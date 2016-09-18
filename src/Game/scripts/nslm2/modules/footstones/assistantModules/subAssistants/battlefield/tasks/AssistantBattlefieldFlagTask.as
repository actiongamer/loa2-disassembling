package nslm2.modules.footstones.assistantModules.subAssistants.battlefield.tasks
{
   import nslm2.modules.battles.battlefields.msgs.BattlefieldMsgs;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.battles.battlefields.model.BattleFlagModel;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.battles.battlefields.model.BattlefieldModel;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.battles.battlefields.vos.BattleFlagInfoData;
   import proto.BgStageResInfo;
   import nslm2.modules.battles.battlefields.consts.BattlefieldConsts;
   import com.mz.core.utils.ArrayUtil;
   import proto.BgStagePlayerInfo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcStageNpcRelationVo;
   import nslm2.mgrs.stcMgrs.consts.StcNpcGroupConsts;
   import flash.geom.Point;
   import com.mz.core.utils.MathUtil;
   
   public class AssistantBattlefieldFlagTask extends AssistantBattlefieldBaseTask
   {
       
      
      public function AssistantBattlefieldFlagTask(param1:Object = null)
      {
         super(param1);
      }
      
      override protected function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            BattlefieldMsgs.ins.addEventListener("MSG_FLAG_OWNER_UPDATE",onFlagOwnerUpdate);
         }
         else
         {
            BattlefieldMsgs.ins.removeEventListener("MSG_FLAG_OWNER_UPDATE",onFlagOwnerUpdate);
         }
      }
      
      override protected function doNextAction(param1:MzEvent = null) : void
      {
         goHome();
         super.doNextAction(param1);
         goGetFlag();
      }
      
      private function goHome() : void
      {
         var _loc2_:int = 0;
         if(hasActionDoing())
         {
            return;
         }
         var _loc1_:Array = BattleFlagModel.ins.flagOwnerIdArr;
         if(_loc1_.indexOf(PlayerModel.ins.playerInfo.id.toString()) >= 0)
         {
            if(BattlefieldModel.ins.currentBgStagePlayerInfo.side == 1)
            {
               _loc2_ = 2503;
            }
            else
            {
               _loc2_ = 2504;
            }
            ObserverMgr.ins.sendNotice("task_notice_auto_track",_loc2_);
            nowAction = "goHome";
         }
      }
      
      private function goGetFlag() : void
      {
         if(hasActionDoing())
         {
            return;
         }
         var _loc1_:int = selectGatherId();
         if(_loc1_ != 0)
         {
            ObserverMgr.ins.sendNotice("task_notice_auto_track",_loc1_);
            nowAction = "goGetFlag";
         }
      }
      
      private function selectGatherId() : int
      {
         var _loc5_:int = 0;
         var _loc2_:* = null;
         var _loc1_:* = null;
         var _loc4_:* = null;
         switch(int(this.setting.flagAutoMode))
         {
            case 0:
               _loc5_ = 2500;
               _loc2_ = BattleFlagModel.ins.flagDataDic.getValue(_loc5_);
               _loc1_ = BattleFlagModel.ins.getStageResInfo(_loc5_);
               if(_loc1_.status == 0)
               {
                  if(_loc2_ == null || _loc2_.leftCnt == 0)
                  {
                     _loc5_ = 2502;
                  }
                  else
                  {
                     _loc5_ = getKillMonsterId(getFlagNearMonsterArr(_loc5_));
                  }
               }
               break;
            case 1:
               _loc5_ = 2502;
               _loc2_ = BattleFlagModel.ins.flagDataDic.getValue(_loc5_);
               _loc1_ = BattleFlagModel.ins.getStageResInfo(_loc5_);
               if(_loc1_.status == 0)
               {
                  if(_loc2_ == null || _loc2_.leftCnt == 0)
                  {
                     _loc5_ = 2500;
                  }
                  else
                  {
                     _loc5_ = getKillMonsterId(getFlagNearMonsterArr(_loc5_));
                  }
               }
               break;
            case 2:
               _loc4_ = [];
               if(this.setting.needKillUpMon)
               {
                  _loc4_ = _loc4_.concat(BattlefieldConsts.BATTLE_FLAG_UP_MONSTER_ARR);
               }
               if(this.setting.needKillDownMon)
               {
                  _loc4_ = _loc4_.concat(BattlefieldConsts.BATTLE_FLAG_DOWN_MONSTER_ARR);
               }
               if(this.setting.needKillLeftMon)
               {
                  _loc4_ = _loc4_.concat(BattlefieldConsts.BATTLE_FLAG_LEFT_MONSTER_ARR);
               }
               if(this.setting.needKillRightMon)
               {
                  _loc4_ = _loc4_.concat(BattlefieldConsts.BATTLE_FLAG_RIGHT_MONSTER_ARR);
               }
               _loc5_ = getKillMonsterId(_loc4_);
         }
         var _loc3_:BgStageResInfo = BattleFlagModel.ins.getStageResInfo(2501);
         _loc2_ = BattleFlagModel.ins.flagDataDic.getValue(_loc5_);
         _loc1_ = BattleFlagModel.ins.getStageResInfo(_loc5_);
         if(_loc1_ && _loc1_.status == 0)
         {
            if((_loc2_ == null || _loc2_.leftCnt == 0) && this.setting.flagAutoMode != 2)
            {
               _loc5_ = _loc3_.id;
            }
            else
            {
               _loc5_ = getKillMonsterId(getFlagNearMonsterArr(_loc5_));
            }
         }
         return _loc5_;
      }
      
      private function getFlagNearMonsterArr(param1:int) : Array
      {
         var _loc2_:Array = [];
         switch(int(param1) - 2500)
         {
            case 0:
               _loc2_ = BattlefieldConsts.BATTLE_FLAG_UP_MONSTER_ARR.concat(BattlefieldConsts.BATTLE_FLAG_LEFT_MONSTER_ARR);
               break;
            default:
               _loc2_ = BattlefieldConsts.BATTLE_FLAG_UP_MONSTER_ARR.concat(BattlefieldConsts.BATTLE_FLAG_LEFT_MONSTER_ARR);
               break;
            case 2:
               _loc2_ = BattlefieldConsts.BATTLE_FLAG_DOWN_MONSTER_ARR.concat(BattlefieldConsts.BATTLE_FLAG_RIGHT_MONSTER_ARR);
         }
         return _loc2_;
      }
      
      private function getKillMonsterId(param1:Array) : int
      {
         var _loc5_:int = 0;
         var _loc2_:* = null;
         var _loc4_:int = 0;
         var _loc3_:int = param1.length;
         if(_loc3_ == 0)
         {
            param1 = ArrayUtil.concat(BattlefieldConsts.BATTLE_FLAG_UP_MONSTER_ARR,BattlefieldConsts.BATTLE_FLAG_DOWN_MONSTER_ARR,BattlefieldConsts.BATTLE_FLAG_LEFT_MONSTER_ARR,BattlefieldConsts.BATTLE_FLAG_RIGHT_MONSTER_ARR);
            _loc3_ = param1.length;
         }
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            _loc2_ = BattleFlagModel.ins.getStageResInfo(param1[_loc5_]);
            if(_loc2_ && _loc2_.status == 1)
            {
               _loc4_ = _loc2_.id;
               break;
            }
            _loc5_++;
         }
         return _loc4_;
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
      
      private function onFlagOwnerUpdate(param1:MzEvent) : void
      {
         var _loc2_:Array = BattleFlagModel.ins.flagOwnerIdArr;
         if(_loc2_.indexOf(PlayerModel.ins.playerInfo.id.toString()) >= 0)
         {
            clearActionAndDoNext();
         }
         else if(nowAction == "goHome")
         {
            clearActionAndDoNext();
         }
         else
         {
            doNextAction();
         }
      }
   }
}
