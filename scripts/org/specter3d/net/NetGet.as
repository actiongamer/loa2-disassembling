package org.specter3d.net
{
   import org.msgpack.MsgPack;
   import flash.utils.ByteArray;
   import org.specter3d.mvc.Facade;
   
   public final class NetGet extends NetWork
   {
       
      
      private var _msgPack:MsgPack;
      
      private var _bytes:ByteArray;
      
      public function NetGet()
      {
         _bytes = new ByteArray();
         _bytes.endian = "bigEndian";
         _msgPack = new MsgPack(1);
         super();
      }
      
      override protected function readCmd(param1:ByteArray, param2:int) : void
      {
         param1.position = 0;
         var _loc3_:* = _msgPack.read(param1);
         Facade.instance.dispatcherCommand(param2,_loc3_);
      }
      
      public function sendObject(param1:int, param2:Object = null, param3:int = 0) : void
      {
         _bytes.position = 0;
         _bytes.length = 0;
         _msgPack.write(param2,_bytes);
         send(param1,_bytes,param3);
      }
      
      public function sendLogin(param1:ByteArray) : void
      {
         sendData(param1);
      }
   }
}
