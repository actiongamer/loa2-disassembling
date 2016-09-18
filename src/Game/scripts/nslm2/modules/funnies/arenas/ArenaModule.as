package nslm2.modules.funnies.arenas
{
   import game.ui.arenas.ArenaModuleUI;
   import nslm2.modules.footstones.newerGuideModules.INewerGuideGetComp;
   import nslm2.modules.dungeons.scripts.IScriptBox;
   import nslm2.modules.footstones.newerGuideModules.NGScriptPlayer;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import proto.ArenaInfoRes;
   import nslm2.modules.funnies.arenas.mains.ArenaInfoPanel;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.utils.TimeUtils;
   import nslm2.utils.LabelUtils;
   import nslm2.utils.ServerTimer;
   import nslm2.modules.Chapters.treasureBox.TreasureBoxVo;
   import flash.events.MouseEvent;
   import nslm2.modules.funnies.arenas.rewards.ActRewardVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.nets.sockets.ServerEngine;
   import proto.ArenaGetRankRewardRes;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.ProtocolStatusRes;
   import nslm2.modules.foundations.AlertUtil;
   import morn.core.managers.timerMgrs.TimerManager;
   import com.greensock.TweenLite;
   import com.mz.core.configs.EnvConfig;
   import nslm2.modules.foundations.chatModules.ChatModuleParam;
   import nslm2.modules.foundations.mainToolBar.MainToolBarChangeMsg;
   import nslm2.modules.funnies.arenas.mains.ArenaScene3D;
   import nslm2.modules.foundations.shop.model.ShopModel;
   import nslm2.mgrs.SoundMgr;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import proto.ArenaPlayer;
   import com.mz.core.event.MzEvent;
   import com.netease.protobuf.UInt64;
   import proto.ArenaChallengeReq;
   import morn.core.handlers.Handler;
   import proto.ArenaChallengeRes;
   import nslm2.nets.sockets.ServerEvent;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.modules.funnies.arenas.mains.PlayChallengePreEffTask;
   import com.mz.core.logging.Log;
   import nslm2.modules.battles.battleResults.BattleResultGlobel;
   import proto.BgFightInfo;
   import proto.BgFightNotify;
   import nslm2.modules.battles.battlefields.vos.FastBattleData;
   import nslm2.modules.battles.battlefields.vos.FastBattlePlayerData;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.battles.reportPlayer.BattleReportParamVo;
   import flash.events.Event;
   import nslm2.modules.footstones.newerGuideModules.NGCompForUnit3D;
   import morn.core.components.Component;
   import nslm2.mgrs.stcMgrs.vos.StcGuideVo;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.funnies.arenas.mains.ArenaUnit3D;
   import flash.display.DisplayObject;
   import nslm2.modules.dungeons.scripts.comps.ScriptCmdEffect3DView;
   import away3d.containers.ObjectContainer3D;
   import flash.geom.Point;
   import nslm2.modules.fightPlayer.UnitView;
   import nslm2.modules.fightPlayer.UnitVo;
   import nslm2.common.model.HeroModel;
   import nslm2.common.ui.components.comps2d.others.TreasureBoxBaseRender;
   
   public class ArenaModule extends ArenaModuleUI implements INewerGuideGetComp, IScriptBox
   {
       
      
      protected var ngScriptPlayer:NGScriptPlayer;
      
      private var textCDCtrl_reward:TextCDCtrlS2;
      
      private var _cntDown:int;
      
      private var scene3D:ArenaScene3D;
      
      private var _isChallenged:Boolean;
      
      private var _challengedPlayerInfo:ArenaPlayer;
      
      private var ngFakeComp2D:NGCompForUnit3D;
      
      public function ArenaModule()
      {
         super();
         box_rule.toolTip = LocaleMgr.ins.getStr(50200706);
         textCDCtrl_reward = new TextCDCtrlS2(this.infoPanel.txt_rewardCD,textCDFormat_reward,txtCDCtrl_reward_cpl);
         (infoPanel.btn_rewardIcon as TreasureBoxBaseRender).treasureType = 2;
      }
      
      public function get infoRes() : ArenaInfoRes
      {
         return ArenaService.ins.infoRes;
      }
      
      public function get service() : ArenaService
      {
         return ArenaService.ins;
      }
      
      public function get infoPanel() : ArenaInfoPanel
      {
         return this.infoPanelUI as ArenaInfoPanel;
      }
      
      private function textCDFormat_reward(param1:int) : String
      {
         if(infoRes.rankRewardStatus != 1)
         {
            return "";
         }
         return TextFieldUtil.htmlText2(TimeUtils.hisColonFullAddZero(param1),LabelUtils.cdColor(false));
      }
      
      private function txtCDCtrl_reward_cpl() : void
      {
         infoRes.rankRewardStatus = 2;
         if(ServerTimer.ins.second >= infoRes.rankRefreshTime)
         {
            infoRes.rankRefreshTime = infoRes.rankRefreshTime + 86400;
         }
         this.infoPanel.img_rewarded.visible = false;
         this.infoPanel.img_treasureBg.visible = true;
         this.infoPanel.btn_rewardIcon.dataSource = new TreasureBoxVo([],2);
         this.infoPanel.txt_rewardCD.text = "";
      }
      
      private function treasureBox_onClick(param1:MouseEvent) : void
      {
         var _loc2_:ActRewardVo = new ActRewardVo();
         _loc2_.list_items = StcMgr.ins.getVoArrByColumnValue("static_rank","kind",3);
         _loc2_.canGetReward = infoRes.rankRewardStatus == 2;
         _loc2_.hasGotReward = infoRes.rankRewardStatus == 3;
         _loc2_.canNotGetTip = LocaleMgr.ins.getStr(50200028);
         _loc2_.canGetTip = LocaleMgr.ins.getStr(50200009);
         _loc2_.haveGotTip = LocaleMgr.ins.getStr(50200029);
         _loc2_.yesterdayRank = infoRes.yesterdayRank;
         _loc2_.rank = infoRes.yesterdayRank;
         _loc2_.getHandler = getRankReward;
         _loc2_.tipString = LocaleMgr.ins.getStr(50200904);
         ModuleMgr.ins.showModule(50242,_loc2_);
      }
      
      private function getRankReward() : void
      {
         ServerEngine.ins.send(4037,null,server_arenaGetRankReward_cpl);
      }
      
      private function server_arenaGetRankReward_cpl(param1:ArenaGetRankRewardRes) : void
      {
         infoRes.rankRewardStatus = 3;
         this.infoPanel.btn_rewardIcon.dataSource = new TreasureBoxVo([],1);
         this.infoPanel.img_rewarded.visible = true;
         this.infoPanel.img_treasureBg.visible = false;
         textCDCtrl_reward.start(infoRes.rankRefreshTime);
         ObserverMgr.ins.sendNotice("ACT_RANK_REWARD_GET_SUCCES");
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         ServerEngine.ins.send(4030,null,server_info_cpl,server_info_err);
      }
      
      public function server_info_cpl(param1:ArenaInfoRes) : void
      {
         service.infoRes = param1;
         service.sortArenaPlayers();
         ArenaService.ins.server_getSwapActions(ArenaModel.ins.stcIdArr);
         moduleServerCpl();
      }
      
      private function server_info_err(param1:ProtocolStatusRes) : void
      {
         ServerEngine.ins.doDefaultErr(param1);
         ModuleMgr.ins.closeModule(this.moduleId);
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            this.service.addEventListener("EVT_CHANGE_ENEMY",onChangeEnemy);
            this.service.addEventListener("EVT_CHANGE_CD",onChangeCD);
            this.service.addEventListener("EVT_CHANGE_SCORE_CAN_GET_REWARD",onChangeScore);
            this.service.addEventListener("EVT_BE_CHANGE_RANK",onBeChangeRank);
            this.service.addEventListener("evt_multi_challenge_success",multiChallengeSuccess);
            this.box_zoom.addEventListener("click",zoomInfoPanel);
            this.box_refresh.addEventListener("click",changeCompetitors);
            this.infoPanel.btn_rewardIcon.addEventListener("click",treasureBox_onClick);
         }
         else
         {
            this.service.removeEventListener("EVT_CHANGE_ENEMY",onChangeEnemy);
            this.service.removeEventListener("EVT_CHANGE_CD",onChangeCD);
            this.service.removeEventListener("EVT_CHANGE_SCORE_CAN_GET_REWARD",onChangeScore);
            this.service.removeEventListener("EVT_BE_CHANGE_RANK",onBeChangeRank);
            this.service.removeEventListener("evt_multi_challenge_success",multiChallengeSuccess);
            this.box_zoom.removeEventListener("click",zoomInfoPanel);
            this.box_refresh.removeEventListener("click",changeCompetitors);
            this.infoPanel.btn_rewardIcon.removeEventListener("click",treasureBox_onClick);
         }
      }
      
      protected function changeCompetitors(param1:MouseEvent) : void
      {
         if(_cntDown != 0)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(999900111,[_cntDown]));
            return;
         }
         _cntDown = 5;
         txt_changeCD.num = _cntDown;
         TimerManager.ins.doLoop(1000,onTimer);
         ArenaService.ins.changeArenaPlayer();
      }
      
      private function onTimer() : void
      {
         _cntDown = Number(_cntDown) - 1;
         txt_changeCD.num = _cntDown;
         if(_cntDown == 0)
         {
            TimerManager.ins.clearTimer(onTimer);
            txt_changeCD.text = "";
         }
      }
      
      protected function zoomInfoPanel(param1:MouseEvent) : void
      {
         if(infoPanel.x >= 0)
         {
            TweenLite.to(infoPanel,0.2,{
               "x":-infoPanel.width,
               "onComplete":hideInfoPanelComplete
            });
            TweenLite.to(box_zoom,0.2,{"x":1});
            TweenLite.to(img_zone,0.2,{"rotation":180});
         }
         else
         {
            TweenLite.to(infoPanel,0.2,{
               "x":0,
               "onComplete":showInfoPanelComplete
            });
            TweenLite.to(box_zoom,0.2,{"x":140});
            TweenLite.to(img_zone,0.2,{"rotation":0});
         }
      }
      
      private function hideInfoPanelComplete() : void
      {
         img_zone.rotation = 180;
      }
      
      private function showInfoPanelComplete() : void
      {
         img_zone.rotation = 0;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         ModuleMgr.ins.staticLayer.closeAll([10430]);
         if(EnvConfig.ins.testAuthor != 991)
         {
            ModuleMgr.ins.showModule(10400);
            ModuleMgr.ins.showModule(10500,ChatModuleParam.init(this.moduleId,false));
         }
         ObserverMgr.ins.sendNotice("msg_main_tool_bar_id",new MainToolBarChangeMsg(MainToolBarChangeMsg.Arena_moduleIdArr,MainToolBarChangeMsg.Arena_moduleIdArrVertical,true,false));
         scene3D = new ArenaScene3D();
         this.addChild(scene3D);
         scene3D.init();
         scene3D.addEventListener("EVT_CHALLENGE",toChallengeHandler);
         this.infoPanel.refresh();
         scene3D.refresh();
         refreshReward();
         ShopModel.ins.checkRedPoint(50240);
         super.preShow(param1);
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
         SoundMgr.ins.playBackSound("map_101");
         ngScriptPlayer = new NGScriptPlayer(this);
         NGUtil.checkModuleShow(this.moduleId,this);
         ArenaUtil.ins.showBattleResult();
      }
      
      private function toChallengeHandler(param1:MzEvent) : void
      {
         var _loc2_:* = null;
         if(_isChallenged)
         {
            return;
         }
         this.scene3D.resetPos();
         if(ngFakeComp2D)
         {
            ngFakeComp2D.dispatchEvent(new MouseEvent("click",true,false));
            ngFakeComp2D.dispose();
            ngFakeComp2D = null;
         }
         if(infoRes.residualTimes <= 0)
         {
            AlertUtil.floatErr(LocaleMgr.ins.getStr(300004073));
            if(this.infoPanel.canShowBuyTimesPop())
            {
               this.infoPanel.showBuyTimesPop();
            }
         }
         else
         {
            _loc2_ = param1.data as ArenaPlayer;
            _isChallenged = true;
            _challengedPlayerInfo = _loc2_;
            this.server_arenaChallenge(_loc2_.playerInfo.id,_loc2_.rank);
         }
      }
      
      private function server_arenaChallenge(param1:UInt64, param2:uint) : void
      {
         var _loc3_:ArenaChallengeReq = new ArenaChallengeReq();
         _loc3_.id = param1;
         _loc3_.rank = param2;
         if(ArenaModel.ins.showSimpleFight)
         {
            _loc3_.kind = 1;
         }
         ServerEngine.ins.send(4031,_loc3_,new Handler(server_arenaChallenge_cpl,[param1,param2]),server_arenaChallenge_err);
      }
      
      private function server_arenaChallenge_err(param1:ProtocolStatusRes) : void
      {
         ServerEngine.ins.doDefaultErr(param1);
         if(param1.errCode == 300004075)
         {
            service.changeArenaPlayer();
         }
         _isChallenged = false;
      }
      
      private function server_arenaChallenge_cpl(param1:UInt64, param2:uint, param3:ArenaChallengeRes, param4:ServerEvent) : void
      {
         NpcFuncService.ins.changeCount(50200,param3.residualTimes);
         new PlayChallengePreEffTask(this.scene3D,param1).addCompleteHandler(new Handler(playerChallengePreEff_cpl,[param2,param3,param4])).exec();
      }
      
      private function playerChallengePreEff_cpl(param1:uint, param2:ArenaChallengeRes, param3:ServerEvent) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc4_:* = null;
         var _loc8_:* = null;
         var _loc7_:* = null;
         Log.info(this,!!param2.isWin?"挑战成功":"挑战失败");
         ArenaUtil.initArenaChallengeResultVo(param1,param2,param3);
         if(param2.isWin && infoRes.rank > param1)
         {
            infoRes.rank = param1;
         }
         infoRes.cdStamp = param2.cdStamp;
         infoRes.isCdRed = param2.isCdRed;
         infoRes.residualTimes = param2.residualTimes;
         infoRes.scores = param2.scores;
         infoRes.histTopRank = param2.histTopRank;
         _isChallenged = false;
         BattleResultGlobel.ins.doubleId = 1010;
         if(param2.attacker && param2.target)
         {
            _loc5_ = new BgFightNotify();
            _loc6_ = new FastBattleData();
            _loc5_.attacker = param2.attacker;
            _loc5_.target = param2.target;
            if(param2.isWin)
            {
               _loc5_.winnerId = param2.attacker.playerId;
            }
            else
            {
               _loc5_.winnerId = param2.target.playerId;
            }
            _loc4_ = new FastBattlePlayerData();
            _loc8_ = new FastBattlePlayerData();
            _loc4_.initToSelf();
            _loc4_.side = 1;
            _loc7_ = PlayerModel.ins.getFullNameWithDistName(_challengedPlayerInfo.playerInfo,true,false);
            _loc8_.name = _loc7_;
            _loc8_.fightValue = _challengedPlayerInfo.playerInfo.ability;
            _loc8_.level = _challengedPlayerInfo.playerInfo.lv;
            _loc8_.miliRank = _challengedPlayerInfo.playerInfo.militaryRank;
            _loc8_.side = 2;
            _loc8_.npcID = _challengedPlayerInfo.playerInfo.npcId;
            _loc6_.fightData = _loc5_;
            _loc6_.leftPlayerData = _loc4_;
            _loc6_.rightPlayerData = _loc8_;
            _loc6_.winCallBack = new Handler(simpleFightCpl,[true]);
            _loc6_.loseCallBack = new Handler(simpleFightCpl,[false]);
            _loc6_.closeCallBack = ArenaUtil.ins.showBattleResult;
            ModuleMgr.ins.showModule(50509,_loc6_,ModuleMgr.ins.popLayer.curModuleId);
         }
         else
         {
            ModuleMgr.ins.showModule(40201,BattleReportParamVo.createReportVo(param2.reportId,param2.isWin,param2.drops,param3.dataNotifyCacheVo));
         }
      }
      
      private function simpleFightCpl(param1:Boolean) : void
      {
         if(param1)
         {
            onBeChangeRank(null);
         }
         ArenaService.ins.checkScoreCanGet();
         this.onChangeCD(null);
         this.onChangeScore(null);
         this.scene3D.resetPos();
         ObserverMgr.ins.sendNotice("msg_changeBottomShopWealth");
      }
      
      private function onChangeEnemy(param1:Event) : void
      {
         scene3D.refresh();
      }
      
      private function onChangeCD(param1:Event) : void
      {
         this.infoPanel.refresh();
      }
      
      private function onChangeScore(param1:Event) : void
      {
         this.infoPanel.refreshScoreState();
      }
      
      private function onBeChangeRank(param1:Event) : void
      {
         this.infoPanel.refreshRank();
         ArenaService.ins.changeArenaPlayer();
      }
      
      private function multiChallengeSuccess(param1:Event) : void
      {
      }
      
      private function refreshReward() : void
      {
         switch(int(infoRes.rankRewardStatus) - 1)
         {
            case 0:
               this.infoPanel.btn_rewardIcon.dataSource = new TreasureBoxVo([],1);
               this.infoPanel.img_rewarded.visible = false;
               this.infoPanel.img_treasureBg.visible = false;
               textCDCtrl_reward.start(infoRes.rankRefreshTime);
               break;
            case 1:
               this.infoPanel.btn_rewardIcon.dataSource = new TreasureBoxVo([],2);
               this.infoPanel.img_rewarded.visible = false;
               this.infoPanel.img_treasureBg.visible = true;
               this.infoPanel.txt_rewardCD.text = "";
               break;
            case 2:
               this.infoPanel.btn_rewardIcon.dataSource = new TreasureBoxVo([],1);
               this.infoPanel.img_rewarded.visible = true;
               this.infoPanel.img_treasureBg.visible = false;
               textCDCtrl_reward.start(infoRes.rankRefreshTime);
         }
      }
      
      override public function preClose(param1:Object = null) : void
      {
         if(scene3D)
         {
            scene3D.removeEventListener("EVT_CHALLENGE",toChallengeHandler);
            scene3D.dispose();
            scene3D = null;
         }
         textCDCtrl_reward.dispose();
         textCDCtrl_reward = null;
         ngScriptPlayer.dispose();
         ngScriptPlayer = null;
         if(ngFakeComp2D)
         {
            ngFakeComp2D.dispose();
            ngFakeComp2D = null;
         }
         ServerEngine.ins.send(4041);
         super.preClose(param1);
      }
      
      public function getCompById(param1:String, param2:StcGuideVo) : Component
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc7_:* = param1;
         if("unit3d" !== _loc7_)
         {
            return NGUtil.getCompById(this,param1,param2);
         }
         if(ngFakeComp2D)
         {
            ngFakeComp2D.dispose();
            ngFakeComp2D = null;
         }
         if(this.scene3D.unit3DArr[4].arenaPlayer)
         {
            _loc3_ = this.scene3D.unit3DArr[4].arenaPlayer.playerInfo.ability;
         }
         else
         {
            _loc3_ = Uint64Util.fromNumber(0);
         }
         if(this.scene3D.unit3DArr[6].arenaPlayer)
         {
            _loc4_ = this.scene3D.unit3DArr[6].arenaPlayer.playerInfo.ability;
         }
         else
         {
            _loc4_ = Uint64Util.fromNumber(0);
         }
         if(Uint64Util.compare(_loc3_,_loc4_) == -1)
         {
            _loc6_ = this.scene3D.unit3DArr[4];
         }
         else
         {
            _loc6_ = this.scene3D.unit3DArr[6];
         }
         ngFakeComp2D = new NGCompForUnit3D(_loc6_,this,76,220);
         return ngFakeComp2D;
      }
      
      public function addDisplay2D(param1:String, param2:DisplayObject) : void
      {
      }
      
      public function addDisplay3D(param1:String, param2:String, param3:ObjectContainer3D = null) : ScriptCmdEffect3DView
      {
         return null;
      }
      
      public function get anchorPoi() : Point
      {
         return null;
      }
      
      public function get cameraX() : int
      {
         return 0;
      }
      
      public function set cameraX(param1:int) : void
      {
      }
      
      public function createTempUnitByNpcId(param1:int, param2:String, param3:String, param4:int, param5:int, param6:int) : UnitView
      {
         return null;
      }
      
      public function deleteDisplay2D(param1:String) : void
      {
      }
      
      public function deleteDisplay3D(param1:String) : void
      {
      }
      
      public function deleteUnit(param1:String) : void
      {
      }
      
      public function getDisplay2DById(param1:String) : DisplayObject
      {
         return null;
      }
      
      public function getDisplay3DById(param1:String) : ScriptCmdEffect3DView
      {
         return null;
      }
      
      public function get isBossBattle() : Boolean
      {
         return false;
      }
      
      public function get topLayer2D() : Component
      {
         return ModuleMgr.ins.dramaLayer;
      }
      
      public function getUnitById(param1:String) : Array
      {
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc2_:* = null;
         var _loc4_:* = null;
         if(param1.indexOf(":") != -1)
         {
            _loc3_ = param1.split(":").shift();
            _loc5_ = param1.split(":")[1];
         }
         else if(param1 == "major")
         {
            _loc2_ = new UnitVo();
            _loc2_.name = PlayerModel.ins.playerInfo.name;
            _loc2_.isAttack = 1;
            _loc2_.npc_id = HeroModel.ins.playerHero.baseInfo.baseId;
            _loc4_ = new UnitView(null,null);
            _loc4_.vo = _loc2_;
            _loc4_.avatarBody = this.scene3D.player3D.avatar;
            return [_loc4_];
         }
         return [];
      }
   }
}
