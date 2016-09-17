package org.specter3d.display.particle.extend
{
   import away3d.animators.states.ParticleStateBase;
   import away3d.core.managers.Stage3DProxy;
   import away3d.core.base.IRenderable;
   import away3d.animators.data.AnimationSubGeometry;
   import away3d.animators.data.AnimationRegisterCache;
   import away3d.cameras.Camera3D;
   import away3d.animators.ParticleAnimator;
   import away3d.animators.nodes.ParticleNodeBase;
   
   public class ParticleAlphaState extends ParticleStateBase
   {
       
      
      private var _alphaTranslate:Vector.<Number>;
      
      public function ParticleAlphaState(param1:ParticleAnimator, param2:ParticleNodeBase, param3:Boolean = false)
      {
         super(param1,param2,param3);
         _alphaTranslate = Vector.<Number>([0,0,0,0]);
      }
      
      override public function setRenderState(param1:Stage3DProxy, param2:IRenderable, param3:AnimationSubGeometry, param4:AnimationRegisterCache, param5:Camera3D) : void
      {
         var _loc6_:int = param4.getRegisterIndex(_animationNode,0);
         param4.setFragmentConst(_loc6_,_alphaTranslate[0],_alphaTranslate[1],_alphaTranslate[2],_alphaTranslate[3]);
      }
      
      public function updateAlpha(param1:Number) : void
      {
         if(param1 > 1)
         {
            param1 = 1;
         }
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param1 != _alphaTranslate[3])
         {
            _alphaTranslate[0] = 0;
            _alphaTranslate[1] = 0;
            _alphaTranslate[2] = 0;
            _alphaTranslate[3] = param1;
         }
      }
   }
}
