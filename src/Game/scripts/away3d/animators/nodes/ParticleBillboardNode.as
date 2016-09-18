package away3d.animators.nodes
{
   import away3d.materials.passes.MaterialPassBase;
   import away3d.animators.data.AnimationRegisterCache;
   import away3d.materials.compilation.ShaderRegisterElement;
   import away3d.animators.states.ParticleBillboardState;
   import away3d.animators.IAnimator;
   import away3d.animators.ParticleAnimationSet;
   
   public class ParticleBillboardNode extends ParticleNodeBase
   {
      
      static const MATRIX_INDEX:int = 0;
       
      
      public function ParticleBillboardNode()
      {
         super("ParticleBillboard",0,0,4);
         _stateClass = ParticleBillboardState;
      }
      
      override public function getAGALVertexCode(param1:MaterialPassBase, param2:AnimationRegisterCache) : String
      {
         var _loc4_:* = null;
         var _loc3_:ShaderRegisterElement = param2.getFreeVertexConstant();
         param2.setRegisterIndex(this,0,_loc3_.index);
         param2.getFreeVertexConstant();
         param2.getFreeVertexConstant();
         param2.getFreeVertexConstant();
         var _loc5_:String = "m33 " + param2.scaleAndRotateTarget + "," + param2.scaleAndRotateTarget + "," + _loc3_ + "\n";
         var _loc7_:int = 0;
         var _loc6_:* = param2.rotationRegisters;
         for each(_loc4_ in param2.rotationRegisters)
         {
            _loc5_ = _loc5_ + ("m33 " + _loc4_.regName + _loc4_.index + ".xyz," + _loc4_ + "," + _loc3_ + "\n");
         }
         return _loc5_;
      }
      
      public function getAnimationState(param1:IAnimator) : ParticleBillboardState
      {
         return param1.getAnimationState(this) as ParticleBillboardState;
      }
      
      override function processAnimationSetting(param1:ParticleAnimationSet) : void
      {
         param1.hasBillboard = true;
      }
   }
}
