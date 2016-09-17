package away3d.animators.states
{
   import away3d.animators.nodes.ParticleRotationalVelocityNode;
   import flash.geom.Vector3D;
   import flash.utils.Dictionary;
   import away3d.core.managers.Stage3DProxy;
   import away3d.core.base.IRenderable;
   import away3d.animators.data.AnimationSubGeometry;
   import away3d.animators.data.AnimationRegisterCache;
   import away3d.cameras.Camera3D;
   import away3d.animators.ParticleAnimator;
   
   public class ParticleRotationalVelocityState extends ParticleStateBase
   {
       
      
      private var _particleRotationalVelocityNode:ParticleRotationalVelocityNode;
      
      private var _rotationalVelocityData:Vector3D;
      
      private var _rotationalVelocity:Vector3D;
      
      public function ParticleRotationalVelocityState(param1:ParticleAnimator, param2:ParticleRotationalVelocityNode)
      {
         super(param1,param2);
         _particleRotationalVelocityNode = param2;
         _rotationalVelocity = _particleRotationalVelocityNode._rotationalVelocity;
         updateRotationalVelocityData();
      }
      
      public function get rotationalVelocity() : Vector3D
      {
         return _rotationalVelocity;
      }
      
      public function set rotationalVelocity(param1:Vector3D) : void
      {
         _rotationalVelocity = param1;
         updateRotationalVelocityData();
      }
      
      public function getRotationalVelocities() : Vector.<Vector3D>
      {
         return _dynamicProperties;
      }
      
      public function setRotationalVelocities(param1:Vector.<Vector3D>) : void
      {
         _dynamicProperties = param1;
         _dynamicPropertiesDirty = new Dictionary(true);
      }
      
      override public function setRenderState(param1:Stage3DProxy, param2:IRenderable, param3:AnimationSubGeometry, param4:AnimationRegisterCache, param5:Camera3D) : void
      {
         param2 = param2;
         param5 = param5;
         if(_particleRotationalVelocityNode.mode == 2 && !_dynamicPropertiesDirty[param3])
         {
            updateDynamicProperties(param3);
         }
         if(_registerIndex == null)
         {
            _registerIndex = param4.getRegisterIndexVectror(_animationNode);
         }
         var _loc6_:int = _registerIndex[0];
         if(_particleRotationalVelocityNode.mode == 0)
         {
            param4.setVertexConst(_loc6_,_rotationalVelocityData.x,_rotationalVelocityData.y,_rotationalVelocityData.z,_rotationalVelocityData.w);
         }
         else
         {
            param3.activateVertexBuffer(_loc6_,_particleRotationalVelocityNode.dataOffset,param1,"float4");
         }
      }
      
      private function updateRotationalVelocityData() : void
      {
         var _loc1_:* = null;
         if(_particleRotationalVelocityNode.mode == 0)
         {
            if(_rotationalVelocity.w <= 0)
            {
               throw new Error("the cycle duration must greater than zero");
            }
            _loc1_ = _rotationalVelocity.clone();
            if(_loc1_.length <= 0)
            {
               _loc1_.z = 1;
            }
            else
            {
               _loc1_.normalize();
            }
            _rotationalVelocityData = new Vector3D(_loc1_.x,_loc1_.y,_loc1_.z,3.14159265358979 / _loc1_.w);
         }
      }
   }
}
