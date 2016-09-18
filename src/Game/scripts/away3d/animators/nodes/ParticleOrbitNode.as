package away3d.animators.nodes
{
   import flash.geom.Vector3D;
   import away3d.materials.passes.MaterialPassBase;
   import away3d.animators.data.AnimationRegisterCache;
   import away3d.materials.compilation.ShaderRegisterElement;
   import §away3d:arcane§._usesCycle;
   import §away3d:arcane§._usesPhase;
   import §away3d:arcane§._usesEulers;
   import away3d.animators.states.ParticleOrbitState;
   import away3d.animators.IAnimator;
   import away3d.animators.data.ParticleProperties;
   import §away3d:arcane§._radius;
   import §away3d:arcane§._cycleDuration;
   import §away3d:arcane§._cyclePhase;
   import §away3d:arcane§._eulers;
   
   public class ParticleOrbitNode extends ParticleNodeBase
   {
      
      static const ORBIT_INDEX:uint = 0;
      
      static const EULERS_INDEX:uint = 1;
      
      public static const ORBIT_VECTOR3D:String = "OrbitVector3D";
       
      
      var _usesEulers:Boolean;
      
      var _usesCycle:Boolean;
      
      var _usesPhase:Boolean;
      
      var _radius:Number;
      
      var _cycleDuration:Number;
      
      var _cyclePhase:Number;
      
      var _eulers:Vector3D;
      
      public function ParticleOrbitNode(param1:uint, param2:Boolean = true, param3:Boolean = false, param4:Boolean = false, param5:Number = 100, param6:Number = 1, param7:Number = 0, param8:Vector3D = null)
      {
         var _loc9_:int = 3;
         if(param4)
         {
            _loc9_++;
         }
         super("ParticleOrbit",param1,_loc9_);
         _stateClass = ParticleOrbitState;
         _usesEulers = param2;
         _usesCycle = param3;
         _usesPhase = param4;
         _radius = param5;
         _cycleDuration = param6;
         _cyclePhase = param7;
         _eulers = param8 || new Vector3D();
      }
      
      override public function getAGALVertexCode(param1:MaterialPassBase, param2:AnimationRegisterCache) : String
      {
         var _loc8_:ShaderRegisterElement = _mode == 0?param2.getFreeVertexConstant():param2.getFreeVertexAttribute();
         param2.setRegisterIndex(this,0,_loc8_.index);
         var _loc3_:ShaderRegisterElement = param2.getFreeVertexConstant();
         param2.setRegisterIndex(this,1,_loc3_.index);
         param2.getFreeVertexConstant();
         param2.getFreeVertexConstant();
         param2.getFreeVertexConstant();
         var _loc4_:ShaderRegisterElement = param2.getFreeVertexVectorTemp();
         param2.addVertexTempUsages(_loc4_,1);
         var _loc6_:ShaderRegisterElement = new ShaderRegisterElement(_loc4_.regName,_loc4_.index);
         var _loc5_:ShaderRegisterElement = param2.getFreeVertexVectorTemp();
         var _loc9_:ShaderRegisterElement = new ShaderRegisterElement(_loc5_.regName,_loc5_.index,0);
         var _loc10_:ShaderRegisterElement = new ShaderRegisterElement(_loc5_.regName,_loc5_.index,1);
         var _loc7_:ShaderRegisterElement = new ShaderRegisterElement(_loc5_.regName,_loc5_.index,2);
         param2.removeVertexTempUsage(_loc4_);
         var _loc11_:String = "";
         if(_usesCycle)
         {
            _loc11_ = _loc11_ + ("mul " + _loc7_ + "," + param2.vertexTime + "," + _loc8_ + ".y\n");
            if(_usesPhase)
            {
               _loc11_ = _loc11_ + ("add " + _loc7_ + "," + _loc7_ + "," + _loc8_ + ".w\n");
            }
         }
         else
         {
            _loc11_ = _loc11_ + ("mul " + _loc7_ + "," + param2.vertexLife + "," + _loc8_ + ".y\n");
         }
         _loc11_ = _loc11_ + ("cos " + _loc9_ + "," + _loc7_ + "\n");
         _loc11_ = _loc11_ + ("sin " + _loc10_ + "," + _loc7_ + "\n");
         _loc11_ = _loc11_ + ("mul " + _loc6_ + ".x," + _loc9_ + "," + _loc8_ + ".x\n");
         _loc11_ = _loc11_ + ("mul " + _loc6_ + ".y," + _loc10_ + "," + _loc8_ + ".x\n");
         _loc11_ = _loc11_ + ("mov " + _loc6_ + ".wz" + param2.vertexZeroConst + "\n");
         if(_usesEulers)
         {
            _loc11_ = _loc11_ + ("m44 " + _loc6_ + "," + _loc6_ + "," + _loc3_ + "\n");
         }
         _loc11_ = _loc11_ + ("add " + param2.positionTarget + ".xyz," + _loc6_ + ".xyz," + param2.positionTarget + ".xyz\n");
         if(param2.needVelocity)
         {
            _loc11_ = _loc11_ + ("neg " + _loc6_ + ".x," + _loc10_ + "\n");
            _loc11_ = _loc11_ + ("mov " + _loc6_ + ".y," + _loc9_ + "\n");
            _loc11_ = _loc11_ + ("mov " + _loc6_ + ".zw," + param2.vertexZeroConst + "\n");
            if(_usesEulers)
            {
               _loc11_ = _loc11_ + ("m44 " + _loc6_ + "," + _loc6_ + "," + _loc3_ + "\n");
            }
            _loc11_ = _loc11_ + ("mul " + _loc6_ + "," + _loc6_ + "," + _loc8_ + ".z\n");
            _loc11_ = _loc11_ + ("div " + _loc6_ + "," + _loc6_ + "," + _loc8_ + ".y\n");
            if(!_usesCycle)
            {
               _loc11_ = _loc11_ + ("div " + _loc6_ + "," + _loc6_ + "," + param2.vertexLife + "\n");
            }
            _loc11_ = _loc11_ + ("add " + param2.velocityTarget + ".xyz," + param2.velocityTarget + ".xyz," + _loc6_ + ".xyz\n");
         }
         return _loc11_;
      }
      
      public function getAnimationState(param1:IAnimator) : ParticleOrbitState
      {
         return param1.getAnimationState(this) as ParticleOrbitState;
      }
      
      override function generatePropertyOfOneParticle(param1:ParticleProperties) : void
      {
         var _loc2_:Vector3D = param1["OrbitVector3D"];
         if(!_loc2_)
         {
            throw new Error("there is no OrbitVector3D in param!");
         }
         _oneData[0] = _loc2_.x;
         if(_usesCycle && _loc2_.y <= 0)
         {
            throw new Error("the cycle duration must be greater than zero");
         }
         _oneData[1] = 3.14159265358979 * 2 / (!_usesCycle?1:Number(_loc2_.y));
         _oneData[2] = _loc2_.x * 3.14159265358979 * 2;
         if(_usesPhase)
         {
            _oneData[3] = _loc2_.z * 3.14159265358979 / 180;
         }
      }
   }
}
