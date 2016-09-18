package away3d.lights
{
   import away3d.lights.shadowmaps.ShadowMapperBase;
   import away3d.lights.shadowmaps.CubeMapShadowMapper;
   import away3d.core.partition.EntityNode;
   import away3d.core.partition.PointLightNode;
   import §away3d:arcane§._radius;
   import §away3d:arcane§._fallOff;
   import §away3d:arcane§._fallOffFactor;
   import flash.geom.Vector3D;
   import away3d.bounds.BoundingVolumeBase;
   import away3d.bounds.BoundingSphere;
   import flash.geom.Matrix3D;
   import away3d.core.base.IRenderable;
   import away3d.core.math.Matrix3DUtils;
   
   public class PointLight extends LightBase
   {
       
      
      var _radius:Number = 1.7976931348623157E308;
      
      var _fallOff:Number = 1.7976931348623157E308;
      
      var _fallOffFactor:Number;
      
      public function PointLight()
      {
         super();
         _fallOffFactor = 1 / (_fallOff - _radius);
      }
      
      override protected function createShadowMapper() : ShadowMapperBase
      {
         return new CubeMapShadowMapper();
      }
      
      override protected function createEntityPartitionNode() : EntityNode
      {
         return new PointLightNode(this);
      }
      
      public function get radius() : Number
      {
         return _radius;
      }
      
      public function set radius(param1:Number) : void
      {
         _radius = param1;
         if(_radius < 0)
         {
            _radius = 0;
         }
         else if(_radius > _fallOff)
         {
            _fallOff = _radius;
            invalidateBounds();
         }
         _fallOffFactor = 1 / (_fallOff - _radius);
      }
      
      function fallOffFactor() : Number
      {
         return _fallOffFactor;
      }
      
      public function get fallOff() : Number
      {
         return _fallOff;
      }
      
      public function set fallOff(param1:Number) : void
      {
         _fallOff = param1;
         if(_fallOff < 0)
         {
            _fallOff = 0;
         }
         if(_fallOff < _radius)
         {
            _radius = _fallOff;
         }
         _fallOffFactor = 1 / (_fallOff - _radius);
         invalidateBounds();
      }
      
      override protected function updateBounds() : void
      {
         _bounds.fromSphere(new Vector3D(),_fallOff);
         _boundsInvalid = false;
      }
      
      override protected function getDefaultBoundingVolume() : BoundingVolumeBase
      {
         return new BoundingSphere();
      }
      
      override function getObjectProjectionMatrix(param1:IRenderable, param2:Matrix3D = null) : Matrix3D
      {
         var _loc10_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc3_:Vector.<Number> = Matrix3DUtils.RAW_DATA_CONTAINER;
         var _loc8_:BoundingVolumeBase = param1.sourceEntity.bounds;
         var _loc7_:Matrix3D = new Matrix3D();
         _loc7_.copyFrom(param1.sceneTransform);
         _loc7_.append(_parent.inverseSceneTransform);
         lookAt(_loc7_.position);
         _loc7_.copyFrom(param1.sceneTransform);
         _loc7_.append(inverseSceneTransform);
         _loc7_.copyColumnTo(3,_pos);
         var _loc4_:Vector3D = _loc7_.deltaTransformVector(_loc8_.min);
         var _loc6_:Vector3D = _loc7_.deltaTransformVector(_loc8_.max);
         var _loc12_:Number = _pos.z;
         var _loc9_:Number = _loc4_.x * _loc4_.x + _loc4_.y * _loc4_.y + _loc4_.z * _loc4_.z;
         var _loc11_:Number = _loc6_.x * _loc6_.x + _loc6_.y * _loc6_.y + _loc6_.z * _loc6_.z;
         var _loc5_:Number = Math.sqrt(_loc9_ > _loc11_?_loc9_:Number(_loc11_));
         _loc13_ = _loc12_ - _loc5_;
         _loc10_ = _loc12_ + _loc5_;
         var _loc14_:* = _loc13_ / _loc5_;
         _loc3_[0] = _loc14_;
         _loc3_[5] = _loc14_;
         _loc3_[10] = _loc10_ / (_loc10_ - _loc13_);
         _loc3_[11] = 1;
         _loc14_ = 0;
         _loc3_[15] = _loc14_;
         _loc14_ = _loc14_;
         _loc3_[13] = _loc14_;
         _loc14_ = _loc14_;
         _loc3_[12] = _loc14_;
         _loc14_ = _loc14_;
         _loc3_[9] = _loc14_;
         _loc14_ = _loc14_;
         _loc3_[8] = _loc14_;
         _loc14_ = _loc14_;
         _loc3_[7] = _loc14_;
         _loc14_ = _loc14_;
         _loc3_[6] = _loc14_;
         _loc14_ = _loc14_;
         _loc3_[4] = _loc14_;
         _loc14_ = _loc14_;
         _loc3_[3] = _loc14_;
         _loc14_ = _loc14_;
         _loc3_[2] = _loc14_;
         _loc3_[1] = _loc14_;
         _loc3_[14] = -_loc13_ * _loc3_[10];
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
