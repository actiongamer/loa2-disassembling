package nslm2.nets.sockets
{
   import flash.events.Event;
   import flash.utils.ByteArray;
   import com.netease.protobuf.Message;
   import morn.core.utils.ObjectUtils;
   
   class SimpleServerEvent extends Event
   {
      
      public static const ON_PACK:String = "onPack";
      
      public static const ON_CONNECT:String = "onConnect";
      
      public static const ON_DISCONNECT:String = "onDisconnect";
      
      public static const ON_ERR_CONNECT:String = "onErrConnect";
       
      
      public var cmd:int;
      
      var body:ByteArray;
      
      public var message:Message;
      
      function SimpleServerEvent(param1:String)
      {
         super(param1);
      }
      
      override public function toString() : String
      {
         return ObjectUtils.__debugVars(this,ObjectUtils.varListOfOb(this));
      }
   }
}
