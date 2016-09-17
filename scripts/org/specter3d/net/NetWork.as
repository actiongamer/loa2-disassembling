package org.specter3d.net
{
   import flash.events.EventDispatcher;
   import org.specter3d.events.NetWorkEvent;
   import flash.net.Socket;
   import flash.utils.ByteArray;
   import org.specter3d.debug.DevLog;
   import flash.events.SecurityErrorEvent;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.events.ProgressEvent;
   import flash.utils.getTimer;
   
   public class NetWork extends EventDispatcher
   {
      
      private static const FRAME_LIMIT:int = 7000;
      
      public static const FIXED_LENGTH:uint = 8;
       
      
      private var _lastFrameTime:int;
      
      protected var _closeEvent:NetWorkEvent;
      
      protected var _connectEvent:NetWorkEvent;
      
      protected var _errorEvent:NetWorkEvent;
      
      protected var _netErrorMesg:org.specter3d.net.NetErrorMesg;
      
      private var _sk:Socket;
      
      private var length:int = -1;
      
      private var _readBuffer:ByteArray;
      
      private var _rawBuffer:ByteArray;
      
      private var _encryptedBuffer:ByteArray;
      
      private var _decryptedBuffer:ByteArray;
      
      private var _encryptionHeader:ByteArray;
      
      private var _counter:int = 0;
      
      private var cur_msg_len:int = 0;
      
      private var _read_cmd_buffer:ByteArray;
      
      public function NetWork()
      {
         _readBuffer = new ByteArray();
         _rawBuffer = new ByteArray();
         _encryptedBuffer = new ByteArray();
         _decryptedBuffer = new ByteArray();
         _encryptionHeader = new ByteArray();
         _read_cmd_buffer = new ByteArray();
         super();
         init();
      }
      
      public function closeConnect() : void
      {
         if(_sk.connected)
         {
            _sk.close();
         }
      }
      
      public function connect(param1:String, param2:int) : void
      {
         DevLog.debug("engine","[开始连接] IP:" + param1 + " Prot:" + param2);
         this.closeConnect();
         try
         {
            this._sk.endian = "littleEndian";
            this._sk.connect(param1,param2);
            return;
         }
         catch(e:Error)
         {
            _sk.dispatchEvent(new SecurityErrorEvent("securityError"));
            return;
         }
      }
      
      public function send(param1:int, param2:ByteArray, param3:int) : void
      {
         var _loc5_:int = 0;
         if(!this._sk.connected)
         {
            return;
         }
         _rawBuffer.position = 0;
         _rawBuffer.length = 0;
         _rawBuffer.writeBytes(MessageHeadClient.getMessageHead(param1,param2.length,param3));
         _rawBuffer.writeBytes(param2);
         _counter = _counter + 1;
         Encryption.getInstance().encrypt(_rawBuffer,_encryptedBuffer,_counter + 1);
         var _loc4_:uint = 0;
         _loc5_ = 0;
         while(_loc5_ < _rawBuffer.length)
         {
            _loc4_ = _loc4_ + (_rawBuffer[_loc5_] ^ 88);
            _loc5_++;
         }
         _encryptionHeader.position = 0;
         _encryptionHeader.writeUnsignedInt(25 + param2.length);
         _encryptionHeader.writeUnsignedInt(5);
         _encryptionHeader.writeUnsignedInt(_loc4_);
         _sk.writeBytes(_encryptionHeader);
         sendData(_encryptedBuffer);
      }
      
      protected function initErrorEvent() : void
      {
         _errorEvent = new NetWorkEvent("network_error");
         if(_netErrorMesg == null)
         {
            _netErrorMesg = new org.specter3d.net.NetErrorMesg();
         }
      }
      
      protected function readCmd(param1:ByteArray, param2:int) : void
      {
      }
      
      protected function sendData(param1:ByteArray) : void
      {
         _sk.writeBytes(param1);
         _sk.flush();
      }
      
      private function conned(param1:Event) : void
      {
         if(hasEventListener("network_connect"))
         {
            _connectEvent = new NetWorkEvent("network_connect");
            dispatchEvent(_connectEvent);
         }
      }
      
      private function disConn(param1:Event) : void
      {
         if(hasEventListener("network_close"))
         {
            _closeEvent = new NetWorkEvent("network_close");
            dispatchEvent(_closeEvent);
         }
      }
      
      private function heartSend(param1:TimerEvent) : void
      {
      }
      
      private function init() : void
      {
         _sk = new Socket();
         _sk.addEventListener("connect",conned);
         _sk.addEventListener("close",disConn);
         _sk.addEventListener("ioError",onErr);
         _sk.addEventListener("securityError",onSec);
         _sk.addEventListener("socketData",onSkData);
         _readBuffer.endian = "bigEndian";
         _rawBuffer.endian = "littleEndian";
         _encryptedBuffer.endian = "littleEndian";
         _decryptedBuffer.endian = "littleEndian";
         _encryptionHeader.endian = "littleEndian";
      }
      
      private function onErr(param1:Event) : void
      {
         if(hasEventListener("network_error"))
         {
            initErrorEvent();
            _netErrorMesg.errorCode = "001";
            _netErrorMesg.errorMesg = "IO_Error";
            _errorEvent.data = _netErrorMesg;
            dispatchEvent(_errorEvent);
         }
      }
      
      private function onSec(param1:SecurityErrorEvent) : void
      {
         if(hasEventListener("network_error"))
         {
            initErrorEvent();
            _netErrorMesg.errorCode = "002";
            _netErrorMesg.errorMesg = "Security_Error";
            _errorEvent.data = _netErrorMesg;
            dispatchEvent(_errorEvent);
         }
      }
      
      private function onSkData(param1:ProgressEvent) : void
      {
         readData();
      }
      
      private function clipMsg(param1:ByteArray) : void
      {
         var _loc2_:int = 0;
         var _loc4_:* = 0;
         var _loc5_:* = 0;
         var _loc3_:* = 0;
         param1.position = 0;
         while(true)
         {
            if(cur_msg_len == 0)
            {
               if(param1.bytesAvailable >= 4)
               {
                  cur_msg_len = param1.readUnsignedInt() - 4;
               }
               addr84:
               param1.position = 0;
               param1.length = 0;
               return;
            }
            if(cur_msg_len <= param1.bytesAvailable)
            {
               _loc2_ = param1.readUnsignedInt();
               _loc4_ = _loc2_ >> 24 & 255;
               _loc5_ = _loc2_ >> 16 & 255;
               _loc3_ = _loc2_ & 65535;
               cur_msg_len = cur_msg_len - 4;
               _read_cmd_buffer.length = 0;
               _read_cmd_buffer.position = 0;
               if(cur_msg_len > 0)
               {
                  param1.readBytes(_read_cmd_buffer,0,cur_msg_len);
                  continue;
               }
               continue;
            }
            break;
         }
         §§goto(addr84);
      }
      
      private function readData() : void
      {
         var _loc2_:int = 0;
         var _loc1_:int = 0;
         var _loc4_:int = 0;
         var _loc7_:int = 0;
         var _loc5_:* = 0;
         var _loc6_:* = 0;
         var _loc3_:* = 0;
         _lastFrameTime = getTimer();
         while(this._sk.bytesAvailable >= 8 && hasTime())
         {
            if(length == -1)
            {
               length = this._sk.readUnsignedInt() - 4;
            }
            if(length <= _sk.bytesAvailable)
            {
               _loc2_ = this._sk.readUnsignedInt();
               if(_loc2_ == 1)
               {
                  length = -1;
               }
               else
               {
                  _loc1_ = 0;
                  _loc4_ = length - 4;
                  if(_loc2_ == 5)
                  {
                     _loc7_ = this._sk.readUnsignedInt();
                     _readBuffer.position = 0;
                     _loc4_ = _loc4_ - 4;
                     _sk.readBytes(_readBuffer,0,_loc4_);
                     _readBuffer.length = _loc4_;
                     Encryption.getInstance().decrypt(_readBuffer,_decryptedBuffer);
                     _readBuffer.position = 0;
                     if(_loc7_ > 0)
                     {
                        _decryptedBuffer.uncompress();
                        if(_loc7_ != _decryptedBuffer.length)
                        {
                           trace("uncompress message data failed!");
                        }
                     }
                     clipMsg(_decryptedBuffer);
                  }
                  else
                  {
                     _loc5_ = _loc2_ >> 24 & 255;
                     _loc6_ = _loc2_ >> 16 & 255;
                     _loc3_ = _loc2_ & 65535;
                     if(_loc4_ > 0)
                     {
                        _readBuffer.position = 0;
                        _sk.readBytes(_readBuffer,0,_loc4_);
                        _readBuffer.length = _loc4_;
                        this.readCmd(_readBuffer,_loc3_);
                     }
                  }
                  length = -1;
               }
               continue;
            }
            break;
         }
      }
      
      private function hasTime() : Boolean
      {
         var _loc1_:* = getTimer() - _lastFrameTime < 7000;
         if(!_loc1_)
         {
            DevLog.warning("NetWork处理超时:7000ms");
         }
         return _loc1_;
      }
   }
}
