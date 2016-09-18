package com.mz.core.mgrs.res3ds
{
   import flash.display.BitmapData;
   
   public class BitmapDataFor3D extends BitmapData
   {
       
      
      public var oriW:int;
      
      public var oriH:int;
      
      public function BitmapDataFor3D(param1:int, param2:int, param3:Boolean = true, param4:uint = 4294967295)
      {
         super(param1,param2,param3,param4);
      }
   }
}
