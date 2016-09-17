package away3d.materials.methods
{
   import away3d.materials.compilation.ShaderRegisterElement;
   import away3d.textures.Texture2DBase;
   import away3d.core.managers.Stage3DProxy;
   import away3d.materials.compilation.ShaderRegisterCache;
   import com.mz.core.configs.Client3DConfig;
   import §away3d:arcane§._modulateMethod;
   import §away3d:arcane§._useDiffuseTexture;
   
   public class BasicDiffuseMethod extends LightingMethodBase
   {
       
      
      protected var _alphaThreshold:Number = 0;
      
      protected var _customTextureCode:Function;
      
      protected var _diffuseInputRegister:ShaderRegisterElement;
      
      protected var _isFirstLight:Boolean;
      
      protected var _lightmapRegister:ShaderRegisterElement;
      
      protected var _shadowRegister:ShaderRegisterElement;
      
      protected var _useTexture:Boolean;
      
      var _totalLightColorReg:ShaderRegisterElement;
      
      var _useDiffuseTexture:Boolean;
      
      private var _diffuseColor:uint = 16777215;
      
      private var _diffuseR:Number = 1;
      
      private var _diffuseG:Number = 1;
      
      private var _diffuseB:Number = 1;
      
      private var _diffuseA:Number = 1;
      
      private var _texture:Texture2DBase;
      
      public function BasicDiffuseMethod()
      {
         super();
      }
      
      public function get alphaThreshold() : Number
      {
         return _alphaThreshold;
      }
      
      public function set alphaThreshold(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         else if(param1 > 1)
         {
            param1 = 1;
         }
         if(param1 == _alphaThreshold)
         {
            return;
         }
         if(param1 == 0 || _alphaThreshold == 0)
         {
            invalidateShaderProgram();
         }
         _alphaThreshold = param1;
      }
      
      override public function copyFrom(param1:ShadingMethodBase) : void
      {
         var _loc2_:BasicDiffuseMethod = BasicDiffuseMethod(param1);
         alphaThreshold = _loc2_.alphaThreshold;
         texture = _loc2_.texture;
         diffuseAlpha = _loc2_.diffuseAlpha;
         diffuseColor = _loc2_.diffuseColor;
      }
      
      public function get diffuseAlpha() : Number
      {
         return _diffuseA;
      }
      
      public function set diffuseAlpha(param1:Number) : void
      {
         _diffuseA = param1;
      }
      
      public function get diffuseColor() : uint
      {
         return _diffuseColor;
      }
      
      public function set diffuseColor(param1:uint) : void
      {
         _diffuseColor = param1;
         updateDiffuse();
      }
      
      override public function dispose() : void
      {
      }
      
      public function generateMip(param1:Stage3DProxy) : void
      {
         if(_useTexture)
         {
            _texture.getTextureForStage3D(param1);
         }
      }
      
      public function get texture() : Texture2DBase
      {
         return _texture;
      }
      
      public function set texture(param1:Texture2DBase) : void
      {
         if(Boolean(param1) != _useTexture || param1 && _texture && (param1.hasMipMaps != _texture.hasMipMaps || param1.format != _texture.format))
         {
            invalidateShaderProgram();
         }
         _useTexture = Boolean(param1);
         _texture = param1;
      }
      
      override function activate(param1:MethodVO, param2:Stage3DProxy) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = undefined;
         if(_useTexture)
         {
            param2.setTextureAt(param1.texturesIndex,_texture.getTextureForStage3D(param2));
            if(_alphaThreshold > 0)
            {
               param1.fragmentData[param1.fragmentConstantsIndex] = _alphaThreshold;
            }
         }
         else
         {
            _loc3_ = param1.fragmentConstantsIndex;
            _loc4_ = param1.fragmentData;
            _loc4_[_loc3_] = _diffuseR;
            _loc4_[_loc3_ + 1] = _diffuseG;
            _loc4_[_loc3_ + 2] = _diffuseB;
            _loc4_[_loc3_ + 3] = _diffuseA;
         }
      }
      
      override function cleanCompilationData() : void
      {
         super.cleanCompilationData();
         _shadowRegister = null;
         _lightmapRegister = null;
         _totalLightColorReg = null;
         _diffuseInputRegister = null;
      }
      
      override function getFragmentCodePerLight(param1:MethodVO, param2:ShaderRegisterElement, param3:ShaderRegisterElement, param4:ShaderRegisterCache) : String
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:String = "";
         if(!_isFirstLight)
         {
            _loc5_ = param4.getFreeFragmentVectorTemp();
            param4.addFragmentTempUsages(_loc5_,1);
         }
         else
         {
            _loc5_ = _totalLightColorReg;
         }
         _loc6_ = param4.getFreeFragmentVectorTemp();
         param4.addFragmentTempUsages(_loc6_,1);
         _loc7_ = _loc7_ + ("dp3 " + _loc5_ + ".x, " + param2 + ".xyz, " + _sharedRegisters.normalFragment + ".xyz\n");
         if(Client3DConfig.useBothSideLight)
         {
            _loc7_ = _loc7_ + ("abs " + _loc5_ + ".x, " + _loc5_ + ".x, \n");
         }
         else
         {
            _loc7_ = _loc7_ + ("max " + _loc5_ + ".x, " + _loc5_ + ".x, " + _sharedRegisters.commons + ".y\n");
         }
         if(Client3DConfig.useHalfLambert)
         {
            _loc7_ = _loc7_ + ("mul" + _loc6_ + ".x, " + _loc5_ + ".x, " + _sharedRegisters.commons + ".x\n");
            _loc7_ = _loc7_ + ("add" + _loc5_ + ".w, " + _loc6_ + ".x, " + _sharedRegisters.commons + ".x\n");
         }
         param4.removeFragmentTempUsage(_loc6_);
         if(param1.useLightFallOff)
         {
            _loc7_ = _loc7_ + ("mul " + _loc5_ + ".w, " + _loc5_ + ".w, " + param2 + ".w\n");
         }
         if(_modulateMethod != null)
         {
            _loc7_ = _loc7_ + _modulateMethod(param1,_loc5_,param4,_sharedRegisters);
         }
         _loc7_ = _loc7_ + ("mul " + _loc5_ + ", " + _loc5_ + ".w, " + param3 + "\n");
         if(!_isFirstLight)
         {
            _loc7_ = _loc7_ + ("add " + _totalLightColorReg + ".xyz, " + _totalLightColorReg + ".xyz, " + _loc5_ + ".xyz\n");
            param4.removeFragmentTempUsage(_loc5_);
         }
         _isFirstLight = false;
         return _loc7_;
      }
      
      override function getFragmentCodePerProbe(param1:MethodVO, param2:ShaderRegisterElement, param3:String, param4:ShaderRegisterCache) : String
      {
         var _loc5_:* = null;
         var _loc6_:String = "";
         if(_isFirstLight)
         {
            _loc5_ = param4.getFreeFragmentVectorTemp();
            param4.addFragmentTempUsages(_loc5_,1);
         }
         else
         {
            _loc5_ = _totalLightColorReg;
         }
         _loc6_ = _loc6_ + ("tex " + _loc5_ + ", " + _sharedRegisters.normalFragment + ", " + param2 + " <cube,linear,miplinear>\n" + "mul " + _loc5_ + ".xyz, " + _loc5_ + ".xyz, " + param3 + "\n");
         if(_modulateMethod != null)
         {
            _loc6_ = _loc6_ + _modulateMethod(param1,_loc5_,param4,_sharedRegisters);
         }
         if(!_isFirstLight)
         {
            _loc6_ = _loc6_ + ("add " + _totalLightColorReg + ".xyz, " + _totalLightColorReg + ".xyz, " + _loc5_ + ".xyz\n");
            param4.removeFragmentTempUsage(_loc5_);
         }
         _isFirstLight = false;
         return _loc6_;
      }
      
      override function getFragmentPostLightingCode(param1:MethodVO, param2:ShaderRegisterCache, param3:ShaderRegisterElement) : String
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc4_:* = null;
         var _loc8_:String = "";
         _loc7_ = param2.getFreeFragmentVectorTemp();
         param2.addFragmentTempUsages(_loc7_,1);
         _loc4_ = param2.getFreeFragmentVectorTemp();
         param2.addFragmentTempUsages(_loc4_,1);
         _loc6_ = param2.getFreeFragmentConstant();
         param1.fragmentConstantsIndex = _loc6_.index * 4;
         if(param1.numLights > 0)
         {
            _loc5_ = _loc7_;
            _loc8_ = _loc8_ + ("mov " + _loc5_ + ", " + _loc6_ + ".z\n");
            if(_shadowRegister)
            {
               _loc8_ = _loc8_ + ("mul " + _totalLightColorReg + ".xyz, " + _totalLightColorReg + ".xyz, " + _shadowRegister + ".w\n");
            }
         }
         else
         {
            _loc5_ = param3;
         }
         if(_customTextureCode != null)
         {
            _loc8_ = _loc8_ + _customTextureCode(param1,param2,_loc5_);
         }
         else if(_useTexture)
         {
            _diffuseInputRegister = param2.getFreeTextureReg();
            param1.texturesIndex = _diffuseInputRegister.index;
            _loc8_ = _loc8_ + getTex2DSampleCode(param1,_loc5_,_diffuseInputRegister,_texture);
            if(_alphaThreshold > 0)
            {
               _loc6_ = param2.getFreeFragmentConstant();
               param1.fragmentConstantsIndex = _loc6_.index * 4;
               _loc8_ = _loc8_ + ("sub " + _loc5_ + ".w, " + _loc5_ + ".w, " + _loc6_ + ".x\n" + "kil " + _loc5_ + ".w\n" + "add " + _loc5_ + ".w, " + _loc5_ + ".w, " + _loc6_ + ".x\n");
            }
         }
         else
         {
            _diffuseInputRegister = param2.getFreeFragmentConstant();
            param1.fragmentConstantsIndex = _diffuseInputRegister.index * 4;
            _loc8_ = _loc8_ + ("mov " + _loc5_ + ", " + _diffuseInputRegister + "\n");
         }
         if(param1.numLights == 0)
         {
            return _loc8_;
         }
         if(_useDiffuseTexture)
         {
            _loc8_ = _loc8_ + ("min " + _totalLightColorReg + ".xyz, " + _totalLightColorReg + ".xyz, " + _sharedRegisters.commons + ".www\n" + "mul " + _loc5_ + ".xyz, " + _loc5_ + ".xyz, " + _totalLightColorReg + ".xyz\n" + "mul " + _totalLightColorReg + ".xyz, " + param3 + ".xyz, " + _totalLightColorReg + ".xyz\n" + "sub " + param3 + ".xyz, " + param3 + ".xyz, " + _totalLightColorReg + ".xyz\n" + "add " + param3 + ".xyz, " + _loc5_ + ".xyz, " + param3 + ".xyz\n");
         }
         else
         {
            _loc8_ = _loc8_ + ("add " + param3 + ".xyz, " + _totalLightColorReg + ".xyz, " + param3 + ".xyz\n" + "min " + param3 + ".xyz, " + param3 + ".xyz, " + _sharedRegisters.commons + ".www\n" + "mul " + param3 + ".xyz, " + _loc5_ + ".xyz, " + param3 + ".xyz\n" + "mov " + param3 + ".w, " + _loc5_ + ".w\n");
         }
         if(_lightmapRegister)
         {
            _loc8_ = _loc8_ + ("mul " + _loc7_ + ", " + _lightmapRegister + ", " + _loc6_ + ".y\n" + "mul " + param3 + ".xyz, " + param3 + ",xyz " + _loc7_ + ".xyz\n");
         }
         param2.removeFragmentTempUsage(_totalLightColorReg);
         param2.removeFragmentTempUsage(_loc5_);
         param2.removeFragmentTempUsage(_loc4_);
         return _loc8_;
      }
      
      override function getFragmentPreLightingCode(param1:MethodVO, param2:ShaderRegisterCache) : String
      {
         var _loc3_:String = "";
         _isFirstLight = true;
         if(param1.numLights > 0)
         {
            _totalLightColorReg = param2.getFreeFragmentVectorTemp();
            param2.addFragmentTempUsages(_totalLightColorReg,1);
         }
         return _loc3_;
      }
      
      override function initConstants(param1:MethodVO) : void
      {
         param1.fragmentData[param1.fragmentConstantsIndex + 1] = 2;
         param1.fragmentData[param1.fragmentConstantsIndex + 2] = 1;
      }
      
      override function initVO(param1:MethodVO) : void
      {
         param1.needsUV = _useTexture;
         param1.needsNormals = param1.numLights > 0;
      }
      
      function set lightmapRegister(param1:ShaderRegisterElement) : void
      {
         _lightmapRegister = param1;
      }
      
      function set shadowRegister(param1:ShaderRegisterElement) : void
      {
         _shadowRegister = param1;
      }
      
      private function updateDiffuse() : void
      {
         _diffuseR = (_diffuseColor >> 16 & 255) / 255;
         _diffuseG = (_diffuseColor >> 8 & 255) / 255;
         _diffuseB = (_diffuseColor & 255) / 255;
      }
   }
}
