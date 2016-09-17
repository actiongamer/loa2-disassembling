package away3d.animators.states
{
   import away3d.animators.nodes.ParticleColorNode;
   import flash.geom.ColorTransform;
   import flash.geom.Vector3D;
   import away3d.core.managers.Stage3DProxy;
   import away3d.core.base.IRenderable;
   import away3d.animators.data.AnimationSubGeometry;
   import away3d.animators.data.AnimationRegisterCache;
   import away3d.cameras.Camera3D;
   import away3d.animators.ParticleAnimator;
   
   public class ParticleColorState extends ParticleStateBase
   {
       
      
      private var _particleColorNode:ParticleColorNode;
      
      private var _usesMultiplier:Boolean;
      
      private var _usesOffset:Boolean;
      
      private var _usesCycle:Boolean;
      
      private var _usesPhase:Boolean;
      
      private var _startColor:ColorTransform;
      
      private var _endColor:ColorTransform;
      
      private var _cycleDuration:Number;
      
      private var _cyclePhase:Number;
      
      private var _cycleData:Vector3D;
      
      private var _startMultiplierData:Vector3D;
      
      private var _deltaMultiplierData:Vector3D;
      
      private var _startOffsetData:Vector3D;
      
      private var _deltaOffsetData:Vector3D;
      
      public function ParticleColorState(param1:ParticleAnimator, param2:ParticleColorNode)
      {
         super(param1,param2);
         _particleColorNode = param2;
         _usesMultiplier = _particleColorNode._usesMultiplier;
         _usesOffset = _particleColorNode._usesOffset;
         _usesCycle = _particleColorNode._usesCycle;
         _usesPhase = _particleColorNode._usesPhase;
         _startColor = _particleColorNode._startColor;
         _endColor = _particleColorNode._endColor;
         _cycleDuration = _particleColorNode._cycleDuration;
         _cyclePhase = _particleColorNode._cyclePhase;
         updateColorData();
      }
      
      public function get startColor() : ColorTransform
      {
         return _startColor;
      }
      
      public function set startColor(param1:ColorTransform) : void
      {
         _startColor = param1;
         updateColorData();
      }
      
      public function get endColor() : ColorTransform
      {
         return _endColor;
      }
      
      public function set endColor(param1:ColorTransform) : void
      {
         _endColor = param1;
         updateColorData();
      }
      
      public function get cycleDuration() : Number
      {
         return _cycleDuration;
      }
      
      public function set cycleDuration(param1:Number) : void
      {
         _cycleDuration = param1;
         updateColorData();
      }
      
      public function get cyclePhase() : Number
      {
         return _cyclePhase;
      }
      
      public function set cyclePhase(param1:Number) : void
      {
         _cyclePhase = param1;
         updateColorData();
      }
      
      override public function setRenderState(param1:Stage3DProxy, param2:IRenderable, param3:AnimationSubGeometry, param4:AnimationRegisterCache, param5:Camera3D) : void
      {
         var _loc6_:* = 0;
         if(param4.needFragmentAnimation)
         {
            _loc6_ = uint(_particleColorNode.dataOffset);
            if(_usesCycle)
            {
               param4.setFragmentConst(param4.getRegisterIndex(_animationNode,8),_cycleData.x,_cycleData.y,_cycleData.z,_cycleData.w);
            }
            if(_registerIndex == null)
            {
               _registerIndex = param4.getRegisterIndexVectror(_animationNode);
            }
            if(_usesMultiplier)
            {
               if(_particleColorNode.mode == 1)
               {
                  param3.activateVertexBuffer(_registerIndex[0],_loc6_,param1,"float4");
                  _loc6_ = uint(_loc6_ + 4);
                  param3.activateVertexBuffer(_registerIndex[2],_loc6_,param1,"float4");
                  _loc6_ = uint(_loc6_ + 4);
               }
               else
               {
                  param4.setFragmentConst(_registerIndex[0],_startMultiplierData.x,_startMultiplierData.y,_startMultiplierData.z,_startMultiplierData.w);
                  param4.setFragmentConst(_registerIndex[2],_deltaMultiplierData.x,_deltaMultiplierData.y,_deltaMultiplierData.z,_deltaMultiplierData.w);
               }
            }
            if(_usesOffset)
            {
               if(_particleColorNode.mode == 1)
               {
                  param3.activateVertexBuffer(_registerIndex[4],_loc6_,param1,"float4");
                  _loc6_ = uint(_loc6_ + 4);
                  param3.activateVertexBuffer(_registerIndex[6],_loc6_,param1,"float4");
                  _loc6_ = uint(_loc6_ + 4);
               }
               else
               {
                  param4.setFragmentConst(_registerIndex[4],_startOffsetData.x,_startOffsetData.y,_startOffsetData.z,_startOffsetData.w);
                  param4.setFragmentConst(_registerIndex[6],_deltaOffsetData.x,_deltaOffsetData.y,_deltaOffsetData.z,_deltaOffsetData.w);
               }
            }
         }
      }
      
      private function updateColorData() : void
      {
         if(_particleColorNode.mode == 0)
         {
            if(_usesCycle)
            {
               if(_cycleDuration <= 0)
               {
                  throw new Error("the cycle duration must be greater than zero");
               }
               _cycleData = new Vector3D(3.14159265358979 * 2 / _cycleDuration,_cyclePhase * 3.14159265358979 / 180,0,0);
               if(_usesMultiplier)
               {
                  _startMultiplierData = new Vector3D((_startColor.redMultiplier + _endColor.redMultiplier) / 2,(_startColor.greenMultiplier + _endColor.greenMultiplier) / 2,(_startColor.blueMultiplier + _endColor.blueMultiplier) / 2,(_startColor.alphaMultiplier + _endColor.alphaMultiplier) / 2);
                  _deltaMultiplierData = new Vector3D((_endColor.redMultiplier - _startColor.redMultiplier) / 2,(_endColor.greenMultiplier - _startColor.greenMultiplier) / 2,(_endColor.blueMultiplier - _startColor.blueMultiplier) / 2,(_endColor.alphaMultiplier - _startColor.alphaMultiplier) / 2);
               }
               if(_usesOffset)
               {
                  _startOffsetData = new Vector3D((_startColor.redOffset + _endColor.redOffset) / 510,(_startColor.greenOffset + _endColor.greenOffset) / 510,(_startColor.blueOffset + _endColor.blueOffset) / 510,(_startColor.alphaOffset + _endColor.alphaOffset) / 510);
                  _deltaOffsetData = new Vector3D((_endColor.redOffset - _startColor.redOffset) / 510,(_endColor.greenOffset - _startColor.greenOffset) / 510,(_endColor.blueOffset - _startColor.blueOffset) / 510,(_endColor.alphaOffset - _startColor.alphaOffset) / 510);
               }
            }
            else
            {
               if(_usesMultiplier)
               {
                  _startMultiplierData = new Vector3D(_startColor.redMultiplier,_startColor.greenMultiplier,_startColor.blueMultiplier,_startColor.alphaMultiplier);
                  _deltaMultiplierData = new Vector3D(_endColor.redMultiplier - _startColor.redMultiplier,_endColor.greenMultiplier - _startColor.greenMultiplier,_endColor.blueMultiplier - _startColor.blueMultiplier,_endColor.alphaMultiplier - _startColor.alphaMultiplier);
               }
               if(_usesOffset)
               {
                  _startOffsetData = new Vector3D(_startColor.redOffset / 255,_startColor.greenOffset / 255,_startColor.blueOffset / 255,_startColor.alphaOffset / 255);
                  _deltaOffsetData = new Vector3D((_endColor.redOffset - _startColor.redOffset) / 255,(_endColor.greenOffset - _startColor.greenOffset) / 255,(_endColor.blueOffset - _startColor.blueOffset) / 255,(_endColor.alphaOffset - _startColor.alphaOffset) / 255);
               }
            }
         }
      }
   }
}
