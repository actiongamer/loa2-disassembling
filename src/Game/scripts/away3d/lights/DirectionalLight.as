package away3d.lights
{
   import flash.geom.Vector3D;
   import away3d.core.partition.EntityNode;
   import away3d.core.partition.DirectionalLightNode;
   import away3d.bounds.BoundingVolumeBase;
   import away3d.bounds.NullBounds;
   import away3d.lights.shadowmaps.ShadowMapperBase;
   import away3d.lights.shadowmaps.DirectionalShadowMapper;
   import flash.geom.Matrix3D;
   import away3d.core.base.IRenderable;
   import away3d.core.math.Matrix3DUtils;
   
   public class DirectionalLight extends LightBase
   {
       
      
      private var _direction:Vector3D;
      
      private var _tmpLookAt:Vector3D;
      
      private var _sceneDirection:Vector3D;
      
      private var _projAABBPoints:Vector.<Number>;
      
      public function DirectionalLight(param1:Number = 0, param2:Number = -1, param3:Number = 1)
      {
         super();
         direction = new Vector3D(param1,param2,param3);
         _sceneDirection = new Vector3D();
      }
      
      override protected function createEntityPartitionNode() : EntityNode
      {
         return new DirectionalLightNode(this);
      }
      
      public function get sceneDirection() : Vector3D
      {
         if(_sceneTransformDirty)
         {
            updateSceneTransform();
         }
         return _sceneDirection;
      }
      
      public function get direction() : Vector3D
      {
         return _direction;
      }
      
      public function set direction(param1:Vector3D) : void
      {
         _direction = param1;
         if(!_tmpLookAt)
         {
            _tmpLookAt = new Vector3D();
         }
         _tmpLookAt.x = x + _direction.x;
         _tmpLookAt.y = y + _direction.y;
         _tmpLookAt.z = z + _direction.z;
         lookAt(_tmpLookAt);
      }
      
      override protected function getDefaultBoundingVolume() : BoundingVolumeBase
      {
         return new NullBounds();
      }
      
      override protected function updateBounds() : void
      {
      }
      
      override protected function updateSceneTransform() : void
      {
         super.updateSceneTransform();
         sceneTransform.copyColumnTo(2,_sceneDirection);
         _sceneDirection.normalize();
      }
      
      override protected function createShadowMapper() : ShadowMapperBase
      {
         return new DirectionalShadowMapper();
      }
      
      override function getObjectProjectionMatrix(param1:IRenderable, param2:Matrix3D = null) : Matrix3D
      {
         var _loc4_:Number = NaN;
         var _loc10_:int = 0;
         var _loc3_:Vector.<Number> = Matrix3DUtils.RAW_DATA_CONTAINER;
         var _loc11_:BoundingVolumeBase = param1.sourceEntity.bounds;
         var _loc7_:Matrix3D = new Matrix3D();
         _loc7_.copyFrom(param1.sceneTransform);
         _loc7_.append(inverseSceneTransform);
         if(!_projAABBPoints)
         {
            _projAABBPoints = new Vector.<Number>();
         }
         _loc7_.transformVectors(_loc11_.aabbPoints,_projAABBPoints);
         var _loc9_:* = Infinity;
         var _loc6_:* = -Infinity;
         var _loc5_:* = Infinity;
         var _loc8_:* = -Infinity;
         var _loc16_:* = Infinity;
         var _loc13_:* = -Infinity;
         _loc10_ = 0;
         while(_loc10_ < 24)
         {
            _loc10_++;
            _loc4_ = _projAABBPoints[_loc10_];
            if(_loc4_ < _loc9_)
            {
               _loc9_ = _loc4_;
            }
            if(_loc4_ > _loc6_)
            {
               _loc6_ = _loc4_;
            }
            _loc10_++;
            _loc4_ = _projAABBPoints[_loc10_];
            if(_loc4_ < _loc5_)
            {
               _loc5_ = _loc4_;
            }
            if(_loc4_ > _loc8_)
            {
               _loc8_ = _loc4_;
            }
            _loc10_++;
            _loc4_ = _projAABBPoints[_loc10_];
            if(_loc4_ < _loc16_)
            {
               _loc16_ = _loc4_;
            }
            if(_loc4_ > _loc13_)
            {
               _loc13_ = _loc4_;
            }
         }
         var _loc14_:Number = 1 / (_loc6_ - _loc9_);
         var _loc15_:Number = 1 / (_loc8_ - _loc5_);
         var _loc12_:Number = 1 / (_loc13_ - _loc16_);
         _loc3_[0] = 2 * _loc14_;
         _loc3_[5] = 2 * _loc15_;
         _loc3_[10] = _loc12_;
         _loc3_[12] = -(_loc6_ + _loc9_) * _loc14_;
         _loc3_[13] = -(_loc8_ + _loc5_) * _loc15_;
         _loc3_[14] = -_loc16_ * _loc12_;
         var _loc17_:* = 0;
         _loc3_[11] = _loc17_;
         _loc17_ = _loc17_;
         _loc3_[9] = _loc17_;
         _loc17_ = _loc17_;
         _loc3_[8] = _loc17_;
         _loc17_ = _loc17_;
         _loc3_[7] = _loc17_;
         _loc17_ = _loc17_;
         _loc3_[6] = _loc17_;
         _loc17_ = _loc17_;
         _loc3_[4] = _loc17_;
         _loc17_ = _loc17_;
         _loc3_[3] = _loc17_;
         _loc17_ = _loc17_;
         _loc3_[2] = _loc17_;
         _loc3_[1] = _loc17_;
         _loc3_[15] = 1;
         if(!param2)
         {
            param2 = new Matrix3D();
         }
         param2.copyRawDataFrom(_loc3_);
         param2.prepend(_loc7_);
         return param2;
      }
   }
}
