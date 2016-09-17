package org.specter3d.loaders.parsers.data
{
   import flash.display.BitmapData;
   import away3d.textures.BitmapTexture;
   
   public final class ImageObject
   {
       
      
      public var group:String = "default_group";
      
      private var _bitmapData:BitmapData;
      
      private var _bitmapTexture:BitmapTexture;
      
      public function ImageObject(param1:BitmapData)
      {
         super();
         this._bitmapData = param1;
      }
      
      public function get bitmapTexture() : BitmapTexture
      {
         !_bitmapTexture && new BitmapTexture(_bitmapData);
         return _bitmapTexture;
      }
      
      public function dispose() : void
      {
         _bitmapTexture && _bitmapTexture.dispose();
         _bitmapTexture = null;
         if(_bitmapData)
         {
            if(_bitmapData is ShareBitmapData)
            {
               (_bitmapData as ShareBitmapData).dispose_real();
            }
            else
            {
               _bitmapData.dispose();
            }
         }
         _bitmapData = null;
      }
   }
}
