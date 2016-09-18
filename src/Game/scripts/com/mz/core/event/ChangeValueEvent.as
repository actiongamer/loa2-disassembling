package com.mz.core.event
{
   public class ChangeValueEvent extends MzEvent
   {
      
      public static const CHANGE_VALUE:String = "changeValue";
       
      
      public var oldValue;
      
      public var newValue;
      
      public function ChangeValueEvent(param1:* = null, param2:* = null)
      {
         super("changeValue");
         this.newValue = param1;
         this.oldValue = param2;
      }
   }
}
