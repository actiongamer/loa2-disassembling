package away3d.animators.states
{
   import away3d.animators.nodes.ParticleScaleNode;
   import flash.geom.Vector3D;
   import away3d.core.managers.Stage3DProxy;
   import away3d.core.base.IRenderable;
   import away3d.animators.data.AnimationSubGeometry;
   import away3d.animators.data.AnimationRegisterCache;
   import away3d.cameras.Camera3D;
   import away3d.animators.ParticleAnimator;
   
   public class ParticleScaleState extends ParticleStateBase
   {
       
      
      private var _particleScaleNode:ParticleScaleNode;
      
      private var _usesCycle:Boolean;
      
      private var _usesPhase:Boolean;
      
      private var _minScale:Number;
      
      private var _maxScale:Number;
      
      private var _cycleDuration:Number;
      
      private var _cyclePhase:Number;
      
      private var _scaleData:Vector3D;
      
      public function ParticleScaleState(param1:ParticleAnimator, param2:ParticleScaleNode)
      {
         super(param1,param2);
         _particleScaleNode = param2;
         _usesCycle = _particleScaleNode._usesCycle;
         _usesPhase = _particleScaleNode._usesPhase;
         _minScale = _particleScaleNode._minScale;
         _maxScale = _particleScaleNode._maxScale;
         _cycleDuration = _particleScaleNode._cycleDuration;
         _cyclePhase = _particleScaleNode._cyclePhase;
         updateScaleData();
      }
      
      public function get minScale() : Number
      {
         return _minScale;
      }
      
      public function set minScale(param1:Number) : void
      {
         _minScale = param1;
         updateScaleData();
      }
      
      public function get maxScale() : Number
      {
         return _maxScale;
      }
      
      public function set maxScale(param1:Number) : void
      {
         _maxScale = param1;
         updateScaleData();
      }
      
      public function get cycleDuration() : Number
      {
         return _cycleDuration;
      }
      
      public function set cycleDuration(param1:Number) : void
      {
         _cycleDuration = param1;
         updateScaleData();
      }
      
      public function get cyclePhase() : Number
      {
         return _cyclePhase;
      }
      
      public function set cyclePhase(param1:Number) : void
      {
         _cyclePhase = param1;
         updateScaleData();
      }
      
      override public function setRenderState(param1:Stage3DProxy, param2:IRenderable, param3:AnimationSubGeometry, param4:AnimationRegisterCache, param5:Camera3D) : void
      {
         if(_registerIndex == null)
         {
            _registerIndex = param4.getRegisterIndexVectror(_animationNode);
         }
         var _loc6_:int = _registerIndex[0];
         if(_particleScaleNode.mode == 1)
         {
            if(_usesCycle)
            {
               if(_usesPhase)
               {
                  param3.activateVertexBuffer(_loc6_,_particleScaleNode.dataOffset,param1,"float4");
               }
               else
               {
                  param3.activateVertexBuffer(_loc6_,_particleScaleNode.dataOffset,param1,"float3");
               }
            }
            else
            {
               param3.activateVertexBuffer(_loc6_,_particleScaleNode.dataOffset,param1,"float2");
            }
         }
         else
         {
            param4.setVertexConst(_loc6_,_scaleData.x,_scaleData.y,_scaleData.z,_scaleData.w);
         }
      }
      
      private function updateScaleData() : void
      {
         if(_particleScaleNode.mode == 0)
         {
            if(_usesCycle)
            {
               if(_cycleDuration <= 0)
               {
                  throw new Error("the cycle duration must be greater than zero");
               }
               _scaleData = new Vector3D((_minScale + _maxScale) / 2,Math.abs(_minScale - _maxScale) / 2,3.14159265358979 * 2 / _cycleDuration,_cyclePhase * 3.14159265358979 / 180);
            }
            else
            {
               _scaleData = new Vector3D(_minScale,_maxScale - _minScale,0,0);
            }
         }
      }
   }
}
