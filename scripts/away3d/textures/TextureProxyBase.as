package away3d.textures
{
   import away3d.library.assets.NamedAssetBase;
   import away3d.library.assets.IAsset;
   import flash.display3D.textures.TextureBase;
   import flash.display3D.Context3D;
   import away3d.core.managers.Stage3DProxy;
   import away3d.events.TextureEvent;
   import away3d.errors.AbstractMethodError;
   
   public class TextureProxyBase extends NamedAssetBase implements IAsset
   {
       
      
      protected var _format:String = "bgra";
      
      protected var _hasMipmaps:Boolean = true;
      
      protected var _textures:Vector.<TextureBase>;
      
      protected var _dirty:Vector.<Context3D>;
      
      protected var _width:int;
      
      protected var _height:int;
      
      protected var _isUploadDone:Boolean = false;
      
      public function TextureProxyBase()
      {
         super();
         _textures = new Vector.<TextureBase>(8);
         _dirty = new Vector.<Context3D>(8);
      }
      
      public function get hasMipMaps() : Boolean
      {
         return _hasMipmaps;
      }
      
      public function get format() : String
      {
         return _format;
      }
      
      public function get assetType() : String
      {
         return "texture";
      }
      
      public function get width() : int
      {
         return _width;
      }
      
      public function get height() : int
      {
         return _height;
      }
      
      public function getTextureForStage3D(param1:Stage3DProxy) : TextureBase
      {
         var _loc4_:int = param1._stage3DIndex;
         var _loc3_:TextureBase = _textures[_loc4_];
         var _loc2_:Context3D = param1._context3D;
         if(!_loc3_ || _dirty[_loc4_] != _loc2_)
         {
            _loc3_ = createTexture(_loc2_);
            _textures[_loc4_] = createTexture(_loc2_);
            _dirty[_loc4_] = _loc2_;
            uploadContent(_loc3_);
            if(!(this is ATFTexture) && hasEventListener("upload_texture_complete"))
            {
               _isUploadDone = true;
               dispatchEvent(new TextureEvent("upload_texture_complete"));
            }
         }
         return _loc3_;
      }
      
      public final function get isUploadDone() : Boolean
      {
         return _isUploadDone;
      }
      
      public function uploadTexture(param1:Stage3DProxy) : void
      {
         getTextureForStage3D(param1);
      }
      
      protected function uploadContent(param1:TextureBase) : void
      {
         throw new AbstractMethodError();
      }
      
      protected function setSize(param1:int, param2:int) : void
      {
         if(_width != param1 || _height != param2)
         {
            invalidateSize();
         }
         _width = param1;
         _height = param2;
      }
      
      public function invalidateContent() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < 8)
         {
            _dirty[_loc1_] = null;
            _loc1_++;
         }
      }
      
      protected function invalidateSize() : void
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < 8)
         {
            _loc1_ = _textures[_loc2_];
            if(_loc1_)
            {
               _loc1_.dispose();
               _textures[_loc2_] = null;
               _dirty[_loc2_] = null;
            }
            _loc2_++;
         }
      }
      
      protected function createTexture(param1:Context3D) : TextureBase
      {
         throw new AbstractMethodError();
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < 8)
         {
            if(_textures[_loc1_])
            {
               _textures[_loc1_].dispose();
            }
            _loc1_++;
         }
      }
   }
}
