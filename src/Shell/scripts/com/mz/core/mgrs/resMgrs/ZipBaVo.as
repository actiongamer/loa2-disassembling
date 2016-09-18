package com.mz.core.mgrs.resMgrs
{
   import flash.utils.ByteArray;
   
   public class ZipBaVo
   {
       
      
      public var name:String;
      
      public var ba:ByteArray;
      
      public function ZipBaVo(param1:String, param2:ByteArray)
      {
         super();
         this.name = param1;
         this.ba = param2;
      }
      
      public function dispose() : void
      {
         name = null;
         if(ba)
         {
            ba.clear();
            ba = null;
         }
      }
   }
}
