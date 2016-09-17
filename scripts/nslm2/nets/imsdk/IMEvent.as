package nslm2.nets.imsdk
{
   import flash.events.Event;
   
   public class IMEvent extends Event
   {
      
      public static const ON_PACK:String = "onPack";
      
      public static const ON_ERR:String = "onErr";
      
      public static const ON_CONNECT:String = "onConnect";
      
      public static const ON_DISCONNECT:String = "onDisconnect";
      
      public static const ON_CHATMESSAGE:String = "onChatMessage";
      
      public static const ON_CHATERR:String = "onChatErr";
      
      public static const ON_LOGIN_SUCCESS:String = "onLoginSuccess";
       
      
      public var header:nslm2.nets.imsdk.MsgHeader;
      
      public var msg:String;
      
      public var chat:nslm2.nets.imsdk.ChatMessage;
      
      public var offline:Boolean;
      
      public function IMEvent(param1:String)
      {
         super(param1);
      }
   }
}
