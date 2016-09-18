package nslm2.modules.footstones.assistantModules.subAssistants.battlefield.tasks
{
   import com.mz.core.utils2.task.TaskBase;
   import nslm2.modules.footstones.assistantModules.vos.AssistantBattlefieldSettingVo;
   import nslm2.modules.battles.battlefields.service.BattlefieldService;
   import flash.geom.Point;
   import nslm2.modules.battles.battlefields.model.BattlefieldModel;
   import morn.core.managers.timerMgrs.TimerManager;
   import com.greensock.TweenLite;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.battles.battlefields.utils.BattlefieldUtil;
   import nslm2.modules.battles.battlefields.msgs.BattlefieldMsgs;
   import nslm2.modules.footstones.assistantModules.model.AssistantModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.foundations.AlertUtil;
   import morn.core.utils.StringUtils;
   import nslm2.common.model.PlayerModel;
   import proto.BgStagePlayerInfo;
   import morn.core.handlers.Handler;
   import nslm2.modules.battles.battlefields.service.BattlefieldBattleService;
   import com.netease.protobuf.UInt64;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.battles.battlefields.model.BattlefieldCrystalModel;
   import nslm2.modules.battles.battlefields.model.BattleFlagModel;
   import nslm2.utils.ServerTimer;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   
   public class AssistantBattlefieldBaseTask extends TaskBase
   {
       
      
      protected var setting:AssistantBattlefieldSettingVo;
      
      private var _lastPos:Point;
      
      private var _nowAction:String = "";
      
      private var _isInBattle:Boolean;
      
      public function AssistantBattlefieldBaseTask(param1:Object = null)
      {
         _lastPos = new Point();
         super(param1);
      }
      
      override public function exec() : void
      {
         switchEventListeners(true);
         BattlefieldService.ins.getBattlefieldInfo();
      }
      
      private function protectProgramRestart() : void
      {
         _lastPos = new Point(BattlefieldModel.ins.currentBgStagePlayerInfo.x,BattlefieldModel.ins.currentBgStagePlayerInfo.y);
         TimerManager.ins.doOnce(15 * 1000,protectProgram);
      }
      
      private function protectProgram() : void
      {
         var _loc1_:Point = new Point(BattlefieldModel.ins.currentBgStagePlayerInfo.x,BattlefieldModel.ins.currentBgStagePlayerInfo.y);
         if(_lastPos.x == _loc1_.x && _lastPos.y == _loc1_.y)
         {
            clearActionAndDoNext();
         }
         else
         {
            TweenLite.delayedCall(0.1,protectProgramRestart);
         }
      }
      
      private function onGetBgInfoCpl(param1:MzEvent) : void
      {
         if(BattlefieldUtil.canEnter())
         {
            BattlefieldMsgs.ins.removeEventListener("msgBattlefieldInfoCpl",onGetBgInfoCpl);
            _nowAction = "";
            initSetting();
            start();
            AssistantModel.ins.showDoingAlert(LocaleMgr.ins.getStr(60200028));
         }
         else
         {
            this.onComplete();
         }
      }
      
      override public function stop() : void
      {
         switchEventListeners(false);
         _nowAction = "";
         TimerManager.ins.clearTimer(onStart);
         TimerManager.ins.clearTimer(selfCheck);
         TimerManager.ins.clearTimer(protectProgram);
         TweenLite.killDelayedCallsTo(protectProgramRestart);
         AlertUtil.float(LocaleMgr.ins.getStr(60200030));
         AssistantModel.ins.hideDoingAlert();
         super.stop();
      }
      
      private function initSetting() : void
      {
         this.setting = AssistantModel.ins.getSetting(50500);
      }
      
      protected function get nowAction() : String
      {
         return _nowAction;
      }
      
      override public function onStart() : void
      {
         protectProgramRestart();
         doNextAction(null);
         TimerManager.ins.doLoop(3 * 1000,selfCheck);
         super.onStart();
      }
      
      protected function set nowAction(param1:String) : void
      {
         protectProgramRestart();
         _nowAction = param1;
         if(StringUtils.isNull(_nowAction))
         {
            doNextAction();
         }
      }
      
      protected function hasActionDoing() : Boolean
      {
         return !StringUtils.isNull(_nowAction) || _isInBattle == true || BattlefieldModel.ins.isDied;
      }
      
      protected function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            BattlefieldMsgs.ins.addEventListener("msgFightFinished",onFightFinished);
            BattlefieldMsgs.ins.addEventListener("msgBattleStart",onFightStart);
            BattlefieldMsgs.ins.addEventListener("msgBattleEnd",onFightEnd);
            BattlefieldMsgs.ins.addEventListener("msgError",onActionError);
            BattlefieldMsgs.ins.addEventListener("msgBattlefieldInfoCpl",onGetBgInfoCpl);
            BattlefieldMsgs.ins.addEventListener("kazhushou",onKaZhuShou);
         }
         else
         {
            BattlefieldMsgs.ins.removeEventListener("msgFightFinished",onFightFinished);
            BattlefieldMsgs.ins.removeEventListener("msgBattleStart",onFightStart);
            BattlefieldMsgs.ins.removeEventListener("msgBattleEnd",onFightEnd);
            BattlefieldMsgs.ins.removeEventListener("msgError",onActionError);
            BattlefieldMsgs.ins.removeEventListener("msgBattlefieldInfoCpl",onGetBgInfoCpl);
            BattlefieldMsgs.ins.removeEventListener("kazhushou",onKaZhuShou);
         }
      }
      
      private function onKaZhuShou(param1:MzEvent) : void
      {
         nowAction = "kazhu";
         BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgStopRun",PlayerModel.ins.playerInfo.id));
      }
      
      protected function doNextAction(param1:MzEvent = null) : void
      {
         doAttack();
      }
      
      protected function doAttack() : void
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         var _loc5_:int = 0;
         var _loc1_:* = null;
         var _loc4_:* = null;
         if(hasActionDoing())
         {
            return;
         }
         if(this.setting.needAttackPlayer && !(this.setting.notAttackLowHp && BattlefieldModel.ins.currentBgStagePlayerInfo.hpPercent < this.setting.lowHpPer))
         {
            _loc3_ = BattlefieldModel.ins.bgStagePlayers.array;
            _loc2_ = _loc3_.length;
            _loc5_ = 0;
            while(_loc5_ < _loc2_)
            {
               _loc1_ = _loc3_[_loc5_];
               if(canAttackTarget(_loc1_) && _loc1_.side != BattlefieldModel.ins.currentBgStagePlayerInfo.side)
               {
                  _loc4_ = new Point(_loc1_.x,_loc1_.y);
                  nowAction = "attack";
                  BattlefieldModel.ins.curScene.playerHero.runTo(_loc4_.x,_loc4_.y,new Handler(runHandler,[_loc1_]));
               }
               _loc5_++;
            }
         }
      }
      
      protected function runHandler(param1:BgStagePlayerInfo) : void
      {
         BattlefieldBattleService.ins.attackOtherPlayer(param1.playerInfo.baseInfo.id,new Point(param1.x,param1.y));
      }
      
      protected function canAttackTarget(param1:BgStagePlayerInfo) : Boolean
      {
         var _loc3_:* = null;
         var _loc2_:* = false;
         var _loc4_:* = false;
         if(this.setting.notAttackBuffPlayer)
         {
            _loc2_ = param1.conDeathNum <= 0;
         }
         else
         {
            _loc2_ = true;
         }
         if(this.setting.onlyAttackLowerFightValue)
         {
            _loc3_ = BattlefieldModel.ins.currentBgStagePlayerInfo.playerInfo.baseInfo.ability;
            _loc4_ = Uint64Util.toNumber(param1.playerInfo.baseInfo.ability) <= Uint64Util.toNumber(_loc3_) - this.setting.lowerFightValue;
         }
         else
         {
            _loc4_ = true;
         }
         return _loc2_ && _loc4_;
      }
      
      protected function clearActionAndDoNext() : void
      {
         nowAction = "";
      }
      
      private function onFightFinished(param1:MzEvent = null) : void
      {
         this.onComplete();
      }
      
      private function onFightStart(param1:MzEvent = null) : void
      {
         _isInBattle = true;
         _nowAction = "";
      }
      
      private function onFightEnd(param1:MzEvent = null) : void
      {
         _isInBattle = false;
         doNextAction();
      }
      
      protected function onActionError(param1:MzEvent) : void
      {
         _nowAction = "";
      }
      
      private function start() : void
      {
         var _loc1_:* = 0;
         switch(int(BattlefieldModel.ins.curBattlefieldId) - 1000)
         {
            case 0:
               _loc1_ = uint(BattlefieldCrystalModel.ins.bgCryStageInfoNotify.startStamp);
               break;
            case 1:
               _loc1_ = uint(BattleFlagModel.ins.bgFlagFireStageInfoNotify.startStamp);
         }
         if(ServerTimer.ins.second < _loc1_ + int(DefindConsts.BG_WAITING_TIME))
         {
            TimerManager.ins.doOnce((_loc1_ + int(DefindConsts.BG_WAITING_TIME) - ServerTimer.ins.second) * 1000 + 3,onStart);
         }
         else
         {
            onStart();
         }
      }
      
      protected function selfCheck() : void
      {
         if(hasActionDoing() == false)
         {
            doNextAction();
         }
      }
   }
}
