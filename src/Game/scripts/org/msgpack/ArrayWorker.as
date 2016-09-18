package org.msgpack
{
   import flash.utils.IDataOutput;
   import flash.utils.IDataInput;
   
   class ArrayWorker extends Worker
   {
       
      
      private var array:Array;
      
      private var workers:Array;
      
      private var count:int;
      
      function ArrayWorker(param1:Factory, param2:int = -1)
      {
         super(param1,param2);
         array = [];
         workers = [];
         count = -1;
      }
      
      public static function checkType(param1:int) : Boolean
      {
         return (param1 & 240) == 144 || param1 == 220 || param1 == 221;
      }
      
      override public function assembly(param1:*, param2:IDataOutput) : void
      {
         var _loc5_:* = 0;
         var _loc3_:* = null;
         var _loc4_:uint = param1.length;
         if(_loc4_ < 16)
         {
            param2.writeByte(144 | _loc4_);
         }
         else if(_loc4_ < 65536)
         {
            param2.writeByte(220);
            param2.writeShort(_loc4_);
         }
         else
         {
            param2.writeByte(221);
            param2.writeUnsignedInt(_loc4_);
         }
         _loc5_ = uint(0);
         while(_loc5_ < _loc4_)
         {
            _loc3_ = factory.getWorkerByType(param1[_loc5_]);
            _loc3_.assembly(param1[_loc5_],param2);
            _loc5_++;
         }
      }
      
      override public function disassembly(param1:IDataInput) : *
      {
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         var _loc2_:* = undefined;
         if(count == -1)
         {
            if((byte & 240) == 144)
            {
               count = byte & 15;
            }
            else if(byte == 220 && param1.bytesAvailable >= 2)
            {
               count = param1.readUnsignedShort();
            }
            else if(byte == 221 && param1.bytesAvailable >= 4)
            {
               count = param1.readUnsignedInt();
            }
         }
         if(array.length < count)
         {
            _loc3_ = uint(array.length);
            _loc4_ = _loc3_;
            while(_loc4_ < count)
            {
               if(!workers[_loc4_])
               {
                  if(param1.bytesAvailable != 0)
                  {
                     workers.push(factory.getWorkerByByte(param1));
                  }
                  break;
               }
               _loc2_ = workers[_loc4_].disassembly(param1);
               if(_loc2_ != incomplete)
               {
                  array.push(_loc2_);
                  _loc4_++;
                  continue;
               }
               break;
            }
         }
         if(array.length == count)
         {
            return array;
         }
         return incomplete;
      }
   }
}
