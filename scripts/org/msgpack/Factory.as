package org.msgpack
{
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   import flash.utils.IDataInput;
   
   public class Factory
   {
       
      
      private var flags:uint;
      
      private var workers:Object;
      
      private var root:org.msgpack.Worker;
      
      private var _workerByByteMap:Dictionary;
      
      private var _workerByTypeMap:Dictionary;
      
      public function Factory(param1:uint)
      {
         _workerByByteMap = new Dictionary();
         _workerByTypeMap = new Dictionary();
         super();
         this.flags = param1;
         workers = {};
      }
      
      public function assign(param1:Class, ... rest) : void
      {
         var _loc4_:* = 0;
         var _loc3_:* = null;
         _loc4_ = uint(0);
         while(_loc4_ < rest.length)
         {
            if(rest[_loc4_] != null && !(rest[_loc4_] is Class))
            {
               throw new MsgPackError("Workers must be assigned to classes not regular objects");
            }
            _loc3_ = getQualifiedClassName(rest[_loc4_]);
            workers[_loc3_] = param1;
            _loc4_++;
         }
      }
      
      public function unassign(param1:Class) : void
      {
         var _loc2_:String = getQualifiedClassName(param1);
         workers[_loc2_] = undefined;
      }
      
      public function getWorkerByType(param1:*) : org.msgpack.Worker
      {
         var _loc2_:String = param1 == null?"null":getQualifiedClassName(param1);
         if(!workers[_loc2_])
         {
            throw new MsgPackError("Worker for type \'" + _loc2_ + "\' not found");
         }
         if(_workerByTypeMap[_loc2_] == null)
         {
            _workerByTypeMap[_loc2_] = new workers[_loc2_](this);
         }
         return _workerByTypeMap[_loc2_];
      }
      
      public function getWorkerByByte(param1:IDataInput) : org.msgpack.Worker
      {
         var _loc3_:* = param1.readByte() & 255;
         var _loc5_:int = 0;
         var _loc4_:* = workers;
         for each(var _loc2_ in workers)
         {
            if(_loc2_["checkType"](_loc3_))
            {
               return new _loc2_(this,_loc3_);
            }
         }
         throw new MsgPackError("Worker for signature 0x" + _loc3_.toString(16) + " not found");
      }
      
      public function checkFlag(param1:uint) : Boolean
      {
         return (param1 & flags) != 0;
      }
   }
}
