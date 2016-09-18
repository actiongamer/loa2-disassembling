package org.specter3d.display.particle.extend
{
   import away3d.animators.nodes.ParticleNodeBase;
   import away3d.materials.passes.MaterialPassBase;
   import away3d.animators.data.AnimationRegisterCache;
   import away3d.materials.compilation.ShaderRegisterElement;
   
   public class ParticleAlphaNode extends ParticleNodeBase
   {
      
      public static const NAME:String = "ParticleAlpha";
      
      public static const ALPHA_INDEX:int = 0;
       
      
      public function ParticleAlphaNode()
      {
         super("ParticleAlpha",0,1);
         _stateClass = ParticleAlphaState;
      }
      
      override public function getAGALFragmentCode(param1:MaterialPassBase, param2:AnimationRegisterCache) : String
      {
         var _loc4_:String = "";
         var _loc3_:ShaderRegisterElement = param2.getFreeFragmentConstant();
         param2.setRegisterIndex(this,0,_loc3_.index);
         _loc4_ = "mul " + param2.colorTarget + ".w," + _loc3_ + ".w," + param2.colorTarget + ".w\n";
         return _loc4_;
      }
   }
}
