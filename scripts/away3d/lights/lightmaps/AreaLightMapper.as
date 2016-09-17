package away3d.lights.lightmaps
{
   import away3d.core.traverse.LightCasterCollector;
   import away3d.lights.LightBase;
   import away3d.cameras.Camera3D;
   import away3d.textures.TextureProxyBase;
   import flash.geom.Matrix3D;
   import away3d.core.managers.Stage3DProxy;
   import away3d.core.traverse.EntityCollector;
   import away3d.core.render.LightMapRenderer;
   import away3d.textures.RenderTexture;
   import flash.display3D.textures.TextureBase;
   import away3d.containers.Scene3D;
   import away3d.cameras.lenses.OrthographicOffCenterLens;
   import away3d.utils.Away3DConfig;
   
   public class AreaLightMapper
   {
       
      
      protected var _casterCollector:LightCasterCollector;
      
      protected var _light:LightBase;
      
      protected var _lightCamera:Camera3D;
      
      private var _lightMap:TextureProxyBase;
      
      private var _lightMapSize:uint;
      
      private var _localFrustum:Vector.<Number>;
      
      private var _mtx:Matrix3D;
      
      public function AreaLightMapper(param1:LightBase)
      {
         _lightMapSize = Away3DConfig.LightMapSize;
         _localFrustum = new Vector.<Number>(24);
         _mtx = new Matrix3D();
         super();
         _light = param1;
         _casterCollector = new LightCasterCollector();
         _lightCamera = new Camera3D();
         _lightCamera.name = "texLightCamera";
         _lightCamera.lens = new OrthographicOffCenterLens(-10,-10,10,10);
      }
      
      public function dispose() : void
      {
         _casterCollector = null;
         if(_lightMap)
         {
            _lightMap.dispose();
         }
         _lightMap = null;
      }
      
      public function get lightMap() : TextureProxyBase
      {
         return _lightMap || createLightTexture();
      }
      
      public function get lightMapSize() : uint
      {
         return _lightMapSize;
      }
      
      public function set lightMapSize(param1:uint) : void
      {
         if(param1 == _lightMapSize)
         {
            return;
         }
         _lightMapSize = param1;
         _lightMap.dispose();
         _lightMap = null;
      }
      
      function get lightProjection() : Matrix3D
      {
         return _lightCamera.viewProjection;
      }
      
      function renderLightMap(param1:Stage3DProxy, param2:EntityCollector, param3:LightMapRenderer) : void
      {
         if(!_lightMap)
         {
            _lightMap = createLightTexture();
         }
         updateLightProjection(param2.camera);
         drawLightMap(_lightMap.getTextureForStage3D(param1),param2.scene,param3);
      }
      
      private function createLightTexture() : TextureProxyBase
      {
         return new RenderTexture(_lightMapSize,_lightMapSize);
      }
      
      private function drawLightMap(param1:TextureBase, param2:Scene3D, param3:LightMapRenderer) : void
      {
         _casterCollector.clear();
         _casterCollector.camera = _lightCamera;
         param2.traversePartitions(_casterCollector);
         param3.render(_casterCollector,param1);
         _casterCollector.cleanUp();
      }
      
      private function updateLightProjection(param1:Camera3D) : void
      {
         var _loc9_:Number = NaN;
         var _loc11_:* = 0;
         var _loc15_:* = 0;
         var _loc7_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc16_:OrthographicOffCenterLens = OrthographicOffCenterLens(_lightCamera.lens);
         _loc16_.near = 100;
         _loc16_.far = 10000;
         var _loc13_:* = Infinity;
         var _loc14_:* = Infinity;
         var _loc2_:* = Infinity;
         var _loc10_:* = -Infinity;
         var _loc8_:* = -Infinity;
         var _loc6_:* = -Infinity;
         _mtx.copyFrom(_light.inverseSceneTransform);
         _mtx.prepend(param1.sceneTransform);
         _mtx.transformVectors(param1.lens.frustumCorners,_localFrustum);
         _loc15_ = uint(0);
         _loc11_ = uint(12);
         while(_loc15_ < 12)
         {
            _loc4_ = _localFrustum[_loc15_++];
            _loc5_ = _localFrustum[_loc15_++];
            _loc17_ = _localFrustum[_loc15_++];
            _loc19_ = _localFrustum[_loc11_++];
            _loc18_ = _localFrustum[_loc11_++];
            _loc3_ = _localFrustum[_loc11_++];
            if(_loc4_ < _loc13_)
            {
               _loc13_ = _loc4_;
            }
            if(_loc4_ > _loc10_)
            {
               _loc10_ = _loc4_;
            }
            if(_loc5_ < _loc14_)
            {
               _loc14_ = _loc5_;
            }
            if(_loc5_ > _loc8_)
            {
               _loc8_ = _loc5_;
            }
            if(_loc17_ < _loc2_)
            {
               _loc2_ = _loc17_;
            }
            if(_loc17_ > _loc6_)
            {
               _loc6_ = _loc17_;
            }
            if(_loc19_ < _loc13_)
            {
               _loc13_ = _loc19_;
            }
            if(_loc19_ > _loc10_)
            {
               _loc10_ = _loc19_;
            }
            if(_loc18_ < _loc14_)
            {
               _loc14_ = _loc18_;
            }
            if(_loc18_ > _loc8_)
            {
               _loc8_ = _loc18_;
            }
            if(_loc3_ < _loc2_)
            {
               _loc2_ = _loc3_;
            }
            if(_loc3_ > _loc6_)
            {
               _loc6_ = _loc3_;
            }
         }
         _loc9_ = Math.abs(_loc13_);
         _loc9_ = Math.max(_loc9_,Math.abs(_loc10_));
         _loc9_ = Math.max(_loc9_,Math.abs(_loc2_));
         _loc9_ = Math.max(_loc9_,Math.abs(_loc6_));
         if(_loc9_ > 8000)
         {
            _loc9_ = 8000;
         }
         _loc16_.minX = -_loc9_;
         _loc16_.maxX = _loc9_;
         _loc16_.minY = -_loc9_;
         _loc16_.maxY = _loc9_;
         _lightCamera.transform = _light.sceneTransform;
      }
   }
}
