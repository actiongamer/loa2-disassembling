package nslm2.modules.battles.battlefields.scene
{
   import game.ui.battlefield.BattlefieldScene.BattlefieldSceneModuleUI;
   import nslm2.common.ui.components.comps2d.HorseLampVMultiLine;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import org.specter3d.display.particle.SpecterEffect;
   import flash.geom.Vector3D;
   import nslm2.mgrs.stcMgrs.vos.StcBginfoVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.battles.battlefields.msgs.BattlefieldMsgs;
   import flash.events.Event;
   import nslm2.modules.battles.battlefields.model.BattleFlagModel;
   import morn.core.components.Button;
   import com.greensock.TweenLite;
   import nslm2.modules.battles.battlefields.model.BattlefieldModel;
   import nslm2.common.ctrls.ProgressBarCtrl;
   import nslm2.modules.footstones.assistantModules.model.AssistantModel;
   import nslm2.mgrs.stcMgrs.vos.StcAssistantLevelVo;
   import nslm2.common.model.PlayerModel;
   import proto.TaskGetCurInfoReq;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.TaskGetCurInfoRes;
   import proto.TaskInfo;
   import nslm2.modules.battles.battlefields.model.BattlefieldCrystalModel;
   import nslm2.modules.battles.battlefields.panels.BattleFlagInfoPanel;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.battles.battlefields.service.BattlefieldBattleService;
   import nslm2.modules.battles.battlefields.ctrls.BattlefieldCurPlayerCtrl;
   import nslm2.utils.ServerTimer;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import org.specter3d.display.particle.EffectManager;
   import nslm2.utils.Effect3DUtils;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.battles.battlefields.vos.BattlefieldPlayerDiedVo;
   import nslm2.modules.battles.battle.FPUtil;
   import nslm2.utils.TimeUtils;
   import com.greensock.TimelineLite;
   import proto.BgSceneMoveReq;
   import nslm2.modules.scenes.commons.SceneModel;
   import com.netease.protobuf.UInt64;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.mainToolBar.MainToolBarBackMsg;
   import nslm2.modules.foundations.mainToolBar.MainToolBarChangeMsg;
   import nslm2.common.globals.GlobalRef;
   import nslm2.mgrs.MouseIconManager;
   import nslm2.modules.foundations.chatModules.ChatModel;
   import nslm2.modules.foundations.chatModules.ChatModuleParam;
   import morn.customs.expands.MornExpandUtil;
   
   public class BattlefieldSceneModule extends BattlefieldSceneModuleUI
   {
       
      
      public var scene:nslm2.modules.battles.battlefields.scene.BattlefieldScene3D;
      
      private var _horseLamp:HorseLampVMultiLine;
      
      private var _textCDCtrl:TextCDCtrlS2;
      
      private var _battlefieldId:int;
      
      private var _protectMaskEffect:SpecterEffect;
      
      private var _protectMaskEffectEnimy:SpecterEffect;
      
      private var _protectMaskDestroyEff:SpecterEffect;
      
      private var maskEffPos:Vector3D;
      
      private var maskEffPos2:Vector3D;
      
      private var maskEffCryPos:Vector3D;
      
      private var maskEffCryPos2:Vector3D;
      
      private var _showAll:Boolean = true;
      
      private var _curPlayerCtrl:BattlefieldCurPlayerCtrl;
      
      public function BattlefieldSceneModule()
      {
         maskEffPos = new Vector3D(440,0,-10115);
         maskEffPos2 = new Vector3D(4016,0,-1311);
         maskEffCryPos = new Vector3D(972,0,-9841);
         maskEffCryPos2 = new Vector3D(3492,0,-1646);
         super();
         ModuleMgr.ins.staticLayer.closeAll([10430]);
         ModuleMgr.ins.showModule(10460);
         ModuleMgr.ins.showModule(10500,ChatModuleParam.init(50507,true,false,1008));
         ObserverMgr.ins.sendNotice("MSG_SWITCH_MINIMAP_HINTBOX_VISIBLE",false);
         ObserverMgr.ins.sendNotice("msg_main_tool_bar_id",new MainToolBarChangeMsg([50506,80100],[],true,false));
         ObserverMgr.ins.sendNotice("msg_update_icon_bar_visible",false);
         ObserverMgr.ins.sendNotice("main_tool_bar_back_add",new MainToolBarBackMsg(50507,this.btnBack_handler,null));
         GlobalRef.bottomModuleBtns.expBar.visible = false;
         GlobalRef.bottomModuleBtns.btnRecharge.visible = false;
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
      }
      
      private function get top_info() : BattlefieldSceneTopPanel
      {
         return this.panel_topInfo as BattlefieldSceneTopPanel;
      }
      
      private function get my_info() : BattlefieldMyInfoPanel
      {
         return this.panel_myInfo as BattlefieldMyInfoPanel;
      }
      
      private function get vo() : StcBginfoVo
      {
         return StcMgr.ins.getBginfoVo(_battlefieldId);
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            BattlefieldMsgs.ins.addEventListener("msgFightPlayerDied",onDie);
            BattlefieldMsgs.ins.addEventListener("msgFightPlayerRevived",onRevive);
            BattlefieldMsgs.ins.addEventListener("msgFightInfoChanged",onInfoChanged);
            BattlefieldMsgs.ins.addEventListener("msgFightFinished",onFinished);
            BattlefieldMsgs.ins.addEventListener("msgFightNewHorseLamp",onNewHorseLamp);
            BattlefieldMsgs.ins.addEventListener("MSG_MONSTER_BUFF_CHANGE",updateSideBuff);
         }
         else
         {
            BattlefieldMsgs.ins.removeEventListener("msgFightPlayerDied",onDie);
            BattlefieldMsgs.ins.removeEventListener("msgFightPlayerRevived",onRevive);
            BattlefieldMsgs.ins.removeEventListener("msgFightInfoChanged",onInfoChanged);
            BattlefieldMsgs.ins.removeEventListener("msgFightFinished",onFinished);
            BattlefieldMsgs.ins.removeEventListener("msgFightNewHorseLamp",onNewHorseLamp);
            BattlefieldMsgs.ins.removeEventListener("MSG_MONSTER_BUFF_CHANGE",updateSideBuff);
         }
      }
      
      protected function updateSideBuff(param1:Event) : void
      {
         this.top_info.updateBuff(BattleFlagModel.ins.getKillMonsterNum(1),BattleFlagModel.ins.getKillMonsterNum(2));
      }
      
      private function onBtnFunc(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(btn_suofang === _loc2_)
         {
            _showAll = !_showAll;
            showOrHideHorseLamp(_showAll);
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
         var _loc2_:* = null;
         initLanguage();
         BattlefieldModel.ins.isInBattleScene = true;
         _battlefieldId = param1 as int;
         init3D();
         this.txt_reviveCountDown.visible = false;
         this.box_starCon.visible = false;
         _horseLamp = new HorseLampVMultiLine("right");
         _horseLamp.mouseEnabled = false;
         _horseLamp.needCycling = false;
         this.txt_horseLamp.replaceWith(_horseLamp);
         _horseLamp.init(6);
         _horseLamp.speed = 1;
         _horseLamp.show([]);
         if(_battlefieldId != 1001)
         {
            flagInfoView.parent.removeChild(flagInfoView);
         }
         this.parts.push(new ProgressBarCtrl(this.progressBar_gather.progressBar));
         this.checkBox_assistant.visible = AssistantModel.ins.canUseAssistant(50500);
         var _loc3_:StcAssistantLevelVo = StcMgr.ins.getAssistantLevelVo(50500);
         if(_loc3_ != null && int(_loc3_.condition.split(":")[1]) <= PlayerModel.ins.level)
         {
            _loc2_ = new TaskGetCurInfoReq();
            _loc2_.kinds = [3];
            ServerEngine.ins.send(8300,_loc2_,crtTasksInfoHandler);
         }
      }
      
      private function initLanguage() : void
      {
         this.checkBox_assistant.label = LocaleMgr.ins.getStr(60200083);
      }
      
      private function crtTasksInfoHandler(param1:TaskGetCurInfoRes) : void
      {
         if(param1)
         {
            var _loc4_:int = 0;
            var _loc3_:* = param1.info;
            for each(var _loc2_ in param1.info)
            {
               if(_loc2_.id == 40001)
               {
                  if(_loc2_.status > 1)
                  {
                     this.checkBox_assistant.visible = true;
                  }
                  else
                  {
                     this.checkBox_assistant.visible = false;
                  }
               }
            }
         }
      }
      
      override public function show(param1:Object = null) : void
      {
         var _loc2_:* = null;
         super.show(param1);
         if(AssistantModel.ins.isActingAuto(50500))
         {
            _loc2_ = StcMgr.ins.getBginfoVo(BattlefieldModel.ins.curBattlefieldId);
            if(_loc2_)
            {
               AssistantModel.ins.addLog(LocaleMgr.ins.getStr(60200042,[LocaleMgr.ins.getStr(_loc2_.bg_name),LocaleMgr.ins.getStr(50500900 + BattlefieldModel.ins.currentBgStagePlayerInfo.side)]),50500);
            }
            this.checkBox_assistant.selected = true;
            AssistantModel.ins.clearTask();
            AssistantModel.ins.addTask([50500]);
            AssistantModel.ins.allStart();
         }
      }
      
      private function updateInfo() : void
      {
         switch(int(_battlefieldId) - 1000)
         {
            case 0:
               this.top_info.show(BattlefieldCrystalModel.ins.bgCryStageInfoNotify);
               this.my_info.show(BattlefieldCrystalModel.ins.bgCryStageInfoNotify);
               break;
            case 1:
               (this.flagInfoView as BattleFlagInfoPanel).update();
               (this.flagInfoView as BattleFlagInfoPanel).updateMonsterCnt();
               this.top_info.show(BattleFlagModel.ins.bgFlagFireStageInfoNotify);
               this.my_info.show2(BattleFlagModel.ins.bgFlagFireStageInfoNotify);
         }
      }
      
      private function btnBack_handler() : void
      {
         if(BattlefieldModel.ins.isFinished)
         {
            BattlefieldModel.ins.clearLastFightData();
            BattlefieldModel.ins.clearData();
            ModuleMgr.ins.closeModule(this.moduleId);
         }
         else
         {
            AlertUtil.comfirm(LocaleMgr.ins.getStr(50500108),onConfirm);
         }
      }
      
      private function onConfirm() : void
      {
         BattlefieldBattleService.ins.leave();
         ModuleMgr.ins.closeModule(this.moduleId);
      }
      
      private function init3D() : void
      {
         this.scene = new nslm2.modules.battles.battlefields.scene.BattlefieldScene3D();
         BattlefieldModel.ins.curScene = this.scene;
         this.scene.init(this.moduleId,this.vo.bg_scene_id,initHandler);
         this.addChild(this.scene);
         this.scene.layer3D.addEventListener("mouseDown3d",on3DClicked);
      }
      
      private function on3DClicked(param1:Event) : void
      {
         if(AssistantModel.ins.isActingAuto(50500))
         {
            this.checkBox_assistant.selected = false;
            AssistantModel.ins.removeTask(50500);
            AssistantModel.ins.removeNeedDoFuncId(50500);
         }
      }
      
      private function initHandler() : void
      {
         var _loc1_:* = 0;
         _curPlayerCtrl = new BattlefieldCurPlayerCtrl();
         this.parts.push(new BattlefieldCurPlayerCtrl());
         _curPlayerCtrl.bind(this.scene.playerHero).initScene(this.scene);
         this.scene.playerHero.tag3DVBox.hideGuildName();
         _curPlayerCtrl.gatherProgress = this.progressBar_gather as BattlefieldGatherProgressBar;
         switch(int(_battlefieldId) - 1000)
         {
            case 0:
               _loc1_ = uint(BattlefieldCrystalModel.ins.bgCryStageInfoNotify.startStamp);
               break;
            case 1:
               _loc1_ = uint(BattleFlagModel.ins.bgFlagFireStageInfoNotify.startStamp);
         }
         if(ServerTimer.ins.second < _loc1_ + int(DefindConsts.BG_WAITING_TIME))
         {
            if(_textCDCtrl == null)
            {
               _textCDCtrl = new TextCDCtrlS2(this.txt_reviveCountDown,textCDFormatReady,bgStart);
               this.parts.push(new TextCDCtrlS2(this.txt_reviveCountDown,textCDFormatReady,bgStart));
               _textCDCtrl.start(_loc1_ + int(DefindConsts.BG_WAITING_TIME));
               this.txt_reviveCountDown.visible = true;
            }
            if(_battlefieldId == 1001)
            {
               _protectMaskEffect = EffectManager.createEffect(Effect3DUtils.getUrlBySid(600020),true,null,null,0,true,1);
               scene.multiBgLayer.effAllLayer.addChild(_protectMaskEffect);
               _protectMaskEffectEnimy = EffectManager.createEffect(Effect3DUtils.getUrlBySid(600020),true,null,null,0,true,1);
               scene.multiBgLayer.effAllLayer.addChild(_protectMaskEffectEnimy);
               if(BattlefieldModel.ins.currentBgStagePlayerInfo.side == 1)
               {
                  _protectMaskEffect.position = maskEffPos;
                  _protectMaskEffectEnimy.position = maskEffPos2;
                  var _loc2_:* = 4;
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
            if(_battlefieldId == 1000)
            {
               _protectMaskEffect = EffectManager.createEffect(Effect3DUtils.getUrlBySid(6200),true,null,null,0,true,1);
               scene.multiBgLayer.effAllLayer.addChild(_protectMaskEffect);
               _protectMaskEffectEnimy = EffectManager.createEffect(Effect3DUtils.getUrlBySid(6200),true,null,null,0,true,1);
               scene.multiBgLayer.effAllLayer.addChild(_protectMaskEffectEnimy);
               if(BattlefieldModel.ins.currentBgStagePlayerInfo.side == 1)
               {
                  _protectMaskEffect.position = maskEffCryPos;
                  _protectMaskEffectEnimy.position = maskEffCryPos2;
               }
               else
               {
                  _protectMaskEffectEnimy.position = maskEffCryPos;
                  _protectMaskEffect.position = maskEffCryPos2;
               }
               _loc2_ = 1.6;
               _protectMaskEffectEnimy.scaleAll = _loc2_;
               _protectMaskEffect.scaleAll = _loc2_;
               _loc2_ = 55;
               _protectMaskEffectEnimy.rotationY = _loc2_;
               _protectMaskEffect.rotationY = _loc2_;
            }
         }
         else
         {
            if(_battlefieldId == 1001)
            {
               _protectMaskEffect = EffectManager.createEffect(Effect3DUtils.getUrlBySid(600020),true,null,null,0,true,1);
               scene.multiBgLayer.effAllLayer.addChild(_protectMaskEffect);
               if(BattlefieldModel.ins.currentBgStagePlayerInfo.side == 2)
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
            }
            if(_battlefieldId == 1000)
            {
               _protectMaskEffectEnimy = EffectManager.createEffect(Effect3DUtils.getUrlBySid(6200),true,null,null,0,true,1);
               scene.multiBgLayer.effAllLayer.addChild(_protectMaskEffectEnimy);
               if(BattlefieldModel.ins.currentBgStagePlayerInfo.side == 1)
               {
                  _protectMaskEffectEnimy.position = maskEffCryPos2;
               }
               else
               {
                  _protectMaskEffectEnimy.position = maskEffCryPos;
               }
               _protectMaskEffectEnimy.scaleAll = 1.6;
               _protectMaskEffectEnimy.rotationY = 55;
            }
            changePathMask();
         }
         updateInfo();
         updateSideBuff(null);
         this.checkBox_assistant.clickHandler = onAssisClicked;
         this.checkBox_assistant.preCondHandler = canDoAuto;
         this.preShowCpl();
      }
      
      private function canDoAuto(param1:Boolean) : Boolean
      {
         if(param1 == true)
         {
            if(AssistantModel.ins.canUseAssistant(50500))
            {
               AssistantModel.ins.addNeedDoFunId(50500);
               return true;
            }
            AlertUtil.lackLevel(AssistantModel.ins.getOpenLevel(50500));
            return false;
         }
         AssistantModel.ins.removeNeedDoFuncId(50500);
         return true;
      }
      
      private function onAssisClicked() : void
      {
         if(this.checkBox_assistant.selected)
         {
            AssistantModel.ins.clearTask();
            AssistantModel.ins.addTask([50500]);
            AssistantModel.ins.allStart();
         }
         else
         {
            AssistantModel.ins.removeTask(50500);
         }
      }
      
      private function onDie(param1:MzEvent) : void
      {
         var _loc2_:BattlefieldPlayerDiedVo = param1.data as BattlefieldPlayerDiedVo;
         if(PlayerModel.ins.isCurPlayer(_loc2_.playerId))
         {
            scene.multiBgLayer.addMethod(FPUtil.getGrayMethod());
            scene.multiBgLayer.mouseChildren = false;
            scene.multiBgLayer.mouseEnabled = false;
            if(_textCDCtrl == null)
            {
               _textCDCtrl = new TextCDCtrlS2(this.txt_reviveCountDown,textCDFormat,countDownCpl);
               _textCDCtrl.start(_loc2_.diedStamp + int(DefindConsts.BG_CRY_REBORN_TIME));
               this.txt_reviveCountDown.visible = true;
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
         var _loc2_:BgSceneMoveReq = new BgSceneMoveReq();
         _loc2_.x = this.scene.playerHero.pos2d.x;
         _loc2_.y = this.scene.playerHero.pos2d.y;
         BattlefieldBattleService.ins.sendSelfPos(_loc2_,true);
         if(_battlefieldId == 1001)
         {
            _protectMaskDestroyEff = EffectManager.createEffect(Effect3DUtils.getUrlBySid(600021),true,null,moveProtectMaskEffect,0,true,1);
            scene.multiBgLayer.effAllLayer.addChild(_protectMaskDestroyEff);
            if(BattlefieldModel.ins.currentBgStagePlayerInfo.side == 1)
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
         }
         if(_battlefieldId == 1000)
         {
            moveProtectMaskEffect(_protectMaskEffect);
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
      
      private function changePathMask() : void
      {
         switch(int(BattlefieldModel.ins.currentBgStagePlayerInfo.side) - 1)
         {
            case 0:
               SceneModel.ins.findPathMed.initFindPathMed([1]);
               break;
            case 1:
               SceneModel.ins.findPathMed.initFindPathMed([2]);
         }
      }
      
      private function readyOver() : void
      {
         this.box_starCon.visible = false;
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
         if(ModuleMgr.ins.isShow(50508) == false)
         {
            ModuleMgr.ins.showModule(50508,null,ModuleMgr.ins.popLayer.curModuleId);
         }
      }
      
      private function onNewHorseLamp(param1:MzEvent) : void
      {
         _horseLamp.add(param1.data as String);
      }
      
      override public function preClose(param1:Object = null) : void
      {
         ObserverMgr.ins.sendNotice("main_tool_bar_back_delete",new MainToolBarBackMsg(50500,this.btnBack_handler,null));
         ObserverMgr.ins.sendNotice("msg_main_tool_bar_id",new MainToolBarChangeMsg(MainToolBarChangeMsg.MainCity_moduleIdArr,MainToolBarChangeMsg.MainCity_moduleIdArrVertical,false));
         BattlefieldBattleService.ins.switchEventListeners(false);
         ObserverMgr.ins.sendNotice("msg_update_icon_bar_visible",true);
         BattlefieldModel.ins.curScene = null;
         ModuleMgr.ins.closeModule(10460);
         GlobalRef.bottomModuleBtns.expBar.visible = true;
         GlobalRef.bottomModuleBtns.btnRecharge.visible = true;
         MouseIconManager.changeMouseCursor("auto");
         MouseIconManager.ins.hideSpecialMouseCursor();
         BattleFlagModel.ins.dispose();
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
         if(this.scene && this.scene.layer3D)
         {
            this.scene.layer3D.removeEventListener("mouseDown3d",on3DClicked);
         }
         BattlefieldModel.ins.isInBattleScene = false;
         super.preClose(param1);
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["task_notice_auto_track","refreshModule"]);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         super.handleNotices(param1,param2);
         var _loc3_:* = param1;
         if("task_notice_auto_track" !== _loc3_)
         {
            if("refreshModule" === _loc3_)
            {
               this.checkBox_assistant.selected = AssistantModel.ins.isActingAuto(50500);
            }
         }
         else
         {
            scene.autoTrack(param2);
         }
      }
      
      override public function dispose() : void
      {
         if(AssistantModel.ins.isActing)
         {
            AssistantModel.ins.clearTask();
            AssistantModel.ins.addTask(AssistantModel.ins.needDoIdArr);
            AssistantModel.ins.allStart();
         }
         super.dispose();
      }
   }
}
