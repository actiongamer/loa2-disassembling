package org.msgpack
{
   import flash.utils.IDataOutput;
   import flash.utils.IDataInput;
   
   class MapWorker extends org.msgpack.Worker
   {
       
      
      private var count:int;
      
      private var ready:int;
      
      private var map:Object;
      
      private var keyWorker:org.msgpack.Worker;
      
      private var valWorker:org.msgpack.Worker;
      
      private var key;
      
      private var val;
      
      function MapWorker(param1:Factory, param2:int = -1)
      {
         super(param1,param2);
         count = -1;
         ready = 0;
         map = {};
         key = incomplete;
         val = incomplete;
      }
      
      public static function checkType(param1:int) : Boolean
      {
         return (param1 & 240) == 128 || param1 == 222 || param1 == 223;
      }
      
      override public function assembly(param1:*, param2:IDataOutput) : void
      {
         var _loc9_:* = 0;
         var _loc4_:* = null;
         var _loc8_:* = null;
         var _loc3_:* = null;
         var _loc6_:Array = [];
         var _loc11_:int = 0;
         var _loc10_:* = param1;
         for(var _loc7_ in param1)
         {
            _loc6_.push(_loc7_);
         }
         var _loc5_:uint = _loc6_.length;
         if(_loc5_ < 16)
         {
            param2.writeByte(128 | _loc5_);
         }
         else if(_loc5_ < 65536)
         {
            param2.writeByte(222);
            param2.writeShort(_loc5_);
         }
         else
         {
            param2.writeByte(223);
            param2.writeUnsignedInt(_loc5_);
         }
         _loc9_ = uint(0);
         while(_loc9_ < _loc5_)
         {
            _loc4_ = _loc6_[_loc9_];
            _loc8_ = factory.getWorkerByType(_loc4_);
            _loc8_.assembly(_loc4_,param2);
            _loc3_ = factory.getWorkerByType(param1[_loc4_]);
            _loc3_.assembly(param1[_loc4_],param2);
            _loc9_++;
         }
      }
      
      override public function disassembly(param1:IDataInput) : *
      {
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         if(count == -1)
         {
            if((byte & 240) == 128)
            {
               count = byte & 15;
            }
            else if(byte == 222 && param1.bytesAvailable >= 2)
            {
               count = param1.readUnsignedShort();
            }
            else if(byte == 223 && param1.bytesAvailable >= 4)
            {
               count = param1.readUnsignedInt();
            }
         }
         if(ready < count)
         {
            _loc2_ = uint(ready);
            _loc3_ = _loc2_;
            while(_loc3_ < count)
            {
               if(key == incomplete)
               {
                  if(!keyWorker)
                  {
                     if(param1.bytesAvailable != 0)
                     {
                        keyWorker = factory.getWorkerByByte(param1);
                     }
                     break;
                  }
                  key = keyWorker.disassembly(param1);
               }
               if(key != incomplete && val == incomplete)
               {
                  if(!valWorker)
                  {
                     if(param1.bytesAvailable != 0)
                     {
                        valWorker = factory.getWorkerByByte(param1);
                     }
                     break;
                  }
                  val = valWorker.disassembly(param1);
               }
               if(key != incomplete && val != incomplete)
               {
                  map[key.toString()] = val;
                  keyWorker = undefined;
                  valWorker = undefined;
                  key = incomplete;
                  val = incomplete;
                  ready = Number(ready) + 1;
                  _loc3_++;
                  continue;
               }
               break;
            }
         }
         if(ready == count)
         {
            return map;
         }
         return incomplete;
      }
   }
}
