package away3d.animators.nodes
{
   import flash.geom.Vector3D;
   import away3d.materials.passes.MaterialPassBase;
   import away3d.animators.data.AnimationRegisterCache;
   import away3d.materials.compilation.ShaderRegisterElement;
   import away3d.animators.states.ParticleOscillatorState;
   import away3d.animators.IAnimator;
   import away3d.animators.data.ParticleProperties;
   import §away3d:arcane§._oscillator;
   
   public class ParticleOscillatorNode extends ParticleNodeBase
   {
      
      static const OSCILLATOR_INDEX:uint = 0;
      
      public static const OSCILLATOR_VECTOR3D:String = "OscillatorVector3D";
       
      
      var _oscillator:Vector3D;
      
      public function ParticleOscillatorNode(param1:uint, param2:Vector3D = null)
      {
         super("ParticleOscillator",param1,4);
         _stateClass = ParticleOscillatorState;
         _oscillator = param2 || new Vector3D();
      }
      
      override public function getAGALVertexCode(param1:MaterialPassBase, param2:AnimationRegisterCache) : String
      {
         var _loc9_:ShaderRegisterElement = _mode == 0?param2.getFreeVertexConstant():param2.getFreeVertexAttribute();
         param2.setRegisterIndex(this,0,_loc9_.index);
         var _loc7_:ShaderRegisterElement = param2.getFreeVertexVectorTemp();
         var _loc10_:ShaderRegisterElement = new ShaderRegisterElement(_loc7_.regName,_loc7_.index,0);
         var _loc6_:ShaderRegisterElement = new ShaderRegisterElement(_loc7_.regName,_loc7_.index,1);
         var _loc5_:ShaderRegisterElement = new ShaderRegisterElement(_loc7_.regName,_loc7_.index,2);
         param2.addVertexTempUsages(_loc7_,1);
         var _loc4_:ShaderRegisterElement = param2.getFreeVertexVectorTemp();
         var _loc3_:ShaderRegisterElement = new ShaderRegisterElement(_loc4_.regName,_loc4_.index,5);
         param2.removeVertexTempUsage(_loc7_);
         var _loc8_:String = "";
         _loc8_ = _loc8_ + ("mul " + _loc10_ + "," + param2.vertexTime + "," + _loc9_ + ".w\n");
         _loc8_ = _loc8_ + ("sin " + _loc6_ + "," + _loc10_ + "\n");
         _loc8_ = _loc8_ + ("mul " + _loc3_ + "," + _loc6_ + "," + _loc9_ + ".xyz\n");
         _loc8_ = _loc8_ + ("add " + param2.positionTarget + "," + _loc3_ + "," + param2.positionTarget + "\n");
         if(param2.needVelocity)
         {
            _loc8_ = _loc8_ + ("cos " + _loc5_ + "," + _loc10_ + "\n");
            _loc8_ = _loc8_ + ("mul " + _loc3_ + "," + _loc5_ + "," + _loc9_ + ".xyz\n");
            _loc8_ = _loc8_ + ("add " + param2.velocityTarget + ".xyz," + _loc3_ + "," + param2.velocityTarget + ".xyz\n");
         }
         return _loc8_;
      }
      
      public function getAnimationState(param1:IAnimator) : ParticleOscillatorState
      {
         return param1.getAnimationState(this) as ParticleOscillatorState;
      }
      
      override function generatePropertyOfOneParticle(param1:ParticleProperties) : void
      {
         var _loc2_:Vector3D = param1["OscillatorVector3D"];
         if(!_loc2_)
         {
            throw new Error("there is no OscillatorVector3D in param!");
         }
         _oneData[0] = _loc2_.x;
         _oneData[1] = _loc2_.y;
         _oneData[2] = _loc2_.z;
         if(_loc2_.w <= 0)
         {
            throw new Error("the cycle duration must greater than zero");
         }
         _oneData[3] = 3.14159265358979 * 2 / _loc2_.w;
      }
   }
}
