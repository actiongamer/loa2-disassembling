package org.msgpack
{
   import flash.utils.IDataOutput;
   import flash.utils.IDataInput;
   
   class IntegerWorker extends Worker
   {
       
      
      function IntegerWorker(param1:Factory, param2:int = -1)
      {
         super(param1,param2);
      }
      
      public static function checkType(param1:int) : Boolean
      {
         return (param1 & 128) == 0 || (param1 & 224) == 224 || param1 == 204 || param1 == 205 || param1 == 206 || param1 == 207 || param1 == 208 || param1 == 209 || param1 == 210 || param1 == 211;
      }
      
      override public function assembly(param1:*, param2:IDataOutput) : void
      {
         if(param1 < -32)
         {
            if(param1 < -32768)
            {
               param2.writeByte(210);
               param2.writeInt(param1);
            }
            else if(param1 < -128)
            {
               param2.writeByte(209);
               param2.writeShort(param1);
            }
            else
            {
               param2.writeByte(208);
               param2.writeByte(param1);
            }
         }
         else if(param1 < 128)
         {
            param2.writeByte(param1);
         }
         else if(param1 < 256)
         {
            param2.writeByte(204);
            param2.writeByte(param1);
         }
         else if(param1 < 65536)
         {
            param2.writeByte(205);
            param2.writeShort(param1);
         }
         else
         {
            param2.writeByte(206);
            param2.writeUnsignedInt(param1);
         }
      }
      
      override public function disassembly(param1:IDataInput) : *
      {
         var _loc3_:* = 0;
         var _loc2_:* = undefined;
         if((byte & 128) == 0)
         {
            return byte;
         }
         if((byte & 224) == 224)
         {
            return byte - 255 - 1;
         }
         if(byte == 204 && param1.bytesAvailable >= 1)
         {
            return param1.readUnsignedByte();
         }
         if(byte == 205 && param1.bytesAvailable >= 2)
         {
            return param1.readUnsignedShort();
         }
         if(byte == 206 && param1.bytesAvailable >= 4)
         {
            return param1.readUnsignedInt();
         }
         if(byte == 207 && param1.bytesAvailable >= 8)
         {
            _loc3_ = uint(0);
            while(_loc3_ < 8)
            {
               param1.readByte();
               _loc3_++;
            }
            return NaN;
         }
         if(byte == 208 && param1.bytesAvailable >= 1)
         {
            return param1.readByte();
         }
         if(byte == 209 && param1.bytesAvailable >= 2)
         {
            return param1.readShort();
         }
         if(byte == 210 && param1.bytesAvailable >= 4)
         {
            return param1.readInt();
         }
         if(byte == 211 && param1.bytesAvailable >= 8)
         {
            _loc3_ = uint(0);
            while(_loc3_ < 8)
            {
               param1.readByte();
               _loc3_++;
            }
            return NaN;
         }
         return incomplete;
      }
   }
}
