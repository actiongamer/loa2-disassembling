package com.mz.core.event
{
   import flash.events.Event;
   
   public class ValueChangedEvent extends Event
   {
       
      
      public var oldValue;
      
      public var newValue;
      
      public function ValueChangedEvent(param1:String, param2:* = null, param3:* = null, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param4,param5);
         this.newValue = param2;
         this.oldValue = param3;
      }
   }
}
