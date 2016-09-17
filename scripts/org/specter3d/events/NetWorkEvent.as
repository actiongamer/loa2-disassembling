package org.specter3d.events
{
   import flash.events.Event;
   
   public class NetWorkEvent extends Event
   {
      
      public static const NETWORK_CONNECT:String = "network_connect";
      
      public static const NETWORK_CLOSE:String = "network_close";
      
      public static const NETWORK_ERROR:String = "network_error";
       
      
      public var data:Object;
      
      public function NetWorkEvent(param1:String, param2:Object = null)
      {
         this.data = param2;
         super(param1,false,false);
      }
   }
}
