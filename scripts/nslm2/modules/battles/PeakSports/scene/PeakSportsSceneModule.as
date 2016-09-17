package nslm2.modules.battles.PeakSports.scene
{
   import game.ui.peakSports.peakSportsScene.PeakSportsSceneModuleUI;
   import nslm2.common.ui.components.comps2d.HorseLampVMultiLine;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import org.specter3d.display.particle.SpecterEffect;
   import flash.geom.Vector3D;
   import nslm2.modules.battles.PeakSports.model.PeakSportsModel;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.battles.PeakSports.service.PeakSportsBattleService;
   import nslm2.modules.battles.PeakSports.type.PeakSportsMsgs;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.battles.PeakSports.model.vos.PeakSportsPlayerDiedVo;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.battles.battle.FPUtil;
   import nslm2.utils.TimeUtils;
   import com.netease.protobuf.UInt64;
   import morn.core.components.Button;
   import proto.BkSpecialCommandReq;
   import nslm2.nets.sockets.ServerEngine;
   import com.greensock.TweenLite;
   import proto.BkSpecialCommandRes;
   import nslm2.modules.battles.PeakSports.model.PeakFlagModel;
   import proto.BkMyItemInfo;
   import flash.events.Event;
   import flash.geom.Point;
   import away3d.events.MouseEvent3D;
   import nslm2.modules.battles.PeakSports.control.PeakSportsCurPlayerControl;
   import nslm2.utils.ServerTimer;
   import nslm2.modules.battles.PeakSports.type.PeakSportsTempType;
   import org.specter3d.display.particle.EffectManager;
   import nslm2.utils.Effect3DUtils;
   import nslm2.modules.scenes.commons.SceneModel;
   import proto.BkGameStageInfoNotify;
   import proto.BkStageResInfo;
   import nslm2.utils.TransformUtil;
   import com.greensock.TimelineLite;
   import proto.BkSceneMoveReq;
   import proto.BkStagePlayerInfo;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.mainToolBar.MainToolBarBackMsg;
   import nslm2.modules.foundations.mainToolBar.MainToolBarChangeMsg;
   import nslm2.common.globals.GlobalRef;
   import nslm2.mgrs.MouseIconManager;
   import nslm2.modules.foundations.chatModules.ChatModel;
   import nslm2.modules.foundations.chatModules.ChatModuleParam;
   import morn.customs.expands.MornExpandUtil;
   
   public class PeakSportsSceneModule extends PeakSportsSceneModuleUI
   {
       
      
      public var scene:nslm2.modules.battles.PeakSports.scene.PeakSportsScene3D;
      
      private var _horseLamp:HorseLampVMultiLine;
      
      private var _textCDCtrl:TextCDCtrlS2;
      
      private var _protectMaskEffect:SpecterEffect;
      
      private var _protectMaskEffectEnimy:SpecterEffect;
      
      private var _protectMaskDestroyEff:SpecterEffect;
      
      private var maskEffPos:Vector3D;
      
      private var maskEffPos2:Vector3D;
      
      private var maskEffCryPos:Vector3D;
      
      private var maskEffCryPos2:Vector3D;
      
      private var effPos1:Vector3D;
      
      private var effPos2:Vector3D;
      
      private var effPos3:Vector3D;
      
      private var _specterEffect1:nslm2.modules.battles.PeakSports.scene.PeakSportsEffectProgressView;
      
      private var _specterEffect2:nslm2.modules.battles.PeakSports.scene.PeakSportsEffectProgressView;
      
      private var _specterEffect3:nslm2.modules.battles.PeakSports.scene.PeakSportsEffectProgressView;
      
      private var _peakSportsDeathView:nslm2.modules.battles.PeakSports.scene.PeakSportsDeathView;
      
      private var _showAll:Boolean = true;
      
      private var _leftBtnBool:Boolean;
      
      private var _rightBtnBool:Boolean;
      
      private var isDownBool:Boolean;
      
      private var aim:Point;
      
      private var _curPlayerCtrl:PeakSportsCurPlayerControl;
      
      public function PeakSportsSceneModule()
      {
         maskEffPos = new Vector3D(440,0,-10115);
         maskEffPos2 = new Vector3D(4016,0,-1311);
         maskEffCryPos = new Vector3D(972,0,-9841);
         maskEffCryPos2 = new Vector3D(3492,0,-1646);
         effPos1 = new Vector3D(543,498,0);
         effPos2 = new Vector3D(2347,2011,0);
         effPos3 = new Vector3D(3813,3968,0);
         super();
         ModuleMgr.ins.staticLayer.closeAll([10430]);
         ModuleMgr.ins.showModule(10480);
         ModuleMgr.ins.showModule(10500,ChatModuleParam.init(50527,true,false,1008));
         ObserverMgr.ins.sendNotice("MSG_SWITCH_MINIMAP_HINTBOX_VISIBLE",false);
         ObserverMgr.ins.sendNotice("msg_main_tool_bar_id",new MainToolBarChangeMsg([50532,50526],[],true,false));
         ObserverMgr.ins.sendNotice("msg_update_icon_bar_visible",false);
         ObserverMgr.ins.sendNotice("main_tool_bar_back_add",new MainToolBarBackMsg(50527,btnBack_handler,null));
         GlobalRef.bottomModuleBtns.expBar.visible = false;
         GlobalRef.bottomModuleBtns.btnRecharge.visible = false;
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
      }
      
      public function get leftBtnBool() : Boolean
      {
         return _leftBtnBool;
      }
      
      public function set leftBtnBool(param1:Boolean) : void
      {
         _leftBtnBool = param1;
         if(_leftBtnBool)
         {
            leftBtn.skin = "png.uiPeakSports.btn_left";
         }
         else
         {
            leftBtn.skin = "png.uiPeakSports.btn_right";
         }
      }
      
      public function get rightBtnBool() : Boolean
      {
         return _rightBtnBool;
      }
      
      public function set rightBtnBool(param1:Boolean) : void
      {
         _rightBtnBool = param1;
         if(_rightBtnBool)
         {
            rightBtn.skin = "png.uiPeakSports.btn_right";
         }
         else
         {
            rightBtn.skin = "png.uiPeakSports.btn_left";
         }
      }
      
      private function btnBack_handler() : void
      {
         if(PeakSportsModel.ins.isFinished)
         {
            PeakSportsModel.ins.clearLastFightData();
            PeakSportsModel.ins.clearData();
            ModuleMgr.ins.closeModule(this.moduleId);
         }
         else
         {
            AlertUtil.comfirm(LocaleMgr.ins.getStr(999600129),onConfirm);
         }
      }
      
      private function onConfirm() : void
      {
         PeakSportsBattleService.ins.leave();
         ModuleMgr.ins.closeModule(this.moduleId);
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            PeakSportsMsgs.ins.addEventListener("msgFightPlayerDied",onDie);
            PeakSportsMsgs.ins.addEventListener("msgFightPlayerRevived",onRevive);
            PeakSportsMsgs.ins.addEventListener("msgFightInfoChanged",onInfoChanged);
            PeakSportsMsgs.ins.addEventListener("msgFightFinished",onFinished);
            PeakSportsMsgs.ins.addEventListener("msgFightNewHorseLamp",onNewHorseLamp);
            PeakSportsMsgs.ins.addEventListener("peakSportsStep",onStep);
            PeakSportsMsgs.ins.addEventListener("msgPeakSportsEnterScene",enterSceneHandle);
            PeakSportsMsgs.ins.addEventListener("msgFightNewPlayer",addPlayerHandle);
            PeakSportsMsgs.ins.addEventListener("msgFightPlayerLeave",removePlayerHandle);
            App.stage.addEventListener("resize",resize);
         }
         else
         {
            PeakSportsMsgs.ins.removeEventListener("msgFightPlayerDied",onDie);
            PeakSportsMsgs.ins.removeEventListener("msgFightPlayerRevived",onRevive);
            PeakSportsMsgs.ins.removeEventListener("msgFightInfoChanged",onInfoChanged);
            PeakSportsMsgs.ins.removeEventListener("msgFightFinished",onFinished);
            PeakSportsMsgs.ins.removeEventListener("msgFightNewHorseLamp",onNewHorseLamp);
            PeakSportsMsgs.ins.removeEventListener("peakSportsStep",onStep);
            PeakSportsMsgs.ins.removeEventListener("msgPeakSportsEnterScene",enterSceneHandle);
            PeakSportsMsgs.ins.removeEventListener("msgFightNewPlayer",addPlayerHandle);
            PeakSportsMsgs.ins.removeEventListener("msgFightPlayerLeave",removePlayerHandle);
            App.stage.removeEventListener("resize",resize);
         }
      }
      
      private function onDie(param1:MzEvent) : void
      {
         var _loc2_:PeakSportsPlayerDiedVo = param1.data as PeakSportsPlayerDiedVo;
         if(PlayerModel.ins.isCurPlayer(_loc2_.playerId))
         {
            scene.multiBgLayer.addMethod(FPUtil.getGrayMethod());
            if(_loc2_.rebornStamp == -1)
            {
               scene.isDragBool = true;
               scene.multiBgLayer.mouseChildren = true;
               scene.multiBgLayer.mouseEnabled = true;
               txt_reviveCountDown.text = LocaleMgr.ins.getStr(999600130);
               this.txt_reviveCountDown.visible = true;
            }
            else
            {
               scene.isDragBool = false;
               scene.multiBgLayer.mouseChildren = false;
               scene.multiBgLayer.mouseEnabled = false;
               if(_textCDCtrl == null)
               {
                  _textCDCtrl = new TextCDCtrlS2(this.txt_reviveCountDown,textCDFormat,countDownCpl);
                  _textCDCtrl.start(_loc2_.rebornStamp);
                  this.txt_reviveCountDown.visible = true;
               }
            }
         }
      }
      
      private function countDownCpl() : void
      {
         if(_textCDCtrl)
         {
            _textCDCtrl.dispose();
            _textCDCtrl = null;
            this.txt_reviveCountDown.visible = false;
         }
      }
      
      private function textCDFormat(param1:int) : String
      {
         return LocaleMgr.ins.getStr(50500109) + ":" + TimeUtils.hisColonAddZero2(param1);
      }
      
      private function onRevive(param1:MzEvent) : void
      {
         var _loc2_:UInt64 = param1.data as UInt64;
         if(PlayerModel.ins.isCurPlayer(_loc2_))
         {
            scene.multiBgLayer.removeMethod(FPUtil.getGrayMethod());
            scene.multiBgLayer.mouseChildren = true;
            scene.multiBgLayer.mouseEnabled = true;
            if(_textCDCtrl)
            {
               _textCDCtrl.dispose();
               _textCDCtrl = null;
               this.txt_reviveCountDown.visible = false;
            }
            AlertUtil.float(LocaleMgr.ins.getStr(50500132));
         }
      }
      
      private function onInfoChanged(param1:MzEvent) : void
      {
         updateInfo();
      }
      
      private function onFinished(param1:MzEvent) : void
      {
         if(ModuleMgr.ins.isShow(50528) == false)
         {
            ModuleMgr.ins.showModule(50528,null,ModuleMgr.ins.popLayer.curModuleId);
         }
      }
      
      private function onNewHorseLamp(param1:MzEvent) : void
      {
         _horseLamp.add(param1.data as String);
      }
      
      protected function onStep(param1:MzEvent) : void
      {
         (topInfoView as PeakSportsSceneTopPanel).updataStep();
         if(PeakSportsModel.ins.step == 1)
         {
            if(_peakSportsDeathView == null)
            {
               _peakSportsDeathView = new nslm2.modules.battles.PeakSports.scene.PeakSportsDeathView();
            }
            _peakSportsDeathView.x = ModuleMgr.ins.popLayer.width - _peakSportsDeathView.width >> 1;
            _peakSportsDeathView.y = ModuleMgr.ins.popLayer.height - _peakSportsDeathView.height >> 1;
            ModuleMgr.ins.popLayer.addChild(_peakSportsDeathView);
            removeEnimyEffect();
         }
         else if(_peakSportsDeathView && _peakSportsDeathView.parent)
         {
            _peakSportsDeathView.outEffect();
         }
         changePathMask();
      }
      
      protected function addPlayerHandle(param1:MzEvent) : void
      {
         showList();
      }
      
      protected function removePlayerHandle(param1:MzEvent) : void
      {
         showList();
      }
      
      protected function enterSceneHandle(param1:MzEvent) : void
      {
         showList();
      }
      
      private function onBtnFunc(param1:Button) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = param1;
         if(btn_suofang !== _loc3_)
         {
            if(buyBtn !== _loc3_)
            {
               if(leftBtn !== _loc3_)
               {
                  if(rightBtn === _loc3_)
                  {
                     TweenLite.killTweensOf(rightBox);
                     if(rightBtnBool)
                     {
                        TweenLite.to(rightBox,0.5,{"right":-202});
                     }
                     else
                     {
                        TweenLite.to(rightBox,0.5,{"right":0});
                     }
                     rightBtnBool = !rightBtnBool;
                  }
               }
               else
               {
                  TweenLite.killTweensOf(leftBox);
                  if(leftBtnBool)
                  {
                     TweenLite.to(leftBox,0.5,{"left":-202});
                  }
                  else
                  {
                     TweenLite.to(leftBox,0.5,{"left":0});
                  }
                  leftBtnBool = !leftBtnBool;
               }
            }
            else
            {
               buyBtn.disabled = true;
               _loc2_ = new BkSpecialCommandReq();
               _loc2_.command = 1;
               _loc2_.param1 = 1;
               _loc2_.param2 = 0;
               ServerEngine.ins.send(4276,_loc2_,fogRqecpl);
            }
         }
         else
         {
            _showAll = !_showAll;
            showOrHideHorseLamp(_showAll);
         }
      }
      
      private function fogRqecpl(param1:BkSpecialCommandRes) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         if(param1.command == 1)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(999600035));
            _loc3_ = PeakFlagModel.ins.bkGameStageInfoNotify.myInfo.items;
            _loc4_ = 0;
            while(_loc4_ < _loc3_.length)
            {
               _loc2_ = _loc3_[_loc4_] as BkMyItemInfo;
               if(_loc2_ && _loc2_.itemId == 1)
               {
                  _loc2_.itemNum = Number(_loc2_.itemNum) - 1;
                  if(_loc2_.itemNum < 0)
                  {
                     _loc2_.itemNum = 0;
                  }
               }
               _loc4_++;
            }
            TweenLite.killTweensOf(fogBox);
            TweenLite.to(fogBox,0.5,{"alpha":0});
         }
      }
      
      private function showOrHideHorseLamp(param1:Boolean) : void
      {
         if(param1)
         {
            TweenLite.to(this._horseLamp,0.5,{"x":0});
            TweenLite.to(this.img_arrow,0.5,{"rotation":-90});
         }
         else
         {
            TweenLite.to(this._horseLamp,0.5,{"x":500});
            TweenLite.to(this.img_arrow,0.5,{"rotation":90});
         }
      }
      
      override public function preShow(param1:Object = null) : void
      {
         leftBtnBool = true;
         rightBtnBool = true;
         App.stage.addEventListener("resize",resizeHandle);
         PeakSportsModel.ins.isInBattleScene = true;
         init3D();
         txt_reviveCountDown.visible = false;
         box_starCon.visible = false;
         _horseLamp = new HorseLampVMultiLine("right");
         _horseLamp.mouseEnabled = false;
         _horseLamp.needCycling = false;
         this.txt_horseLamp.replaceWith(_horseLamp);
         _horseLamp.init(6);
         _horseLamp.speed = 1;
         _horseLamp.show([]);
      }
      
      protected function resizeHandle(param1:Event) : void
      {
         if(_peakSportsDeathView)
         {
            _peakSportsDeathView.x = this.width - _peakSportsDeathView.width >> 1;
            _peakSportsDeathView.y = this.height - _peakSportsDeathView.height >> 1;
         }
      }
      
      private function init3D() : void
      {
         scene = new nslm2.modules.battles.PeakSports.scene.PeakSportsScene3D();
         PeakSportsModel.ins.curScene = scene;
         scene.init(this.moduleId,50520,initHandler);
         this.addChild(scene);
      }
      
      protected function scene3DMouseUp(param1:MouseEvent3D) : void
      {
         isDownBool = true;
         aim = scene.lookAtPos2d;
      }
      
      protected function scene3DMouseDown(param1:MouseEvent3D) : void
      {
         isDownBool = false;
      }
      
      protected function scene3DMouseMove(param1:MouseEvent3D) : void
      {
      }
      
      private function initHandler() : void
      {
         _curPlayerCtrl = new PeakSportsCurPlayerControl();
         this.parts.push(new PeakSportsCurPlayerControl());
         _curPlayerCtrl.bind(this.scene.playerHero).initScene(this.scene);
         scene.playerHero.tag3DVBox.hideGuildName();
         var _loc1_:uint = PeakFlagModel.ins.bkGameStageInfoNotify.startStamp;
         if(ServerTimer.ins.second < _loc1_ + int(PeakSportsTempType.BK_WAITING_TIME))
         {
            if(_textCDCtrl == null)
            {
               _textCDCtrl = new TextCDCtrlS2(this.txt_reviveCountDown,textCDFormatReady,bgStart);
               this.parts.push(new TextCDCtrlS2(this.txt_reviveCountDown,textCDFormatReady,bgStart));
               _textCDCtrl.start(_loc1_ + int(PeakSportsTempType.BK_WAITING_TIME));
               this.txt_reviveCountDown.visible = true;
            }
            _protectMaskEffect = EffectManager.createEffect(Effect3DUtils.getUrlBySid(600020),true,null,null,0,true,1);
            scene.multiBgLayer.effAllLayer.addChild(_protectMaskEffect);
            _protectMaskEffectEnimy = EffectManager.createEffect(Effect3DUtils.getUrlBySid(600020),true,null,null,0,true,1);
            scene.multiBgLayer.effAllLayer.addChild(_protectMaskEffectEnimy);
            if(PeakSportsModel.ins.currentBkStagePlayerInfo.side == 1)
            {
               _protectMaskEffect.position = maskEffPos;
               _protectMaskEffectEnimy.position = maskEffPos2;
               var _loc2_:int = 4;
               _protectMaskEffectEnimy.scaleAll = _loc2_;
               _protectMaskEffect.scaleAll = _loc2_;
               _loc2_ = -8;
               _protectMaskEffectEnimy.rotationX = _loc2_;
               _protectMaskEffect.rotationX = _loc2_;
            }
            else
            {
               _protectMaskEffectEnimy.position = maskEffPos;
               _protectMaskEffect.position = maskEffPos2;
               _loc2_ = 4;
               _protectMaskEffectEnimy.scaleAll = _loc2_;
               _protectMaskEffect.scaleAll = _loc2_;
               _loc2_ = -8;
               _protectMaskEffectEnimy.rotationX = _loc2_;
               _protectMaskEffect.rotationX = _loc2_;
            }
         }
         else
         {
            _protectMaskEffect = EffectManager.createEffect(Effect3DUtils.getUrlBySid(600020),true,null,null,0,true,1);
            scene.multiBgLayer.effAllLayer.addChild(_protectMaskEffect);
            if(PeakSportsModel.ins.currentBkStagePlayerInfo.side == 2)
            {
               _protectMaskEffect.position = maskEffPos;
               _protectMaskEffect.scaleAll = 4;
               _protectMaskEffect.rotationX = -8;
            }
            else
            {
               _protectMaskEffect.position = maskEffPos2;
               _protectMaskEffect.scaleAll = 4;
               _protectMaskEffect.rotationX = -8;
            }
            changePathMask();
         }
         addEff();
         updateInfo();
         preShowCpl();
      }
      
      private function changePathMask() : void
      {
         var _loc1_:uint = PeakFlagModel.ins.bkGameStageInfoNotify.startStamp + int(PeakSportsTempType.BK_WAITING_TIME) + PeakSportsTempType.battleTime - PeakSportsTempType.dieModelTime;
         if(ServerTimer.ins.second > _loc1_ || PeakSportsModel.ins.step == 1)
         {
            SceneModel.ins.findPathMed.initFindPathMed([3]);
         }
         else
         {
            switch(int(PeakSportsModel.ins.currentBkStagePlayerInfo.side) - 1)
            {
               case 0:
                  SceneModel.ins.findPathMed.initFindPathMed([1]);
                  break;
               case 1:
                  SceneModel.ins.findPathMed.initFindPathMed([2]);
            }
         }
      }
      
      private function updateInfo() : void
      {
         var _loc5_:int = 0;
         var _loc4_:* = null;
         var _loc1_:* = null;
         var _loc2_:BkGameStageInfoNotify = PeakFlagModel.ins.bkGameStageInfoNotify;
         (topInfoView as PeakSportsSceneTopPanel).show(_loc2_);
         (myInfoView as PeakSportsMyInfoPanel).show2(_loc2_);
         _loc5_ = 0;
         while(_loc5_ < _loc2_.resInfos.length)
         {
            _loc4_ = _loc2_.resInfos[_loc5_] as BkStageResInfo;
            if(_loc4_.id == 9002)
            {
               _specterEffect1.progressValue(_loc4_.progress,_loc4_.id);
            }
            else if(_loc4_.id == 9003)
            {
               _specterEffect2.progressValue(_loc4_.progress,_loc4_.id);
            }
            else
            {
               _specterEffect3.progressValue(_loc4_.progress,_loc4_.id);
            }
            _loc5_++;
         }
         var _loc3_:Array = _loc2_.myInfo.items;
         _loc5_ = 0;
         while(_loc5_ < _loc3_.length)
         {
            _loc1_ = _loc3_[_loc5_] as BkMyItemInfo;
            if(_loc1_ && _loc1_.itemId == 1)
            {
               if(_loc1_.itemNum > 0)
               {
                  fogBox.alpha = 1;
               }
               else if(fogBox.alpha == 1)
               {
                  fogBox.alpha = 0;
               }
            }
            _loc5_++;
         }
      }
      
      public function addEff() : void
      {
         _specterEffect1 = new nslm2.modules.battles.PeakSports.scene.PeakSportsEffectProgressView();
         _specterEffect1.showEffect(9000002);
         effPos1 = TransformUtil.tran2DTo3DByPoi(new Point(effPos1.x,effPos1.y));
         _specterEffect1.position = effPos1;
         scene.multiBgLayer.effAllLayer.addChild(_specterEffect1);
         _specterEffect2 = new nslm2.modules.battles.PeakSports.scene.PeakSportsEffectProgressView();
         _specterEffect2.showEffect(9000003);
         effPos2 = TransformUtil.tran2DTo3DByPoi(new Point(effPos2.x,effPos2.y));
         _specterEffect2.position = effPos2;
         scene.multiBgLayer.effAllLayer.addChild(_specterEffect2);
         _specterEffect3 = new nslm2.modules.battles.PeakSports.scene.PeakSportsEffectProgressView();
         _specterEffect3.showEffect(9000004);
         effPos3 = TransformUtil.tran2DTo3DByPoi(new Point(effPos3.x,effPos3.y));
         _specterEffect3.position = effPos3;
         scene.multiBgLayer.effAllLayer.addChild(_specterEffect3);
      }
      
      private function textCDFormatReady(param1:int) : String
      {
         return LocaleMgr.ins.getStr(50500110) + ":" + TimeUtils.hisColonAddZero2(param1);
      }
      
      private function bgStart() : void
      {
         this.box_starCon.visible = true;
         this.txt_reviveCountDown.visible = false;
         var _loc1_:TimelineLite = new TimelineLite();
         _loc1_.from(this.img_star,0.2,{
            "scaleX":1.5,
            "scaleY":1.5
         });
         _loc1_.to(this.img_starC,0.3,{
            "scaleX":3,
            "scaleY":3,
            "alpha":0
         });
         _loc1_.call(readyOver,null,"+=.1");
         if(_textCDCtrl)
         {
            _textCDCtrl.dispose();
            _textCDCtrl = null;
            this.txt_reviveCountDown.visible = false;
         }
         var _loc2_:BkSceneMoveReq = new BkSceneMoveReq();
         _loc2_.x = this.scene.playerHero.pos2d.x;
         _loc2_.y = this.scene.playerHero.pos2d.y;
         PeakSportsBattleService.ins.sendSelfPos(_loc2_,true);
         _protectMaskDestroyEff = EffectManager.createEffect(Effect3DUtils.getUrlBySid(600021),true,null,moveProtectMaskEffect,0,true,1);
         scene.multiBgLayer.effAllLayer.addChild(_protectMaskDestroyEff);
         if(PeakSportsModel.ins.currentBkStagePlayerInfo.side == 1)
         {
            _protectMaskDestroyEff.x = 440;
            _protectMaskDestroyEff.y = 0;
            _protectMaskDestroyEff.z = -10115;
            _protectMaskDestroyEff.scaleAll = 4;
            _protectMaskDestroyEff.rotationX = -8;
         }
         else
         {
            _protectMaskDestroyEff.x = 4016;
            _protectMaskDestroyEff.y = 0;
            _protectMaskDestroyEff.z = -1311;
            _protectMaskDestroyEff.scaleAll = 4;
            _protectMaskDestroyEff.rotationX = -8;
         }
         changePathMask();
      }
      
      private function moveProtectMaskEffect(param1:Object) : void
      {
         if(_protectMaskEffect)
         {
            scene.multiBgLayer.effAllLayer.removeChild(_protectMaskEffect);
            _protectMaskEffect.dispose();
            _protectMaskEffect = null;
         }
      }
      
      private function removeEnimyEffect() : void
      {
         if(_protectMaskEffectEnimy)
         {
            scene.multiBgLayer.effAllLayer.removeChild(_protectMaskEffectEnimy);
            _protectMaskEffectEnimy.dispose();
            _protectMaskEffectEnimy = null;
         }
      }
      
      private function readyOver() : void
      {
         this.box_starCon.visible = false;
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
         showList();
      }
      
      private function showList() : void
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc6_:int = 0;
         resize(null);
         var _loc5_:Array = [];
         var _loc1_:Array = [];
         var _loc2_:Array = PeakSportsModel.ins.bkStagePlayers.array;
         _loc6_ = 0;
         while(_loc6_ < _loc2_.length)
         {
            _loc4_ = _loc2_[_loc6_] as BkStagePlayerInfo;
            if(_loc4_)
            {
               _loc3_ = {};
               _loc3_.id = _loc4_.playerInfo.baseInfo.id;
               _loc3_.npcId = _loc4_.playerInfo.baseInfo.npcId;
               _loc3_.name = PlayerModel.ins.getFullNameWithDistName(_loc4_.playerInfo.baseInfo);
               _loc3_.lv = _loc4_.playerInfo.baseInfo.lv;
               _loc3_.ability = _loc4_.playerInfo.baseInfo.ability;
               _loc3_.side = _loc4_.side;
               if(_loc4_.side == 1)
               {
                  _loc5_.push(_loc3_);
               }
               else if(_loc4_.side == 2)
               {
                  _loc1_.push(_loc3_);
               }
            }
            _loc6_++;
         }
         _loc5_.sortOn("ability",2);
         _loc1_.sortOn("ability",2);
         leftList.repeatY = _loc5_.length;
         leftList.array = _loc5_;
         rightList.repeatY = _loc1_.length;
         rightList.array = _loc1_;
      }
      
      override public function preClose(param1:Object = null) : void
      {
         App.stage.removeEventListener("resize",resizeHandle);
         ObserverMgr.ins.sendNotice("main_tool_bar_back_delete",new MainToolBarBackMsg(50520,this.btnBack_handler,null));
         ObserverMgr.ins.sendNotice("msg_main_tool_bar_id",new MainToolBarChangeMsg(MainToolBarChangeMsg.MainCity_moduleIdArr,MainToolBarChangeMsg.MainCity_moduleIdArrVertical,false));
         PeakSportsBattleService.ins.switchEventListeners(false);
         ObserverMgr.ins.sendNotice("msg_update_icon_bar_visible",true);
         PeakSportsModel.ins.curScene = null;
         ModuleMgr.ins.closeModule(10480);
         GlobalRef.bottomModuleBtns.expBar.visible = true;
         GlobalRef.bottomModuleBtns.btnRecharge.visible = true;
         MouseIconManager.changeMouseCursor("auto");
         MouseIconManager.ins.hideSpecialMouseCursor();
         PeakFlagModel.ins.dispose();
         ChatModel.ins.synChannels();
         if(_protectMaskEffect)
         {
            _protectMaskEffect.dispose();
            _protectMaskEffect = null;
         }
         if(_protectMaskDestroyEff)
         {
            _protectMaskDestroyEff.dispose();
            _protectMaskDestroyEff = null;
         }
         if(_protectMaskEffectEnimy)
         {
            _protectMaskEffectEnimy.dispose();
            _protectMaskEffectEnimy = null;
         }
         PeakSportsModel.ins.isInBattleScene = false;
         super.preClose(param1);
      }
      
      private function resize(param1:Event) : void
      {
         TweenLite.killTweensOf(leftBox);
         TweenLite.killTweensOf(rightBox);
         if(_leftBtnBool)
         {
            leftBox.left = 0;
         }
         else
         {
            leftBox.left = -202;
         }
         if(_rightBtnBool)
         {
            rightBox.right = 0;
         }
         else
         {
            rightBox.right = -202;
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
