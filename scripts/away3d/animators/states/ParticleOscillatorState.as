package away3d.animators.states
{
   import away3d.animators.nodes.ParticleOscillatorNode;
   import flash.geom.Vector3D;
   import away3d.core.managers.Stage3DProxy;
   import away3d.core.base.IRenderable;
   import away3d.animators.data.AnimationSubGeometry;
   import away3d.animators.data.AnimationRegisterCache;
   import away3d.cameras.Camera3D;
   import away3d.animators.ParticleAnimator;
   
   public class ParticleOscillatorState extends ParticleStateBase
   {
       
      
      private var _particleOscillatorNode:ParticleOscillatorNode;
      
      private var _oscillator:Vector3D;
      
      private var _oscillatorData:Vector3D;
      
      public function ParticleOscillatorState(param1:ParticleAnimator, param2:ParticleOscillatorNode)
      {
         super(param1,param2);
         _particleOscillatorNode = param2;
         _oscillator = _particleOscillatorNode._oscillator;
         updateOscillatorData();
      }
      
      public function get oscillator() : Vector3D
      {
         return _oscillator;
      }
      
      public function set oscillator(param1:Vector3D) : void
      {
         _oscillator = param1;
         updateOscillatorData();
      }
      
      override public function setRenderState(param1:Stage3DProxy, param2:IRenderable, param3:AnimationSubGeometry, param4:AnimationRegisterCache, param5:Camera3D) : void
      {
         if(_registerIndex == null)
         {
            _registerIndex = param4.getRegisterIndexVectror(_animationNode);
         }
         var _loc6_:int = _registerIndex[0];
         if(_particleOscillatorNode.mode == 1)
         {
            param3.activateVertexBuffer(_loc6_,_particleOscillatorNode.dataOffset,param1,"float4");
         }
         else
         {
            param4.setVertexConst(_loc6_,_oscillatorData.x,_oscillatorData.y,_oscillatorData.z,_oscillatorData.w);
         }
      }
      
      private function updateOscillatorData() : void
      {
         if(_particleOscillatorNode.mode == 0)
         {
            if(_oscillator.w <= 0)
            {
               throw new Error("the cycle duration must greater than zero");
            }
            _oscillatorData.x = _oscillator.x;
            _oscillatorData.y = _oscillator.y;
            _oscillatorData.z = _oscillator.z;
            _oscillatorData.w = 3.14159265358979 * 2 / _oscillator.w;
         }
      }
   }
}
