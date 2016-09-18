package nslm2.modules.globalModules.facebook.event
{
   import flash.events.Event;
   
   public class FBEvent extends Event
   {
      
      public static const ADD_FRIEND:String = "addFriend";
      
      public static const REMOVE_FRIEND:String = "removeFriend";
       
      
      public var data;
      
      public function FBEvent(param1:String, param2:* = null, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         data = param2;
      }
   }
}
