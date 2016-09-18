package away3d.materials.methods
{
   import away3d.lights.LightBase;
   import away3d.lights.shadowmaps.ShadowMapperBase;
   import away3d.materials.compilation.ShaderRegisterCache;
   import away3d.materials.compilation.ShaderRegisterElement;
   import away3d.errors.AbstractMethodError;
   
   public class ShadowMapMethodBase extends ShadingMethodBase
   {
       
      
      protected var _castingLight:LightBase;
      
      protected var _shadowMapper:ShadowMapperBase;
      
      protected var _epsilon:Number = 0.002;
      
      protected var _alpha:Number = 1;
      
      public function ShadowMapMethodBase(param1:LightBase)
      {
         super();
         _castingLight = param1;
         param1.castsShadows = true;
         _shadowMapper = param1.shadowMapper;
      }
      
      public function get alpha() : Number
      {
         return _alpha;
      }
      
      public function set alpha(param1:Number) : void
      {
         _alpha = param1;
      }
      
      public function get castingLight() : LightBase
      {
         return _castingLight;
      }
      
      public function get epsilon() : Number
      {
         return _epsilon;
      }
      
      public function set epsilon(param1:Number) : void
      {
         _epsilon = param1;
      }
      
      function getFragmentCode(param1:MethodVO, param2:ShaderRegisterCache, param3:ShaderRegisterElement) : String
      {
         throw new AbstractMethodError();
      }
   }
}
