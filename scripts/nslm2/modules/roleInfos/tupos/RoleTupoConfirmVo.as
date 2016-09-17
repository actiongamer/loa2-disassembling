package nslm2.modules.roleInfos.tupos
{
   public class RoleTupoConfirmVo
   {
       
      
      public var handlerYes;
      
      public var handlerNo;
      
      public var feedHeroList:Array;
      
      public function RoleTupoConfirmVo(param1:*, param2:*, param3:Array)
      {
         super();
         handlerYes = param1;
         handlerNo = param2;
         feedHeroList = param3;
      }
   }
}
