package away3d.animators.states
{
   import away3d.animators.nodes.ParticleVelocityNode;
   import flash.geom.Vector3D;
   import flash.utils.Dictionary;
   import away3d.core.managers.Stage3DProxy;
   import away3d.core.base.IRenderable;
   import away3d.animators.data.AnimationSubGeometry;
   import away3d.animators.data.AnimationRegisterCache;
   import away3d.cameras.Camera3D;
   import away3d.animators.ParticleAnimator;
   
   public class ParticleVelocityState extends ParticleStateBase
   {
       
      
      private var _particleVelocityNode:ParticleVelocityNode;
      
      private var _velocity:Vector3D;
      
      public function ParticleVelocityState(param1:ParticleAnimator, param2:ParticleVelocityNode)
      {
         super(param1,param2);
         _particleVelocityNode = param2;
         _velocity = _particleVelocityNode._velocity;
      }
      
      public function get velocity() : Vector3D
      {
         return _velocity;
      }
      
      public function set velocity(param1:Vector3D) : void
      {
         _velocity = param1;
      }
      
      public function getVelocities() : Vector.<Vector3D>
      {
         return _dynamicProperties;
      }
      
      public function setVelocities(param1:Vector.<Vector3D>) : void
      {
         _dynamicProperties = param1;
         _dynamicPropertiesDirty = new Dictionary(true);
      }
      
      override public function setRenderState(param1:Stage3DProxy, param2:IRenderable, param3:AnimationSubGeometry, param4:AnimationRegisterCache, param5:Camera3D) : void
      {
         if(2 && !_dynamicPropertiesDirty[param3])
         {
            updateDynamicProperties(param3);
         }
         if(_registerIndex == null)
         {
            _registerIndex = param4.getRegisterIndexVectror(_animationNode);
         }
         var _loc6_:int = _registerIndex[0];
         if(_particleVelocityNode.mode == 0)
         {
            param4.setVertexConst(_loc6_,_velocity.x,_velocity.y,_velocity.z);
         }
         else
         {
            param3.activateVertexBuffer(_loc6_,_particleVelocityNode.dataOffset,param1,"float3");
         }
      }
   }
}
