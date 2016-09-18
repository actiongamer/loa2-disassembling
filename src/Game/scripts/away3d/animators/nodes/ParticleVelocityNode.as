package away3d.animators.nodes
{
   import flash.geom.Vector3D;
   import away3d.materials.passes.MaterialPassBase;
   import away3d.animators.data.AnimationRegisterCache;
   import away3d.materials.compilation.ShaderRegisterElement;
   import away3d.animators.states.ParticleVelocityState;
   import away3d.animators.IAnimator;
   import away3d.animators.data.ParticleProperties;
   import §away3d:arcane§._velocity;
   
   public class ParticleVelocityNode extends ParticleNodeBase
   {
      
      static const VELOCITY_INDEX:int = 0;
      
      public static const VELOCITY_VECTOR3D:String = "VelocityVector3D";
       
      
      var _velocity:Vector3D;
      
      public function ParticleVelocityNode(param1:uint, param2:Vector3D = null)
      {
         super("ParticleVelocity",param1,3);
         _stateClass = ParticleVelocityState;
         _velocity = param2 || new Vector3D();
      }
      
      override public function getAGALVertexCode(param1:MaterialPassBase, param2:AnimationRegisterCache) : String
      {
         var _loc5_:ShaderRegisterElement = _mode == 0?param2.getFreeVertexConstant():param2.getFreeVertexAttribute();
         param2.setRegisterIndex(this,0,_loc5_.index);
         var _loc3_:ShaderRegisterElement = param2.getFreeVertexVectorTemp();
         var _loc4_:String = "";
         _loc4_ = _loc4_ + ("mul " + _loc3_ + "," + param2.vertexTime + "," + _loc5_ + "\n");
         _loc4_ = _loc4_ + ("add " + param2.positionTarget + "," + _loc3_ + "," + param2.positionTarget + "\n");
         if(param2.needVelocity)
         {
            _loc4_ = _loc4_ + ("add " + param2.velocityTarget + ".xyz," + _loc5_ + ".xyz," + param2.velocityTarget + "\n");
         }
         return _loc4_;
      }
      
      public function getAnimationState(param1:IAnimator) : ParticleVelocityState
      {
         return param1.getAnimationState(this) as ParticleVelocityState;
      }
      
      override function generatePropertyOfOneParticle(param1:ParticleProperties) : void
      {
         var _loc2_:Vector3D = param1["VelocityVector3D"];
         if(!_loc2_)
         {
            throw new Error("there is no VelocityVector3D in param!");
         }
         _oneData[0] = _loc2_.x;
         _oneData[1] = _loc2_.y;
         _oneData[2] = _loc2_.z;
      }
   }
}
