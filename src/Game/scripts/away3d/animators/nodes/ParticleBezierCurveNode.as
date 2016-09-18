package away3d.animators.nodes
{
   import flash.geom.Vector3D;
   import away3d.materials.passes.MaterialPassBase;
   import away3d.animators.data.AnimationRegisterCache;
   import away3d.materials.compilation.ShaderRegisterElement;
   import away3d.animators.states.ParticleBezierCurveState;
   import away3d.animators.IAnimator;
   import away3d.animators.data.ParticleProperties;
   import §away3d:arcane§._controlPoint;
   import §away3d:arcane§._endPoint;
   
   public class ParticleBezierCurveNode extends ParticleNodeBase
   {
      
      static const BEZIER_CONTROL_INDEX:int = 0;
      
      static const BEZIER_END_INDEX:int = 1;
      
      public static const BEZIER_CONTROL_VECTOR3D:String = "BezierControlVector3D";
      
      public static const BEZIER_END_VECTOR3D:String = "BezierEndVector3D";
       
      
      var _controlPoint:Vector3D;
      
      var _endPoint:Vector3D;
      
      public function ParticleBezierCurveNode(param1:uint, param2:Vector3D = null, param3:Vector3D = null)
      {
         super("ParticleBezierCurve",param1,6);
         _stateClass = ParticleBezierCurveState;
         _controlPoint = param2 || new Vector3D();
         _endPoint = param3 || new Vector3D();
      }
      
      override public function getAGALVertexCode(param1:MaterialPassBase, param2:AnimationRegisterCache) : String
      {
         var _loc6_:ShaderRegisterElement = _mode == 0?param2.getFreeVertexConstant():param2.getFreeVertexAttribute();
         param2.setRegisterIndex(this,0,_loc6_.index);
         var _loc3_:ShaderRegisterElement = _mode == 0?param2.getFreeVertexConstant():param2.getFreeVertexAttribute();
         param2.setRegisterIndex(this,1,_loc3_.index);
         var _loc7_:ShaderRegisterElement = param2.getFreeVertexVectorTemp();
         var _loc10_:ShaderRegisterElement = new ShaderRegisterElement(_loc7_.regName,_loc7_.index,0);
         var _loc8_:ShaderRegisterElement = new ShaderRegisterElement(_loc7_.regName,_loc7_.index,1);
         var _loc11_:ShaderRegisterElement = new ShaderRegisterElement(_loc7_.regName,_loc7_.index,2);
         param2.addVertexTempUsages(_loc7_,1);
         var _loc5_:ShaderRegisterElement = param2.getFreeVertexVectorTemp();
         var _loc4_:ShaderRegisterElement = new ShaderRegisterElement(_loc5_.regName,_loc5_.index,5);
         param2.removeVertexTempUsage(_loc7_);
         var _loc9_:String = "";
         _loc9_ = _loc9_ + ("sub " + _loc10_ + "," + param2.vertexOneConst + "," + param2.vertexLife + "\n");
         _loc9_ = _loc9_ + ("mul " + _loc8_ + "," + param2.vertexLife + "," + param2.vertexLife + "\n");
         _loc9_ = _loc9_ + ("mul " + _loc11_ + "," + param2.vertexLife + "," + _loc10_ + "\n");
         _loc9_ = _loc9_ + ("mul " + _loc11_ + "," + _loc11_ + "," + param2.vertexTwoConst + "\n");
         _loc9_ = _loc9_ + ("mul " + _loc4_ + "," + _loc11_ + "," + _loc6_ + "\n");
         _loc9_ = _loc9_ + ("add " + param2.positionTarget + ".xyz," + _loc4_ + "," + param2.positionTarget + ".xyz\n");
         _loc9_ = _loc9_ + ("mul " + _loc4_ + "," + _loc8_ + "," + _loc3_ + "\n");
         _loc9_ = _loc9_ + ("add " + param2.positionTarget + ".xyz," + _loc4_ + "," + param2.positionTarget + ".xyz\n");
         if(param2.needVelocity)
         {
            _loc9_ = _loc9_ + ("mul " + _loc8_ + "," + param2.vertexLife + "," + param2.vertexTwoConst + "\n");
            _loc9_ = _loc9_ + ("sub " + _loc11_ + "," + param2.vertexOneConst + "," + _loc8_ + "\n");
            _loc9_ = _loc9_ + ("mul " + _loc11_ + "," + param2.vertexTwoConst + "," + _loc11_ + "\n");
            _loc9_ = _loc9_ + ("mul " + _loc4_ + "," + _loc6_ + "," + _loc11_ + "\n");
            _loc9_ = _loc9_ + ("add " + param2.velocityTarget + ".xyz," + _loc4_ + "," + param2.velocityTarget + ".xyz\n");
            _loc9_ = _loc9_ + ("mul " + _loc4_ + "," + _loc3_ + "," + _loc8_ + "\n");
            _loc9_ = _loc9_ + ("add " + param2.velocityTarget + ".xyz," + _loc4_ + "," + param2.velocityTarget + ".xyz\n");
         }
         return _loc9_;
      }
      
      public function getAnimationState(param1:IAnimator) : ParticleBezierCurveState
      {
         return param1.getAnimationState(this) as ParticleBezierCurveState;
      }
      
      override function generatePropertyOfOneParticle(param1:ParticleProperties) : void
      {
         var _loc3_:Vector3D = param1["BezierControlVector3D"];
         if(!_loc3_)
         {
            throw new Error("there is no BezierControlVector3D in param!");
         }
         var _loc2_:Vector3D = param1["BezierEndVector3D"];
         if(!_loc2_)
         {
            throw new Error("there is no BezierEndVector3D in param!");
         }
         _oneData[0] = _loc3_.x;
         _oneData[1] = _loc3_.y;
         _oneData[2] = _loc3_.z;
         _oneData[3] = _loc2_.x;
         _oneData[4] = _loc2_.y;
         _oneData[5] = _loc2_.z;
      }
   }
}
