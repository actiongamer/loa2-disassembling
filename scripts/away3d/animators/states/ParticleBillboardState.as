package away3d.animators.states
{
   import flash.geom.Matrix3D;
   import away3d.core.managers.Stage3DProxy;
   import away3d.core.base.IRenderable;
   import away3d.animators.data.AnimationSubGeometry;
   import away3d.animators.data.AnimationRegisterCache;
   import away3d.cameras.Camera3D;
   import away3d.core.math.Matrix3DUtils;
   import flash.geom.Vector3D;
   import away3d.animators.ParticleAnimator;
   import away3d.animators.nodes.ParticleNodeBase;
   
   public class ParticleBillboardState extends ParticleStateBase
   {
       
      
      private var _matrix:Matrix3D;
      
      public function ParticleBillboardState(param1:ParticleAnimator, param2:ParticleNodeBase)
      {
         _matrix = new Matrix3D();
         super(param1,param2);
      }
      
      override public function setRenderState(param1:Stage3DProxy, param2:IRenderable, param3:AnimationSubGeometry, param4:AnimationRegisterCache, param5:Camera3D) : void
      {
         _matrix.copyFrom(param2.sceneTransform);
         _matrix.append(param5.inverseSceneTransform);
         var _loc6_:Vector.<Vector3D> = Matrix3DUtils.decompose(_matrix,"axisAngle");
         _matrix.identity();
         _matrix.appendRotation(-_loc6_[1].w * 57.2957795130823,_loc6_[1]);
         var _loc9_:int = _loc6_[2].x < 0?-1:1;
         var _loc8_:int = _loc6_[2].y < 0?-1:1;
         var _loc7_:int = _loc6_[2].z < 0?-1:1;
         _matrix.appendScale(_loc9_,_loc8_,_loc7_);
         if(_registerIndex == null)
         {
            _registerIndex = param4.getRegisterIndexVectror(_animationNode);
         }
         param4.setVertexConstFromMatrix(_registerIndex[0],_matrix);
      }
   }
}
