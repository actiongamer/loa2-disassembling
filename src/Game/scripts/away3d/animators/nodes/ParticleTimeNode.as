package away3d.animators.nodes
{
   import §away3d:arcane§._usesLooping;
   import away3d.materials.passes.MaterialPassBase;
   import away3d.animators.data.AnimationRegisterCache;
   import away3d.materials.compilation.ShaderRegisterElement;
   import §away3d:arcane§._usesDuration;
   import §away3d:arcane§._usesDelay;
   import away3d.animators.states.ParticleTimeState;
   import away3d.animators.IAnimator;
   import away3d.animators.data.ParticleProperties;
   
   public class ParticleTimeNode extends ParticleNodeBase
   {
      
      static const TIME_STREAM_INDEX:uint = 0;
      
      static const TIME_CONSTANT_INDEX:uint = 1;
       
      
      var _usesDuration:Boolean;
      
      var _usesDelay:Boolean;
      
      var _usesLooping:Boolean;
      
      public function ParticleTimeNode(param1:Boolean = false, param2:Boolean = false, param3:Boolean = false)
      {
         _stateClass = ParticleTimeState;
         _usesDuration = param1;
         _usesLooping = param2;
         _usesDelay = param3;
         super("ParticleTime",1,4,0);
      }
      
      public function get usesLooping() : Boolean
      {
         return _usesLooping;
      }
      
      override public function getAGALVertexCode(param1:MaterialPassBase, param2:AnimationRegisterCache) : String
      {
         var _loc5_:* = null;
         var _loc7_:* = null;
         var _loc4_:ShaderRegisterElement = param2.getFreeVertexAttribute();
         param2.vertexDuration = _loc4_;
         param2.setRegisterIndex(this,0,_loc4_.index);
         var _loc3_:ShaderRegisterElement = param2.getFreeVertexConstant();
         param2.setRegisterIndex(this,1,_loc3_.index);
         var _loc8_:String = "";
         _loc8_ = _loc8_ + ("sub " + param2.vertexTime + "," + _loc3_ + "," + _loc4_ + ".x\n");
         var _loc6_:ShaderRegisterElement = param2.getFreeVertexSingleTemp();
         _loc8_ = _loc8_ + ("sge " + _loc6_ + "," + param2.vertexTime + "," + param2.vertexZeroConst + "\n");
         _loc8_ = _loc8_ + ("mul " + param2.scaleAndRotateTarget + "," + param2.scaleAndRotateTarget + "," + _loc6_ + "\n");
         if(_usesDuration)
         {
            if(_usesLooping)
            {
               _loc5_ = param2.getFreeVertexSingleTemp();
               if(_usesDelay)
               {
                  _loc8_ = _loc8_ + ("div " + _loc5_ + "," + param2.vertexTime + "," + _loc4_ + ".z\n");
                  _loc8_ = _loc8_ + ("frc " + _loc5_ + "," + _loc5_ + "\n");
                  _loc8_ = _loc8_ + ("mul " + param2.vertexTime + "," + _loc5_ + "," + _loc4_ + ".z\n");
                  _loc8_ = _loc8_ + ("slt " + _loc5_ + "," + param2.vertexTime + "," + _loc4_ + ".y\n");
                  _loc8_ = _loc8_ + ("mul " + param2.scaleAndRotateTarget + "," + param2.scaleAndRotateTarget + "," + _loc5_ + "\n");
               }
               else
               {
                  _loc8_ = _loc8_ + ("mul " + _loc5_ + "," + param2.vertexTime + "," + _loc4_ + ".w\n");
                  _loc8_ = _loc8_ + ("frc " + _loc5_ + "," + _loc5_ + "\n");
                  _loc8_ = _loc8_ + ("mul " + param2.vertexTime + "," + _loc5_ + "," + _loc4_ + ".y\n");
               }
            }
            else
            {
               _loc7_ = param2.getFreeVertexSingleTemp();
               _loc8_ = _loc8_ + ("sge " + _loc7_ + "," + _loc4_ + ".y," + param2.vertexTime + "\n");
               _loc8_ = _loc8_ + ("mul " + param2.scaleAndRotateTarget + "," + param2.scaleAndRotateTarget + "," + _loc7_ + "\n");
            }
         }
         _loc8_ = _loc8_ + ("mul " + param2.vertexLife + "," + param2.vertexTime + "," + _loc4_ + ".w\n");
         if(param2.needFragmentAnimation && param2.hasColorNode)
         {
            _loc8_ = _loc8_ + ("mov " + param2.fragmentTime + "," + param2.vertexTime + "\n");
            _loc8_ = _loc8_ + ("mov " + param2.fragmentLife + "," + param2.vertexLife + "\n");
         }
         return _loc8_;
      }
      
      public function getAnimationState(param1:IAnimator) : ParticleTimeState
      {
         return param1.getAnimationState(this) as ParticleTimeState;
      }
      
      override function generatePropertyOfOneParticle(param1:ParticleProperties) : void
      {
         _oneData[0] = param1.startTime;
         _oneData[1] = param1.duration;
         _oneData[2] = param1.delay + param1.duration;
         _oneData[3] = 1 / param1.duration;
      }
   }
}
