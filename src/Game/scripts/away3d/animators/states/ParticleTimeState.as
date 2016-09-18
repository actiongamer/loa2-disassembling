package away3d.animators.states
{
   import away3d.animators.nodes.ParticleTimeNode;
   import away3d.core.managers.Stage3DProxy;
   import away3d.core.base.IRenderable;
   import away3d.animators.data.AnimationSubGeometry;
   import away3d.animators.data.AnimationRegisterCache;
   import away3d.cameras.Camera3D;
   import away3d.animators.ParticleAnimator;
   
   public class ParticleTimeState extends ParticleStateBase
   {
       
      
      private var _particleTimeNode:ParticleTimeNode;
      
      public function ParticleTimeState(param1:ParticleAnimator, param2:ParticleTimeNode)
      {
         super(param1,param2,true);
         _particleTimeNode = param2;
      }
      
      override public function setRenderState(param1:Stage3DProxy, param2:IRenderable, param3:AnimationSubGeometry, param4:AnimationRegisterCache, param5:Camera3D) : void
      {
         if(_registerIndex == null)
         {
            _registerIndex = param4.getRegisterIndexVectror(_animationNode);
         }
         param3.activateVertexBuffer(_registerIndex[0],_particleTimeNode.dataOffset,param1,"float4");
         var _loc6_:Number = _time / 1000;
         param4.setVertexConst(_registerIndex[1],_loc6_,_loc6_,_loc6_,_loc6_);
      }
   }
}
