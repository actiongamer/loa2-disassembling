package org.specter3d.display.particle.extend
{
   import away3d.animators.states.ParticleStateBase;
   import away3d.core.managers.Stage3DProxy;
   import away3d.core.base.IRenderable;
   import away3d.animators.data.AnimationSubGeometry;
   import away3d.animators.data.AnimationRegisterCache;
   import away3d.cameras.Camera3D;
   import away3d.animators.ParticleAnimator;
   
   public class ParticleUVScrollState extends ParticleStateBase
   {
       
      
      private var _particleUVScrollNode:org.specter3d.display.particle.extend.ParticleUVScrollNode;
      
      public function ParticleUVScrollState(param1:ParticleAnimator, param2:org.specter3d.display.particle.extend.ParticleUVScrollNode)
      {
         super(param1,param2);
         _particleUVScrollNode = param2;
      }
      
      override public function setRenderState(param1:Stage3DProxy, param2:IRenderable, param3:AnimationSubGeometry, param4:AnimationRegisterCache, param5:Camera3D) : void
      {
         var _loc6_:int = 0;
         if(param4.needUVAnimation)
         {
            _loc6_ = param4.getRegisterIndex(_animationNode,0);
            param4.setVertexConst(_loc6_,_particleUVScrollNode.speed.x,_particleUVScrollNode.speed.y);
         }
      }
   }
}
