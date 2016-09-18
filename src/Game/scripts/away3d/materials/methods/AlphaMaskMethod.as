package away3d.materials.methods
{
   import away3d.textures.Texture2DBase;
   import away3d.core.managers.Stage3DProxy;
   import away3d.materials.compilation.ShaderRegisterCache;
   import away3d.materials.compilation.ShaderRegisterElement;
   
   public class AlphaMaskMethod extends EffectMethodBase
   {
       
      
      private var _texture:Texture2DBase;
      
      private var _useSecondaryUV:Boolean;
      
      public function AlphaMaskMethod(param1:Texture2DBase, param2:Boolean = false)
      {
         super();
         _texture = param1;
         _useSecondaryUV = param2;
      }
      
      override function initVO(param1:MethodVO) : void
      {
         param1.needsSecondaryUV = _useSecondaryUV;
         param1.needsUV = !_useSecondaryUV;
      }
      
      public function get useSecondaryUV() : Boolean
      {
         return _useSecondaryUV;
      }
      
      public function set useSecondaryUV(param1:Boolean) : void
      {
         if(_useSecondaryUV == param1)
         {
            return;
         }
         _useSecondaryUV = param1;
         invalidateShaderProgram();
      }
      
      public function get texture() : Texture2DBase
      {
         return _texture;
      }
      
      public function set texture(param1:Texture2DBase) : void
      {
         _texture = param1;
      }
      
      override function activate(param1:MethodVO, param2:Stage3DProxy) : void
      {
         param2.setTextureAt(param1.texturesIndex,_texture.getTextureForStage3D(param2));
      }
      
      override function getFragmentCode(param1:MethodVO, param2:ShaderRegisterCache, param3:ShaderRegisterElement) : String
      {
         var _loc5_:ShaderRegisterElement = param2.getFreeTextureReg();
         var _loc6_:ShaderRegisterElement = param2.getFreeFragmentVectorTemp();
         var _loc4_:ShaderRegisterElement = !!_useSecondaryUV?_sharedRegisters.secondaryUVVarying:_sharedRegisters.uvVarying;
         param1.texturesIndex = _loc5_.index;
         return getTex2DSampleCode(param1,_loc6_,_loc5_,_texture,_loc4_) + "mul " + param3 + ", " + param3 + ", " + _loc6_ + ".x\n";
      }
   }
}
