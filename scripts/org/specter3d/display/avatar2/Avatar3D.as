package org.specter3d.display.avatar2
{
   import org.specter3d.display.Specter3D;
   import flash.events.Event;
   import away3d.materials.TextureMaterial;
   import away3d.entities.Mesh;
   import away3d.core.base.ISubGeometry;
   import org.specter3d.loaders.AssetLib;
   import org.specter3d.loaders.ResourceVo;
   import org.specter3d.context.AppGlobalContext;
   import away3d.textures.ATFTexture;
   import org.specter3d.utils.FunctionDelegate;
   import org.specter3d.loaders.S3DObject;
   import com.mz.core.logging.Log;
   import org.specter3d.events.Avatar3DEvent;
   import away3d.textures.Texture2DBase;
   import away3d.materials.utils.DefaultMaterialManager;
   
   public class Avatar3D extends Specter3D
   {
      
      public static var totalModel:int;
       
      
      private var _headerY:int = 75;
      
      private var _useAtf:Boolean = true;
      
      protected var _avatarMaterial:TextureMaterial;
      
      protected var _avatarMesh:Mesh;
      
      private var _avtType:String;
      
      private var _alphaBlend:Boolean = true;
      
      private var _alphaBlendInvalid:Boolean;
      
      private var _alphaThreshold:Number = 0.5;
      
      private var _alphaThresholdInvalid:Boolean;
      
      private var _blendMode:String = "normal";
      
      private var _blendModeInvalid:Boolean;
      
      private var _bothSides:Boolean;
      
      private var _bothSidesInvalid:Boolean;
      
      private var _castsShadows:Boolean;
      
      private var _castsShadowsInvalid:Boolean;
      
      private var _mipmap:Boolean;
      
      private var _mipmapInvalid:Boolean;
      
      private var _isAsyncTimerRun:Boolean;
      
      private var _modelUrl:String;
      
      private var _subGeometrie:ISubGeometry;
      
      private var _textureUrl:String;
      
      private var _group:String;
      
      private var _size:Number;
      
      private var _atfTexture:ATFTexture;
      
      private var changedTexture:String;
      
      private var _renderLayer:int;
      
      public function Avatar3D(param1:String)
      {
         totalModel = Number(totalModel) + 1;
         super();
         _avtType = param1;
      }
      
      public function get headerY() : int
      {
         return _headerY;
      }
      
      public function set headerY(param1:int) : void
      {
         if(_headerY != param1)
         {
            _headerY = param1;
            this.dispatchEvent(new Event("HEDER_Y_CHANGE"));
         }
      }
      
      public function get alphaBlend() : Boolean
      {
         return _alphaBlend;
      }
      
      public function set alphaBlend(param1:Boolean) : void
      {
         if(_alphaBlend != param1)
         {
            _alphaBlend = param1;
            _alphaBlendInvalid = true;
         }
      }
      
      public function get alphaThreshold() : Number
      {
         return _alphaThreshold;
      }
      
      public function set alphaThreshold(param1:Number) : void
      {
         _alphaThreshold = param1;
         _alphaThresholdInvalid = true;
      }
      
      public function get avatarMesh() : Mesh
      {
         return _avatarMesh;
      }
      
      public function set avtType(param1:String) : void
      {
         _avtType = param1;
      }
      
      public function get avtType() : String
      {
         return _avtType;
      }
      
      public function get blendMode() : String
      {
         return _blendMode;
      }
      
      public function set blendMode(param1:String) : void
      {
         _blendMode = param1;
         _blendModeInvalid = true;
      }
      
      public function get bothSides() : Boolean
      {
         return _bothSides;
      }
      
      public function set bothSides(param1:Boolean) : void
      {
         if(_bothSides != param1)
         {
            _bothSides = param1;
            _bothSidesInvalid = true;
         }
      }
      
      public function get castsShadows() : Boolean
      {
         return _castsShadows;
      }
      
      public function set castsShadows(param1:Boolean) : void
      {
         if(_castsShadows != param1)
         {
            _castsShadows = param1;
            _castsShadowsInvalid = true;
         }
      }
      
      public function set mipmap(param1:Boolean) : void
      {
         if(_mipmap != param1)
         {
            _mipmap = param1;
            _mipmapInvalid = true;
         }
      }
      
      override public function dispose() : void
      {
         if(this.isDispose)
         {
            return;
         }
         if(!this.isDispose)
         {
            totalModel = Number(totalModel) - 1;
         }
         if(_avatarMaterial)
         {
            _avatarMaterial.dispose();
            _avatarMaterial = null;
         }
         if(_avatarMesh)
         {
            _avatarMesh.dispose();
            _avatarMesh = null;
            AssetLib.costS3dRefCount(this.modelUrl);
         }
         if(_atfTexture)
         {
            _atfTexture.disposeAtf();
            _atfTexture = null;
         }
         super.dispose();
      }
      
      public function initAvatar(param1:String, param2:String, param3:String = "default_group", param4:int = 10, param5:Number = 1, param6:Boolean = true) : void
      {
         var _loc7_:* = null;
         if(isDispose || param1 == "")
         {
            return;
         }
         if(changedTexture != null)
         {
            param2 = changedTexture;
         }
         if(_modelUrl != param1 && _textureUrl != param2)
         {
            _modelUrl = param1;
            _group = param3;
            _size = param5;
            this.bothSides = param6;
            if(!AssetLib.hasAsset(param1))
            {
               _loc7_ = new ResourceVo(param1);
               _loc7_.level = param4;
               AppGlobalContext.asynLoader.loadOne(_loc7_,onLoadMeshDone,_group);
            }
            else
            {
               onLoadMeshDone();
            }
            if(param2)
            {
               changeAvatarTexture(param2);
            }
         }
      }
      
      public function changeAvatarTexture(param1:String) : void
      {
         textureUrl = param1;
         if(isDispose)
         {
            return;
         }
         if(_modelUrl == null)
         {
            changedTexture = textureUrl;
            return;
         }
         if(_textureUrl != textureUrl)
         {
            _textureUrl = textureUrl;
            if(AssetLib.hasAsset(textureUrl))
            {
               if(this._useAtf)
               {
                  _atfTexture = AssetLib.getATFTexture(textureUrl);
               }
               onLoadTextureDone();
            }
            else if(false || !this._useAtf)
            {
               AppGlobalContext.asynLoader.loadOne(new ResourceVo(textureUrl),onLoadTextureDone,_group);
            }
            else if(_useAtf)
            {
               var atfUrl:String = textureUrl.replace(".png",".dxt").replace(".jpg",".dxt");
               if(AssetLib.hasAsset(atfUrl))
               {
                  var atfTexture:ATFTexture = AssetLib.getATFTexture(atfUrl);
                  if(atfTexture.atfData.parsingError == false)
                  {
                     _atfTexture = atfTexture;
                     onLoadTextureDone();
                  }
                  else
                  {
                     AppGlobalContext.asynLoader.loadOne(new ResourceVo(textureUrl),onLoadTextureDone,_group);
                  }
               }
               else
               {
                  onMeshAtfLoaded = function(param1:String, param2:String):void
                  {
                     atfTexture = AssetLib.getATFTexture(atfUrl);
                     if(atfTexture)
                     {
                        if(atfTexture.atfData.parsingError == false)
                        {
                           _atfTexture = atfTexture;
                           onLoadTextureDone();
                        }
                        else
                        {
                           AppGlobalContext.asynLoader.loadOne(new ResourceVo(textureUrl),onLoadTextureDone,_group);
                        }
                     }
                     else
                     {
                        AppGlobalContext.asynLoader.loadOne(new ResourceVo(textureUrl),onLoadTextureDone,_group);
                     }
                  };
                  AppGlobalContext.asynLoader.loadOne(new ResourceVo(atfUrl,1),FunctionDelegate.create(onMeshAtfLoaded,textureUrl,atfUrl),_group);
               }
            }
            else
            {
               AppGlobalContext.asynLoader.loadOne(new ResourceVo(textureUrl),onLoadTextureDone,_group);
            }
         }
      }
      
      protected function onLoadMeshDone() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(isDispose)
         {
            return;
         }
         if(_avatarMesh == null)
         {
            _loc1_ = AssetLib.getS3DaddRefCount(modelUrl);
            if(_loc1_ == null)
            {
               _loc2_ = "模型解析错误,请检查模型. Path：" + modelUrl;
               Log.fatal(this,_loc2_);
               return;
            }
            _avatarMesh = _loc1_["mesh"].clone() as Mesh;
            if(_avatarMesh == null)
            {
               _loc2_ = "failed to get mesh. Path：" + modelUrl;
               Log.fatal(this,_loc2_);
               return;
            }
            _avatarMesh.name = modelUrl;
            _avatarMesh.renderLayer = this.renderLayer;
         }
         assembleMesh();
         if(_avatarMesh != null && hasEventListener("avatar_init_complete"))
         {
            dispatchEvent(new Avatar3DEvent("avatar_init_complete"));
         }
      }
      
      public function get renderLayer() : int
      {
         return _renderLayer;
      }
      
      public function set renderLayer(param1:int) : void
      {
         if(_renderLayer != param1)
         {
            _renderLayer = param1;
            if(this._avatarMesh)
            {
               this._avatarMesh.renderLayer = param1;
            }
         }
      }
      
      protected function onLoadTextureDone() : void
      {
         if(isDispose)
         {
            return;
         }
         var _loc2_:Texture2DBase = null;
         if(!textureUrl)
         {
            return;
         }
         if(_atfTexture)
         {
            _loc2_ = _atfTexture;
         }
         else
         {
            _loc2_ = AssetLib.getBitmapTexture(textureUrl);
         }
         if(!_loc2_)
         {
            throw new Error("failed to get BitmapTexture. Path：" + textureUrl);
         }
         var _loc1_:String = "normal";
         if(_avatarMaterial)
         {
            _loc1_ = _avatarMaterial.blendMode;
            _avatarMaterial.dispose();
            _avatarMaterial = null;
         }
         if(_loc2_.format == "compressed")
         {
         }
         _avatarMaterial = new TextureMaterial(_loc2_,true,false,_mipmap);
         _avatarMaterial.renderPriority = 1;
         _avatarMaterial.alpha = this.alpha;
         if(_avatarMesh != null)
         {
            if(_avatarMesh.material.lightPicker)
            {
               _avatarMaterial.lightPicker = _avatarMesh.material.lightPicker;
            }
            _avatarMesh.material = _avatarMaterial;
         }
         _mipmapInvalid = true;
         _castsShadowsInvalid = true;
         _bothSidesInvalid = true;
         _blendModeInvalid = true;
         _alphaThresholdInvalid = true;
         _alphaBlendInvalid = true;
         this.dispatchEvent(new Event("MAT_LOAD_CPL"));
      }
      
      public function get modelUrl() : String
      {
         return _modelUrl;
      }
      
      public function get textureUrl() : String
      {
         return _textureUrl;
      }
      
      protected function assembleMesh() : void
      {
         if(_avatarMesh != null)
         {
            if(_avatarMaterial == null)
            {
               _avatarMaterial = new TextureMaterial(DefaultMaterialManager.getSingleColorTexture(),true,false,true);
            }
            _avatarMesh.scale(_size);
            _avatarMesh.material = _avatarMaterial;
            addChild(_avatarMesh);
         }
      }
      
      override protected function onRender(param1:Number) : void
      {
         super.onRender(param1);
         if(_bothSidesInvalid && _avatarMaterial)
         {
            _avatarMaterial.bothSides = _bothSides;
            _bothSidesInvalid = false;
         }
         if(_blendModeInvalid && _avatarMaterial)
         {
            _avatarMaterial.blendMode = _blendMode;
            _blendModeInvalid = false;
         }
         if(_alphaBlendInvalid && _avatarMaterial)
         {
            _avatarMaterial.alphaBlending = _alphaBlend;
            _alphaBlendInvalid = false;
         }
         if(_castsShadowsInvalid && _avatarMesh)
         {
            _avatarMesh.castsShadows = _castsShadows;
            _castsShadowsInvalid = false;
         }
         if(_alphaThresholdInvalid && _avatarMaterial)
         {
            _avatarMaterial.alphaThreshold = _alphaThreshold;
            _alphaThresholdInvalid = false;
         }
         if(_mipmapInvalid && _avatarMaterial)
         {
            _avatarMaterial.mipmap = _mipmap;
            _mipmapInvalid = false;
         }
      }
   }
}
