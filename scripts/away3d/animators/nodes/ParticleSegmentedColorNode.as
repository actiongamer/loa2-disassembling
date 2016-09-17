package away3d.animators.nodes
{
   import flash.geom.ColorTransform;
   import away3d.animators.data.ColorSegmentPoint;
   import away3d.animators.ParticleAnimationSet;
   import §away3d:arcane§._usesMultiplier;
   import §away3d:arcane§._usesOffset;
   import away3d.materials.passes.MaterialPassBase;
   import away3d.animators.data.AnimationRegisterCache;
   import away3d.materials.compilation.ShaderRegisterElement;
   import §away3d:arcane§._numSegmentPoint;
   import away3d.animators.states.ParticleSegmentedColorState;
   import §away3d:arcane§._startColor;
   import §away3d:arcane§._endColor;
   import §away3d:arcane§._segmentPoints;
   
   public class ParticleSegmentedColorNode extends ParticleNodeBase
   {
      
      static const START_MULTIPLIER_INDEX:uint = 0;
      
      static const START_OFFSET_INDEX:uint = 1;
      
      static const TIME_DATA_INDEX:uint = 2;
       
      
      var _usesMultiplier:Boolean;
      
      var _usesOffset:Boolean;
      
      var _startColor:ColorTransform;
      
      var _endColor:ColorTransform;
      
      var _numSegmentPoint:int;
      
      var _segmentPoints:Vector.<ColorSegmentPoint>;
      
      public function ParticleSegmentedColorNode(param1:Boolean, param2:Boolean, param3:int, param4:ColorTransform, param5:ColorTransform, param6:Vector.<ColorSegmentPoint>)
      {
         _stateClass = ParticleSegmentedColorState;
         super("ParticleSegmentedColor",0,0,18);
         if(param3 > 4)
         {
            throw new Error("the numSegmentPoint must be less or equal 4");
         }
         _usesMultiplier = param1;
         _usesOffset = param2;
         _numSegmentPoint = param3;
         _startColor = param4;
         _endColor = param5;
         _segmentPoints = param6;
      }
      
      override function processAnimationSetting(param1:ParticleAnimationSet) : void
      {
         if(_usesMultiplier)
         {
            param1.hasColorMulNode = true;
         }
         if(_usesOffset)
         {
            param1.hasColorAddNode = true;
         }
      }
      
      override public function getAGALVertexCode(param1:MaterialPassBase, param2:AnimationRegisterCache) : String
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc13_:* = null;
         var _loc9_:* = null;
         var _loc7_:* = null;
         var _loc10_:* = null;
         var _loc8_:int = 0;
         var _loc11_:* = null;
         var _loc12_:* = undefined;
         var _loc5_:* = null;
         var _loc14_:* = undefined;
         param1 = param1;
         var _loc6_:String = "";
         if(param2.needFragmentAnimation)
         {
            if(_usesMultiplier)
            {
               _loc3_ = param2.getFreeVertexVectorTemp();
               param2.addVertexTempUsages(_loc3_,1);
            }
            _loc4_ = param2.getFreeVertexVectorTemp();
            param2.addVertexTempUsages(_loc4_,1);
            _loc13_ = param2.getFreeVertexVectorTemp();
            _loc9_ = new ShaderRegisterElement(_loc13_.regName,_loc13_.index,0);
            _loc7_ = new ShaderRegisterElement(_loc13_.regName,_loc13_.index,1);
            if(_usesMultiplier)
            {
               param2.removeVertexTempUsage(_loc3_);
            }
            param2.removeVertexTempUsage(_loc4_);
            _loc10_ = param2.getFreeVertexConstant();
            param2.setRegisterIndex(this,2,_loc10_.index);
            if(_usesMultiplier)
            {
               _loc11_ = param2.getFreeVertexConstant();
               param2.setRegisterIndex(this,0,_loc11_.index);
               _loc12_ = new Vector.<ShaderRegisterElement>();
               _loc8_ = 0;
               while(_loc8_ < _numSegmentPoint + 1)
               {
                  _loc12_.push(param2.getFreeVertexConstant());
                  _loc8_++;
               }
            }
            if(_usesOffset)
            {
               _loc5_ = param2.getFreeVertexConstant();
               param2.setRegisterIndex(this,1,_loc5_.index);
               _loc14_ = new Vector.<ShaderRegisterElement>();
               _loc8_ = 0;
               while(_loc8_ < _numSegmentPoint + 1)
               {
                  _loc14_.push(param2.getFreeVertexConstant());
                  _loc8_++;
               }
            }
            if(_usesMultiplier)
            {
               _loc6_ = _loc6_ + ("mov " + _loc3_ + "," + _loc11_ + "\n");
            }
            if(_usesOffset)
            {
               _loc6_ = _loc6_ + ("add " + param2.colorAddTarget + "," + param2.colorAddTarget + "," + _loc5_ + "\n");
            }
            _loc8_ = 0;
            while(_loc8_ < _numSegmentPoint)
            {
               switch(int(_loc8_))
               {
                  case 0:
                     _loc6_ = _loc6_ + ("min " + _loc7_ + "," + param2.vertexLife + "," + _loc10_ + ".x\n");
                     break;
                  case 1:
                     _loc6_ = _loc6_ + ("sub " + _loc9_ + "," + param2.vertexLife + "," + _loc10_ + ".x\n");
                     _loc6_ = _loc6_ + ("max " + _loc7_ + "," + _loc9_ + "," + param2.vertexZeroConst + "\n");
                     _loc6_ = _loc6_ + ("min " + _loc7_ + "," + _loc7_ + "," + _loc10_ + ".y\n");
                     break;
                  case 2:
                     _loc6_ = _loc6_ + ("sub " + _loc9_ + "," + _loc9_ + "," + _loc10_ + ".y\n");
                     _loc6_ = _loc6_ + ("max " + _loc7_ + "," + _loc9_ + "," + param2.vertexZeroConst + "\n");
                     _loc6_ = _loc6_ + ("min " + _loc7_ + "," + _loc7_ + "," + _loc10_ + ".z\n");
                     break;
                  case 3:
                     _loc6_ = _loc6_ + ("sub " + _loc9_ + "," + _loc9_ + "," + _loc10_ + ".z\n");
                     _loc6_ = _loc6_ + ("max " + _loc7_ + "," + _loc9_ + "," + param2.vertexZeroConst + "\n");
                     _loc6_ = _loc6_ + ("min " + _loc7_ + "," + _loc7_ + "," + _loc10_ + ".w\n");
               }
               if(_usesMultiplier)
               {
                  _loc6_ = _loc6_ + ("mul " + _loc4_ + "," + _loc7_ + "," + _loc12_[_loc8_] + "\n");
                  _loc6_ = _loc6_ + ("add " + _loc3_ + "," + _loc3_ + "," + _loc4_ + "\n");
               }
               if(_usesOffset)
               {
                  _loc6_ = _loc6_ + ("mul " + _loc4_ + "," + _loc7_ + "," + _loc14_[_loc8_] + "\n");
                  _loc6_ = _loc6_ + ("add " + param2.colorAddTarget + "," + param2.colorAddTarget + "," + _loc4_ + "\n");
               }
               _loc8_++;
            }
            if(_numSegmentPoint == 0)
            {
               _loc7_ = param2.vertexLife;
            }
            else
            {
               switch(int(_numSegmentPoint) - 1)
               {
                  case 0:
                     _loc6_ = _loc6_ + ("sub " + _loc9_ + "," + param2.vertexLife + "," + _loc10_ + ".x\n");
                     break;
                  case 1:
                     _loc6_ = _loc6_ + ("sub " + _loc9_ + "," + _loc9_ + "," + _loc10_ + ".y\n");
                     break;
                  case 2:
                     _loc6_ = _loc6_ + ("sub " + _loc9_ + "," + _loc9_ + "," + _loc10_ + ".z\n");
                     break;
                  case 3:
                     _loc6_ = _loc6_ + ("sub " + _loc9_ + "," + _loc9_ + "," + _loc10_ + ".w\n");
               }
               _loc6_ = _loc6_ + ("max " + _loc7_ + "," + _loc9_ + "," + param2.vertexZeroConst + "\n");
            }
            if(_usesMultiplier)
            {
               _loc6_ = _loc6_ + ("mul " + _loc4_ + "," + _loc7_ + "," + _loc12_[_numSegmentPoint] + "\n");
               _loc6_ = _loc6_ + ("add " + _loc3_ + "," + _loc3_ + "," + _loc4_ + "\n");
               _loc6_ = _loc6_ + ("mul " + param2.colorMulTarget + "," + param2.colorMulTarget + "," + _loc3_ + "\n");
            }
            if(_usesOffset)
            {
               _loc6_ = _loc6_ + ("mul " + _loc4_ + "," + _loc7_ + "," + _loc14_[_numSegmentPoint] + "\n");
               _loc6_ = _loc6_ + ("add " + param2.colorAddTarget + "," + param2.colorAddTarget + "," + _loc4_ + "\n");
            }
         }
         return _loc6_;
      }
   }
}
