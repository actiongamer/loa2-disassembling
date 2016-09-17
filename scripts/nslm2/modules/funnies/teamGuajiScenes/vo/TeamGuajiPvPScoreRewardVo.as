package nslm2.modules.funnies.teamGuajiScenes.vo
{
   import nslm2.mgrs.stcMgrs.vos.StcSwapActionVo;
   import nslm2.utils.WealthUtil;
   
   public class TeamGuajiPvPScoreRewardVo
   {
      
      public static const STATUS_NOT_AVAILABLE:int = 0;
      
      public static const STATUS_CAN_GET:int = 1;
      
      public static const STATUS_HAS_GOT:int = 2;
       
      
      public var status:int;
      
      private var _rewards:Array;
      
      public var stcVo:StcSwapActionVo;
      
      public function TeamGuajiPvPScoreRewardVo()
      {
         super();
      }
      
      public function get needCnt() : int
      {
         return stcVo.condition1count;
      }
      
      public function get rewards() : Array
      {
         if(!_rewards)
         {
            _rewards = WealthUtil.dropGroupIDToWealthVoArr(stcVo.drop_id);
         }
         return _rewards;
      }
   }
}
