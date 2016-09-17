package org.msgpack
{
   import flash.utils.IDataOutput;
   import flash.utils.IDataInput;
   
   class NullWorker extends Worker
   {
       
      
      function NullWorker(param1:Factory, param2:int = -1)
      {
         super(param1,param2);
      }
      
      public static function checkType(param1:int) : Boolean
      {
         return param1 == 192;
      }
      
      override public function assembly(param1:*, param2:IDataOutput) : void
      {
         param2.writeByte(192);
      }
      
      override public function disassembly(param1:IDataInput) : *
      {
         return null;
      }
   }
}
