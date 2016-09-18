package org.specter3d.events
{
   import flash.events.Event;
   
   public class ModelEvent extends BaseEvent
   {
       
      
      public function ModelEvent(param1:String, param2:Object = null, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param2,param3,param4);
      }
      
      override public function clone() : Event
      {
         return new ModelEvent(type,data,bubbles,cancelable);
      }
   }
}
