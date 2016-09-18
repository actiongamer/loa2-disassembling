package nslm2.modules.funnies.pkCrossSer
{
   import game.ui.pkCrossSer.PKCrossModuleUI;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import nslm2.nets.sockets.ServerEngine;
   import proto.CrossArenaSomeDataNotify;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleRedPointMsg;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import com.mz.core.utils.LocalData;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.foundations.TimePriceUtil;
   import nslm2.modules.foundations.vip.model.VipModel;
   import nslm2.modules.funnies.arenas.rewards.ActRewardVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.utils.TimeUtils;
   import nslm2.utils.LabelUtils;
   import nslm2.modules.footstones.alerts.AlertMsgVo;
   import com.greensock.TweenLite;
   import proto.CrossArenaInfoRes;
   import nslm2.mgrs.SoundMgr;
   import com.mz.core.configs.EnvConfig;
   import nslm2.modules.foundations.chatModules.ChatModuleParam;
   import nslm2.modules.funnies.newYears.olmpic2016.OlmpicSelCountryModel;
   import flash.events.Event;
   import nslm2.mgrs.stcMgrs.vos.StcCountryIconVo;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.foundations.mainToolBar.MainToolBarChangeMsg;
   import nslm2.utils.ServerTimer;
   import flash.geom.Point;
   import com.mz.core.mgrs.UIMgr;
   import nslm2.common.uiEffects.WealthFlyEffectTask;
   import nslm2.modules.funnies.pkCrossSer.PKCrossFinal.PKCrossFinalCtrl;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import proto.CrossArenaEnemyInfo;
   import proto.CrossArenaFightReq;
   import proto.CrossArenaFightRes;
   import proto.BgFightNotify;
   import nslm2.modules.battles.battlefields.vos.FastBattleData;
   import nslm2.modules.battles.battlefields.vos.FastBattlePlayerData;
   import nslm2.common.model.PlayerModel;
   import nslm2.utils.Uint64Util;
   import morn.core.handlers.Handler;
   import proto.ProtocolStatusRes;
   import proto.CrossArenaUpdateFinalEnemyRes;
   import nslm2.nets.sockets.ServerEvent;
   import nslm2.modules.battles.reportPlayer.BattleReportParamVo;
   import proto.CrossArenaFinalEnemyInfo;
   import proto.CrossArenaFinalFightReq;
   import proto.CrossArenaFinalFightRes;
   import nslm2.modules.funnies.arenas.ArenaConsts;
   import nslm2.modules.funnies.arenas.ArenaChallengeResultVo;
   import proto.CrossArenaChangeEnemyRes;
   import com.mz.core.configs.ClientConfig;
   import morn.customs.expands.MornExpandUtil;
   
   public class PKCrossModule extends PKCrossModuleUI
   {
       
      
      private var scene3D:nslm2.modules.funnies.pkCrossSer.PKCrossScene3D;
      
      private var pkEntryView:nslm2.modules.funnies.pkCrossSer.PKCrossEntry;
      
      private var rankCtrl:nslm2.modules.funnies.pkCrossSer.PKCrossRankCtrl;
      
      private var textCDCtrl_preFinish:TextCDCtrlS2;
      
      private var _playReBornAni:Boolean = false;
      
      private var finalCtrl:PKCrossFinalCtrl;
      
      private var _isFight:Boolean;
      
      private var currChallenger:CrossArenaEnemyInfo;
      
      public function PKCrossModule()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         var _loc1_:int = StcMgr.ins.getFunctionVo(50600).level;
         this.box_rule.buttonMode = true;
         this.box_rule.toolTip = LocaleMgr.ins.getStr(50600011,[_loc1_]);
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            btn_rewardIcon.addEventListener("click",treasureBox_onClick);
            ServerEngine.ins.addAlwayHandler(4316,timeNotify);
         }
         else
         {
            btn_rewardIcon.removeEventListener("click",treasureBox_onClick);
            ServerEngine.ins.removeAlwayHandler(4316,timeNotify);
         }
      }
      
      private function timeNotify(param1:CrossArenaSomeDataNotify) : void
      {
         if(model.info == null)
         {
            return;
         }
         if(model.info.status == 1)
         {
            model.info.residualTimes = param1.residualTimes;
            NpcFuncService.ins.changeCount(50600,param1.residualTimes);
            updateViewData();
         }
         else
         {
            model.info.residualTimes = param1.finalResidualTimes;
            updateFinalTimes();
            if(model.cheerInfo == null)
            {
               return;
            }
            if(param1.cheerResidualTimes != model.cheerInfo.residualTimes)
            {
               model.cheerInfo.residualTimes = param1.cheerResidualTimes;
               ObserverMgr.ins.sendNotice("OPT_FINAL_CHEER_CHG_TIMES");
               NpcFuncService.ins.changeCount(50600,param1.cheerResidualTimes);
               updateCheerRedPointTime(param1.cheerResidualTimes);
            }
         }
      }
      
      private function updateCheerRedPointTime(param1:int) : void
      {
         if(param1 <= 0)
         {
            ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(50246,false));
         }
         else
         {
            ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(50246,true,param1));
         }
      }
      
      private function updateChkLabel() : void
      {
         chk_fastfight.label = !!chk_fastfight.selected?LocaleMgr.ins.getStr(40740006) + LocaleMgr.ins.getStr(40740008):LocaleMgr.ins.getStr(40740006) + LocaleMgr.ins.getStr(40740009);
      }
      
      private function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.chk_fastfight !== _loc3_)
         {
            if(this.btn_left_dock !== _loc3_)
            {
               if(this.btn_addTimes === _loc3_)
               {
                  if(model.info.status == 2)
                  {
                     if(TimePriceUtil.curTimes(10) < int(VipModel.ins.getVipValue(11220)))
                     {
                        AlertUtil.comfirm(new AdvanceBuyBox(10,11220,50600048,30121013,30121012,final_buyTimes_yes));
                     }
                     else
                     {
                        AlertUtil.float(LocaleMgr.ins.getStr(50200108));
                     }
                     return;
                  }
                  if(TimePriceUtil.curTimes(9) < int(VipModel.ins.getVipValue(11200)))
                  {
                     AlertUtil.comfirm(new AdvanceBuyBox(9,11200,50600048,30121013,30121012,buyTimes_yes));
                  }
                  else
                  {
                     AlertUtil.float(LocaleMgr.ins.getStr(50200108));
                  }
               }
            }
            else
            {
               zoomInfoPanel();
            }
         }
         else
         {
            LocalData.insCurPlayer.save("local_data_pkcross_fast_fight",chk_fastfight.selected);
            updateChkLabel();
            if(chk_fastfight.selected)
            {
               AlertUtil.float(LocaleMgr.ins.getStr(41300283));
            }
            else
            {
               AlertUtil.float(LocaleMgr.ins.getStr(41300284));
            }
         }
      }
      
      private function treasureBox_onClick(param1:MouseEvent) : void
      {
         var _loc2_:ActRewardVo = new ActRewardVo();
         _loc2_.yesterdayRank = model.info.finalRank;
         _loc2_.rank = model.info.finalRank;
         var _loc3_:Array = StcMgr.ins.getVoArrByColumnValue("static_rank","kind",10);
         _loc3_.sortOn("id",16);
         _loc2_.list_items = _loc3_;
         ModuleMgr.ins.showModule(50510,_loc2_,ModuleMgr.ins.popLayer.curModuleId);
      }
      
      private function startPreFinishCD(param1:uint) : void
      {
         param1 = param1 + 3;
         if(!textCDCtrl_preFinish)
         {
            textCDCtrl_preFinish = new TextCDCtrlS2(this.txt_cd_preFinish,textCDFormat,txtCDCtrl_preFinish_cpl);
            this.parts.push(textCDCtrl_preFinish);
         }
         else
         {
            textCDCtrl_preFinish.stop();
         }
         textCDCtrl_preFinish.start(param1);
      }
      
      private function textCDFormat(param1:int) : String
      {
         return LocaleMgr.ins.getStr(50600001,[TextFieldUtil.htmlText2(TimeUtils.hisCNWithDay(param1),LabelUtils.cdColor(false))]);
      }
      
      private function txtCDCtrl_preFinish_cpl() : void
      {
         refreshModule();
      }
      
      private function refreshModule() : void
      {
         ModuleMgr.ins.showModule(50600);
      }
      
      private function buyTimes_yes() : void
      {
         NpcFuncService.ins.countPlusOne(50600);
         ObserverMgr.ins.sendNotice("floatMsgCenter",new AlertMsgVo(LocaleMgr.ins.getStr(41300250)));
      }
      
      private function final_buyTimes_yes() : void
      {
         ObserverMgr.ins.sendNotice("floatMsgCenter",new AlertMsgVo(LocaleMgr.ins.getStr(41300250)));
      }
      
      public function get model() : PKCrossModel
      {
         return PKCrossModel.ins;
      }
      
      protected function zoomInfoPanel(param1:MouseEvent = null) : void
      {
         if(rank_panel.x >= 0)
         {
            TweenLite.to(rank_panel,0.2,{"x":-rank_panel.width + btn_left_dock.width});
            TweenLite.to(img_dock_left,0.2,{"rotation":180});
         }
         else
         {
            TweenLite.to(rank_panel,0.2,{"x":0});
            TweenLite.to(img_dock_left,0.2,{"rotation":0});
         }
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         ServerEngine.ins.send(4310,null,onCrossPKInfoReturn);
      }
      
      private function onCrossPKInfoReturn(param1:CrossArenaInfoRes) : void
      {
         model.info = param1;
         moduleServerCpl();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         SoundMgr.ins.playBackSound("map_kfzb");
         ModuleMgr.ins.staticLayer.closeAll([10430]);
         var _loc2_:CrossArenaInfoRes = model.info;
         if(_loc2_.status == 1 && _loc2_.isOpen)
         {
            preMatchMode(_loc2_);
            if(EnvConfig.ins.testAuthor != 991)
            {
               ModuleMgr.ins.showModule(10400);
               ModuleMgr.ins.showModule(10500,ChatModuleParam.init(this.moduleId,false));
            }
         }
         else if(_loc2_.status == 2 && _loc2_.isOpen)
         {
            finalMatchMode(_loc2_);
            if(EnvConfig.ins.testAuthor != 991)
            {
               ModuleMgr.ins.showModule(10400);
               ModuleMgr.ins.showModule(10500,ChatModuleParam.init(this.moduleId,false));
            }
         }
         else
         {
            entryMode(_loc2_);
            if(EnvConfig.ins.testAuthor != 991)
            {
               ModuleMgr.ins.showModule(10500,ChatModuleParam.init(this.moduleId,false));
            }
         }
         if(OlmpicSelCountryModel.ins.isOpen())
         {
            OlmpicSelCountryModel.ins.addEventListener("myCountryChange",onMyCountryChange);
            onMyCountryChange(null);
         }
         else
         {
            this.img_myFlag.visible = false;
         }
         super.preShow(param1);
      }
      
      protected function onMyCountryChange(param1:Event) : void
      {
         var _loc2_:* = null;
         if(OlmpicSelCountryModel.ins.selCountry > 0)
         {
            this.img_myFlag.visible = true;
            _loc2_ = StcMgr.ins.getCountryIconVo(OlmpicSelCountryModel.ins.selCountry);
            this.img_myFlag.url = UrlLib.olmpicCountryFlagUrl(_loc2_.icon);
         }
         else
         {
            this.img_myFlag.visible = false;
         }
      }
      
      override public function preClose(param1:Object = null) : void
      {
         if(scene3D)
         {
            scene3D.dispose();
            scene3D = null;
         }
         OlmpicSelCountryModel.ins.removeEventListener("myCountryChange",onMyCountryChange);
         super.preClose(param1);
      }
      
      private function initPreScene3D() : void
      {
         scene3D = new nslm2.modules.funnies.pkCrossSer.PKCrossScene3D();
         this.addChild(scene3D);
         scene3D.init();
      }
      
      public function entryMode(param1:CrossArenaInfoRes) : void
      {
         ObserverMgr.ins.sendNotice("msg_main_tool_bar_id",new MainToolBarChangeMsg(MainToolBarChangeMsg.PKCrossEntry_moduleIdArr,[],true,false));
         initPreScene3D();
         if(!pkEntryView)
         {
            pkEntryView = new nslm2.modules.funnies.pkCrossSer.PKCrossEntry();
            pkEntryView.centerX = 0;
            pkEntryView.centerY = -60;
         }
         this.addChild(pkEntryView);
         this.rank_panel.visible = false;
         this.top_panel.visible = false;
         this.bottom_panel.visible = false;
         this.box_rule.visible = false;
         this.con_finalBox.visible = false;
         this.box_upbg.visible = false;
         pkEntryView.setDate(param1.openStamp);
         if(param1.rewardStamp > 0)
         {
            pkEntryView.startRewardCD(param1.rewardStamp);
            return;
         }
         if(param1.openStamp <= 0)
         {
            pkEntryView.txt_countdown.text = LocaleMgr.ins.getStr(50600002);
            return;
         }
         var _loc2_:uint = ServerTimer.ins.second;
         var _loc3_:int = param1.openStamp - _loc2_;
         if(_loc3_ <= PKCrossConst.SHOW_CD_SEC)
         {
            if(_loc3_ > 0)
            {
               pkEntryView.startCD(param1.openStamp);
            }
            else
            {
               pkEntryView.breakTime();
            }
         }
         else
         {
            pkEntryView.txt_countdown.text = LocaleMgr.ins.getStr(50600003,[TimeUtils.getFullTimeStr(param1.openStamp)]);
         }
      }
      
      public function preMatchMode(param1:CrossArenaInfoRes) : void
      {
         var _loc2_:* = null;
         this.chk_fastfight.selected = LocalData.insCurPlayer.load("local_data_pkcross_fast_fight",false);
         updateChkLabel();
         ObserverMgr.ins.sendNotice("msg_main_tool_bar_id",new MainToolBarChangeMsg(MainToolBarChangeMsg.PKCross_moduleIdArr,MainToolBarChangeMsg.PKCross_moduleIdArrVertical,true,false));
         initPreScene3D();
         if(!rankCtrl)
         {
            rankCtrl = new nslm2.modules.funnies.pkCrossSer.PKCrossRankCtrl(this);
            this.parts.push(rankCtrl);
         }
         detectSize();
         if(pkEntryView)
         {
            pkEntryView.dispose();
            pkEntryView = null;
         }
         this.scene3D.initAvatars();
         this.rank_panel.visible = true;
         this.top_panel.visible = true;
         this.bottom_panel.visible = true;
         this.box_upbg.visible = true;
         this.box_rule.visible = true;
         this.chk_fastfight.visible = true;
         this.con_finalBox.visible = false;
         top_panel.right = 30;
         top_panel.centerX = NaN;
         box_rule.top = 124;
         this.rankCtrl.reqData();
         updateViewData();
         this.txt_currLayer.text = LocaleMgr.ins.getStr(41500131,[currLayer]);
         startPreFinishCD(param1.endStamp);
         PKCrossTop(top_panel).setData(param1.boxes,currLayer,param1.enemies);
         if(model.info.nextLayer)
         {
            goNextLayer();
            _playReBornAni = true;
         }
         else
         {
            trySetEnemies();
         }
         model.lastFightLayer = -1;
         if(model.addScore > 0)
         {
            this.txt_jifen.text = Math.max(model.info.score - model.addScore,0) + "";
            _loc2_ = new Point(UIMgr.gameWidth / 2,UIMgr.gameHeight / 2);
            new WealthFlyEffectTask(17,model.addScore,ModuleMgr.ins.toGlobalPoi(_loc2_)).setToPoi(this.txt_jifen).addCompleteHandler(updateViewData).exec();
            model.addScore = 0;
         }
      }
      
      private function goNextLayer() : void
      {
         if(this.isDisposed)
         {
            return;
         }
         if(!scene3D)
         {
            TweenLite.delayedCall(1,goNextLayer);
         }
         else
         {
            scene3D.elevatorUp(trySetEnemies);
         }
      }
      
      private function trySetEnemies() : void
      {
         if(this.isDisposed)
         {
            return;
         }
         if(!scene3D)
         {
            TweenLite.delayedCall(0.5,trySetEnemies);
         }
         else if(_playReBornAni)
         {
            scene3D.playRebornAni();
            _playReBornAni = false;
            TweenLite.delayedCall(0.5,scene3D.changeEnemies,[model.info.enemies]);
         }
         else
         {
            scene3D.changeEnemies(model.info.enemies);
         }
      }
      
      private function updateViewData() : void
      {
         this.txt_jifen.text = model.info.score + "";
         this.txt_times.text = LocaleMgr.ins.getStr(50200002) + " " + LabelUtils.leaveMaxStrGR(model.info.residualTimes,int(VipModel.ins.getVipValue(11210)));
      }
      
      private function updateFinalTimes() : void
      {
         this.txt_times.text = LocaleMgr.ins.getStr(50200002) + " " + LabelUtils.leaveMaxStrGR(model.info.residualTimes,int(VipModel.ins.getVipValue(11230)));
      }
      
      public function finalMatchMode(param1:*) : void
      {
         ObserverMgr.ins.sendNotice("msg_main_tool_bar_id",new MainToolBarChangeMsg(MainToolBarChangeMsg.PKCross_final_moduleIdArr,MainToolBarChangeMsg.PKCross_moduleIdArrVertical,true,false));
         this.box_rule.toolTip = LocaleMgr.ins.getStr(50600043,[DefindConsts.CROSS_ARENA_FINAL_DAY]);
         bottom_panelSize();
         startPreFinishCD(param1.endStamp);
         updateFinalTimes();
         updateCheerRedPointTime(NpcFuncService.ins.getVo(50600).count);
         finalCtrl = new PKCrossFinalCtrl(this,param1);
         this.parts.push(finalCtrl);
      }
      
      override public function getFocusNotices() : Array
      {
         return ["OPT_START_CD_COMPLETE","OPT_START_CHALLENGE","OPT_CHANGE_ENEMY","OPT_FINAL_START_CHALLENGE","OPT_SHOW_REWARD"];
      }
      
      private function challengeBegin(param1:CrossArenaEnemyInfo) : void
      {
         if(_isFight)
         {
            return;
         }
         if(model.info.residualTimes <= 0)
         {
            ObserverMgr.ins.sendNotice("floatMsgCenter",new AlertMsgVo(LocaleMgr.ins.getStr(41500010)));
            return;
         }
         _isFight = true;
         currChallenger = param1;
         model.lastFightLayer = currLayer;
         var _loc2_:CrossArenaFightReq = new CrossArenaFightReq();
         _loc2_.playerId = param1.baseInfo.id;
         _loc2_.choice = !!isFastFight?1:0;
         ServerEngine.ins.send(4311,_loc2_,server_arenaChallenge_cpl,server_arenaChallenge_err);
      }
      
      private function starFastFight(param1:CrossArenaFightRes) : void
      {
         var _loc3_:BgFightNotify = new BgFightNotify();
         var _loc4_:FastBattleData = new FastBattleData();
         _loc3_.attacker = param1.self;
         _loc3_.target = param1.target;
         if(param1.result == 1)
         {
            _loc3_.winnerId = param1.self.playerId;
         }
         else
         {
            _loc3_.winnerId = param1.target.playerId;
         }
         var _loc2_:FastBattlePlayerData = new FastBattlePlayerData();
         var _loc6_:FastBattlePlayerData = new FastBattlePlayerData();
         _loc2_.name = PlayerModel.ins.playerInfo.name;
         _loc2_.level = PlayerModel.ins.level;
         _loc2_.fightValue = Uint64Util.fromNumber(PlayerModel.ins.totalFightValue);
         _loc2_.playerId = PlayerModel.ins.playerInfo.id;
         _loc2_.npcID = PlayerModel.ins.playerInfo.playerHero.baseInfo.baseId;
         _loc2_.miliRank = PlayerModel.ins.playerInfo.militaryrank;
         _loc2_.side = 1;
         var _loc5_:String = PlayerModel.ins.getFullNameWithDistName(currChallenger.baseInfo,true,false);
         _loc6_.name = _loc5_;
         _loc6_.fightValue = currChallenger.baseInfo.ability;
         _loc6_.level = currChallenger.baseInfo.lv;
         _loc6_.miliRank = currChallenger.baseInfo.militaryRank;
         _loc6_.side = 2;
         _loc6_.npcID = currChallenger.baseInfo.npcId;
         _loc4_.fightData = _loc3_;
         _loc4_.leftPlayerData = _loc2_;
         _loc4_.rightPlayerData = _loc6_;
         _loc4_.closeCallBack = new Handler(fastcloseHandler);
         _loc4_.loseCallBack = new Handler(losehandler);
         ModuleMgr.ins.closeModule(50509);
         ModuleMgr.ins.showModule(50509,_loc4_,ModuleMgr.ins.popLayer.curModuleId);
      }
      
      private function losehandler() : void
      {
      }
      
      private function fastcloseHandler() : void
      {
         refreshPreMatch = function(param1:CrossArenaInfoRes):void
         {
            var _loc2_:* = null;
            model.info = param1;
            rankCtrl.reqData();
            updateViewData();
            txt_currLayer.text = LocaleMgr.ins.getStr(41500131,[currLayer]);
            scene3D.resetPos();
            PKCrossTop(top_panel).setData(param1.boxes,currLayer,param1.enemies);
            if(model.info.nextLayer)
            {
               scene3D.reNewAvatar();
               goNextLayer();
               _playReBornAni = true;
            }
            else
            {
               trySetEnemies();
            }
            model.lastFightLayer = -1;
            if(model.addScore > 0)
            {
               txt_jifen.text = Math.max(model.info.score - model.addScore,0) + "";
               _loc2_ = new Point(UIMgr.gameWidth / 2,UIMgr.gameHeight / 2);
               new WealthFlyEffectTask(17,model.addScore,ModuleMgr.ins.toGlobalPoi(_loc2_)).setToPoi(txt_jifen).addCompleteHandler(updateViewData).exec();
               model.addScore = 0;
            }
         };
         ServerEngine.ins.send(4310,null,refreshPreMatch);
      }
      
      private function server_arenaChallenge_err(param1:ProtocolStatusRes) : void
      {
         if(param1.errCode == 300004253 || param1.errCode == 300004256)
         {
            ObserverMgr.ins.sendNotice("floatMsgCenter",new AlertMsgVo(LocaleMgr.ins.getStr(50200103)));
            ServerEngine.ins.send(4324,null,onUpdateRet);
         }
         ServerEngine.ins.doDefaultErr(param1);
         _isFight = false;
      }
      
      private function onUpdateRet(param1:CrossArenaUpdateFinalEnemyRes) : void
      {
         if(finalCtrl)
         {
            finalCtrl.updateEnemy(param1.finalEnemies);
         }
      }
      
      private function get isFastFight() : Boolean
      {
         return this.chk_fastfight.selected;
      }
      
      private function server_arenaChallenge_cpl(param1:CrossArenaFightRes, param2:ServerEvent) : void
      {
         $res = param1;
         $e = param2;
         playReport = function():void
         {
            _isFight = false;
            if(isFastFight)
            {
               starFastFight($res);
            }
            else
            {
               ModuleMgr.ins.showModule(40201,BattleReportParamVo.createReportVo($res.reportId,$res.result,$res.rewards,$e.dataNotifyCacheVo,4));
            }
         };
         model.addCoin = $res.coin;
         model.addScore = $res.score;
         scene3D.runTo(currChallenger.baseInfo.id,playReport);
      }
      
      private function finalChallengeBegin(param1:CrossArenaFinalEnemyInfo) : void
      {
         if(_isFight)
         {
            return;
         }
         if(model.info.residualTimes <= 0)
         {
            ObserverMgr.ins.sendNotice("floatMsgCenter",new AlertMsgVo(LocaleMgr.ins.getStr(41500010)));
            return;
         }
         _isFight = true;
         var _loc2_:CrossArenaFinalFightReq = new CrossArenaFinalFightReq();
         _loc2_.id = param1.baseInfo.id;
         _loc2_.rank = param1.rank;
         ServerEngine.ins.send(4320,_loc2_,server_final_arenaChallenge_cpl,server_arenaChallenge_err);
      }
      
      private function server_final_arenaChallenge_cpl(param1:CrossArenaFinalFightRes, param2:ServerEvent) : void
      {
         $res = param1;
         $e = param2;
         playReport = function():void
         {
            ModuleMgr.ins.showModule(40201,BattleReportParamVo.createReportVo($res.reportId,$res.isWin,null,$e.dataNotifyCacheVo,1));
         };
         _isFight = false;
         var $upedRank:int = model.info.finalRank - $res.rank;
         ArenaConsts.ins.ARENA_CHALLENGE_RESULT_VO = new ArenaChallengeResultVo($res.rank,$upedRank,0,false,$res.isWin);
      }
      
      private function onChangeEnemyRet(param1:CrossArenaChangeEnemyRes) : void
      {
         model.info.enemies = param1.enemies;
         scene3D.setAllUnitVisibleFalse();
         _playReBornAni = true;
         trySetEnemies();
         PKCrossTop(top_panel).setData(model.info.boxes,currLayer,model.info.enemies);
      }
      
      public function get currLayer() : int
      {
         return model.info.finishedLayer + 1;
      }
      
      private function confirmHandler() : void
      {
         ServerEngine.ins.send(4313,null,onChangeEnemyRet);
      }
      
      protected function detectSize() : void
      {
         if(UIMgr.gameHeight <= ClientConfig.SCENE_MIN_H + 100)
         {
            rankCtrl.setBigOrSmall(false);
         }
         else
         {
            rankCtrl.setBigOrSmall(true);
         }
         bottom_panelSize();
      }
      
      protected function bottom_panelSize() : void
      {
         if(UIMgr.gameWidth <= ClientConfig.SCENE_MIN_W + 150)
         {
            bottom_panel.bottom = 100;
            bottom_panel.right = 110;
            bottom_panel.centerX = NaN;
         }
         else
         {
            bottom_panel.bottom = 50;
            bottom_panel.right = NaN;
            bottom_panel.centerX = 0;
         }
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc4_:int = 0;
         var _loc6_:* = param1;
         if("OPT_START_CD_COMPLETE" !== _loc6_)
         {
            if("OPT_START_CHALLENGE" !== _loc6_)
            {
               if("OPT_CHANGE_ENEMY" !== _loc6_)
               {
                  if("OPT_FINAL_START_CHALLENGE" !== _loc6_)
                  {
                     if("OPT_SHOW_REWARD" === _loc6_)
                     {
                        treasureBox_onClick(null);
                     }
                  }
                  else
                  {
                     finalChallengeBegin(param2);
                  }
               }
               else
               {
                  _loc4_ = 0;
                  _loc6_ = 0;
                  var _loc5_:* = model.info.enemies;
                  for each(var _loc3_ in model.info.enemies)
                  {
                     if(_loc3_.status == 0)
                     {
                        _loc4_++;
                     }
                  }
                  if(_loc4_ <= 0)
                  {
                     confirmHandler();
                  }
                  else
                  {
                     AlertUtil.comfirm(LocaleMgr.ins.getStr(50600004,[_loc4_]),confirmHandler,null,null);
                  }
               }
            }
            else
            {
               challengeBegin(param2);
            }
         }
         else
         {
            refreshModule();
         }
      }
   }
}
