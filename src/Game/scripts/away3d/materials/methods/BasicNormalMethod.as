package away3d.materials.methods
{
   import away3d.textures.Texture2DBase;
   import away3d.materials.compilation.ShaderRegisterElement;
   import away3d.core.managers.Stage3DProxy;
   import away3d.materials.compilation.ShaderRegisterCache;
   
   public class BasicNormalMethod extends ShadingMethodBase
   {
       
      
      private var _texture:Texture2DBase;
      
      private var _useTexture:Boolean;
      
      protected var _normalTextureRegister:ShaderRegisterElement;
      
      public function BasicNormalMethod()
      {
         super();
      }
      
      override function initVO(param1:MethodVO) : void
      {
         param1.needsUV = Boolean(_texture);
      }
      
      function get tangentSpace() : Boolean
      {
         return true;
      }
      
      function get hasOutput() : Boolean
      {
         return _useTexture;
      }
      
      override public function copyFrom(param1:ShadingMethodBase) : void
      {
         normalMap = BasicNormalMethod(param1).normalMap;
      }
      
      public function get normalMap() : Texture2DBase
      {
         return _texture;
      }
      
      public function set normalMap(param1:Texture2DBase) : void
      {
         if(Boolean(param1) != _useTexture || param1 && _texture && (param1.hasMipMaps != _texture.hasMipMaps || param1.format != _texture.format))
         {
            invalidateShaderProgram();
         }
         _useTexture = Boolean(param1);
         _texture = param1;
      }
      
      override function cleanCompilationData() : void
      {
         super.cleanCompilationData();
         _normalTextureRegister = null;
      }
      
      override public function dispose() : void
      {
         if(_texture)
         {
            _texture = null;
         }
      }
      
      override function activate(param1:MethodVO, param2:Stage3DProxy) : void
      {
         if(param1.texturesIndex >= 0)
         {
            param2.setTextureAt(param1.texturesIndex,_texture.getTextureForStage3D(param2));
         }
      }
      
      function getFragmentCode(param1:MethodVO, param2:ShaderRegisterCache, param3:ShaderRegisterElement) : String
      {
         _normalTextureRegister = param2.getFreeTextureReg();
         param1.texturesIndex = _normalTextureRegister.index;
         return getTex2DSampleCode(param1,param3,_normalTextureRegister,_texture) + "sub " + param3 + ".xyz, " + param3 + ".xyz, " + _sharedRegisters.commons + ".xxx\t\n" + "nrm " + param3 + ".xyz, " + param3 + ".xyz\t\t\t\t\t\t\t\n";
      }
   }
}
