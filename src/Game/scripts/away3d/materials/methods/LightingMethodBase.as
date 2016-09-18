package away3d.materials.methods
{
   import away3d.materials.compilation.ShaderRegisterCache;
   import away3d.materials.compilation.ShaderRegisterElement;
   
   public class LightingMethodBase extends ShadingMethodBase
   {
       
      
      var _modulateMethod:Function;
      
      public function LightingMethodBase()
      {
         super();
      }
      
      function getFragmentPreLightingCode(param1:MethodVO, param2:ShaderRegisterCache) : String
      {
         return "";
      }
      
      function getFragmentCodePerLight(param1:MethodVO, param2:ShaderRegisterElement, param3:ShaderRegisterElement, param4:ShaderRegisterCache) : String
      {
         return "";
      }
      
      function getFragmentCodePerProbe(param1:MethodVO, param2:ShaderRegisterElement, param3:String, param4:ShaderRegisterCache) : String
      {
         return "";
      }
      
      function getFragmentPostLightingCode(param1:MethodVO, param2:ShaderRegisterCache, param3:ShaderRegisterElement) : String
      {
         return "";
      }
   }
}
