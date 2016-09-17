package away3d.animators.states
{
   import away3d.animators.nodes.ParticleBezierCurveNode;
   import flash.geom.Vector3D;
   import away3d.core.managers.Stage3DProxy;
   import away3d.core.base.IRenderable;
   import away3d.animators.data.AnimationSubGeometry;
   import away3d.animators.data.AnimationRegisterCache;
   import away3d.cameras.Camera3D;
   import away3d.animators.ParticleAnimator;
   
   public class ParticleBezierCurveState extends ParticleStateBase
   {
       
      
      private var _particleBezierCurveNode:ParticleBezierCurveNode;
      
      private var _controlPoint:Vector3D;
      
      private var _endPoint:Vector3D;
      
      public function ParticleBezierCurveState(param1:ParticleAnimator, param2:ParticleBezierCurveNode)
      {
         super(param1,param2);
         _particleBezierCurveNode = param2;
         _controlPoint = _particleBezierCurveNode._controlPoint;
         _endPoint = _particleBezierCurveNode._endPoint;
      }
      
      public function get controlPoint() : Vector3D
      {
         return _controlPoint;
      }
      
      public function set controlPoint(param1:Vector3D) : void
      {
         _controlPoint = param1;
      }
      
      public function get endPoint() : Vector3D
      {
         return _endPoint;
      }
      
      public function set endPoint(param1:Vector3D) : void
      {
         _endPoint = param1;
      }
      
      override public function setRenderState(param1:Stage3DProxy, param2:IRenderable, param3:AnimationSubGeometry, param4:AnimationRegisterCache, param5:Camera3D) : void
      {
         if(_registerIndex == null)
         {
            _registerIndex = param4.getRegisterIndexVectror(_animationNode);
         }
         var _loc6_:int = _registerIndex[0];
         var _loc7_:int = _registerIndex[1];
         if(_particleBezierCurveNode.mode == 1)
         {
            param3.activateVertexBuffer(_loc6_,_particleBezierCurveNode.dataOffset,param1,"float3");
            param3.activateVertexBuffer(_loc7_,_particleBezierCurveNode.dataOffset + 3,param1,"float3");
         }
         else
         {
            param4.setVertexConst(_loc6_,_controlPoint.x,_controlPoint.y,_controlPoint.z);
            param4.setVertexConst(_loc7_,_endPoint.x,_endPoint.y,_endPoint.z);
         }
      }
   }
}
