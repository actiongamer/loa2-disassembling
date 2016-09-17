package org.msgpack
{
   import flash.utils.IDataOutput;
   import flash.utils.IDataInput;
   
   public class Worker
   {
       
      
      protected var factory:org.msgpack.Factory;
      
      protected var byte:int;
      
      public function Worker(param1:org.msgpack.Factory, param2:int = -1)
      {
         super();
         this.factory = param1;
         this.byte = param2;
      }
      
      public static function checkType(param1:int) : Boolean
      {
         return false;
      }
      
      public function getFactory() : org.msgpack.Factory
      {
         return factory;
      }
      
      public function getByte() : int
      {
         return byte;
      }
      
      public function assembly(param1:*, param2:IDataOutput) : void
      {
      }
      
      public function disassembly(param1:IDataInput) : *
      {
         return incomplete;
      }
   }
}
