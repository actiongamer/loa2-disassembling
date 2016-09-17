package away3d.textures
{
   import flash.display.BitmapData;
   import away3d.tools.utils.TextureUtils;
   import flash.display3D.textures.TextureBase;
   import away3d.materials.utils.MipmapGenerator;
   import flash.display3D.textures.Texture;
   import com.mz.core.logging.Log;
   
   public class BitmapTexture extends Texture2DBase
   {
      
      private static var _mipMaps:Array = [];
      
      private static var _mipMapUses:Array = [];
       
      
      private var _bitmapData:BitmapData;
      
      private var _mipMapHolder:BitmapData;
      
      private var _generateMipmaps:Boolean;
      
      public var isDisposed:Boolean;
      
      public function BitmapTexture(param1:BitmapData, param2:Boolean = false)
      {
         super();
         this.bitmapData = param1;
         _generateMipmaps = param2;
      }
      
      public function get bitmapData() : BitmapData
      {
         return _bitmapData;
      }
      
      public function set bitmapData(param1:BitmapData) : void
      {
         if(!TextureUtils.isBitmapDataValid(param1))
         {
            throw new Error("Invalid bitmapData: Width and height must be power of 2 and cannot exceed 2048");
         }
         if(param1 == null)
         {
            throw new Error("Invalid bitmapData: null");
         }
         if(param1 == _bitmapData)
         {
            return;
         }
         invalidateContent();
         setSize(param1.width,param1.height);
         _bitmapData = param1;
         if(_generateMipmaps)
         {
            getMipMapHolder();
         }
      }
      
      override protected function uploadContent(param1:TextureBase) : void
      {
         if(_generateMipmaps)
         {
            MipmapGenerator.generateMipMaps(_bitmapData,param1,_mipMapHolder,true);
         }
         else
         {
            try
            {
               Texture(param1).uploadFromBitmapData(_bitmapData,0);
               return;
            }
            catch($err:Error)
            {
               Log.fatal(this,"uploadFromBitmapData 无效的_bitmapData");
               return;
            }
         }
      }
      
      private function getMipMapHolder() : void
      {
         var _loc2_:* = 0;
         var _loc1_:* = 0;
         _loc1_ = uint(_bitmapData.width);
         _loc2_ = uint(_bitmapData.height);
         if(_mipMapHolder)
         {
            if(_mipMapHolder.width == _loc1_ && _bitmapData.height == _loc2_)
            {
               return;
            }
            freeMipMapHolder();
         }
         if(!_mipMaps[_loc1_])
         {
            _mipMaps[_loc1_] = [];
            _mipMapUses[_loc1_] = [];
         }
         if(!_mipMaps[_loc1_][_loc2_])
         {
            var _loc3_:* = new BitmapData(_loc1_,_loc2_,true);
            _mipMaps[_loc1_][_loc2_] = _loc3_;
            _mipMapHolder = _loc3_;
            _mipMapUses[_loc1_][_loc2_] = 1;
         }
         else
         {
            _mipMapUses[_loc1_][_loc2_] = _mipMapUses[_loc1_][_loc2_] + 1;
            _mipMapHolder = _mipMaps[_loc1_][_loc2_];
         }
      }
      
      private function freeMipMapHolder() : void
      {
         var _loc1_:uint = _mipMapHolder.width;
         var _loc2_:uint = _mipMapHolder.height;
         var _loc3_:* = _mipMapUses[_loc1_];
         var _loc4_:* = _loc2_;
         var _loc5_:* = _loc3_[_loc4_] - 1;
         _loc3_[_loc4_] = _loc5_;
         if(_loc5_ == 0)
         {
            _mipMaps[_loc1_][_loc2_].dispose();
            _mipMaps[_loc1_][_loc2_] = null;
         }
      }
      
      override public function dispose() : void
      {
         isDisposed = true;
         super.dispose();
         if(_mipMapHolder)
         {
            freeMipMapHolder();
         }
      }
   }
}
