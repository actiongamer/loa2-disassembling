package away3d.animators.nodes
{
   import flash.geom.Vector3D;
   import away3d.materials.passes.MaterialPassBase;
   import away3d.animators.data.AnimationRegisterCache;
   import away3d.materials.compilation.ShaderRegisterElement;
   import away3d.animators.states.ParticleRotationalVelocityState;
   import away3d.animators.IAnimator;
   import away3d.animators.data.ParticleProperties;
   import §away3d:arcane§._rotationalVelocity;
   
   public class ParticleRotationalVelocityNode extends ParticleNodeBase
   {
      
      static const ROTATIONALVELOCITY_INDEX:uint = 0;
      
      public static const ROTATIONALVELOCITY_VECTOR3D:String = "RotationalVelocityVector3D";
       
      
      var _rotationalVelocity:Vector3D;
      
      public function ParticleRotationalVelocityNode(param1:uint, param2:Vector3D = null)
      {
         _stateClass = ParticleRotationalVelocityState;
         super("ParticleRotationalVelocity",param1,4);
         _rotationalVelocity = param2 || new Vector3D();
      }
      
      override public function getAGALVertexCode(param1:MaterialPassBase, param2:AnimationRegisterCache) : String
      {
         var _loc6_:int = 0;
         param1 = param1;
         var _loc7_:ShaderRegisterElement = _mode == 0?param2.getFreeVertexConstant():param2.getFreeVertexAttribute();
         param2.setRegisterIndex(this,0,_loc7_.index);
         var _loc9_:ShaderRegisterElement = param2.getFreeVertexVectorTemp();
         param2.addVertexTempUsages(_loc9_,1);
         var _loc12_:ShaderRegisterElement = param2.getFreeVertexVectorTemp();
         param2.addVertexTempUsages(_loc12_,1);
         var _loc11_:ShaderRegisterElement = param2.getFreeVertexVectorTemp();
         param2.addVertexTempUsages(_loc11_,1);
         var _loc13_:ShaderRegisterElement = new ShaderRegisterElement(_loc11_.regName,_loc11_.index);
         var _loc8_:ShaderRegisterElement = param2.getFreeVertexVectorTemp();
         _loc8_ = new ShaderRegisterElement(_loc8_.regName,_loc8_.index);
         var _loc3_:ShaderRegisterElement = new ShaderRegisterElement(_loc13_.regName,_loc13_.index,3);
         var _loc10_:ShaderRegisterElement = new ShaderRegisterElement(_loc8_.regName,_loc8_.index,3);
         param2.removeVertexTempUsage(_loc9_);
         param2.removeVertexTempUsage(_loc12_);
         param2.removeVertexTempUsage(_loc11_);
         var _loc4_:String = "";
         _loc4_ = _loc4_ + ("mov " + _loc9_ + ".xyz," + _loc7_ + ".xyz\n");
         _loc4_ = _loc4_ + ("mov " + _loc9_ + ".w," + param2.vertexZeroConst + "\n");
         _loc4_ = _loc4_ + ("mul " + _loc3_ + "," + param2.vertexTime + "," + _loc7_ + ".w\n");
         _loc4_ = _loc4_ + ("sin " + _loc10_ + "," + _loc3_ + "\n");
         _loc4_ = _loc4_ + ("cos " + _loc3_ + "," + _loc3_ + "\n");
         _loc4_ = _loc4_ + ("mul " + _loc13_ + ".xyz," + _loc10_ + "," + _loc9_ + ".xyz\n");
         _loc4_ = _loc4_ + ("mul " + _loc8_ + ".xyz," + _loc10_ + "," + _loc9_ + ".xyz\n");
         _loc4_ = _loc4_ + ("neg " + _loc8_ + ".xyz," + _loc8_ + ".xyz\n");
         _loc4_ = _loc4_ + ("crs " + _loc9_ + ".xyz," + _loc13_ + ".xyz," + param2.scaleAndRotateTarget + ".xyz\n");
         _loc4_ = _loc4_ + ("mul " + _loc12_ + ".xyz," + _loc3_ + "," + param2.scaleAndRotateTarget + ".xyz\n");
         _loc4_ = _loc4_ + ("add " + _loc9_ + ".xyz," + _loc9_ + ".xyz," + _loc12_ + ".xyz\n");
         _loc4_ = _loc4_ + ("dp3 " + _loc12_ + ".w," + _loc13_ + ".xyz," + param2.scaleAndRotateTarget + ".xyz\n");
         _loc4_ = _loc4_ + ("neg " + _loc9_ + ".w," + _loc12_ + ".w\n");
         _loc4_ = _loc4_ + ("crs " + _loc13_ + ".xyz," + _loc9_ + ".xyz," + _loc8_ + ".xyz\n");
         _loc4_ = _loc4_ + ("mul " + _loc12_ + ".xyzw," + _loc9_ + ".xyzw," + _loc3_ + "\n");
         _loc4_ = _loc4_ + ("add " + _loc13_ + ".xyz," + _loc13_ + ".xyz," + _loc12_ + ".xyz\n");
         _loc4_ = _loc4_ + ("mul " + _loc12_ + ".xyz," + _loc9_ + ".w," + _loc8_ + ".xyz\n");
         _loc4_ = _loc4_ + ("add " + param2.scaleAndRotateTarget + ".xyz," + _loc13_ + ".xyz," + _loc12_ + ".xyz\n");
         var _loc5_:int = param2.rotationRegisters.length;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc4_ = _loc4_ + ("mov " + _loc9_ + ".xyz," + _loc7_ + ".xyz\n");
            _loc4_ = _loc4_ + ("mov " + _loc9_ + ".w," + param2.vertexZeroConst + "\n");
            _loc4_ = _loc4_ + ("mul " + _loc3_ + "," + param2.vertexTime + "," + _loc7_ + ".w\n");
            _loc4_ = _loc4_ + ("sin " + _loc10_ + "," + _loc3_ + "\n");
            _loc4_ = _loc4_ + ("cos " + _loc3_ + "," + _loc3_ + "\n");
            _loc4_ = _loc4_ + ("mul " + _loc13_ + ".xyz," + _loc10_ + "," + _loc9_ + ".xyz\n");
            _loc4_ = _loc4_ + ("mul " + _loc8_ + ".xyz," + _loc10_ + "," + _loc9_ + ".xyz\n");
            _loc4_ = _loc4_ + ("neg " + _loc8_ + ".xyz," + _loc8_ + ".xyz\n");
            _loc4_ = _loc4_ + ("crs " + _loc9_ + ".xyz," + _loc13_ + ".xyz," + param2.rotationRegisters[_loc6_] + ".xyz\n");
            _loc4_ = _loc4_ + ("mul " + _loc12_ + ".xyz," + _loc3_ + "," + param2.rotationRegisters[_loc6_] + "\n");
            _loc4_ = _loc4_ + ("add " + _loc9_ + ".xyz," + _loc9_ + ".xyz," + _loc12_ + ".xyz\n");
            _loc4_ = _loc4_ + ("dp3 " + _loc12_ + ".w," + _loc13_ + ".xyz," + param2.rotationRegisters[_loc6_] + "\n");
            _loc4_ = _loc4_ + ("neg " + _loc9_ + ".w," + _loc12_ + ".w\n");
            _loc4_ = _loc4_ + ("crs " + _loc13_ + ".xyz," + _loc9_ + ".xyz," + _loc8_ + ".xyz\n");
            _loc4_ = _loc4_ + ("mul " + _loc12_ + ".xyzw," + _loc9_ + ".xyzw," + _loc3_ + "\n");
            _loc4_ = _loc4_ + ("add " + _loc13_ + ".xyz," + _loc13_ + ".xyz," + _loc12_ + ".xyz\n");
            _loc4_ = _loc4_ + ("mul " + _loc12_ + ".xyz," + _loc9_ + ".w," + _loc8_ + ".xyz\n");
            _loc4_ = _loc4_ + ("add " + param2.rotationRegisters[_loc6_] + "," + _loc13_ + ".xyz," + _loc12_ + ".xyz\n");
            _loc6_++;
         }
         return _loc4_;
      }
      
      public function getAnimationState(param1:IAnimator) : ParticleRotationalVelocityState
      {
         return param1.getAnimationState(this) as ParticleRotationalVelocityState;
      }
      
      override function generatePropertyOfOneParticle(param1:ParticleProperties) : void
      {
         var _loc2_:Vector3D = param1["RotationalVelocityVector3D"];
         if(!_loc2_)
         {
            throw new Error("there is no RotationalVelocityVector3D in param!");
         }
         if(_loc2_.length <= 0)
         {
            _loc2_.z = 1;
         }
         else
         {
            _loc2_.normalize();
         }
         _oneData[0] = _loc2_.x;
         _oneData[1] = _loc2_.y;
         _oneData[2] = _loc2_.z;
         if(_loc2_.w <= 0)
         {
            throw new Error("the cycle duration must greater than zero");
         }
         _oneData[3] = 3.14159265358979 / _loc2_.w;
      }
   }
}
