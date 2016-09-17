package nslm2.modules.footstones.assistantModules.subAssistants.battlefield.tasks
{
   import nslm2.modules.battles.battlefields.msgs.BattlefieldMsgs;
   import com.mz.core.event.MzEvent;
   import nslm2.common.model.PlayerModel;
   import com.netease.protobuf.UInt64;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.battles.battlefields.model.BattlefieldCrystalModel;
   import proto.BgStageResInfo;
   import nslm2.modules.battles.battlefields.model.BattlefieldModel;
   import proto.BgStagePlayerInfo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcStageNpcRelationVo;
   import nslm2.mgrs.stcMgrs.consts.StcNpcGroupConsts;
   import flash.geom.Point;
   import com.mz.core.utils.MathUtil;
   
   public class AssistantBattlefieldCryTask extends AssistantBattlefieldBaseTask
   {
       
      
      private var _nowGatheringId:int;
      
      public function AssistantBattlefieldCryTask(param1:Object = null)
      {
         super(param1);
      }
      
      override protected function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            BattlefieldMsgs.ins.addEventListener("msgCrySelfGathered",onGathered);
            BattlefieldMsgs.ins.addEventListener("msgCryStopGather",onGatherStoped);
            BattlefieldMsgs.ins.addEventListener("msgCryMineDryUp",onMineDryUp);
         }
         else
         {
            BattlefieldMsgs.ins.removeEventListener("msgCrySelfGathered",onGathered);
            BattlefieldMsgs.ins.removeEventListener("msgCryStopGather",onGatherStoped);
            BattlefieldMsgs.ins.removeEventListener("msgCryMineDryUp",onMineDryUp);
         }
      }
      
      override protected function doNextAction(param1:MzEvent = null) : void
      {
         super.doNextAction(param1);
         doGather();
      }
      
      private function onGathered(param1:MzEvent = null) : void
      {
         _nowGatheringId = 0;
         clearActionAndDoNext();
      }
      
      private function onGatherStoped(param1:MzEvent = null) : void
      {
         if(PlayerModel.ins.isCurPlayer(param1.data as UInt64))
         {
            _nowGatheringId = 0;
            clearActionAndDoNext();
         }
      }
      
      private function onMineDryUp(param1:MzEvent = null) : void
      {
         if(_nowGatheringId == param1.data as int)
         {
            _nowGatheringId = 0;
            clearActionAndDoNext();
         }
      }
      
      private function doGather() : void
      {
         if(hasActionDoing())
         {
            return;
         }
         if(_nowGatheringId != 0 && nowAction == "gather")
         {
            return;
         }
         _nowGatheringId = selectGatherId();
         if(_nowGatheringId != 0)
         {
            nowAction = "gather";
            ObserverMgr.ins.sendNotice("task_notice_auto_track",_nowGatheringId);
         }
      }
      
      private function selectGatherId() : int
      {
         var _loc2_:int = 0;
         switch(int(this.setting.cryAutoMode) - 1)
         {
            case 0:
               _loc2_ = selfNearNpcId;
               break;
            case 1:
               _loc2_ = enemyNearNpcId;
               break;
            case 2:
               _loc2_ = rightNpcId;
               break;
            case 3:
               _loc2_ = middleNpcId;
         }
         var _loc1_:BgStageResInfo = BattlefieldCrystalModel.ins.getStageResInfo(_loc2_);
         if(_loc1_ == null)
         {
            _loc2_ = 0;
         }
         return _loc2_;
      }
      
      private function get selfNearNpcId() : int
      {
         var _loc1_:int = 0;
         switch(int(BattlefieldModel.ins.currentBgStagePlayerInfo.side) - 1)
         {
            case 0:
               _loc1_ = 1100;
               break;
            case 1:
               _loc1_ = 1102;
         }
         return _loc1_;
      }
      
      private function get enemyNearNpcId() : int
      {
         var _loc1_:int = 0;
         switch(int(BattlefieldModel.ins.currentBgStagePlayerInfo.side) - 1)
         {
            case 0:
               _loc1_ = 1102;
               break;
            case 1:
               _loc1_ = 1100;
         }
         return _loc1_;
      }
      
      private function get rightNpcId() : int
      {
         return 1101;
      }
      
      private function get middleNpcId() : int
      {
         return 1200;
      }
      
      override protected function canAttackTarget(param1:BgStagePlayerInfo) : Boolean
      {
         var _loc4_:* = null;
         var _loc5_:* = false;
         var _loc3_:int = selectGatherId();
         var _loc2_:StcStageNpcRelationVo = StcMgr.ins.getStageNpcRelationVo(_loc3_);
         if(_loc2_)
         {
            _loc4_ = StcNpcGroupConsts.positionToPoi(_loc2_.position);
            _loc5_ = MathUtil.disWith2Point(new Point(param1.x,param1.y),_loc4_) <= 700;
         }
         return super.canAttackTarget(param1) && _loc5_;
      }
      
      override protected function onActionError(param1:MzEvent) : void
      {
         super.onActionError(param1);
         _nowGatheringId = 0;
      }
   }
}
