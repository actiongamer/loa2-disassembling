package away3d.animators.nodes
{
   import flash.geom.Vector3D;
   import away3d.materials.passes.MaterialPassBase;
   import away3d.animators.data.AnimationRegisterCache;
   import away3d.materials.compilation.ShaderRegisterElement;
   import away3d.animators.states.ParticlePositionState;
   import away3d.animators.IAnimator;
   import away3d.animators.data.ParticleProperties;
   import §away3d:arcane§._position;
   
   public class ParticlePositionNode extends ParticleNodeBase
   {
      
      static const POSITION_INDEX:uint = 0;
      
      public static const POSITION_VECTOR3D:String = "PositionVector3D";
       
      
      var _position:Vector3D;
      
      public function ParticlePositionNode(param1:uint, param2:Vector3D = null)
      {
         super("ParticlePosition",param1,3);
         _stateClass = ParticlePositionState;
         _position = param2 || new Vector3D();
      }
      
      override public function getAGALVertexCode(param1:MaterialPassBase, param2:AnimationRegisterCache) : String
      {
         var _loc3_:ShaderRegisterElement = _mode == 0?param2.getFreeVertexConstant():param2.getFreeVertexAttribute();
         param2.setRegisterIndex(this,0,_loc3_.index);
         return "add " + param2.positionTarget + "," + _loc3_ + ".xyz," + param2.positionTarget + "\n";
      }
      
      public function getAnimationState(param1:IAnimator) : ParticlePositionState
      {
         return param1.getAnimationState(this) as ParticlePositionState;
      }
      
      override function generatePropertyOfOneParticle(param1:ParticleProperties) : void
      {
         var _loc2_:Vector3D = param1["PositionVector3D"];
         if(!_loc2_)
         {
            throw new Error("there is no PositionVector3D in param!");
         }
         _oneData[0] = _loc2_.x;
         _oneData[1] = _loc2_.y;
         _oneData[2] = _loc2_.z;
      }
   }
}
