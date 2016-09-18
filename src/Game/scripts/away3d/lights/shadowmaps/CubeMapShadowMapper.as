package away3d.lights.shadowmaps
{
   import away3d.cameras.Camera3D;
   import away3d.cameras.lenses.PerspectiveLens;
   import away3d.textures.TextureProxyBase;
   import away3d.textures.RenderCubeTexture;
   import away3d.lights.PointLight;
   import flash.geom.Vector3D;
   import flash.display3D.textures.TextureBase;
   import away3d.containers.Scene3D;
   import away3d.core.render.DepthRenderer;
   
   public class CubeMapShadowMapper extends ShadowMapperBase
   {
       
      
      private var _depthCameras:Vector.<Camera3D>;
      
      private var _lenses:Vector.<PerspectiveLens>;
      
      private var _needsRender:Vector.<Boolean>;
      
      public function CubeMapShadowMapper()
      {
         super();
         _depthMapSize = 512;
         _needsRender = new Vector.<Boolean>(6,true);
         initCameras();
      }
      
      private function initCameras() : void
      {
         _depthCameras = new Vector.<Camera3D>();
         _lenses = new Vector.<PerspectiveLens>();
         addCamera(0,90,0);
         addCamera(0,-90,0);
         addCamera(-90,0,0);
         addCamera(90,0,0);
         addCamera(0,0,0);
         addCamera(0,180,0);
      }
      
      private function addCamera(param1:Number, param2:Number, param3:Number) : void
      {
         var _loc4_:Camera3D = new Camera3D();
         _loc4_.rotationX = param1;
         _loc4_.rotationY = param2;
         _loc4_.rotationZ = param3;
         _loc4_.lens.near = 0.01;
         PerspectiveLens(_loc4_.lens).fieldOfView = 90;
         _lenses.push(PerspectiveLens(_loc4_.lens));
         _loc4_.lens.aspectRatio = 1;
         _depthCameras.push(_loc4_);
      }
      
      override protected function createDepthTexture() : TextureProxyBase
      {
         return new RenderCubeTexture(_depthMapSize);
      }
      
      override protected function updateDepthProjection(param1:Camera3D) : void
      {
         var _loc3_:* = 0;
         var _loc2_:Number = PointLight(_light)._fallOff;
         var _loc4_:Vector3D = _light.scenePosition;
         _loc3_ = uint(0);
         while(_loc3_ < 6)
         {
            _lenses[_loc3_].far = _loc2_;
            _depthCameras[_loc3_].position = _loc4_;
            _needsRender[_loc3_] = true;
            _loc3_++;
         }
      }
      
      override protected function drawDepthMap(param1:TextureBase, param2:Scene3D, param3:DepthRenderer, param4:Camera3D = null) : void
      {
         var _loc5_:* = 0;
         _loc5_ = uint(0);
         while(_loc5_ < 6)
         {
            if(_needsRender[_loc5_])
            {
               _casterCollector.clear();
               _casterCollector.camera = _depthCameras[_loc5_];
               param2.traversePartitions(_casterCollector);
               param3.render(_casterCollector,param1,null,_loc5_);
               _casterCollector.cleanUp();
            }
            _loc5_++;
         }
      }
   }
}
