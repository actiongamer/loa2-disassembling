package org.msgpack
{
   import flash.utils.IDataOutput;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   
   class RawWorker extends Worker
   {
       
      
      private var count:int;
      
      function RawWorker(param1:Factory, param2:int = -1)
      {
         super(param1,param2);
         count = -1;
      }
      
      public static function checkType(param1:int) : Boolean
      {
         return (param1 & 224) == 160 || param1 == 218 || param1 == 219;
      }
      
      override public function assembly(param1:*, param2:IDataOutput) : void
      {
         var _loc3_:* = null;
         if(param1 is ByteArray)
         {
            _loc3_ = param1;
         }
         else
         {
            _loc3_ = new ByteArray();
            _loc3_.writeUTFBytes(param1.toString());
         }
         if(_loc3_.length < 32)
         {
            param2.writeByte(160 | _loc3_.length);
         }
         else if(_loc3_.length < 65536)
         {
            param2.writeByte(218);
            param2.writeShort(_loc3_.length);
         }
         else
         {
            param2.writeByte(219);
            param2.writeInt(_loc3_.length);
         }
         param2.writeBytes(_loc3_);
      }
      
      override public function disassembly(param1:IDataInput) : *
      {
         var _loc2_:* = null;
         if(count == -1)
         {
            if((byte & 224) == 160)
            {
               count = byte & 31;
            }
            else if(byte == 218 && param1.bytesAvailable >= 2)
            {
               count = param1.readUnsignedShort();
            }
            else if(byte == 219 && param1.bytesAvailable >= 4)
            {
               count = param1.readUnsignedInt();
            }
         }
         if(param1.bytesAvailable >= count)
         {
            _loc2_ = new ByteArray();
            _loc2_.endian = "bigEndian";
            if(count > 0)
            {
               param1.readBytes(_loc2_,0,count);
            }
            return _loc2_.readUTFBytes(count);
         }
         return incomplete;
      }
   }
}
