package org.specter3d.display.particle.extend
{
   import away3d.animators.nodes.ParticleNodeBase;
   import flash.geom.Vector3D;
   import away3d.materials.passes.MaterialPassBase;
   import away3d.animators.data.AnimationRegisterCache;
   import away3d.materials.compilation.ShaderRegisterElement;
   import away3d.animators.IAnimator;
   import §away3d:arcane§.dataOffset;
   import away3d.animators.data.ParticleProperties;
   
   public class ParticleDampNode extends ParticleNodeBase
   {
      
      public static const DAMP_INDEX:int = 0;
      
      public static const DAMP_VECTOR3D:String = "damp_vector3d";
       
      
      public var damp:Vector3D;
      
      public function ParticleDampNode(param1:uint, param2:Vector3D = null)
      {
         super("ParticleDamp",param1,3);
         _stateClass = ParticleDampState;
         damp = param2 || new Vector3D();
      }
      
      override public function getAGALVertexCode(param1:MaterialPassBase, param2:AnimationRegisterCache) : String
      {
         var _loc6_:String = "";
         var _loc5_:ShaderRegisterElement = _mode == 0?param2.getFreeVertexConstant():param2.getFreeVertexAttribute();
         param2.setRegisterIndex(this,0,_loc5_.index);
         var _loc3_:ShaderRegisterElement = param2.getFreeVertexVectorTemp();
         param2.addVertexTempUsages(_loc3_,1);
         _loc6_ = _loc6_ + ("sub " + _loc3_ + "," + param2.vertexDuration + ".y," + param2.vertexTime + "\n");
         var _loc4_:ShaderRegisterElement = param2.getFreeVertexVectorTemp();
         _loc6_ = _loc6_ + ("mul " + _loc4_ + "," + _loc3_ + "," + _loc5_ + "\n");
         _loc6_ = _loc6_ + ("mul " + _loc4_ + "," + _loc4_ + "," + _loc3_ + "\n");
         _loc6_ = _loc6_ + ("add " + param2.positionTarget + ".xyz," + _loc4_ + "," + param2.positionTarget + ".xyz\n");
         param2.removeVertexTempUsage(_loc3_);
         return _loc6_;
      }
      
      public function getAnimationState(param1:IAnimator) : ParticleDampState
      {
         return param1.getAnimationState(this) as ParticleDampState;
      }
      
      public function get nodeDataOffset() : uint
      {
         return dataOffset;
      }
      
      override function generatePropertyOfOneParticle(param1:ParticleProperties) : void
      {
         var _loc2_:Vector3D = param1["damp_vector3d"];
         if(!_loc2_)
         {
            throw new Error("there is no damp_vector3d in param!");
         }
         _oneData[0] = _loc2_.x / 2;
         _oneData[1] = _loc2_.y / 2;
         _oneData[2] = _loc2_.z / 2;
      }
   }
}
