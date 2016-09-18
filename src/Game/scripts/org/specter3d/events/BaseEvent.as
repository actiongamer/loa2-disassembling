package org.specter3d.events
{
   import flash.events.Event;
   
   public class BaseEvent extends Event
   {
       
      
      private var _data;
      
      public function BaseEvent(param1:String, param2:Object = null, param3:Boolean = false, param4:Boolean = false)
      {
         this.data = param2;
         super(param1,param3,param4);
      }
      
      public function get data() : *
      {
         return _data;
      }
      
      public function set data(param1:*) : void
      {
         _data = param1;
      }
      
      override public function clone() : Event
      {
         return new BaseEvent(type,_data);
      }
   }
}
