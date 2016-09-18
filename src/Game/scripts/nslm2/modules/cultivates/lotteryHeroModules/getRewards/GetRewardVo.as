package nslm2.modules.cultivates.lotteryHeroModules.getRewards
{
   public class GetRewardVo
   {
       
      
      public var groupId:int;
      
      public var canGet:Boolean;
      
      public function GetRewardVo(param1:int, param2:Boolean)
      {
         super();
         this.groupId = param1;
         this.canGet = param2;
      }
   }
}
