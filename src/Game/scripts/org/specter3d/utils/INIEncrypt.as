package org.specter3d.utils
{
   import flash.utils.ByteArray;
   
   public class INIEncrypt
   {
      
      private static var key:Array = [1684226113,1731474277,1684169316,1684300838];
      
      private static var delta:uint = 2654042553;
       
      
      public function INIEncrypt()
      {
         super();
      }
      
      public static function decrypt(param1:ByteArray, param2:int = 0) : void
      {
         param1.position = param2;
         param1.endian = "littleEndian";
         while(param1.position < param1.length - 1)
         {
            INIEncrypt.decryptTEA(param1);
         }
         param1.position = param2;
      }
      
      public static function encrypt(param1:ByteArray) : void
      {
         param1.position = 0;
         param1.endian = "littleEndian";
         param1.length = param1.length + 7 & 4294967288;
         while(param1.position < param1.length - 1)
         {
            INIEncrypt.encryptTEA(param1);
         }
         param1.position = 0;
      }
      
      private static function encryptTEA(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc4_:uint = param1.readUnsignedInt();
         var _loc3_:uint = param1.readUnsignedInt();
         var _loc2_:uint = 0;
         _loc5_ = 0;
         while(_loc5_ < 32)
         {
            _loc2_ = _loc2_ + delta;
            _loc4_ = _loc4_ + ((_loc3_ << 4) + key[0] ^ _loc3_ + _loc2_ ^ (_loc3_ >>> 5) + key[1]);
            _loc3_ = _loc3_ + ((_loc4_ << 4) + key[2] ^ _loc4_ + _loc2_ ^ (_loc4_ >>> 5) + key[3]);
            _loc5_++;
         }
         param1.position = param1.position - 8;
         param1.writeUnsignedInt(_loc4_);
         param1.writeUnsignedInt(_loc3_);
      }
      
      private static function decryptTEA(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc2_:uint = delta << 5;
         var _loc4_:uint = param1.readUnsignedInt();
         var _loc3_:uint = param1.readUnsignedInt();
         _loc5_ = 0;
         while(_loc5_ < 32)
         {
            _loc3_ = _loc3_ - ((_loc4_ << 4) + key[2] ^ _loc4_ + _loc2_ ^ (_loc4_ >>> 5) + key[3]);
            _loc4_ = _loc4_ - ((_loc3_ << 4) + key[0] ^ _loc3_ + _loc2_ ^ (_loc3_ >>> 5) + key[1]);
            _loc2_ = _loc2_ - delta;
            _loc5_++;
         }
         param1.position = param1.position - 8;
         param1.writeUnsignedInt(_loc4_);
         param1.writeUnsignedInt(_loc3_);
      }
   }
}
