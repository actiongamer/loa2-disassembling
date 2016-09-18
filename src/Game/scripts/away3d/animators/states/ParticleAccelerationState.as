package away3d.animators.states
{
   import away3d.animators.nodes.ParticleAccelerationNode;
   import flash.geom.Vector3D;
   import away3d.core.managers.Stage3DProxy;
   import away3d.core.base.IRenderable;
   import away3d.animators.data.AnimationSubGeometry;
   import away3d.animators.data.AnimationRegisterCache;
   import away3d.cameras.Camera3D;
   import away3d.animators.ParticleAnimator;
   
   public class ParticleAccelerationState extends ParticleStateBase
   {
       
      
      private var _particleAccelerationNode:ParticleAccelerationNode;
      
      private var _acceleration:Vector3D;
      
      private var _halfAcceleration:Vector3D;
      
      public function ParticleAccelerationState(param1:ParticleAnimator, param2:ParticleAccelerationNode)
      {
         super(param1,param2);
         _particleAccelerationNode = param2;
         _acceleration = _particleAccelerationNode._acceleration;
         updateAccelerationData();
      }
      
      public function get acceleration() : Vector3D
      {
         return _acceleration;
      }
      
      public function set acceleration(param1:Vector3D) : void
      {
         _acceleration.x = param1.x;
         _acceleration.y = param1.y;
         _acceleration.z = param1.z;
         updateAccelerationData();
      }
      
      override public function setRenderState(param1:Stage3DProxy, param2:IRenderable, param3:AnimationSubGeometry, param4:AnimationRegisterCache, param5:Camera3D) : void
      {
         if(_registerIndex == null)
         {
            _registerIndex = param4.getRegisterIndexVectror(_animationNode);
         }
         var _loc6_:int = _registerIndex[0];
         if(_particleAccelerationNode.mode == 1)
         {
            param3.activateVertexBuffer(_loc6_,_particleAccelerationNode.dataOffset,param1,"float3");
         }
         else
         {
            param4.setVertexConst(_loc6_,_halfAcceleration.x,_halfAcceleration.y,_halfAcceleration.z);
         }
      }
      
      private function updateAccelerationData() : void
      {
         if(_particleAccelerationNode.mode == 0)
         {
            _halfAcceleration = new Vector3D(_acceleration.x / 2,_acceleration.y / 2,_acceleration.z / 2);
         }
      }
   }
}
