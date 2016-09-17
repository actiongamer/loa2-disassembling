package nslm2.modules.funnies.arenas.scores
{
   import proto.SwapActionInfo;
   import nslm2.mgrs.stcMgrs.vos.StcSwapActionVo;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.funnies.arenas.ArenaService;
   import nslm2.mgrs.stcMgrs.StcMgr;
   
   public class ArenaScoreVo
   {
      
      public static const SID:String = "sid";
      
      public static const CONDITION1COUNT:String = "condition1count";
       
      
      public var info:SwapActionInfo;
      
      public var stcVo:StcSwapActionVo;
      
      public var sid:int;
      
      public function ArenaScoreVo(param1:int, param2:SwapActionInfo)
      {
         super();
         this.sid = param1;
         this.stcVo = StcMgr.ins.getSwapActionVo(param1);
         this.info = param2;
      }
      
      public function get canGetReward() : Boolean
      {
         if(this.count < stcVo.limit_count)
         {
            if(PlayerModel.ins.level >= stcVo.conditionLevel)
            {
               if(ArenaService.ins.infoRes.scores >= stcVo.condition1count)
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      public function condition1count() : int
      {
         return stcVo.condition1count;
      }
      
      public function get count() : int
      {
         return info.count;
      }
   }
}
