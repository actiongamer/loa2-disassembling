package away3d.materials.utils
{
   import flash.display.BitmapData;
   import away3d.materials.TextureMaterial;
   import away3d.textures.BitmapTexture;
   import away3d.core.base.IMaterialOwner;
   
   public class DefaultMaterialManager
   {
      
      private static var _defaultTextureBitmapData:BitmapData;
      
      private static var _defaultMaterial:TextureMaterial;
      
      private static var _defaultTexture:BitmapTexture;
      
      private static var _singleColorTextureBitmapData:BitmapData;
      
      private static var _singleColorMaterial:TextureMaterial;
      
      private static var _singleColorTexture:BitmapTexture;
       
      
      public function DefaultMaterialManager()
      {
         super();
      }
      
      public static function getDefaultMaterial(param1:IMaterialOwner = null) : TextureMaterial
      {
         if(!_defaultTexture)
         {
            createDefaultTexture();
         }
         if(!_defaultMaterial)
         {
            createDefaultMaterial();
         }
         return _defaultMaterial;
      }
      
      public static function getDefaultTexture(param1:IMaterialOwner = null) : BitmapTexture
      {
         if(!_defaultTexture)
         {
            createDefaultTexture();
         }
         return _defaultTexture;
      }
      
      private static function createDefaultTexture() : void
      {
         var _loc1_:* = 0;
         var _loc2_:* = 0;
         _defaultTextureBitmapData = new BitmapData(8,8,false,0);
         _loc2_ = uint(0);
         while(_loc2_ < 8)
         {
            _loc1_ = uint(0);
            while(_loc1_ < 8)
            {
               if(_loc1_ & 1 ^ _loc2_ & 1)
               {
                  _defaultTextureBitmapData.setPixel(_loc2_,_loc1_,16777215);
               }
               _loc1_++;
            }
            _loc2_++;
         }
         _defaultTexture = new BitmapTexture(_defaultTextureBitmapData);
      }
      
      private static function createDefaultMaterial() : void
      {
         _defaultMaterial = new TextureMaterial(_defaultTexture);
         _defaultMaterial.mipmap = false;
         _defaultMaterial.smooth = false;
      }
      
      public static function getSingleColorMaterial(param1:IMaterialOwner = null) : TextureMaterial
      {
         if(!_singleColorTexture)
         {
            createSingleColorTexture();
         }
         if(!_singleColorMaterial)
         {
            createSingleColorMaterial();
         }
         return _singleColorMaterial;
      }
      
      public static function getSingleColorTexture(param1:IMaterialOwner = null) : BitmapTexture
      {
         if(!_singleColorTexture)
         {
            createSingleColorTexture();
         }
         return _singleColorTexture;
      }
      
      private static function createSingleColorTexture() : void
      {
         var _loc1_:* = 0;
         var _loc2_:* = 0;
         _singleColorTextureBitmapData = new BitmapData(8,8,false,52428);
         _loc2_ = uint(0);
         while(_loc2_ < 8)
         {
            _loc1_ = uint(0);
            while(_loc1_ < 8)
            {
               if(_loc1_ & 1 ^ _loc2_ & 1)
               {
                  _singleColorTextureBitmapData.setPixel(_loc2_,_loc1_,16777215);
               }
               _loc1_++;
            }
            _loc2_++;
         }
         _singleColorTexture = new BitmapTexture(_singleColorTextureBitmapData,true);
      }
      
      private static function createSingleColorMaterial() : void
      {
         _singleColorMaterial = new TextureMaterial(_singleColorTexture);
         _singleColorMaterial.mipmap = true;
         _singleColorMaterial.smooth = false;
      }
   }
}
