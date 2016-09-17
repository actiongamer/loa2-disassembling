package away3d.lights.shadowmaps
{
   import away3d.core.traverse.ShadowCasterCollector;
   import away3d.textures.TextureProxyBase;
   import away3d.lights.LightBase;
   import §away3d:arcane§._shadowsInvalid;
   import away3d.textures.RenderTexture;
   import away3d.core.managers.Stage3DProxy;
   import away3d.core.traverse.EntityCollector;
   import away3d.core.render.DepthRenderer;
   import away3d.cameras.Camera3D;
   import away3d.errors.AbstractMethodError;
   import flash.display3D.textures.TextureBase;
   import away3d.containers.Scene3D;
   
   public class ShadowMapperBase
   {
       
      
      protected var _casterCollector:ShadowCasterCollector;
      
      private var _depthMap:TextureProxyBase;
      
      protected var _depthMapSize:uint = 2048;
      
      protected var _light:LightBase;
      
      private var _explicitDepthMap:Boolean;
      
      private var _autoUpdateShadows:Boolean = true;
      
      var _shadowsInvalid:Boolean;
      
      public function ShadowMapperBase()
      {
         super();
         _casterCollector = createCasterCollector();
      }
      
      protected function createCasterCollector() : ShadowCasterCollector
      {
         return new ShadowCasterCollector();
      }
      
      public function get autoUpdateShadows() : Boolean
      {
         return _autoUpdateShadows;
      }
      
      public function set autoUpdateShadows(param1:Boolean) : void
      {
         _autoUpdateShadows = param1;
      }
      
      public function updateShadows() : void
      {
         _shadowsInvalid = true;
      }
      
      function setDepthMap(param1:TextureProxyBase) : void
      {
         if(_depthMap == param1)
         {
            return;
         }
         if(_depthMap && !_explicitDepthMap)
         {
            _depthMap.dispose();
         }
         _depthMap = param1;
         if(_depthMap)
         {
            _explicitDepthMap = true;
            _depthMapSize = _depthMap.width;
         }
         else
         {
            _explicitDepthMap = false;
         }
      }
      
      public function get light() : LightBase
      {
         return _light;
      }
      
      public function set light(param1:LightBase) : void
      {
         _light = param1;
      }
      
      public function get depthMap() : TextureProxyBase
      {
         return _depthMap || createDepthTexture();
      }
      
      public function get depthMapSize() : uint
      {
         return _depthMapSize;
      }
      
      public function set depthMapSize(param1:uint) : void
      {
         if(param1 == _depthMapSize)
         {
            return;
         }
         _depthMapSize = param1;
         if(_explicitDepthMap)
         {
            throw Error("Cannot set depth map size for the current renderer.");
         }
         if(_depthMap)
         {
            _depthMap.dispose();
            _depthMap = null;
         }
      }
      
      public function dispose() : void
      {
         _casterCollector = null;
         if(_depthMap && !_explicitDepthMap)
         {
            _depthMap.dispose();
         }
         _depthMap = null;
      }
      
      protected function createDepthTexture() : TextureProxyBase
      {
         return new RenderTexture(_depthMapSize,_depthMapSize);
      }
      
      function renderDepthMap(param1:Stage3DProxy, param2:EntityCollector, param3:DepthRenderer) : void
      {
         _shadowsInvalid = false;
         updateDepthProjection(param2.camera);
         if(!_depthMap)
         {
            _depthMap = createDepthTexture();
         }
         drawDepthMap(_depthMap.getTextureForStage3D(param1),param2.scene,param3,param2.camera);
      }
      
      protected function updateDepthProjection(param1:Camera3D) : void
      {
         throw new AbstractMethodError();
      }
      
      protected function drawDepthMap(param1:TextureBase, param2:Scene3D, param3:DepthRenderer, param4:Camera3D = null) : void
      {
         throw new AbstractMethodError();
      }
   }
}
