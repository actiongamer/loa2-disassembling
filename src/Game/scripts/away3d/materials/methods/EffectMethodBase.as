package away3d.materials.methods
{
   import away3d.materials.compilation.ShaderRegisterCache;
   import away3d.materials.compilation.ShaderRegisterElement;
   import away3d.errors.AbstractMethodError;
   
   public class EffectMethodBase extends ShadingMethodBase
   {
       
      
      public function EffectMethodBase()
      {
         super();
      }
      
      function getFragmentCode(param1:MethodVO, param2:ShaderRegisterCache, param3:ShaderRegisterElement) : String
      {
         throw new AbstractMethodError();
      }
   }
}
