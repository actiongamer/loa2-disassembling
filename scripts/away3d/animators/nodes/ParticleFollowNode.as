package away3d.animators.nodes
{
   import away3d.materials.passes.MaterialPassBase;
   import away3d.animators.data.AnimationRegisterCache;
   import §away3d:arcane§._usesRotation;
   import away3d.materials.compilation.ShaderRegisterElement;
   import §away3d:arcane§._usesPosition;
   import away3d.animators.states.ParticleFollowState;
   import away3d.animators.IAnimator;
   import §away3d:arcane§._smooth;
   
   public class ParticleFollowNode extends ParticleNodeBase
   {
      
      static const FOLLOW_POSITION_INDEX:uint = 0;
      
      static const FOLLOW_ROTATION_INDEX:uint = 1;
       
      
      var _usesPosition:Boolean;
      
      var _usesRotation:Boolean;
      
      var _smooth:Boolean;
      
      public function ParticleFollowNode(param1:Boolean = true, param2:Boolean = true, param3:Boolean = false)
      {
         _stateClass = ParticleFollowState;
         _usesPosition = param1;
         _usesRotation = param2;
         _smooth = param3;
         super("ParticleFollow",2,_usesPosition && _usesRotation?6:3,9);
      }
      
      override public function getAGALVertexCode(param1:MaterialPassBase, param2:AnimationRegisterCache) : String
      {
         var _loc6_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc11_:* = null;
         var _loc8_:int = 0;
         var _loc10_:int = 0;
         var _loc7_:* = null;
         param1 = param1;
         var _loc9_:String = "";
         if(_usesRotation)
         {
            _loc6_ = param2.getFreeVertexAttribute();
            param2.setRegisterIndex(this,1,_loc6_.index);
            _loc3_ = param2.getFreeVertexVectorTemp();
            param2.addVertexTempUsages(_loc3_,1);
            _loc4_ = param2.getFreeVertexVectorTemp();
            param2.addVertexTempUsages(_loc4_,1);
            _loc5_ = param2.getFreeVertexVectorTemp();
            if(param2.hasBillboard)
            {
               param2.addVertexTempUsages(_loc5_,1);
               _loc11_ = param2.getFreeVertexVectorTemp();
            }
            param2.removeVertexTempUsage(_loc3_);
            param2.removeVertexTempUsage(_loc4_);
            if(param2.hasBillboard)
            {
               param2.removeVertexTempUsage(_loc5_);
            }
            _loc8_ = param2.rotationRegisters.length;
            _loc9_ = _loc9_ + ("mov " + _loc3_ + "," + param2.vertexZeroConst + "\n");
            _loc9_ = _loc9_ + ("mov " + _loc3_ + ".x," + param2.vertexOneConst + "\n");
            _loc9_ = _loc9_ + ("mov " + _loc5_ + "," + param2.vertexZeroConst + "\n");
            _loc9_ = _loc9_ + ("sin " + _loc5_ + ".y," + _loc6_ + ".x\n");
            _loc9_ = _loc9_ + ("cos " + _loc5_ + ".z," + _loc6_ + ".x\n");
            _loc9_ = _loc9_ + ("mov " + _loc4_ + ".x," + param2.vertexZeroConst + "\n");
            _loc9_ = _loc9_ + ("mov " + _loc4_ + ".y," + _loc5_ + ".z\n");
            _loc9_ = _loc9_ + ("neg " + _loc4_ + ".z," + _loc5_ + ".y\n");
            if(param2.hasBillboard)
            {
               _loc9_ = _loc9_ + ("m33 " + _loc11_ + ".xyz," + param2.positionTarget + ".xyz," + _loc3_ + "\n");
            }
            else
            {
               _loc9_ = _loc9_ + ("m33 " + param2.scaleAndRotateTarget + ".xyz," + param2.scaleAndRotateTarget + ".xyz," + _loc3_ + "\n");
               _loc10_ = 0;
               while(_loc10_ < _loc8_)
               {
                  _loc9_ = _loc9_ + ("m33 " + param2.rotationRegisters[_loc10_] + ".xyz," + param2.rotationRegisters[_loc10_] + "," + _loc3_ + "\n");
                  _loc10_++;
               }
            }
            _loc9_ = _loc9_ + ("mov " + _loc3_ + "," + param2.vertexZeroConst + "\n");
            _loc9_ = _loc9_ + ("cos " + _loc3_ + ".x," + _loc6_ + ".y\n");
            _loc9_ = _loc9_ + ("sin " + _loc3_ + ".z," + _loc6_ + ".y\n");
            _loc9_ = _loc9_ + ("mov " + _loc4_ + "," + param2.vertexZeroConst + "\n");
            _loc9_ = _loc9_ + ("mov " + _loc4_ + ".y," + param2.vertexOneConst + "\n");
            _loc9_ = _loc9_ + ("mov " + _loc5_ + "," + param2.vertexZeroConst + "\n");
            _loc9_ = _loc9_ + ("neg " + _loc5_ + ".x," + _loc3_ + ".z\n");
            _loc9_ = _loc9_ + ("mov " + _loc5_ + ".z," + _loc3_ + ".x\n");
            if(param2.hasBillboard)
            {
               _loc9_ = _loc9_ + ("m33 " + _loc11_ + ".xyz," + _loc11_ + ".xyz," + _loc3_ + "\n");
            }
            else
            {
               _loc9_ = _loc9_ + ("m33 " + param2.scaleAndRotateTarget + ".xyz," + param2.scaleAndRotateTarget + ".xyz," + _loc3_ + "\n");
               _loc10_ = 0;
               while(_loc10_ < _loc8_)
               {
                  _loc9_ = _loc9_ + ("m33 " + param2.rotationRegisters[_loc10_] + ".xyz," + param2.rotationRegisters[_loc10_] + "," + _loc3_ + "\n");
                  _loc10_++;
               }
            }
            _loc9_ = _loc9_ + ("mov " + _loc4_ + "," + param2.vertexZeroConst + "\n");
            _loc9_ = _loc9_ + ("sin " + _loc4_ + ".x," + _loc6_ + ".z\n");
            _loc9_ = _loc9_ + ("cos " + _loc4_ + ".y," + _loc6_ + ".z\n");
            _loc9_ = _loc9_ + ("mov " + _loc3_ + "," + param2.vertexZeroConst + "\n");
            _loc9_ = _loc9_ + ("mov " + _loc3_ + ".x," + _loc4_ + ".y\n");
            _loc9_ = _loc9_ + ("neg " + _loc3_ + ".y," + _loc4_ + ".x\n");
            _loc9_ = _loc9_ + ("mov " + _loc5_ + "," + param2.vertexZeroConst + "\n");
            _loc9_ = _loc9_ + ("mov " + _loc5_ + ".z," + param2.vertexOneConst + "\n");
            if(param2.hasBillboard)
            {
               _loc9_ = _loc9_ + ("m33 " + _loc11_ + ".xyz," + _loc11_ + ".xyz," + _loc3_ + "\n");
               _loc9_ = _loc9_ + ("sub " + _loc11_ + ".xyz," + _loc11_ + ".xyz," + param2.positionTarget + ".xyz\n");
               _loc9_ = _loc9_ + ("add " + param2.scaleAndRotateTarget + ".xyz," + _loc11_ + ".xyz," + param2.scaleAndRotateTarget + ".xyz\n");
            }
            else
            {
               _loc9_ = _loc9_ + ("m33 " + param2.scaleAndRotateTarget + ".xyz," + param2.scaleAndRotateTarget + ".xyz," + _loc3_ + "\n");
               _loc10_ = 0;
               while(_loc10_ < _loc8_)
               {
                  _loc9_ = _loc9_ + ("m33 " + param2.rotationRegisters[_loc10_] + ".xyz," + param2.rotationRegisters[_loc10_] + "," + _loc3_ + "\n");
                  _loc10_++;
               }
            }
         }
         if(_usesPosition)
         {
            _loc7_ = param2.getFreeVertexAttribute();
            param2.setRegisterIndex(this,0,_loc7_.index);
            _loc9_ = _loc9_ + ("add " + param2.scaleAndRotateTarget + ".xyz," + _loc7_ + "," + param2.scaleAndRotateTarget + ".xyz\n");
         }
         return _loc9_;
      }
      
      public function getAnimationState(param1:IAnimator) : ParticleFollowState
      {
         return param1.getAnimationState(this) as ParticleFollowState;
      }
   }
}
