package nslm2.modules.battles.battle
{
   import flash.net.Socket;
   import flash.events.Event;
   import flash.utils.ByteArray;
   import flash.events.ProgressEvent;
   import flash.events.IOErrorEvent;
   import com.mz.core.logging.Log;
   import flash.events.SecurityErrorEvent;
   import com.mz.core.utils.LocalData;
   
   public class BinarySocket
   {
      
      public static var IP:String = "192.168.240.111";
      
      public static var PORT:int = 8888;
       
      
      private var _socket:Socket;
      
      private var handledPolicyFile:Boolean;
      
      private var waitingForHeader:Boolean;
      
      private var bytesNeeded:int;
      
      private var cmdId:int;
      
      public var onConnect:Function;
      
      public var onData:Function;
      
      public function BinarySocket()
      {
         super();
         _socket = new Socket();
         _socket.endian = "littleEndian";
         waitingForHeader = true;
         _socket.addEventListener("connect",onBinaryConnect);
         _socket.addEventListener("close",onBinaryClose);
         _socket.addEventListener("socketData",onBinarySocketData);
         _socket.addEventListener("ioError",onBinaryIOErrorEvent);
         _socket.addEventListener("securityError",onBinarySecrityError);
         var _loc1_:String = LocalData.insTools.load("settingBattleIP","127.0.0.1");
         IP = _loc1_;
      }
      
      private function onBinaryConnect(param1:Event) : void
      {
         if(onConnect is Function)
         {
            onConnect();
         }
      }
      
      private function onBinaryClose(param1:Event) : void
      {
      }
      
      private function sendBinary(param1:ByteArray) : void
      {
         if(!_socket.connected)
         {
            return;
         }
         _socket.writeBytes(param1);
         _socket.flush();
      }
      
      public function send(param1:int, param2:ByteArray) : void
      {
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.endian = "littleEndian";
         if(param2 == null)
         {
            _loc3_.writeShort(2);
            _loc3_.writeShort(param1);
            _loc3_.writeShort(0);
         }
         else
         {
            _loc3_.writeShort(param2.length);
            _loc3_.writeShort(param1);
            _loc3_.writeBytes(param2);
         }
         _loc3_.position = 0;
         sendBinary(_loc3_);
      }
      
      private function onBinarySocketData(param1:ProgressEvent) : void
      {
         processBinarySocketData();
      }
      
      private function processBinarySocketData() : void
      {
         var _loc1_:ByteArray = null;
         if(!_socket.connected)
         {
            return;
         }
         if(waitingForHeader)
         {
            if(_socket.bytesAvailable >= 4)
            {
               bytesNeeded = _socket.readUnsignedShort() - 4;
               cmdId = _socket.readUnsignedShort();
               waitingForHeader = false;
            }
         }
         if(!waitingForHeader)
         {
            if(_socket.bytesAvailable >= bytesNeeded)
            {
               _loc1_ = new ByteArray();
               _loc1_.endian = "littleEndian";
               _socket.readBytes(_loc1_,0,bytesNeeded);
               if(onData is Function)
               {
                  onData(cmdId,_loc1_);
               }
               waitingForHeader = true;
               processBinarySocketData();
            }
         }
      }
      
      private function onBinaryIOErrorEvent(param1:IOErrorEvent) : void
      {
         Log.error(this,"socket io error" + param1);
      }
      
      private function onBinarySecrityError(param1:SecurityErrorEvent) : void
      {
         Log.error(this,"socket security error" + param1);
      }
      
      public function connect() : void
      {
         _socket.connect(IP,PORT);
      }
      
      public function close() : void
      {
         _socket.close();
      }
   }
}
