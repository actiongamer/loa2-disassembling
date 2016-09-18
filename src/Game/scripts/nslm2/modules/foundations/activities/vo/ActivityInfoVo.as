package nslm2.modules.foundations.activities.vo
{
   import proto.StaticActivityReward;
   
   public class ActivityInfoVo
   {
       
      
      public var activityId:int;
      
      public var staticActivityReward:StaticActivityReward;
      
      public function ActivityInfoVo(param1:int, param2:StaticActivityReward)
      {
         super();
         activityId = param1;
         staticActivityReward = param2;
      }
   }
}
