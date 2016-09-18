package nslm2.modules.battles.battlefields.model
{
   import proto.BgCryStageInfoNotify;
   import proto.BgStageResInfo;
   import nslm2.modules.battles.battlefields.msgs.BattlefieldMsgs;
   import com.mz.core.event.MzEvent;
   import proto.BgStageMyInfo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcBginfoVo;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import proto.BgCryTeamInfo;
   
   public class BattlefieldCrystalModel
   {
      
      private static var _ins:nslm2.modules.battles.battlefields.model.BattlefieldCrystalModel;
       
      
      public var bgCryStageInfoNotify:BgCryStageInfoNotify;
      
      public var firstGatheredNum:int;
      
      public function BattlefieldCrystalModel()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.battles.battlefields.model.BattlefieldCrystalModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.battles.battlefields.model.BattlefieldCrystalModel();
         }
         return _ins;
      }
      
      public function getStageResInfo(param1:int) : BgStageResInfo
      {
         var _loc4_:int = 0;
         var _loc3_:* = this.bgCryStageInfoNotify.resInfos;
         for each(var _loc2_ in this.bgCryStageInfoNotify.resInfos)
         {
            if(_loc2_ != null)
            {
               if(_loc2_.id == param1)
               {
                  return _loc2_;
               }
            }
         }
         return null;
      }
      
      public function changeStageResInfo(param1:int, param2:int) : void
      {
         var _loc3_:BgStageResInfo = this.getStageResInfo(param1);
         _loc3_.status = param2;
      }
      
      public function addMyGathered(param1:int) : void
      {
         if(this.bgCryStageInfoNotify.myInfo.gatherNum == 0)
         {
            firstGatheredNum = param1;
         }
         this.bgCryStageInfoNotify.myInfo.gatherNum = this.bgCryStageInfoNotify.myInfo.gatherNum + param1;
         this.bgCryStageInfoNotify.myInfo.honor = getMyHonor();
         BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgFightInfoChanged"));
      }
      
      public function addMykilledByOne() : void
      {
         this.bgCryStageInfoNotify.myInfo.killNum++;
         this.bgCryStageInfoNotify.myInfo.honor = getMyHonor();
         BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgFightInfoChanged"));
      }
      
      public function addMyAssistedByOne() : void
      {
         this.bgCryStageInfoNotify.myInfo.assistNum++;
         this.bgCryStageInfoNotify.myInfo.honor = getMyHonor();
         BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgFightInfoChanged"));
      }
      
      public function getMyHonor() : int
      {
         var _loc2_:BgStageMyInfo = this.bgCryStageInfoNotify.myInfo;
         var _loc1_:StcBginfoVo = StcMgr.ins.getBginfoVo(1000);
         var _loc5_:int = _loc2_.assistNum * _loc1_.bg_assist_honor;
         var _loc3_:int = _loc2_.killNum > 0?Math.max(0,(_loc2_.killNum - 1) * _loc1_.bg_kill_honor + _loc1_.bg_first_kill_honor):0;
         var _loc4_:int = _loc2_.gatherNum > 0?_loc2_.gatherNum - firstGatheredNum + _loc1_.bg_first_gather_honor:0;
         return Math.min(int(DefindConsts.BG_HONOR_LIMIT),_loc5_ + _loc3_ + _loc4_);
      }
      
      public function addTeamKilled(param1:int) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = this.bgCryStageInfoNotify.teamInfos;
         for each(var _loc2_ in this.bgCryStageInfoNotify.teamInfos)
         {
            if(_loc2_.side == param1)
            {
               _loc2_.killNum = Number(_loc2_.killNum) + 1;
               BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgFightInfoChanged"));
               return;
            }
         }
      }
      
      public function addPlayerOne(param1:int) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = this.bgCryStageInfoNotify.teamInfos;
         for each(var _loc2_ in this.bgCryStageInfoNotify.teamInfos)
         {
            if(_loc2_.side == param1)
            {
               _loc2_.playerNum = Number(_loc2_.playerNum) + 1;
               BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgFightInfoChanged"));
               return;
            }
         }
      }
      
      public function minusPlayerOne(param1:int) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = this.bgCryStageInfoNotify.teamInfos;
         for each(var _loc2_ in this.bgCryStageInfoNotify.teamInfos)
         {
            if(_loc2_.side == param1)
            {
               _loc2_.playerNum = Number(_loc2_.playerNum) - 1;
               BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgFightInfoChanged"));
               return;
            }
         }
      }
      
      public function gatherAllChanged(param1:int, param2:int) : void
      {
         var _loc5_:int = 0;
         var _loc4_:* = this.bgCryStageInfoNotify.teamInfos;
         for each(var _loc3_ in this.bgCryStageInfoNotify.teamInfos)
         {
            if(_loc3_.side == param1)
            {
               _loc3_.resNum = param2;
               BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgFightInfoChanged"));
               return;
            }
         }
      }
   }
}
