package nslm2.nets.imsdk
{
   import flash.events.EventDispatcher;
   import flash.net.Socket;
   import flash.system.Security;
   import com.mz.core.logging.Log;
   import flash.events.IOErrorEvent;
   import flash.utils.clearTimeout;
   import flash.events.SecurityErrorEvent;
   import flash.events.Event;
   import flash.events.ProgressEvent;
   import flash.utils.setTimeout;
   import flash.utils.ByteArray;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class IMSocket extends EventDispatcher
   {
       
      
      private var socket:Socket = null;
      
      private var _host:String;
      
      private var _ports:Array;
      
      private var _port:uint;
      
      private var _packet:nslm2.nets.imsdk.MsgPacket;
      
      private var retryId:int;
      
      private var reconn:uint = 0;
      
      private var isDisposed:Boolean = false;
      
      public function IMSocket()
      {
         _packet = new nslm2.nets.imsdk.MsgPacket();
         super();
      }
      
      private function initSocket() : void
      {
         Security.loadPolicyFile("xmlsocket://" + _host + ":8843");
         socket = new Socket();
         socket.addEventListener("ioError",onIoError);
         socket.addEventListener("securityError",onSecurityError);
         socket.addEventListener("close",onClose);
         socket.addEventListener("connect",onConn);
         socket.addEventListener("socketData",onData);
      }
      
      private function disposeSocket() : void
      {
         if(socket)
         {
            socket.removeEventListener("ioError",onIoError);
            socket.removeEventListener("securityError",onSecurityError);
            socket.removeEventListener("close",onClose);
            socket.removeEventListener("connect",onConn);
            socket.removeEventListener("socketData",onData);
            socket = null;
         }
      }
      
      public function init(param1:String, param2:String) : void
      {
         this._host = param1;
         _ports = param2.split(",");
         this._port = _ports[0];
         _packet = new nslm2.nets.imsdk.MsgPacket();
         initSocket();
         Log.info(this,"Socket First Connect Start",_host,_port);
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
         Log.info(this,"Connection-ioErrorHandler",_host,_port);
         clearTimeout(retryId);
         this.tryConnect0();
      }
      
      private function onSecurityError(param1:SecurityErrorEvent) : void
      {
         Log.info(this,"Connection-securityErrorHandler",_host,_port);
         clearTimeout(retryId);
         this.tryConnect0();
      }
      
      private function onClose(param1:Event) : void
      {
         Log.info(this,"Connection-Close",_host,_port);
         dispatchEvent(new IMEvent("onDisconnect"));
         if(isDisposed)
         {
            return;
         }
         disposeSocket();
         this.initSocket();
         this.tryConnect0(false);
      }
      
      private function onConn(param1:Event) : void
      {
         Log.info(this,"Connected",_host,_port);
         dispatchEvent(new IMEvent("onConnect"));
      }
      
      private function onData(param1:ProgressEvent) : void
      {
         socket.readBytes(_packet._readBuff,_packet._readBuff.length,0);
         _packet.onDataRun(this);
      }
      
      public function tryConnect0(param1:Boolean = true) : void
      {
         if(param1)
         {
            _ports.push(_ports[0]);
         }
         retryId = setTimeout(tryConnect,(reconn + 1) * 1000);
      }
      
      public function tryConnect() : void
      {
         reconn = Number(reconn) + 1;
         this._port = _ports[0];
         Log.info(this,"Socket tryConnect",reconn,"次",_host,_port);
         socket.connect(_host,_port);
      }
      
      public function CloseConnect() : void
      {
         try
         {
            isDisposed = true;
            socket.close();
            return;
         }
         catch(err:Error)
         {
            return;
         }
      }
      
      public function onMessage(param1:MsgHeader, param2:ByteArray) : void
      {
         var _loc3_:IMEvent = new IMEvent("onPack");
         _loc3_.header = param1;
         _loc3_.msg = param2.toString();
         Log.info(this,"onMessage " + param1.msgid + " " + _loc3_.msg);
         this.dispatchEvent(_loc3_);
      }
      
      public function sendBuff(param1:String, param2:ByteArray) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(socket.connected)
         {
            socket.writeBytes(param2);
            socket.flush();
         }
         else
         {
            _loc3_ = new IMEvent("onErr");
            _loc4_ = new MsgHeader();
            _loc4_.msgid = param1;
            _loc3_.header = _loc4_;
            _loc3_.msg = LocaleMgr.ins.getStr(999000527);
            this.dispatchEvent(_loc3_);
         }
      }
      
      public function sendMsg(param1:String, param2:String) : void
      {
      }
   }
}
