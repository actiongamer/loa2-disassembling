package nslm2.common.ui.components.comp3ds
{
   import away3d.entities.Mesh;
   import away3d.primitives.PlaneGeometry;
   import away3d.materials.TextureMaterial;
   import org.specter3d.context.AppGlobalContext;
   import org.specter3d.loaders.ResourceVo;
   import org.specter3d.loaders.AssetLib;
   import away3d.textures.Texture2DBase;
   import flash.display.BitmapData;
   import nslm2.utils.TransformUtil;
   import org.specter3d.loaders.parsers.data.ShareBitmapData;
   import away3d.materials.methods.EffectMethodBase;
   import flash.events.Event;
   import away3d.containers.ObjectContainer3D;
   
   public class TileImgTile extends Mesh
   {
      
      public static const TEX_LOAD_CPL:String = "TEX_LOAD_CPL";
      
      private static var _plane:PlaneGeometry = new PlaneGeometry();
      
      private static var _level:int = 100;
       
      
      public var url:String;
      
      private var _sceneWidth:int;
      
      private var _sceneHeight:int;
      
      private var _sceneTileWidth:int;
      
      private var _sceneTileHeight:int;
      
      public var _row:int;
      
      public var _column:int;
      
      private var _smallTexMat:TextureMaterial;
      
      private var _useAlpha:Boolean;
      
      public var blendMode:String;
      
      private var _textureMat:TextureMaterial;
      
      public var isDispose:Boolean;
      
      public function TileImgTile(param1:String, param2:ObjectContainer3D, param3:TextureMaterial, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:Boolean = false, param11:int = 0, param12:String = null)
      {
         super(null,null);
         this.mousePriority = 1;
         this.blendMode = param12;
         this.url = param1;
         _useAlpha = param10;
         _sceneWidth = param6;
         _sceneHeight = param7;
         _sceneTileWidth = param8;
         _sceneTileHeight = param9;
         _row = param4;
         _column = param5;
         _smallTexMat = param3;
         param2.addChild(this);
         this.renderLayer = param11;
         var _loc13_:int = Math.ceil(_sceneWidth / _sceneTileWidth);
         var _loc14_:int = Math.ceil(_sceneHeight / _sceneTileHeight);
         this.geometry = new PlaneGeometry(_sceneTileWidth,_sceneTileHeight,1,1,false);
         this.mouseEnabled = true;
         this.mouseChildren = true;
         if(AssetLib.hasAsset(url))
         {
            loadComplete();
         }
         else
         {
            this.subMeshes[0].offsetU = _column * _sceneTileWidth / _sceneWidth;
            this.subMeshes[0].offsetV = _row * _sceneTileHeight / _sceneHeight;
            this.subMeshes[0].scaleU = _sceneTileWidth / _sceneWidth;
            this.subMeshes[0].scaleV = _sceneTileWidth / _sceneHeight;
            if(_smallTexMat)
            {
               param3.alphaPremultiplied = true;
               param3.alphaBlending = true;
            }
            this.material = _smallTexMat;
         }
      }
      
      public function show() : void
      {
         if(isload == false)
         {
            AppGlobalContext.asynLoader.loadOne(new ResourceVo(url),loadComplete,"default_group");
            return;
         }
      }
      
      public function get isload() : Boolean
      {
         return _textureMat;
      }
      
      override public function dispose() : void
      {
         var _loc1_:int = 0;
         isDispose = true;
         if(_textureMat)
         {
            _loc1_ = 0;
            while(_loc1_ < _textureMat.numMethods)
            {
               _textureMat.removeMethod(_textureMat.getMethodAt(_loc1_));
               _loc1_++;
            }
            _textureMat && _textureMat.dispose();
            _textureMat = null;
         }
         super.dispose();
      }
      
      public function set height(param1:Number) : void
      {
         if(_plane.height != param1)
         {
            _plane.height = param1;
         }
      }
      
      public function set width(param1:Number) : void
      {
         if(_plane.width != param1)
         {
            _plane.width = param1;
         }
      }
      
      private function loadComplete() : void
      {
         var _loc4_:* = null;
         var _loc1_:* = null;
         var _loc7_:* = null;
         var _loc2_:* = null;
         var _loc6_:int = 0;
         var _loc5_:* = null;
         if(this.isDispose)
         {
            return;
         }
         var _loc3_:* = url.indexOf(".dxt") > -1;
         if(_loc3_)
         {
            _loc4_ = AssetLib.getATFTexture(url);
         }
         else
         {
            if(AssetLib.getData(url) is BitmapData)
            {
               _loc1_ = AssetLib.getBitmapData(url);
               if(_loc1_.width != 256 || _loc1_.height != 256)
               {
                  _loc7_ = TransformUtil.fillBitmap(_loc1_,256,256);
                  if(_loc1_ is ShareBitmapData)
                  {
                     (_loc1_ as ShareBitmapData).dispose_real();
                  }
                  AssetLib.putAsset(AssetLib.operationUrlByVersion(url),_loc7_,"default_group");
               }
            }
            _loc4_ = AssetLib.getBitmapTexture(url);
         }
         _textureMat = new TextureMaterial(_loc4_,false,false,false);
         if(_textureMat)
         {
            _loc2_ = this.material as TextureMaterial;
            if(_loc2_)
            {
               _loc6_ = 0;
               while(_loc6_ < _loc2_.numMethods)
               {
                  _loc5_ = _loc2_.getMethodAt(_loc6_);
                  if(_loc2_ != _smallTexMat)
                  {
                     _loc2_ && _loc2_.removeMethod(_loc5_);
                  }
                  _textureMat.addMethod(_loc5_);
                  _loc6_++;
               }
            }
            if(_useAlpha)
            {
               _textureMat.alphaPremultiplied = true;
               _textureMat.alphaBlending = true;
            }
            else
            {
               _textureMat.alphaPremultiplied = false;
               _textureMat.alphaBlending = false;
            }
            this.material = _textureMat;
            if(blendMode)
            {
               this.material.blendMode = blendMode;
            }
            this.subMeshes[0].offsetU = 0;
            this.subMeshes[0].offsetV = 0;
            this.subMeshes[0].scaleU = 1;
            this.subMeshes[0].scaleV = 1;
            hasEventListener("TEX_LOAD_CPL") && dispatchEvent(new Event("TEX_LOAD_CPL"));
         }
      }
      
      public function addMethod(param1:EffectMethodBase) : void
      {
         var _loc2_:TextureMaterial = this.material as TextureMaterial;
      }
      
      public function removeMethod(param1:EffectMethodBase) : void
      {
         var _loc2_:TextureMaterial = this.material as TextureMaterial;
      }
   }
}
