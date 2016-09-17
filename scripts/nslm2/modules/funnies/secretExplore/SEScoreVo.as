package nslm2.modules.funnies.secretExplore
{
   import nslm2.modules.funnies.arenas.scores.ArenaScoreVo;
   import nslm2.common.model.PlayerModel;
   import proto.SwapActionInfo;
   
   public class SEScoreVo extends ArenaScoreVo
   {
      
      public static const SID:String = "sid";
      
      public static const CONDITION1COUNT:String = "condition1count";
       
      
      public function SEScoreVo(param1:int, param2:SwapActionInfo)
      {
         super(param1,param2);
      }
      
      override public function get canGetReward() : Boolean
      {
         var _loc1_:* = undefined;
         var _loc2_:int = 0;
         if(this.count < stcVo.limit_count)
         {
            if(PlayerModel.ins.level >= stcVo.conditionLevel)
            {
               _loc1_ = PlayerModel.ins.getWealthValue(34);
               _loc2_ = _loc1_ == null?0:_loc1_;
               if(_loc2_ >= stcVo.condition1count)
               {
                  return true;
               }
            }
         }
         return false;
      }
   }
}
