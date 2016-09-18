package away3d.materials.methods
{
   import away3d.materials.compilation.ShaderRegisterCache;
   import away3d.materials.compilation.ShaderRegisterElement;
   
   public class SimpleCutMethod extends EffectMethodBase
   {
       
      
      public function SimpleCutMethod()
      {
         super();
      }
      
      override function initVO(param1:MethodVO) : void
      {
         param1.needsGlobalFragmentPos = true;
      }
      
      override function getFragmentCode(param1:MethodVO, param2:ShaderRegisterCache, param3:ShaderRegisterElement) : String
      {
         var _loc4_:String = "kil" + this.sharedRegisters.globalPositionVarying + ".y \n";
         return _loc4_;
      }
   }
}
