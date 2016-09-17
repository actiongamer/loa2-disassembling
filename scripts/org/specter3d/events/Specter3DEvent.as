package org.specter3d.events
{
   import flash.events.Event;
   
   public class Specter3DEvent extends Event
   {
      
      public static const DISPOSED:String = "disposed";
       
      
      public function Specter3DEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}
