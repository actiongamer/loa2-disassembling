package away3d.animators.states
{
   import flash.geom.ColorTransform;
   import away3d.animators.data.ColorSegmentPoint;
   import away3d.core.managers.Stage3DProxy;
   import away3d.core.base.IRenderable;
   import away3d.animators.data.AnimationSubGeometry;
   import away3d.animators.data.AnimationRegisterCache;
   import away3d.cameras.Camera3D;
   import away3d.animators.ParticleAnimator;
   import away3d.animators.nodes.ParticleSegmentedColorNode;
   
   public class ParticleSegmentedColorState extends ParticleStateBase
   {
       
      
      private var _usesMultiplier:Boolean;
      
      private var _usesOffset:Boolean;
      
      private var _startColor:ColorTransform;
      
      private var _endColor:ColorTransform;
      
      private var _segmentPoints:Vector.<ColorSegmentPoint>;
      
      private var _numSegmentPoint:int;
      
      private var _timeLifeData:Vector.<Number>;
      
      private var _multiplierData:Vector.<Number>;
      
      private var _offsetData:Vector.<Number>;
      
      public function ParticleSegmentedColorState(param1:ParticleAnimator, param2:ParticleSegmentedColorNode)
      {
         super(param1,param2);
         _usesMultiplier = param2._usesMultiplier;
         _usesOffset = param2._usesOffset;
         _startColor = param2._startColor;
         _endColor = param2._endColor;
         _segmentPoints = param2._segmentPoints;
         _numSegmentPoint = param2._numSegmentPoint;
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
      
      public function get numSegmentPoint() : int
      {
         return _numSegmentPoint;
      }
      
      public function get segmentPoints() : Vector.<ColorSegmentPoint>
      {
         return _segmentPoints;
      }
      
      public function set segmentPoints(param1:Vector.<ColorSegmentPoint>) : void
      {
         _segmentPoints = param1;
         updateColorData();
      }
      
      public function get usesMultiplier() : Boolean
      {
         return _usesMultiplier;
      }
      
      public function get usesOffset() : Boolean
      {
         return _usesOffset;
      }
      
      override public function setRenderState(param1:Stage3DProxy, param2:IRenderable, param3:AnimationSubGeometry, param4:AnimationRegisterCache, param5:Camera3D) : void
      {
         if(param4.needFragmentAnimation)
         {
            if(_numSegmentPoint > 0)
            {
               param4.setVertexConst(param4.getRegisterIndex(_animationNode,2),_timeLifeData[0],_timeLifeData[1],_timeLifeData[2],_timeLifeData[3]);
            }
            if(_usesMultiplier)
            {
               param4.setVertexConstFromVector(param4.getRegisterIndex(_animationNode,0),_multiplierData);
            }
            if(_usesOffset)
            {
               param4.setVertexConstFromVector(param4.getRegisterIndex(_animationNode,1),_offsetData);
            }
         }
      }
      
      private function updateColorData() : void
      {
         var _loc1_:int = 0;
         _timeLifeData = new Vector.<Number>();
         _multiplierData = new Vector.<Number>();
         _offsetData = new Vector.<Number>();
         _loc1_ = 0;
         while(_loc1_ < _numSegmentPoint)
         {
            if(_loc1_ == 0)
            {
               _timeLifeData.push(_segmentPoints[_loc1_].life);
            }
            else
            {
               _timeLifeData.push(_segmentPoints[_loc1_].life - _segmentPoints[_loc1_ - 1].life);
            }
            _loc1_++;
         }
         if(_numSegmentPoint == 0)
         {
            _timeLifeData.push(1);
         }
         else
         {
            _timeLifeData.push(1 - _segmentPoints[_loc1_ - 1].life);
         }
         if(_usesMultiplier)
         {
            _multiplierData.push(_startColor.redMultiplier,_startColor.greenMultiplier,_startColor.blueMultiplier,_startColor.alphaMultiplier);
            _loc1_ = 0;
            while(_loc1_ < _numSegmentPoint)
            {
               if(_loc1_ == 0)
               {
                  _multiplierData.push((_segmentPoints[_loc1_].color.redMultiplier - _startColor.redMultiplier) / _timeLifeData[_loc1_],(_segmentPoints[_loc1_].color.greenMultiplier - _startColor.greenMultiplier) / _timeLifeData[_loc1_],(_segmentPoints[_loc1_].color.blueMultiplier - _startColor.blueMultiplier) / _timeLifeData[_loc1_],(_segmentPoints[_loc1_].color.alphaMultiplier - _startColor.alphaMultiplier) / _timeLifeData[_loc1_]);
               }
               else
               {
                  _multiplierData.push((_segmentPoints[_loc1_].color.redMultiplier - _segmentPoints[_loc1_ - 1].color.redMultiplier) / _timeLifeData[_loc1_],(_segmentPoints[_loc1_].color.greenMultiplier - _segmentPoints[_loc1_ - 1].color.greenMultiplier) / _timeLifeData[_loc1_],(_segmentPoints[_loc1_].color.blueMultiplier - _segmentPoints[_loc1_ - 1].color.blueMultiplier) / _timeLifeData[_loc1_],(_segmentPoints[_loc1_].color.alphaMultiplier - _segmentPoints[_loc1_ - 1].color.alphaMultiplier) / _timeLifeData[_loc1_]);
               }
               _loc1_++;
            }
            if(_numSegmentPoint == 0)
            {
               _multiplierData.push(_endColor.redMultiplier - _startColor.redMultiplier,_endColor.greenMultiplier - _startColor.greenMultiplier,_endColor.blueMultiplier - _startColor.blueMultiplier,_endColor.alphaMultiplier - _startColor.alphaMultiplier);
            }
            else
            {
               _multiplierData.push((_endColor.redMultiplier - _segmentPoints[_loc1_ - 1].color.redMultiplier) / _timeLifeData[_loc1_],(_endColor.greenMultiplier - _segmentPoints[_loc1_ - 1].color.greenMultiplier) / _timeLifeData[_loc1_],(_endColor.blueMultiplier - _segmentPoints[_loc1_ - 1].color.blueMultiplier) / _timeLifeData[_loc1_],(_endColor.alphaMultiplier - _segmentPoints[_loc1_ - 1].color.alphaMultiplier) / _timeLifeData[_loc1_]);
            }
         }
         if(_usesOffset)
         {
            _offsetData.push(_startColor.redOffset / 255,_startColor.greenOffset / 255,_startColor.blueOffset / 255,_startColor.alphaOffset / 255);
            _loc1_ = 0;
            while(_loc1_ < _numSegmentPoint)
            {
               if(_loc1_ == 0)
               {
                  _offsetData.push((_segmentPoints[_loc1_].color.redOffset - _startColor.redOffset) / _timeLifeData[_loc1_] / 255,(_segmentPoints[_loc1_].color.greenOffset - _startColor.greenOffset) / _timeLifeData[_loc1_] / 255,(_segmentPoints[_loc1_].color.blueOffset - _startColor.blueOffset) / _timeLifeData[_loc1_] / 255,(_segmentPoints[_loc1_].color.alphaOffset - _startColor.alphaOffset) / _timeLifeData[_loc1_] / 255);
               }
               else
               {
                  _offsetData.push((_segmentPoints[_loc1_].color.redOffset - _segmentPoints[_loc1_ - 1].color.redOffset) / _timeLifeData[_loc1_] / 255,(_segmentPoints[_loc1_].color.greenOffset - _segmentPoints[_loc1_ - 1].color.greenOffset) / _timeLifeData[_loc1_] / 255,(_segmentPoints[_loc1_].color.blueOffset - _segmentPoints[_loc1_ - 1].color.blueOffset) / _timeLifeData[_loc1_] / 255,(_segmentPoints[_loc1_].color.alphaOffset - _segmentPoints[_loc1_ - 1].color.alphaOffset) / _timeLifeData[_loc1_] / 255);
               }
               _loc1_++;
            }
            if(_numSegmentPoint == 0)
            {
               _offsetData.push((_endColor.redOffset - _startColor.redOffset) / 255,(_endColor.greenOffset - _startColor.greenOffset) / 255,(_endColor.blueOffset - _startColor.blueOffset) / 255,(_endColor.alphaOffset - _startColor.alphaOffset) / 255);
            }
            else
            {
               _offsetData.push((_endColor.redOffset - _segmentPoints[_loc1_ - 1].color.redOffset) / _timeLifeData[_loc1_] / 255,(_endColor.greenOffset - _segmentPoints[_loc1_ - 1].color.greenOffset) / _timeLifeData[_loc1_] / 255,(_endColor.blueOffset - _segmentPoints[_loc1_ - 1].color.blueOffset) / _timeLifeData[_loc1_] / 255,(_endColor.alphaOffset - _segmentPoints[_loc1_ - 1].color.alphaOffset) / _timeLifeData[_loc1_] / 255);
            }
         }
         _timeLifeData.length = 4;
      }
   }
}
