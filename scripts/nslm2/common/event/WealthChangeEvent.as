package nslm2.common.event
{
   import com.mz.core.event.MzEvent;
   
   public class WealthChangeEvent extends MzEvent
   {
      
      public static const WEALTH_CHANGE:String = "wealthChange";
       
      
      public var wealthType:int;
      
      public var oldValue;
      
      public var value;
      
      public function WealthChangeEvent(param1:int, param2:int, param3:int)
      {
         this.wealthType = param1;
         this.value = param2;
         this.oldValue = param3;
         super("wealthChange",null);
      }
   }
}
