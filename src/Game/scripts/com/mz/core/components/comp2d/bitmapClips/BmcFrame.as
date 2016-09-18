package com.mz.core.components.comp2d.bitmapClips
{
   import flash.display.BitmapData;
   
   public class BmcFrame
   {
       
      
      public var bmd:BitmapData;
      
      public var rx:Number;
      
      public var ry:Number;
      
      public function BmcFrame()
      {
         super();
      }
      
      public function dispose() : void
      {
         if(bmd != null)
         {
            bmd.dispose();
         }
      }
   }
}
