package org.specter3d.loaders
{
   import flash.events.Event;
   
   public class ErrorLogEvent extends Event
   {
       
      
      public var data:Object;
      
      public function ErrorLogEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}
