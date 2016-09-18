package nslm2.modules.scenes.shenYuans
{
   import game.ui.shenYuans.ShenYuanModuleUI;
   import morn.core.components.Component;
   import nslm2.modules.scenes.shenYuans.model.ShenYuanModel;
   import nslm2.modules.scenes.shenYuans.service.ShenYuanService;
   import nslm2.modules.scenes.shenYuans.comp.ShenYuanBuyBuffPanel;
   import nslm2.modules.scenes.shenYuans.comp.ShenYuanRewardPanel;
   import nslm2.modules.scenes.shenYuans.comp.ShenYuanSelectMonster;
   import nslm2.modules.scenes.shenYuans.comp.ShenYuanActiEndPanel;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import nslm2.common.ui.components.comps2d.others.TreasureBoxBaseRender;
   import flash.events.MouseEvent;
   import nslm2.modules.funnies.arenas.rewards.ActRewardVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.greensock.TweenLite;
   import morn.core.components.Button;
   import nslm2.modules.foundations.shop.vo.ShopOpenVo;
   import nslm2.nets.sockets.ServerEngine;
   import proto.ShenYuanRankRewardRes;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.utils.TimeUtils;
   import nslm2.utils.LabelUtils;
   import nslm2.modules.Chapters.treasureBox.TreasureBoxVo;
   import nslm2.modules.foundations.chatModules.ChatModuleParam;
   import nslm2.modules.foundations.shop.model.ShopModel;
   import nslm2.common.ui.components.comps2d.others.TaskAlertRenderS2;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import nslm2.modules.foundations.FloatBubbleUtil;
   import nslm2.modules.scenes.shenYuans.scenes.ShenYuanScene;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.foundations.vip.view.VipHintBox;
   import proto.BuffInfo;
   import nslm2.mgrs.stcMgrs.vos.StcBuffVo;
   import game.ui.roleInfos.NpcPropVo;
   import proto.GetShenYuanInfoRes;
   import nslm2.mgrs.stcMgrs.vos.StcNvshendianBuffVo;
   import nslm2.modules.footstones.alerts.AlertMsgVo;
   import nslm2.mgrs.MouseIconManager;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleRedPointMsg;
   import flash.geom.Point;
   import com.mz.core.utils.MathUtil;
   import org.specter3d.display.particle.SpecterEffect;
   import org.specter3d.loaders.AssetLib;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.mgrs.stcMgrs.vos.StcSpecialEffectVo;
   import org.specter3d.display.particle.EffectManager;
   import org.specter3d.context.AppGlobalContext;
   import org.specter3d.loaders.ResourceVo;
   import nslm2.utils.TransformUtil;
   import proto.FightShenYuanStartRes;
   import nslm2.modules.battles.battleResults.BattleResultGlobel;
   import nslm2.modules.foundations.vip.model.VipModel;
   import nslm2.modules.scenes.shenYuans.comp.ShenYuanPassAlert;
   import proto.ShenYuanTongGuanReq;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.foundations.mainToolBar.MainToolBarChangeMsg;
   import com.greensock.TimelineLite;
   import proto.GameFriendData;
   import morn.core.components.Image;
   import nslm2.common.uiEffects.IconFlyEff;
   import proto.ShenYuanTongGuanRes;
   import flash.events.Event;
   import proto.GetShenYuanInfoReq;
   import nslm2.common.event.WealthChangeEvent;
   import morn.customs.expands.MornExpandUtil;
   import com.mz.core.utils.DisplayUtils;
   
   public class ShenYuanModule extends ShenYuanModuleUI
   {
      
      public static var FLOOR_TYPE_MONSTER:int = 1;
      
      public static var FLOOR_TYPE_BUFF:int = 2;
      
      public static var FLOOR_TYPE_CHEST:int = 3;
       
      
      private const NPC_BASE_X:int = -340;
      
      private const NPC_BASY_Y:int = -130;
      
      private const NPC_GAP_HOR:int = 341;
      
      private const NPC_GAP_VER:int = 10;
      
      private const TIP_BASE_X:int = 283;
      
      private const TIP_GAP_HOR:int = 311;
      
      private const TIP_BASE_Y:int = 690;
      
      private var monsterPos:Array;
      
      public var layer2D:Component;
      
      private var monsterTipPosArr:Array;
      
      private var shenYuanModel:ShenYuanModel;
      
      private var shenYuanService:ShenYuanService;
      
      private var buyBuffPanel:ShenYuanBuyBuffPanel;
      
      private var rewardPanel:ShenYuanRewardPanel;
      
      private var monsterPanel:ShenYuanSelectMonster;
      
      private var activityEndPanel:ShenYuanActiEndPanel;
      
      private var isScrooling:Boolean;
      
      private var FLOOR_LIST_Y:int;
      
      private var textCDCtrl_reward:TextCDCtrlS2;
      
      private var treasureBox:TreasureBoxBaseRender;
      
      private var _taskAlertRender:TaskAlertRenderS2;
      
      public var scene:ShenYuanScene;
      
      protected var moveArrow:SpecterEffect;
      
      private var _addStar:int;
      
      private var cptaIn:int = 0;
      
      private var _starValue:int;
      
      private var _tl:TimelineLite;
      
      private var oFrontbgY:Number;
      
      private var obgY:Number;
      
      private var ohpsY:Number;
      
      private var _assitVo:GameFriendData;
      
      private var _lockClick:Boolean = false;
      
      public function ShenYuanModule()
      {
         monsterPos = [new Point(-340,-130 - 10),{
            "x":-340 + 341,
            "y":-130
         },{
            "x":-340 + 341 * 2,
            "y":-130 - 10
         }];
         layer2D = new Component();
         monsterTipPosArr = [{
            "x":283,
            "y":690 + 10
         },{
            "x":283 + 311,
            "y":690
         },{
            "x":283 + 311 * 2,
            "y":690 + 10
         }];
         treasureBox = new TreasureBoxBaseRender();
         super();
         this.addChild(layer2D);
         shenYuanModel = ShenYuanModel.ins;
         shenYuanService = ShenYuanService.ins;
         btn_Challenge.visible = false;
         this.btn_rule.buttonMode = true;
         this.btn_rule.toolTip = LocaleMgr.ins.getStr(41500115);
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         textCDCtrl_reward = new TextCDCtrlS2(this.txt_rewardCD,textCDFormat_reward,txtCDCtrl_reward_cpl);
         this.btn_shop.visible = false;
         this.label_star.toolTip = LocaleMgr.ins.getStr(41500122);
         this.label_star1.toolTip = LocaleMgr.ins.getStr(41500122);
         this.icon_star.toolTip = LocaleMgr.ins.getStr(41500122);
         this.icon_star1.toolTip = LocaleMgr.ins.getStr(41500122);
         txt_star_num_all.toolTip = LocaleMgr.ins.getStr(41500122);
         txt_star_num.toolTip = LocaleMgr.ins.getStr(41500122);
         DisplayUtils.replaceDisplayObject(this.btn_rankReward,treasureBox);
         treasureBox.y = treasureBox.y + 15;
         treasureBox.x = treasureBox.x + 15;
         treasureBox.treasureType = 2;
         this.treasureBox.addEventListener("click",treasureBox_onClick);
         this.list_buff.dataSource = [];
      }
      
      protected function treasureBox_onClick(param1:MouseEvent) : void
      {
         var _loc2_:ActRewardVo = new ActRewardVo();
         _loc2_.list_items = StcMgr.ins.getVoArrByColumnValue("static_rank","kind",1);
         _loc2_.canGetReward = shenYuanModel.canGetReward;
         _loc2_.canGetTip = LocaleMgr.ins.getStr(50200009);
         _loc2_.canNotGetTip = LocaleMgr.ins.getStr(50200010);
         _loc2_.yesterdayRank = shenYuanModel.lastRank;
         _loc2_.rank = shenYuanModel.currRank;
         _loc2_.getHandler = getRankReward;
         _loc2_.tipString = LocaleMgr.ins.getStr(50200904);
         _loc2_.hasGotReward = shenYuanModel.lastRank > 0 && !shenYuanModel.canGetReward;
         ModuleMgr.ins.showModule(50242,_loc2_);
      }
      
      protected function zoomInfoPanel(param1:MouseEvent = null) : void
      {
         if(buffPanel.x >= 0)
         {
            TweenLite.to(buffPanel,0.2,{"x":-buffPanel.width + btn_dock.width});
            TweenLite.to(img_dock,0.2,{"rotation":180});
         }
         else
         {
            TweenLite.to(buffPanel,0.2,{"x":0});
            TweenLite.to(img_dock,0.2,{"rotation":0});
         }
      }
      
      private function updateBuffPanelSize() : void
      {
         var _loc2_:* = 18;
         var _loc1_:Number = 155;
         if(list_buff.length <= 0)
         {
            this.txt_no_buff.visible = true;
            _loc1_ = _loc1_ + 18;
         }
         else
         {
            this.txt_no_buff.visible = false;
         }
         buff_bg.height = _loc1_ + _loc2_ * list_buff.length + 92;
         dock_con.y = (buff_bg.height - dock_con.height) / 2;
      }
      
      private function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.btn_rank !== _loc3_)
         {
            if(this.btn_shop !== _loc3_)
            {
               if(this.btn_dock === _loc3_)
               {
                  zoomInfoPanel();
               }
            }
            else
            {
               ModuleMgr.ins.showModule(60300,new ShopOpenVo(11306),ModuleMgr.ins.popLayer.curModuleId);
            }
         }
         else
         {
            ModuleMgr.ins.showModule(50231,[1,shenYuanModel.currRank]);
         }
      }
      
      private function getRankReward() : void
      {
         ServerEngine.ins.send(6085,null,server_GetRankReward_cpl);
      }
      
      private function server_GetRankReward_cpl(param1:ShenYuanRankRewardRes) : void
      {
         shenYuanModel.canGetReward = false;
         ObserverMgr.ins.sendNotice("ACT_RANK_REWARD_GET_SUCCES");
         var _loc2_:Array = WealthUtil.rewardArrToWealthVoArr(param1.reward);
         FloatUtil.showGetItemsDisplayPanel(_loc2_);
         refreshRankRewrdBoxState();
      }
      
      private function textCDFormat_reward(param1:int) : String
      {
         return TextFieldUtil.htmlText2(TimeUtils.hisColonFullAddZero(param1),LabelUtils.cdColor(false));
      }
      
      private function txtCDCtrl_reward_cpl() : void
      {
         shenYuanModel.canGetReward = true;
         this.txt_rewardCD.text = "";
         refreshRankRewrdBoxState();
      }
      
      private function refreshRankRewrdBoxState() : void
      {
         if(shenYuanModel.canGetReward)
         {
            this.treasureBox.dataSource = new TreasureBoxVo([],2);
         }
         else
         {
            this.treasureBox.dataSource = new TreasureBoxVo([],1);
         }
      }
      
      override public function preShow(param1:Object = null) : void
      {
         ModuleMgr.ins.staticLayer.closeAll([10430,10400]);
         ModuleMgr.ins.showModule(10500,ChatModuleParam.init(this.moduleId,false));
         setSceneUIVisible(true);
         this.friend_assist.visible = false;
         initScene();
         ShopModel.ins.checkRedPoint(11306);
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
         if(NGUtil.checkModuleShow(41500,this) == false)
         {
            if(NGUtil.isCurFuncId(this.moduleId) == false && FloatBubbleUtil.needShow(1130))
            {
               if(_taskAlertRender == null)
               {
                  _taskAlertRender = new TaskAlertRenderS2();
                  _taskAlertRender.x = 366;
                  _taskAlertRender.y = 4;
                  _taskAlertRender.show(1130);
               }
               FloatBubbleUtil.addOneTime(1130.toString());
               this.label_getbuff.addChild(_taskAlertRender);
            }
            else if(_taskAlertRender)
            {
               _taskAlertRender.dispose();
               _taskAlertRender = null;
            }
         }
      }
      
      private function initScene() : void
      {
         this.scene = new ShenYuanScene();
         this.scene.init(this.moduleId,DefindConsts.SHEN_YUAN_STAGE_ID,initHandler);
         var _loc1_:VipHintBox = new VipHintBox(10500,47,185);
         _loc1_.hint.width = NaN;
         _loc1_.hint.align = "left";
         this.buffPanel.addChild(_loc1_);
         _loc1_ = new VipHintBox(10520,47,139);
         _loc1_.hint.width = NaN;
         _loc1_.hint.align = "left";
         this.buffPanel.addChild(_loc1_);
         this.addChild(this.scene);
      }
      
      private function initHandler() : void
      {
         scene.playerHero.runCplHandler = runCpl;
         shenYuanService.requestBaseInfo(gotShenYuanInfoHandler);
         this.preShowCpl();
      }
      
      private function getBuffTipArr() : Array
      {
         var _loc6_:* = null;
         var _loc5_:* = null;
         var _loc3_:Array = shenYuanModel.buffArr;
         _loc3_.sortOn("id",16);
         var _loc2_:String = "";
         var _loc1_:Array = [];
         var _loc8_:int = 0;
         var _loc7_:* = _loc3_;
         for each(var _loc4_ in _loc3_)
         {
            _loc5_ = StcMgr.ins.getBuffVo(_loc4_.id);
            _loc6_ = new NpcPropVo(0,1.0e-10 + _loc4_.param,"+");
            _loc6_.propName = LocaleMgr.ins.getStr(int(_loc5_.desc));
            _loc1_.push(_loc6_);
         }
         return _loc1_;
      }
      
      private function gotShenYuanInfoHandler(param1:GetShenYuanInfoRes, param2:Boolean = true) : void
      {
         shenYuanModel.canRevive = param1.canRevive;
         shenYuanModel.crtFloor = param1.currentlayer;
         shenYuanModel.crtStarCnt = param1.nowstar;
         shenYuanModel.maxStarCnt = param1.topStar;
         shenYuanModel.crtMonsterData = param1.monster;
         shenYuanModel.crtMonsterData.sortOn("position");
         shenYuanModel.buffArr = param1.buffid;
         shenYuanModel.selectedMonsterPos = 0;
         shenYuanModel.buffToBuyArr = param1.buff;
         shenYuanModel.isNormalReward = param1.box;
         shenYuanModel.canPass = param1.tongguan;
         shenYuanModel.daibi = param1.shenyuancoin;
         shenYuanModel.currRank = param1.rank;
         shenYuanModel.lastRank = param1.lastrank;
         shenYuanModel.canGetReward = param1.canGetReward;
         shenYuanModel.monstersForNextLayers = param1.monstersForNextLayers;
         shenYuanModel.helptimes = param1.helptime;
         shenYuanModel.canReachLayer = param1.canReachLayer;
         shenYuanModel.hisTopStar = param1.histTopStar;
         shenYuanModel.luckValue = param1.luckValue;
         shenYuanModel.boxOpenNum = param1.num;
         textCDCtrl_reward.stop();
         textCDCtrl_reward.start(param1.time);
         updateBaseInfo();
         var _loc4_:StcNvshendianBuffVo = StcMgr.ins.getNvshendianBuffVo(shenYuanModel.crtFloor);
         shenYuanModel.currFloorType = _loc4_.kind;
         if(isTopLayer(param1))
         {
            ObserverMgr.ins.sendNotice("floatMsgCenter",new AlertMsgVo(LocaleMgr.ins.getStr(999000523)));
            this.scene.showLv(101);
         }
         else if(param2 && this.scene.playerHero)
         {
            this.scene.showLv(shenYuanModel.crtFloor);
            initNgMoveArrow();
            this.scene.playerMoveCtrl.isActived = true;
         }
         var _loc3_:Boolean = shenYuanModel.canPass && shenYuanModel.noShowAlert == 1;
         canPassTxtVisible(_loc3_);
         MouseIconManager.ins.hideSpecialMouseCursor();
         updateFriendRedPointTime(param1.helptime);
         refreshRankRewrdBoxState();
         _lockClick = false;
      }
      
      private function isTopLayer(param1:GetShenYuanInfoRes) : Boolean
      {
         var _loc4_:Boolean = param1.monster && param1.monster.length > 0;
         var _loc5_:Boolean = param1.buff && param1.buff.length > 0;
         var _loc3_:Boolean = param1.box;
         var _loc2_:* = param1.currentlayer >= 100;
         return _loc2_ && !_loc4_ && !_loc5_ && !_loc3_;
      }
      
      private function updateFriendRedPointTime(param1:int) : void
      {
         if(param1 <= 0)
         {
            ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(41502,false));
         }
         else
         {
            ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(41502,true,param1));
         }
      }
      
      private function runCpl() : void
      {
         var _loc1_:Number = NaN;
         this.scene.playerHero.runCplHandler = runCpl;
         if(!this.scene.playerMoveCtrl.isActived)
         {
            return;
         }
         if(shenYuanModel.currFloorType == FLOOR_TYPE_MONSTER)
         {
            _loc1_ = Point.distance(scene.currLevelNpc.npc.pos2d,this.scene.playerHero.pos2d);
            if(_loc1_ > 200)
            {
               scene.currLevelNpc.randomWalkCtrl.resume();
            }
            else
            {
               scene.currLevelNpc.randomWalkCtrl.stop();
               scene.currLevelNpc.npc.setRotation(-MathUtil.roWith2Point(scene.currLevelNpc.npc.pos2d,scene.playerHero.pos2d),true);
               onCurrentLevelClk();
            }
         }
      }
      
      protected function initNgMoveArrow() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(scene.currLevelNpc == null)
         {
            return;
         }
         disposeMoveArrow();
         if(AssetLib.hasAsset(UrlLib.ng_role_move_arrow()))
         {
            _loc1_ = StcMgr.ins.getSpecialEffectVo(600001);
            _loc2_ = UrlLib.e3d_particle(_loc1_.effect);
            moveArrow = EffectManager.createEffect(_loc2_,false,null);
            scene.avatarLayer.addChild(moveArrow);
            validateMoveArrowPos();
         }
         else
         {
            AppGlobalContext.asynLoader.loadOne(new ResourceVo(UrlLib.ng_role_move_arrow()),initNgMoveArrow);
         }
      }
      
      protected function validateMoveArrowPos() : void
      {
         var _loc1_:* = null;
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         if(moveArrow)
         {
            _loc1_ = scene.playerHero.pos2d;
            _loc3_ = MathUtil.disWith2Point(_loc1_,scene.currLevelNpc.npc.pos2d);
            if(_loc3_ < 160)
            {
               this.moveArrow.visible = false;
            }
            else
            {
               this.moveArrow.visible = true;
               _loc2_ = MathUtil.roWith2Point(_loc1_,scene.currLevelNpc.npc.pos2d);
               this.moveArrow.position = TransformUtil.tran2DTo3D(_loc1_.x,_loc1_.y);
               this.moveArrow.rotationY = _loc2_ + 90;
            }
            TweenLite.killDelayedCallsTo(this.validateMoveArrowPos);
            TweenLite.delayedCall(0.01,this.validateMoveArrowPos);
         }
      }
      
      private function disposeMoveArrow() : void
      {
         if(moveArrow)
         {
            moveArrow.dispose();
            moveArrow = null;
         }
      }
      
      private function requestChallenge() : void
      {
         shenYuanService.requestFight(requestFightHandler,_assitVo);
      }
      
      private function requestFightHandler(param1:FightShenYuanStartRes) : void
      {
         BattleResultGlobel.ins.doubleId = 1011;
         ModuleMgr.ins.showModule(41504,param1,ModuleMgr.ins.popLayer.curModuleId);
      }
      
      private function refreshWhenBattleWin(param1:GetShenYuanInfoRes) : void
      {
         gotShenYuanInfoHandler(param1,false);
      }
      
      private function rebuildScene() : void
      {
         setSceneVisible(true);
      }
      
      private function starNumTxtTween() : void
      {
         TweenLite.to(this,0.5,{
            "starValue":shenYuanModel.crtStarCnt,
            "overwrite":2,
            "delay":1
         });
      }
      
      private function showRewardBox(param1:int = 0, param2:int = 0) : void
      {
         if(!rewardPanel)
         {
            rewardPanel = new ShenYuanRewardPanel();
            this.parts.push(rewardPanel);
         }
         if(rewardPanel.stage)
         {
            return;
         }
         ModuleMgr.ins.popLayer.addChild(rewardPanel);
         rewardPanel.init(param1,param2);
         rewardPanel.txt_daibi = this.txt_daibi;
      }
      
      private function updateBaseInfo() : void
      {
         txt_star_num.text = shenYuanModel.crtStarCnt + "";
         txt_currLayer.text = LocaleMgr.ins.getStr(41500131,[shenYuanModel.crtFloor]);
         this.txt_daibi.text = shenYuanModel.daibi + "";
         if(shenYuanModel.currRank > 0)
         {
            this.curr_rank.value = shenYuanModel.currRank;
            this.curr_rank.visible = true;
            this.txt_wsb.visible = false;
         }
         else
         {
            this.curr_rank.visible = false;
            this.txt_wsb.visible = true;
         }
         this.txt_star_num_all.text = shenYuanModel.maxStarCnt + "";
         this.list_buff.dataSource = getBuffTipArr();
         updateBuffPanelSize();
         this.txt_rebornTimes.text = LocaleMgr.ins.getStr(41500110,[shenYuanModel.canRevive]);
         this.label_revive.text = LocaleMgr.ins.getStr(30100350,[shenYuanModel.canRevive,VipModel.ins.getVipValue(10500)]);
         this.label_getbuff.text = LocaleMgr.ins.getStr(30100349,[VipModel.ins.getVipValue(10520)]);
      }
      
      private function canPassTxtVisible(param1:Boolean) : void
      {
         if(param1 == this.txt_canPass.visible)
         {
            return;
         }
         this.txt_canPass.visible = param1;
         if(param1)
         {
            canPassTxtAnimation();
         }
      }
      
      private function canPassTxtAnimation() : void
      {
         var _loc1_:Array = ["",".","..","..."];
         cptaIn = Number(cptaIn) + 1;
         this.txt_canPass.text = LocaleMgr.ins.getStr(999000524) + _loc1_[cptaIn % _loc1_.length];
         if(this.txt_canPass.visible)
         {
            TweenLite.delayedCall(0.5,canPassTxtAnimation);
         }
      }
      
      public function set starValue(param1:int) : void
      {
         _starValue = param1;
         txt_star_num.text = param1 + "";
      }
      
      public function get starValue() : int
      {
         return _starValue;
      }
      
      override public function close(param1:Object = null) : void
      {
         super.close(param1);
      }
      
      private function showMonsterSelect(param1:Object) : void
      {
         if(!monsterPanel)
         {
            monsterPanel = new ShenYuanSelectMonster();
            this.parts.push(monsterPanel);
         }
         ModuleMgr.ins.popLayer.addChild(monsterPanel);
         monsterPanel.init();
         monsterPanel.dataSource = param1;
      }
      
      private function showPassFloorAlert() : void
      {
         passYes = function():void
         {
            if(syalert.cb_selected)
            {
               shenYuanModel.noShowAlert = 1;
            }
            ServerEngine.ins.send(6076,new ShenYuanTongGuanReq(),serPassRet);
            scene.playerMoveCtrl.isActived = false;
         };
         passNo = function():void
         {
            if(syalert.cb_selected)
            {
               shenYuanModel.noShowAlert = 2;
            }
            showMonsterSelect(shenYuanModel.crtMonsterData);
         };
         if(shenYuanModel.noShowAlert == 1)
         {
            ServerEngine.ins.send(6076,new ShenYuanTongGuanReq(),serPassRet);
            this.scene.playerMoveCtrl.isActived = false;
            return;
         }
         if(shenYuanModel.noShowAlert == 2)
         {
            showMonsterSelect(shenYuanModel.crtMonsterData);
            return;
         }
         var syalert:ShenYuanPassAlert = new ShenYuanPassAlert();
         AlertUtil.comfirm(syalert,passYes,passNo,null,LocaleMgr.ins.getStr(41500128),LocaleMgr.ins.getStr(41500127));
      }
      
      private function onMonsterFight(param1:int) : void
      {
         shenYuanModel.selectedMonsterPos = param1 + 1;
         requestChallenge();
         cancelAssit();
      }
      
      private function showBuyBuffPanel(param1:*) : void
      {
         if(!buyBuffPanel)
         {
            buyBuffPanel = new ShenYuanBuyBuffPanel();
            this.parts.push(buyBuffPanel);
         }
         if(buyBuffPanel.stage)
         {
            return;
         }
         ModuleMgr.ins.popLayer.addChild(buyBuffPanel);
         buyBuffPanel.init();
         buyBuffPanel.dataSource = param1;
      }
      
      private function showActEndPanel() : void
      {
         if(!activityEndPanel)
         {
            activityEndPanel = new ShenYuanActiEndPanel();
         }
         activityEndPanel.txt_next.isHtml = true;
         activityEndPanel.txt_next.text = LocaleMgr.ins.getStr(999000525);
         activityEndPanel.txt_result.isHtml = true;
         if(!activityEndPanel.parent)
         {
            addChild(activityEndPanel);
         }
      }
      
      private function goUpFloor() : void
      {
         shenYuanService.requestBaseInfo(gotShenYuanInfoHandler);
      }
      
      private function scroolFloorListComp() : void
      {
         shenYuanModel.floorList.length = 5;
      }
      
      private function setSceneVisible(param1:Boolean) : void
      {
         this.scene.layer3D.visible = param1;
      }
      
      private function setSceneUIVisible(param1:Boolean) : void
      {
         this.btn_rule.visible = param1;
         buffPanel.visible = param1;
         if(param1)
         {
            ModuleMgr.ins.showModule(10430);
            ModuleMgr.ins.showModule(10400);
            ObserverMgr.ins.sendNotice("msg_main_tool_bar_id",new MainToolBarChangeMsg(MainToolBarChangeMsg.ShenYuan_moduleIdArr,[],true));
         }
         else
         {
            ModuleMgr.ins.closeModule(10430);
            ModuleMgr.ins.closeModule(10400);
         }
      }
      
      private function scrollUpdate() : void
      {
      }
      
      override public function dispose() : void
      {
         this.scene.playerHero.stopRun();
         this.scene.playerHero.runCplHandler = null;
         shenYuanService = null;
         shenYuanModel = null;
         TweenLite.killDelayedCallsTo(canPassTxtAnimation);
         disposeMoveArrow();
         if(textCDCtrl_reward)
         {
            textCDCtrl_reward.stop();
         }
         super.dispose();
      }
      
      override public function getFocusNotices() : Array
      {
         return ["shenyhuan_revive_success","shenyuan_buy_buff_complete","SHENYUAN_STAR_NUM_CHG","SHENYUAN_BUY_CHEST_COMPLETE","SHENYUAN_PASS_FLOOR","SHENYUAN_CHOOSE_ASSIT","wealthChange","SHENYUAN_CURRENT_LEVEL_CLICK","SHENYUAN_BUY_ONE_BUFF","SHENYUAN_FIGHT_MONSTER","SHENYUAN_OPEN_FRIENT_ASSIT"];
      }
      
      private function chooseAssit(param1:Array) : void
      {
         data = param1;
         flyCpl = function():void
         {
            friend_assist.visible = true;
            TweenLite.from(friend_assist,0.3,{"alpha":0});
         };
         friend_assist.visible = false;
         var vo:GameFriendData = data[0];
         var icon:Image = data[1];
         var lab:Image = new Image();
         lab.skin = icon.skin;
         lab.width = icon.width;
         lab.height = icon.height;
         new IconFlyEff(lab,ModuleMgr.ins.toGlobalPoi(icon),ModuleMgr.ins.toGlobalPoi(friend_assist.txt_name)).addHandlers(flyCpl).exec();
         _assitVo = vo;
         friend_assist.dataSource = vo;
         friend_assist.btn_cancel.clickHandler = cancelAssit;
      }
      
      private function cancelAssit() : void
      {
         _assitVo = null;
         this.friend_assist.visible = false;
      }
      
      private function passFloor() : void
      {
         var _loc1_:* = shenYuanModel.currFloorType;
         if(FLOOR_TYPE_BUFF !== _loc1_)
         {
            if(FLOOR_TYPE_MONSTER !== _loc1_)
            {
               if(FLOOR_TYPE_CHEST === _loc1_)
               {
                  ObserverMgr.ins.sendNotice("floatMsgCenter",new AlertMsgVo(LocaleMgr.ins.getStr(41500042)));
               }
            }
            else if(shenYuanModel.canPass)
            {
               ServerEngine.ins.send(6076,new ShenYuanTongGuanReq(),serPassRet);
            }
            else
            {
               ObserverMgr.ins.sendNotice("floatMsgCenter",new AlertMsgVo(LocaleMgr.ins.getStr(41500123)));
            }
         }
         else
         {
            ObserverMgr.ins.sendNotice("floatMsgCenter",new AlertMsgVo(LocaleMgr.ins.getStr(41500043)));
         }
      }
      
      private function serPassRet(param1:ShenYuanTongGuanRes) : void
      {
         res = param1;
         onActionComplete = function(param1:Event):void
         {
            param1.currentTarget.removeEventListener(param1.type,arguments.callee);
            shenYuanModel.crtStarCnt = res.star;
            txt_star_num.text = shenYuanModel.crtStarCnt + "";
            var _loc3_:Array = WealthUtil.rewardArrToWealthVoArr(res.reward);
            FloatUtil.showGetItemsDisplayPanel(_loc3_);
            goUpFloor();
            ObserverMgr.ins.sendNotice("floatMsgBottom",new AlertMsgVo(LocaleMgr.ins.getStr(41300100)));
         };
         this.scene.currLevelNpc.npc.addEventListener("animator_complete",onActionComplete);
         this.scene.currLevelNpc.npc.action = "dead";
         this.scene.currLevelNpc.disposeSZC();
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = param1;
         if("shenyhuan_revive_success" !== _loc5_)
         {
            if("SHENYUAN_BUY_CHEST_COMPLETE" !== _loc5_)
            {
               if("shenyuan_buy_buff_complete" !== _loc5_)
               {
                  if("SHENYUAN_STAR_NUM_CHG" !== _loc5_)
                  {
                     if("SHENYUAN_PASS_FLOOR" !== _loc5_)
                     {
                        if("SHENYUAN_CHOOSE_ASSIT" !== _loc5_)
                        {
                           if("wealthChange" !== _loc5_)
                           {
                              if("SHENYUAN_BUY_ONE_BUFF" !== _loc5_)
                              {
                                 if("SHENYUAN_FIGHT_MONSTER" !== _loc5_)
                                 {
                                    if("SHENYUAN_CURRENT_LEVEL_CLICK" !== _loc5_)
                                    {
                                       if("SHENYUAN_OPEN_FRIENT_ASSIT" === _loc5_)
                                       {
                                          if(shenYuanModel.currFloorType == FLOOR_TYPE_MONSTER)
                                          {
                                             ModuleMgr.ins.showOrCloseModule(41502,null,ModuleMgr.ins.popLayer.curModuleId);
                                          }
                                          else
                                          {
                                             ObserverMgr.ins.sendNotice("floatMsgCenter",new AlertMsgVo(LocaleMgr.ins.getStr(41500130)));
                                          }
                                       }
                                    }
                                    else
                                    {
                                       onCurrentLevelClk();
                                    }
                                 }
                                 else
                                 {
                                    onMonsterFight(param2 as int);
                                 }
                              }
                              else
                              {
                                 this.list_buff.dataSource = getBuffTipArr();
                                 updateBuffPanelSize();
                              }
                           }
                           else
                           {
                              _loc4_ = param2 as WealthChangeEvent;
                              if(_loc4_.wealthType == 12)
                              {
                                 this.txt_daibi.text = _loc4_.value + "";
                              }
                           }
                        }
                        else
                        {
                           chooseAssit(param2);
                        }
                     }
                     else
                     {
                        passFloor();
                     }
                  }
                  else
                  {
                     txt_star_num.text = shenYuanModel.crtStarCnt + "";
                  }
               }
            }
            _lockClick = true;
            _loc3_ = new GetShenYuanInfoReq();
            _loc3_.contiChanllge = true;
            ServerEngine.ins.send(6073,_loc3_,gotShenYuanInfoHandler);
         }
      }
      
      private function onCurrentLevelClk() : void
      {
         if(isDisposed)
         {
            return;
         }
         if(_lockClick)
         {
            return;
         }
         var _loc1_:* = shenYuanModel.currFloorType;
         if(FLOOR_TYPE_BUFF !== _loc1_)
         {
            if(FLOOR_TYPE_MONSTER !== _loc1_)
            {
               if(FLOOR_TYPE_CHEST === _loc1_)
               {
                  if(shenYuanModel.isNormalReward)
                  {
                     showRewardBox(0,shenYuanModel.crtFloor);
                  }
                  else
                  {
                     showRewardBox(1,shenYuanModel.crtFloor);
                  }
               }
            }
            else if(shenYuanModel.canPass)
            {
               showPassFloorAlert();
            }
            else
            {
               showMonsterSelect(shenYuanModel.crtMonsterData);
            }
         }
         else
         {
            showBuyBuffPanel(shenYuanModel.buffToBuyArr);
         }
      }
   }
}
