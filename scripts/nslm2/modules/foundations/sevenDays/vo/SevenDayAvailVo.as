package nslm2.modules.foundations.sevenDays.vo
{
   import proto.SevenDayAvaiInfo;
   
   public class SevenDayAvailVo
   {
       
      
      public var day:int;
      
      public var number:int;
      
      public function SevenDayAvailVo()
      {
         super();
      }
      
      public function updateInfo(param1:SevenDayAvaiInfo) : void
      {
         day = param1.day - 1;
         number = param1.num;
      }
   }
}
