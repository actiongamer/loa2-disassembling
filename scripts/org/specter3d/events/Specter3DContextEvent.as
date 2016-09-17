package org.specter3d.events
{
   import flash.events.Event;
   
   public class Specter3DContextEvent extends Event
   {
      
      public static const ENGINE_INIT_COMPLETE:String = "EngineInitComplete";
       
      
      public var data;
      
      public function Specter3DContextEvent(param1:String, param2:* = null, param3:Boolean = false, param4:Boolean = false)
      {
         data = param2;
         super(param1,param3,param4);
      }
   }
}
