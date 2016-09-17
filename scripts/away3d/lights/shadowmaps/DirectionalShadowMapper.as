package away3d.lights.shadowmaps
{
   import away3d.cameras.Camera3D;
   import flash.geom.Matrix3D;
   import away3d.cameras.lenses.FreeMatrixLens;
   import flash.display3D.textures.TextureBase;
   import away3d.containers.Scene3D;
   import away3d.core.render.DepthRenderer;
   import away3d.core.math.Matrix3DUtils;
   import away3d.lights.DirectionalLight;
   import flash.geom.Vector3D;
   
   public class DirectionalShadowMapper extends ShadowMapperBase
   {
       
      
      protected var _depthCamera:Camera3D;
      
      protected var _localFrustum:Vector.<Number>;
      
      protected var _lightOffset:Number = 10000;
      
      protected var _matrix:Matrix3D;
      
      protected var _depthLens:FreeMatrixLens;
      
      public function DirectionalShadowMapper()
      {
         super();
         _depthCamera = new Camera3D();
         _depthLens = new FreeMatrixLens();
         _depthCamera.lens = new FreeMatrixLens();
         _localFrustum = new Vector.<Number>(24);
         _matrix = new Matrix3D();
      }
      
      public function get lightOffset() : Number
      {
         return _lightOffset;
      }
      
      public function set lightOffset(param1:Number) : void
      {
         _lightOffset = param1;
      }
      
      function get depthProjection() : Matrix3D
      {
         return _depthCamera.viewProjection;
      }
      
      override protected function drawDepthMap(param1:TextureBase, param2:Scene3D, param3:DepthRenderer, param4:Camera3D = null) : void
      {
         _casterCollector.clear();
         _casterCollector.camera = _depthCamera;
         param2.traversePartitions(_casterCollector);
         param3.render(_casterCollector,param1);
         _casterCollector.cleanUp();
      }
      
      override protected function updateDepthProjection(param1:Camera3D) : void
      {
         updateProjectionFromFrustumCorners(param1,param1.lens.frustumCorners,_matrix);
         _depthLens.matrix = _matrix;
      }
      
      protected function updateProjectionFromFrustumCorners(param1:Camera3D, param2:Vector.<Number>, param3:Matrix3D) : void
      {
         var _loc17_:* = null;
         var _loc22_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc15_:* = 0;
         var _loc5_:Vector.<Number> = Matrix3DUtils.RAW_DATA_CONTAINER;
         var _loc13_:* = Infinity;
         var _loc16_:* = Infinity;
         var _loc6_:* = Infinity;
         var _loc12_:* = -Infinity;
         var _loc11_:* = -Infinity;
         var _loc10_:* = -Infinity;
         var _loc7_:Number = _depthMapSize * 0.5;
         _loc17_ = DirectionalLight(_light).sceneDirection;
         _depthCamera.transform = _light.sceneTransform;
         _depthCamera.x = -_loc17_.x * _lightOffset;
         _depthCamera.y = -_loc17_.y * _lightOffset;
         _depthCamera.z = -_loc17_.z * _lightOffset;
         _matrix.copyFrom(_depthCamera.inverseSceneTransform);
         _matrix.prepend(param1.sceneTransform);
         _matrix.transformVectors(param2,_localFrustum);
         _loc15_ = uint(0);
         while(_loc15_ < 24)
         {
            _loc23_ = _localFrustum[_loc15_];
            _loc22_ = _localFrustum[uint(_loc15_ + 1)];
            _loc21_ = _localFrustum[uint(_loc15_ + 2)];
            if(_loc23_ < _loc13_)
            {
               _loc13_ = _loc23_;
            }
            if(_loc23_ > _loc12_)
            {
               _loc12_ = _loc23_;
            }
            if(_loc22_ < _loc16_)
            {
               _loc16_ = _loc22_;
            }
            if(_loc22_ > _loc11_)
            {
               _loc11_ = _loc22_;
            }
            if(_loc21_ > _loc10_)
            {
               _loc10_ = _loc21_;
            }
            _loc15_ = uint(_loc15_ + 3);
         }
         _loc6_ = 10;
         var _loc14_:Number = 128;
         var _loc19_:Number = 1 / _loc14_;
         _loc4_ = 2 * _loc19_ / Math.ceil((_loc12_ - _loc13_) * _loc19_);
         _loc8_ = 2 * _loc19_ / Math.ceil((_loc11_ - _loc16_) * _loc19_);
         _loc18_ = Math.ceil(-0.5 * (_loc12_ + _loc13_) * _loc4_ * _loc7_) / _loc7_;
         _loc20_ = Math.ceil(-0.5 * (_loc11_ + _loc16_) * _loc8_ * _loc7_) / _loc7_;
         var _loc9_:Number = 1 / (_loc10_ - _loc6_);
         _loc5_[0] = _loc4_;
         _loc5_[5] = _loc8_;
         _loc5_[10] = _loc9_;
         _loc5_[12] = _loc18_;
         _loc5_[13] = _loc20_;
         _loc5_[14] = -_loc6_ * _loc9_;
         _loc5_[15] = 1;
         var _loc24_:* = 0;
         _loc5_[11] = _loc24_;
         _loc24_ = _loc24_;
         _loc5_[9] = _loc24_;
         _loc24_ = _loc24_;
         _loc5_[8] = _loc24_;
         _loc24_ = _loc24_;
         _loc5_[7] = _loc24_;
         _loc24_ = _loc24_;
         _loc5_[6] = _loc24_;
         _loc24_ = _loc24_;
         _loc5_[4] = _loc24_;
         _loc24_ = _loc24_;
         _loc5_[3] = _loc24_;
         _loc24_ = _loc24_;
         _loc5_[2] = _loc24_;
         _loc5_[1] = _loc24_;
         param3.copyRawDataFrom(_loc5_);
      }
   }
}
