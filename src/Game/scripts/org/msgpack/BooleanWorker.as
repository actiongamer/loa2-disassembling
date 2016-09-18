package org.msgpack
{
   import flash.utils.IDataOutput;
   import flash.utils.IDataInput;
   
   class BooleanWorker extends Worker
   {
       
      
      function BooleanWorker(param1:Factory, param2:int = -1)
      {
         super(param1,param2);
      }
      
      public static function checkType(param1:int) : Boolean
      {
         return param1 == 195 || param1 == 194;
      }
      
      override public function assembly(param1:*, param2:IDataOutput) : void
      {
         param2.writeByte(!!param1?195:Number(194));
      }
      
      override public function disassembly(param1:IDataInput) : *
      {
         return byte == 195;
      }
   }
}
