package away3d.animators.states
{
   import away3d.animators.nodes.ParticleOrbitNode;
   import flash.geom.Vector3D;
   import flash.geom.Matrix3D;
   import away3d.core.managers.Stage3DProxy;
   import away3d.core.base.IRenderable;
   import away3d.animators.data.AnimationSubGeometry;
   import away3d.animators.data.AnimationRegisterCache;
   import away3d.cameras.Camera3D;
   import away3d.animators.ParticleAnimator;
   
   public class ParticleOrbitState extends ParticleStateBase
   {
       
      
      private var _particleOrbitNode:ParticleOrbitNode;
      
      private var _usesEulers:Boolean;
      
      private var _usesCycle:Boolean;
      
      private var _usesPhase:Boolean;
      
      private var _radius:Number;
      
      private var _cycleDuration:Number;
      
      private var _cyclePhase:Number;
      
      private var _eulers:Vector3D;
      
      private var _orbitData:Vector3D;
      
      private var _eulersMatrix:Matrix3D;
      
      public function ParticleOrbitState(param1:ParticleAnimator, param2:ParticleOrbitNode)
      {
         super(param1,param2);
         _particleOrbitNode = param2;
         _usesEulers = _particleOrbitNode._usesEulers;
         _usesCycle = _particleOrbitNode._usesCycle;
         _usesPhase = _particleOrbitNode._usesPhase;
         _eulers = _particleOrbitNode._eulers;
         _radius = _particleOrbitNode._radius;
         _cycleDuration = _particleOrbitNode._cycleDuration;
         _cyclePhase = _particleOrbitNode._cyclePhase;
         updateOrbitData();
      }
      
      public function get radius() : Number
      {
         return _radius;
      }
      
      public function set radius(param1:Number) : void
      {
         _radius = param1;
         updateOrbitData();
      }
      
      public function get cycleDuration() : Number
      {
         return _cycleDuration;
      }
      
      public function set cycleDuration(param1:Number) : void
      {
         _cycleDuration = param1;
         updateOrbitData();
      }
      
      public function get cyclePhase() : Number
      {
         return _cyclePhase;
      }
      
      public function set cyclePhase(param1:Number) : void
      {
         _cyclePhase = param1;
         updateOrbitData();
      }
      
      public function get eulers() : Vector3D
      {
         return _eulers;
      }
      
      public function set eulers(param1:Vector3D) : void
      {
         _eulers = param1;
         updateOrbitData();
      }
      
      override public function setRenderState(param1:Stage3DProxy, param2:IRenderable, param3:AnimationSubGeometry, param4:AnimationRegisterCache, param5:Camera3D) : void
      {
         if(_registerIndex == null)
         {
            _registerIndex = param4.getRegisterIndexVectror(_animationNode);
         }
         var _loc6_:int = _registerIndex[0];
         if(_particleOrbitNode.mode == 1)
         {
            if(_usesPhase)
            {
               param3.activateVertexBuffer(_loc6_,_particleOrbitNode.dataOffset,param1,"float4");
            }
            else
            {
               param3.activateVertexBuffer(_loc6_,_particleOrbitNode.dataOffset,param1,"float3");
            }
         }
         else
         {
            param4.setVertexConst(_loc6_,_orbitData.x,_orbitData.y,_orbitData.z,_orbitData.w);
         }
         if(_usesEulers)
         {
            param4.setVertexConstFromMatrix(param4.getRegisterIndex(_animationNode,1),_eulersMatrix);
         }
      }
      
      private function updateOrbitData() : void
      {
         if(_usesEulers)
         {
            _eulersMatrix = new Matrix3D();
            _eulersMatrix.appendRotation(_eulers.x,Vector3D.X_AXIS);
            _eulersMatrix.appendRotation(_eulers.y,Vector3D.Y_AXIS);
            _eulersMatrix.appendRotation(_eulers.z,Vector3D.Z_AXIS);
         }
         if(_particleOrbitNode.mode == 0)
         {
            _orbitData = new Vector3D(_radius,0,_radius * 3.14159265358979 * 2,_cyclePhase * 3.14159265358979 / 180);
            if(_usesCycle)
            {
               if(_cycleDuration <= 0)
               {
                  throw new Error("the cycle duration must be greater than zero");
               }
               _orbitData.y = 3.14159265358979 * 2 / _cycleDuration;
            }
            else
            {
               _orbitData.y = 3.14159265358979 * 2;
            }
         }
      }
   }
}
