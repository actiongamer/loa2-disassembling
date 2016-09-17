package away3d.animators.nodes
{
   import flash.geom.Vector3D;
   import away3d.materials.passes.MaterialPassBase;
   import away3d.animators.data.AnimationRegisterCache;
   import away3d.materials.compilation.ShaderRegisterElement;
   import away3d.animators.states.ParticleAccelerationState;
   import away3d.animators.IAnimator;
   import away3d.animators.data.ParticleProperties;
   import §away3d:arcane§._acceleration;
   
   public class ParticleAccelerationNode extends ParticleNodeBase
   {
      
      static const ACCELERATION_INDEX:int = 0;
      
      public static const ACCELERATION_VECTOR3D:String = "AccelerationVector3D";
       
      
      var _acceleration:Vector3D;
      
      public function ParticleAccelerationNode(param1:uint, param2:Vector3D = null)
      {
         super("ParticleAcceleration",param1,3);
         _stateClass = ParticleAccelerationState;
         _acceleration = param2 || new Vector3D();
      }
      
      override public function getAGALVertexCode(param1:MaterialPassBase, param2:AnimationRegisterCache) : String
      {
         var _loc4_:* = null;
         var _loc3_:ShaderRegisterElement = _mode == 0?param2.getFreeVertexConstant():param2.getFreeVertexAttribute();
         param2.setRegisterIndex(this,0,_loc3_.index);
         var _loc5_:ShaderRegisterElement = param2.getFreeVertexVectorTemp();
         param2.addVertexTempUsages(_loc5_,1);
         var _loc6_:String = "mul " + _loc5_ + "," + param2.vertexTime + "," + _loc3_ + "\n";
         if(param2.needVelocity)
         {
            _loc4_ = param2.getFreeVertexVectorTemp();
            _loc6_ = _loc6_ + ("mul " + _loc4_ + "," + _loc5_ + "," + param2.vertexTwoConst + "\n");
            _loc6_ = _loc6_ + ("add " + param2.velocityTarget + ".xyz," + _loc4_ + ".xyz," + param2.velocityTarget + "\n");
         }
         param2.removeVertexTempUsage(_loc5_);
         _loc6_ = _loc6_ + ("mul " + _loc5_ + "," + _loc5_ + "," + param2.vertexTime + "\n");
         _loc6_ = _loc6_ + ("add " + param2.positionTarget + ".xyz," + _loc5_ + "," + param2.positionTarget + ".xyz\n");
         return _loc6_;
      }
      
      public function getAnimationState(param1:IAnimator) : ParticleAccelerationState
      {
         return param1.getAnimationState(this) as ParticleAccelerationState;
      }
      
      override function generatePropertyOfOneParticle(param1:ParticleProperties) : void
      {
         var _loc2_:Vector3D = param1["AccelerationVector3D"];
         if(!_loc2_)
         {
            throw new Error("there is no AccelerationVector3D in param!");
         }
         _oneData[0] = _loc2_.x / 2;
         _oneData[1] = _loc2_.y / 2;
         _oneData[2] = _loc2_.z / 2;
      }
   }
}
