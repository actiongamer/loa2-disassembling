package org.msgpack
{
   import flash.utils.IDataOutput;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   
   public class MsgPack
   {
      
      public static const MAJOR:uint = 1;
      
      public static const MINOR:uint = 0;
      
      public static const REVISION:uint = 1;
       
      
      private var _factory:org.msgpack.Factory;
      
      private var root:org.msgpack.Worker;
      
      public function MsgPack(param1:uint = 0)
      {
         super();
         _factory = new org.msgpack.Factory(param1);
         _factory.assign(NullWorker,null);
         _factory.assign(BooleanWorker,Boolean);
         _factory.assign(IntegerWorker,int,uint);
         _factory.assign(IntegerWorker,Number);
         _factory.assign(ArrayWorker,Array);
         _factory.assign(RawWorker,String);
         _factory.assign(MapWorker,Object);
      }
      
      public static function get VERSION() : String
      {
         return "1.0.1";
      }
      
      public function get factory() : org.msgpack.Factory
      {
         return _factory;
      }
      
      public function write(param1:*, param2:IDataOutput = null) : *
      {
         var _loc3_:org.msgpack.Worker = _factory.getWorkerByType(param1);
         if(!param2)
         {
            param2 = new ByteArray();
         }
         checkBigEndian(param2);
         _loc3_.assembly(param1,param2);
         return param2;
      }
      
      public function read(param1:IDataInput) : *
      {
         checkBigEndian(param1);
         if(param1.bytesAvailable == 0)
         {
            return [];
         }
         root = _factory.getWorkerByByte(param1);
         var _loc2_:* = root.disassembly(param1);
         if(_loc2_ != incomplete)
         {
            root = undefined;
         }
         return _loc2_;
      }
      
      private function checkBigEndian(param1:*) : void
      {
      }
   }
}
