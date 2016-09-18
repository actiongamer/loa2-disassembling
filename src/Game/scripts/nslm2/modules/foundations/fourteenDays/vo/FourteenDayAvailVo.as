package nslm2.modules.foundations.fourteenDays.vo
{
   import proto.FourteenDayAvailInfo;
   
   public class FourteenDayAvailVo
   {
       
      
      public var day:int;
      
      public var number:int;
      
      public function FourteenDayAvailVo()
      {
         super();
      }
      
      public function updateInfo(param1:FourteenDayAvailInfo) : void
      {
         day = param1.day - 1;
         number = param1.num;
      }
   }
}
