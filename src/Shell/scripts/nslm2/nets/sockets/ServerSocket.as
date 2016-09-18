package nslm2.nets.sockets
{
   import flash.events.EventDispatcher;
   import flash.net.Socket;
   import flash.system.Security;
   import com.mz.core.logging.Log;
   import flash.events.IOErrorEvent;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import flash.events.SecurityErrorEvent;
   import flash.events.Event;
   import flash.utils.ByteArray;
   import flash.events.ProgressEvent;
   
   public class ServerSocket extends EventDispatcher
   {
      
      private static var _ins:nslm2.nets.sockets.ServerSocket;
      
      public static var HEAD_LENGTH:int = 0;
       
      
      private var socket:Socket = null;
      
      private var _host:String;
      
      private var _port:uint;
      
      public var eventClass:Class;
      
      private var retryId:int;
      
      private var reconn:uint = 0;
      
      private var _readBuff:ByteArray;
      
      public function ServerSocket()
      {
         super();
         eventClass = SimpleServerEvent;
      }
      
      public static function get ins() : nslm2.nets.sockets.ServerSocket
      {
         if(_ins == null)
         {
            _ins = new nslm2.nets.sockets.ServerSocket();
         }
         return _ins;
      }
      
      public function init(param1:String, param2:uint) : void
      {
         this._host = param1;
         this._port = param2;
         Security.loadPolicyFile("xmlsocket://" + _host + ":8843");
         _readBuff = ServerUtil.createByteArray();
         socket = new Socket();
         socket.addEventListener("ioError",onIoError);
         socket.addEventListener("close",onClose);
         socket.addEventListener("connect",onConn);
         socket.addEventListener("securityError",onSecurityError);
         socket.addEventListener("socketData",onData);
         Log.info(this,"Socket Connect Start",_host,_port);
         try
         {
            socket.connect(_host,_port);
            return;
         }
         catch(err:Error)
         {
            this.onSecurityError(null);
            return;
         }
      }
      
      private function onIoError(param1:IOErrorEvent) : void
      {
         Log.fatal(this,"Connection-ioErrorHandler",_host,_port);
         clearTimeout(retryId);
         if(reconn >= 3)
         {
            dispatchEvent(new eventClass("onErrConnect"));
         }
         else
         {
            retryId = setTimeout(tryConnect,(reconn + 1) * 1000);
         }
      }
      
      private function onSecurityError(param1:SecurityErrorEvent) : void
      {
         Log.fatal(this,"Connection-securityErrorHandler",_host,_port);
         clearTimeout(retryId);
         if(reconn >= 3)
         {
            dispatchEvent(new eventClass("onErrConnect"));
         }
         else
         {
            retryId = setTimeout(tryConnect,(reconn + 1) * 1000);
         }
      }
      
      private function onClose(param1:Event) : void
      {
         Log.fatal(this,"Connection-Close",_host,_port);
         dispatchEvent(new eventClass("onDisconnect"));
      }
      
      private function onConn(param1:Event) : void
      {
         Log.info(this,"Connected",_host,_port);
         dispatchEvent(new eventClass("onConnect"));
      }
      
      public function tryConnect() : void
      {
         reconn = Number(reconn) + 1;
         Log.info(this,"Socket tryConnect",reconn,"次",_host,_port);
         socket.connect(_host,_port);
      }
      
      private function onData(param1:ProgressEvent) : void
      {
         socket.readBytes(_readBuff,_readBuff.length,0);
         onDataRun();
      }
      
      private function onDataRun() : void
      {
         var _loc1_:* = null;
         if(HEAD_LENGTH == 0)
         {
            HEAD_LENGTH = 12;
         }
         if(_readBuff.length < HEAD_LENGTH)
         {
            Log.debug(this,"包头不够等下一次","_readBuff:",_readBuff.length,"HEAD_LENGTH:",HEAD_LENGTH);
            return;
         }
         var _loc3_:uint = _readBuff.readInt();
         var _loc5_:uint = _readBuff.readInt();
         if(_readBuff.length < HEAD_LENGTH + _loc5_)
         {
            _readBuff.position = _readBuff.position - 8;
            Log.debug(this,"数据不够等下一次","_readBuff:",_readBuff.length,"HEAD_LENGTH:",HEAD_LENGTH,"$bodyLen:",_loc5_,"$flags",_loc3_);
            return;
         }
         var _loc6_:uint = _readBuff.readInt();
         var _loc4_:SimpleServerEvent = new eventClass("onPack");
         _loc4_.cmd = _loc6_;
         if(_loc5_ > 0)
         {
            _loc1_ = ServerUtil.createByteArray();
            _readBuff.readBytes(_loc1_,0,_loc5_);
            if(_loc3_ == 1)
            {
               ServerUtil.uncompress(_loc1_);
            }
            _loc4_.body = _loc1_;
         }
         this.dispatchEvent(_loc4_);
         var _loc2_:ByteArray = ServerUtil.createByteArray();
         _readBuff.readBytes(_loc2_);
         _readBuff = _loc2_;
         if(_readBuff.length)
         {
            onDataRun();
         }
      }
      
      public function send_to_net(param1:int, param2:ByteArray, param3:int) : void
      {
         if(socket.connected == false)
         {
            return;
         }
         var _loc4_:ByteArray = ServerUtil.createByteArray();
         _loc4_.writeInt(0);
         _loc4_.writeInt(param2.length);
         _loc4_.writeInt(param1);
         socket.writeBytes(_loc4_);
         socket.writeBytes(param2);
         socket.flush();
      }
      
      public function close() : void
      {
         if(socket == null || socket.connected == false)
         {
            return;
         }
         this.socket.close();
      }
   }
}
