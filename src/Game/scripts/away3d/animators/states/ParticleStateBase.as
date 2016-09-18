package away3d.animators.states
{
   import away3d.animators.nodes.ParticleNodeBase;
   import flash.geom.Vector3D;
   import flash.utils.Dictionary;
   import away3d.core.managers.Stage3DProxy;
   import away3d.core.base.IRenderable;
   import away3d.animators.data.AnimationSubGeometry;
   import away3d.animators.data.AnimationRegisterCache;
   import away3d.cameras.Camera3D;
   import away3d.animators.data.ParticleAnimationData;
   import away3d.animators.ParticleAnimator;
   
   public class ParticleStateBase extends AnimationStateBase
   {
       
      
      private var _particleNode:ParticleNodeBase;
      
      protected var _dynamicProperties:Vector.<Vector3D>;
      
      protected var _dynamicPropertiesDirty:Dictionary;
      
      protected var _registerIndex:Vector.<int>;
      
      protected var _needUpdateTime:Boolean;
      
      public function ParticleStateBase(param1:ParticleAnimator, param2:ParticleNodeBase, param3:Boolean = false)
      {
         _dynamicProperties = new Vector.<Vector3D>();
         _dynamicPropertiesDirty = new Dictionary(true);
         super(param1,param2);
         _particleNode = param2;
         _needUpdateTime = param3;
      }
      
      public function get needUpdateTime() : Boolean
      {
         return _needUpdateTime;
      }
      
      public function setRenderState(param1:Stage3DProxy, param2:IRenderable, param3:AnimationSubGeometry, param4:AnimationRegisterCache, param5:Camera3D) : void
      {
      }
      
      protected function updateDynamicProperties(param1:AnimationSubGeometry) : void
      {
         var _loc2_:* = 0;
         var _loc12_:* = 0;
         var _loc13_:* = 0;
         var _loc3_:* = null;
         var _loc10_:* = null;
         _dynamicPropertiesDirty[param1] = true;
         var _loc4_:Vector.<ParticleAnimationData> = param1.animationParticles;
         var _loc14_:Vector.<Number> = param1.vertexData;
         var _loc11_:uint = param1.totalLenOfOneVertex;
         var _loc7_:uint = _particleNode.dataLength;
         var _loc8_:uint = _particleNode.dataOffset;
         var _loc15_:uint = _dynamicProperties.length;
         var _loc9_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         if(_loc15_ == 0)
         {
            return;
         }
         while(_loc9_ < _loc15_)
         {
            while(_loc5_ < _loc15_ && _loc4_[_loc5_].index == _loc9_)
            {
               _loc3_ = _dynamicProperties[_loc9_];
               _loc2_ = uint(_loc10_.numVertices * _loc11_);
               _loc12_ = uint(_loc10_.startVertexIndex * _loc11_ + _loc8_);
               _loc6_ = 0;
               while(_loc6_ < _loc2_)
               {
                  _loc13_ = uint(_loc12_ + _loc6_);
                  _loc6_ = 0;
                  while(_loc6_ < _loc2_)
                  {
                     _loc13_ = uint(_loc12_ + _loc6_);
                     _loc14_[_loc13_++] = _loc3_.x;
                     _loc14_[_loc13_++] = _loc3_.y;
                     _loc14_[_loc13_++] = _loc3_.z;
                     if(_loc7_ == 4)
                     {
                        _loc14_[_loc13_++] = _loc3_.w;
                     }
                     _loc6_ = _loc6_ + _loc11_;
                  }
                  _loc6_ = _loc6_ + _loc11_;
               }
               _loc5_++;
            }
            _loc9_++;
         }
         param1.invalidateBuffer();
      }
   }
}
