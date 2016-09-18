package org.specter3d.display.particle.extend
{
   import away3d.animators.states.ParticleStateBase;
   import flash.geom.Vector3D;
   import away3d.core.managers.Stage3DProxy;
   import away3d.core.base.IRenderable;
   import away3d.animators.data.AnimationSubGeometry;
   import away3d.animators.data.AnimationRegisterCache;
   import away3d.cameras.Camera3D;
   import away3d.animators.ParticleAnimator;
   
   public class ParticleDampState extends ParticleStateBase
   {
       
      
      private var _particleDampNode:org.specter3d.display.particle.extend.ParticleDampNode;
      
      private var _damp:Vector3D;
      
      private var _halfDamp:Vector3D;
      
      public function ParticleDampState(param1:ParticleAnimator, param2:org.specter3d.display.particle.extend.ParticleDampNode)
      {
         super(param1,param2,needUpdateTime);
         _particleDampNode = param2;
         _damp = _particleDampNode.damp;
         updateDampData();
      }
      
      override public function setRenderState(param1:Stage3DProxy, param2:IRenderable, param3:AnimationSubGeometry, param4:AnimationRegisterCache, param5:Camera3D) : void
      {
         var _loc6_:int = param4.getRegisterIndex(_animationNode,0);
         if(_particleDampNode.mode == 1)
         {
            param3.activateVertexBuffer(_loc6_,_particleDampNode.nodeDataOffset,param1,"float3");
         }
         else
         {
            param4.setVertexConst(_loc6_,_halfDamp.x,_halfDamp.y,_halfDamp.z);
         }
      }
      
      private function updateDampData() : void
      {
         if(_particleDampNode.mode == 0)
         {
            _halfDamp = new Vector3D(_damp.x / 2,_damp.y / 2,_damp.z / 2);
         }
      }
   }
}
