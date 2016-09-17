package org.specter3d.events
{
   public class LogEvent extends BaseEvent
   {
      
      public static const ERROR:String = "error";
      
      public static const DEBUG:String = "debug";
       
      
      public function LogEvent(param1:String, param2:Object = null, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param2,param3,param4);
      }
   }
}
