package nslm2.modules.foundations.dailyTask.vo
{
   public class DailyTaskScoreRewardVo
   {
       
      
      public var needLvl:int;
      
      public var needScore:int;
      
      public var dropID:int;
      
      public var rewardArr:Array;
      
      public var id:int;
      
      public var status:int = -1;
      
      public function DailyTaskScoreRewardVo()
      {
         super();
      }
      
      public function pareseInfo(param1:String) : void
      {
         var _loc3_:String = param1.split(";")[0];
         var _loc2_:String = param1.split(";")[1];
         needLvl = _loc2_.split("|")[1];
         needScore = String(_loc3_.split("|")[1]).split(":")[2];
      }
   }
}
