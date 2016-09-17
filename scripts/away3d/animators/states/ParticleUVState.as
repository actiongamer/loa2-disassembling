package away3d.animators.states
{
   import away3d.animators.nodes.ParticleUVNode;
   import away3d.core.managers.Stage3DProxy;
   import away3d.core.base.IRenderable;
   import away3d.animators.data.AnimationSubGeometry;
   import away3d.animators.data.AnimationRegisterCache;
   import away3d.cameras.Camera3D;
   import flash.geom.Vector3D;
   import away3d.animators.ParticleAnimator;
   
   public class ParticleUVState extends ParticleStateBase
   {
       
      
      private var _particleUVNode:ParticleUVNode;
      
      public function ParticleUVState(param1:ParticleAnimator, param2:ParticleUVNode)
      {
         super(param1,param2);
         _particleUVNode = param2;
      }
      
      override public function setRenderState(param1:Stage3DProxy, param2:IRenderable, param3:AnimationSubGeometry, param4:AnimationRegisterCache, param5:Camera3D) : void
      {
         var _loc6_:int = 0;
         var _loc7_:* = null;
         if(param4.needUVAnimation)
         {
            if(_registerIndex == null)
            {
               _registerIndex = param4.getRegisterIndexVectror(_animationNode);
            }
            _loc6_ = _registerIndex[0];
            _loc7_ = _particleUVNode._uvData;
            param4.setVertexConst(_loc6_,_loc7_.x,_loc7_.y);
         }
      }
   }
}
