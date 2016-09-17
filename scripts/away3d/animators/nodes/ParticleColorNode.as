package away3d.animators.nodes
{
   import flash.geom.ColorTransform;
   import away3d.materials.passes.MaterialPassBase;
   import away3d.animators.data.AnimationRegisterCache;
   import §away3d:arcane§._usesMultiplier;
   import away3d.materials.compilation.ShaderRegisterElement;
   import §away3d:arcane§._usesOffset;
   import §away3d:arcane§._usesCycle;
   import §away3d:arcane§._usesPhase;
   import away3d.animators.states.ParticleColorState;
   import away3d.animators.IAnimator;
   import away3d.animators.ParticleAnimationSet;
   import away3d.animators.data.ParticleProperties;
   import §away3d:arcane§._startColor;
   import §away3d:arcane§._endColor;
   import §away3d:arcane§._cycleDuration;
   import §away3d:arcane§._cyclePhase;
   
   public class ParticleColorNode extends ParticleNodeBase
   {
      
      static const START_MULTIPLIER_INDEX:uint = 0;
      
      static const VARYING_START_MULTIPLIER_INDEX:uint = 1;
      
      static const DELTA_MULTIPLIER_INDEX:uint = 2;
      
      static const VARYING_DELTA_MULTIPLIER_INDEX:uint = 3;
      
      static const START_OFFSET_INDEX:uint = 4;
      
      static const VARYING_START_OFFSET_INDEX:uint = 5;
      
      static const DELTA_OFFSET_INDEX:uint = 6;
      
      static const VARYING_DELTA_OFFSET_INDEX:uint = 7;
      
      static const CYCLE_INDEX:uint = 8;
      
      public static const COLOR_START_COLORTRANSFORM:String = "ColorStartColorTransform";
      
      public static const COLOR_END_COLORTRANSFORM:String = "ColorEndColorTransform";
       
      
      var _usesMultiplier:Boolean;
      
      var _usesOffset:Boolean;
      
      var _usesCycle:Boolean;
      
      var _usesPhase:Boolean;
      
      var _startColor:ColorTransform;
      
      var _endColor:ColorTransform;
      
      var _cycleDuration:Number;
      
      var _cyclePhase:Number;
      
      public function ParticleColorNode(param1:uint, param2:Boolean = true, param3:Boolean = true, param4:Boolean = false, param5:Boolean = false, param6:ColorTransform = null, param7:ColorTransform = null, param8:Number = 1, param9:Number = 0)
      {
         _stateClass = ParticleColorState;
         _usesMultiplier = param2;
         _usesOffset = param3;
         _usesCycle = param4;
         _usesPhase = param5;
         _startColor = param6 || new ColorTransform();
         _endColor = param7 || new ColorTransform();
         _cycleDuration = param8;
         _cyclePhase = param9;
         super("ParticleColor",param1,_usesMultiplier && _usesOffset?16:8);
      }
      
      override public function getAGALVertexCode(param1:MaterialPassBase, param2:AnimationRegisterCache) : String
      {
         var _loc3_:* = null;
         var _loc8_:* = null;
         var _loc11_:* = null;
         var _loc7_:* = null;
         var _loc10_:* = null;
         var _loc9_:* = null;
         var _loc5_:* = null;
         var _loc4_:* = null;
         var _loc6_:String = "";
         if(param2.needFragmentAnimation && _mode != 0)
         {
            if(_usesMultiplier)
            {
               _loc3_ = param2.getFreeVertexAttribute();
               param2.setRegisterIndex(this,0,_loc3_.index);
               _loc8_ = param2.getFreeVarying();
               param2.setRegisterIndex(this,1,_loc8_.index);
               _loc11_ = param2.getFreeVertexAttribute();
               param2.setRegisterIndex(this,2,_loc11_.index);
               _loc7_ = param2.getFreeVarying();
               param2.setRegisterIndex(this,3,_loc7_.index);
               _loc6_ = _loc6_ + ("mov " + _loc8_ + "," + _loc3_ + "\n");
               _loc6_ = _loc6_ + ("mov " + _loc7_ + "," + _loc11_ + "\n");
            }
            if(_usesOffset)
            {
               _loc10_ = param2.getFreeVertexAttribute();
               param2.setRegisterIndex(this,4,_loc10_.index);
               _loc9_ = param2.getFreeVarying();
               param2.setRegisterIndex(this,5,_loc9_.index);
               _loc5_ = param2.getFreeVertexAttribute();
               param2.setRegisterIndex(this,6,_loc5_.index);
               _loc4_ = param2.getFreeVarying();
               param2.setRegisterIndex(this,7,_loc4_.index);
               _loc6_ = _loc6_ + ("mov " + _loc9_ + "," + _loc10_ + "\n");
               _loc6_ = _loc6_ + ("mov " + _loc4_ + "," + _loc5_ + "\n");
            }
         }
         return _loc6_;
      }
      
      override public function getAGALFragmentCode(param1:MaterialPassBase, param2:AnimationRegisterCache) : String
      {
         var _loc6_:* = null;
         var _loc10_:* = null;
         var _loc4_:* = null;
         var _loc7_:* = null;
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc9_:* = null;
         var _loc8_:String = "";
         if(param2.needFragmentAnimation)
         {
            _loc6_ = param2.getFreeFragmentVectorTemp();
            if(_usesCycle)
            {
               _loc10_ = param2.getFreeFragmentConstant();
               param2.setRegisterIndex(this,8,_loc10_.index);
               param2.addFragmentTempUsages(_loc6_,1);
               _loc4_ = param2.getFreeFragmentSingleTemp();
               param2.removeFragmentTempUsage(_loc6_);
               _loc8_ = _loc8_ + ("mul " + _loc4_ + "," + param2.fragmentTime + "," + _loc10_ + ".x\n");
               if(_usesPhase)
               {
                  _loc8_ = _loc8_ + ("add " + _loc4_ + "," + _loc4_ + "," + _loc10_ + ".y\n");
               }
               _loc8_ = _loc8_ + ("sin " + _loc4_ + "," + _loc4_ + "\n");
            }
            if(_usesMultiplier)
            {
               _loc7_ = _mode == 0?param2.getFreeFragmentConstant():new ShaderRegisterElement("v",param2.getRegisterIndex(this,1));
               _loc3_ = _mode == 0?param2.getFreeFragmentConstant():new ShaderRegisterElement("v",param2.getRegisterIndex(this,3));
               param2.setRegisterIndex(this,0,_loc7_.index);
               param2.setRegisterIndex(this,2,_loc3_.index);
               _loc8_ = _loc8_ + ("mul " + _loc6_ + "," + _loc3_ + "," + (!!_usesCycle?_loc4_:param2.fragmentLife) + "\n");
               _loc8_ = _loc8_ + ("add " + _loc6_ + "," + _loc6_ + "," + _loc7_ + "\n");
               _loc8_ = _loc8_ + ("mul " + param2.colorTarget + "," + _loc6_ + "," + param2.colorTarget + "\n");
            }
            if(_usesOffset)
            {
               _loc5_ = _mode == 1?new ShaderRegisterElement("v",param2.getRegisterIndex(this,5)):param2.getFreeFragmentConstant();
               _loc9_ = _mode == 1?new ShaderRegisterElement("v",param2.getRegisterIndex(this,7)):param2.getFreeFragmentConstant();
               param2.setRegisterIndex(this,4,_loc5_.index);
               param2.setRegisterIndex(this,6,_loc9_.index);
               _loc8_ = _loc8_ + ("mul " + _loc6_ + "," + _loc9_ + "," + (!!_usesCycle?_loc4_:param2.fragmentLife) + "\n");
               _loc8_ = _loc8_ + ("add " + _loc6_ + "," + _loc6_ + "," + _loc5_ + "\n");
               _loc8_ = _loc8_ + ("add " + param2.colorTarget + "," + _loc6_ + "," + param2.colorTarget + "\n");
            }
         }
         return _loc8_;
      }
      
      public function getAnimationState(param1:IAnimator) : ParticleColorState
      {
         return param1.getAnimationState(this) as ParticleColorState;
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
      
      override function generatePropertyOfOneParticle(param1:ParticleProperties) : void
      {
         var _loc4_:int = 0;
         var _loc2_:ColorTransform = param1["ColorStartColorTransform"];
         if(!_loc2_)
         {
            throw new Error("there is no ColorStartColorTransform in param!");
         }
         var _loc3_:ColorTransform = param1["ColorEndColorTransform"];
         if(!_loc3_)
         {
            throw new Error("there is no ColorEndColorTransform in param!");
         }
         if(_usesCycle)
         {
            if(_usesMultiplier)
            {
               _oneData[_loc4_++] = _loc2_.redMultiplier;
               _oneData[_loc4_++] = _loc2_.greenMultiplier;
               _oneData[_loc4_++] = _loc2_.blueMultiplier;
               _oneData[_loc4_++] = _loc2_.alphaMultiplier;
               _oneData[_loc4_++] = _loc3_.redMultiplier - _loc2_.redMultiplier;
               _oneData[_loc4_++] = _loc3_.greenMultiplier - _loc2_.greenMultiplier;
               _oneData[_loc4_++] = _loc3_.blueMultiplier - _loc2_.blueMultiplier;
               _oneData[_loc4_++] = _loc3_.alphaMultiplier - _loc2_.alphaMultiplier;
            }
            if(_usesOffset)
            {
               _oneData[_loc4_++] = _loc2_.redOffset / 255;
               _oneData[_loc4_++] = _loc2_.greenOffset / 255;
               _oneData[_loc4_++] = _loc2_.blueOffset / 255;
               _oneData[_loc4_++] = _loc2_.alphaOffset / 255;
               _oneData[_loc4_++] = (_loc3_.redOffset - _loc2_.redOffset) / 255;
               _oneData[_loc4_++] = (_loc3_.greenOffset - _loc2_.greenOffset) / 255;
               _oneData[_loc4_++] = (_loc3_.blueOffset - _loc2_.blueOffset) / 255;
               _oneData[_loc4_++] = (_loc3_.alphaOffset - _loc2_.alphaOffset) / 255;
            }
         }
         else
         {
            if(_usesMultiplier)
            {
               _oneData[_loc4_++] = (_loc2_.redMultiplier + _loc3_.redMultiplier) / 2;
               _oneData[_loc4_++] = (_loc2_.greenMultiplier + _loc3_.greenMultiplier) / 2;
               _oneData[_loc4_++] = (_loc2_.blueMultiplier + _loc3_.blueMultiplier) / 2;
               _oneData[_loc4_++] = (_loc2_.alphaMultiplier + _loc3_.alphaMultiplier) / 2;
               _oneData[_loc4_++] = (_loc2_.redMultiplier - _loc3_.redMultiplier) / 2;
               _oneData[_loc4_++] = (_loc2_.greenMultiplier - _loc3_.greenMultiplier) / 2;
               _oneData[_loc4_++] = (_loc2_.blueMultiplier - _loc3_.blueMultiplier) / 2;
               _oneData[_loc4_++] = (_loc2_.alphaMultiplier - _loc3_.alphaMultiplier) / 2;
            }
            if(_usesOffset)
            {
               _oneData[_loc4_++] = (_loc2_.redOffset + _loc3_.redOffset) / 510;
               _oneData[_loc4_++] = (_loc2_.greenOffset + _loc3_.greenOffset) / 510;
               _oneData[_loc4_++] = (_loc2_.blueOffset + _loc3_.blueOffset) / 510;
               _oneData[_loc4_++] = (_loc2_.alphaOffset + _loc3_.alphaOffset) / 510;
               _oneData[_loc4_++] = (_loc2_.redOffset - _loc3_.redOffset) / 510;
               _oneData[_loc4_++] = (_loc2_.greenOffset - _loc3_.greenOffset) / 510;
               _oneData[_loc4_++] = (_loc2_.blueOffset - _loc3_.blueOffset) / 510;
               _oneData[_loc4_++] = (_loc2_.alphaOffset - _loc3_.alphaOffset) / 510;
            }
         }
      }
   }
}
