package away3d.materials.methods
{
   import away3d.materials.compilation.ShaderRegisterElement;
   import away3d.textures.Texture2DBase;
   import away3d.materials.compilation.ShaderRegisterCache;
   import §away3d:arcane§._modulateMethod;
   import away3d.core.managers.Stage3DProxy;
   import flash.display3D.Context3D;
   import §away3d:arcane§._specularR;
   import §away3d:arcane§._specularG;
   import §away3d:arcane§._specularB;
   
   public class BasicSpecularMethod extends LightingMethodBase
   {
       
      
      protected var _useTexture:Boolean;
      
      protected var _totalLightColorReg:ShaderRegisterElement;
      
      protected var _specularTextureRegister:ShaderRegisterElement;
      
      protected var _specularTexData:ShaderRegisterElement;
      
      protected var _specularDataRegister:ShaderRegisterElement;
      
      private var _texture:Texture2DBase;
      
      private var _gloss:int = 50;
      
      private var _specular:Number = 1;
      
      private var _specularColor:uint = 16777215;
      
      var _specularR:Number = 1;
      
      var _specularG:Number = 1;
      
      var _specularB:Number = 1;
      
      private var _shadowRegister:ShaderRegisterElement;
      
      private var _shadingModel:String;
      
      protected var _isFirstLight:Boolean;
      
      public function BasicSpecularMethod()
      {
         super();
         _shadingModel = "blinnPhong";
      }
      
      public function get specularTexData() : ShaderRegisterElement
      {
         return _specularTexData;
      }
      
      override function initVO(param1:MethodVO) : void
      {
         param1.needsUV = _useTexture;
         param1.needsNormals = param1.numLights > 0;
         param1.needsView = param1.numLights > 0;
      }
      
      public function get gloss() : Number
      {
         return _gloss;
      }
      
      public function set gloss(param1:Number) : void
      {
         _gloss = param1;
      }
      
      public function get specular() : Number
      {
         return _specular;
      }
      
      public function set specular(param1:Number) : void
      {
         if(param1 == _specular)
         {
            return;
         }
         _specular = param1;
         updateSpecular();
      }
      
      public function get shadingModel() : String
      {
         return _shadingModel;
      }
      
      public function set shadingModel(param1:String) : void
      {
         if(param1 == _shadingModel)
         {
            return;
         }
         _shadingModel = param1;
         invalidateShaderProgram();
      }
      
      public function get specularColor() : uint
      {
         return _specularColor;
      }
      
      public function set specularColor(param1:uint) : void
      {
         if(_specularColor == param1)
         {
            return;
         }
         if(_specularColor == 0 || param1 == 0)
         {
            invalidateShaderProgram();
         }
         _specularColor = param1;
         updateSpecular();
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
      
      override public function copyFrom(param1:ShadingMethodBase) : void
      {
         var _loc2_:BasicSpecularMethod = BasicSpecularMethod(param1);
         texture = _loc2_.texture;
         specular = _loc2_.specular;
         specularColor = _loc2_.specularColor;
         gloss = _loc2_.gloss;
      }
      
      override function cleanCompilationData() : void
      {
         super.cleanCompilationData();
         _shadowRegister = null;
         _totalLightColorReg = null;
         _specularTextureRegister = null;
         _specularTexData = null;
         _specularDataRegister = null;
      }
      
      override function getFragmentPreLightingCode(param1:MethodVO, param2:ShaderRegisterCache) : String
      {
         var _loc3_:String = "";
         _isFirstLight = true;
         if(param1.numLights > 0)
         {
            _specularDataRegister = param2.getFreeFragmentConstant();
            param1.fragmentConstantsIndex = _specularDataRegister.index * 4;
            if(_useTexture)
            {
               _specularTexData = param2.getFreeFragmentVectorTemp();
               param2.addFragmentTempUsages(_specularTexData,1);
               _specularTextureRegister = param2.getFreeTextureReg();
               param1.texturesIndex = _specularTextureRegister.index;
               _loc3_ = getTex2DSampleCode(param1,_specularTexData,_specularTextureRegister,_texture);
            }
            else
            {
               _specularTextureRegister = null;
            }
            _totalLightColorReg = param2.getFreeFragmentVectorTemp();
            param2.addFragmentTempUsages(_totalLightColorReg,1);
         }
         return _loc3_;
      }
      
      override function getFragmentCodePerLight(param1:MethodVO, param2:ShaderRegisterElement, param3:ShaderRegisterElement, param4:ShaderRegisterCache) : String
      {
         var _loc5_:* = null;
         var _loc8_:String = "";
         if(_isFirstLight)
         {
            _loc5_ = _totalLightColorReg;
         }
         else
         {
            _loc5_ = param4.getFreeFragmentVectorTemp();
            param4.addFragmentTempUsages(_loc5_,1);
         }
         var _loc7_:ShaderRegisterElement = _sharedRegisters.viewDirFragment;
         var _loc6_:ShaderRegisterElement = _sharedRegisters.normalFragment;
         var _loc9_:* = _shadingModel;
         if("blinnPhong" !== _loc9_)
         {
            if("phong" === _loc9_)
            {
               _loc8_ = _loc8_ + ("dp3 " + _loc5_ + ".w, " + param2 + ".xyz, " + _loc6_ + ".xyz\n" + "add " + _loc5_ + ".w, " + _loc5_ + ".w, " + _loc5_ + ".w\n" + "mul " + _loc5_ + ".xyz, " + _loc6_ + ".xyz, " + _loc5_ + ".w\n" + "sub " + _loc5_ + ".xyz, " + _loc5_ + ".xyz, " + param2 + ".xyz\n" + "add" + _loc5_ + ".w, " + _loc5_ + ".w, " + _sharedRegisters.commons + ".w\n" + "sat " + _loc5_ + ".w, " + _loc5_ + ".w\n" + "mul " + _loc5_ + ".xyz, " + _loc5_ + ".xyz, " + _loc5_ + ".w\n" + "dp3 " + _loc5_ + ".w, " + _loc5_ + ".xyz, " + _loc7_ + ".xyz\n" + "sat " + _loc5_ + ".w, " + _loc5_ + ".w\n");
            }
         }
         else
         {
            _loc8_ = _loc8_ + ("add " + _loc5_ + ", " + param2 + ", " + _loc7_ + "\n" + "nrm " + _loc5_ + ".xyz, " + _loc5_ + "\n" + "dp3 " + _loc5_ + ".w, " + _loc6_ + ", " + _loc5_ + "\n" + "sat " + _loc5_ + ".w, " + _loc5_ + ".w\n");
         }
         if(_useTexture)
         {
            _loc8_ = _loc8_ + ("mul " + _specularTexData + ".w, " + _specularTexData + ".y, " + _specularDataRegister + ".w\n" + "pow " + _loc5_ + ".w, " + _loc5_ + ".w, " + _specularTexData + ".w\n");
         }
         else
         {
            _loc8_ = _loc8_ + ("pow " + _loc5_ + ".w, " + _loc5_ + ".w, " + _specularDataRegister + ".w\n");
         }
         if(param1.useLightFallOff)
         {
            _loc8_ = _loc8_ + ("mul " + _loc5_ + ".w, " + _loc5_ + ".w, " + param2 + ".w\n");
         }
         if(_modulateMethod != null)
         {
            _loc8_ = _loc8_ + _modulateMethod(param1,_loc5_,param4,_sharedRegisters);
         }
         _loc8_ = _loc8_ + ("mul " + _loc5_ + ".xyz, " + param3 + ", " + _loc5_ + ".w\n");
         if(!_isFirstLight)
         {
            _loc8_ = _loc8_ + ("add " + _totalLightColorReg + ".xyz, " + _totalLightColorReg + ", " + _loc5_ + "\n");
            param4.removeFragmentTempUsage(_loc5_);
         }
         _isFirstLight = false;
         return _loc8_;
      }
      
      override function getFragmentCodePerProbe(param1:MethodVO, param2:ShaderRegisterElement, param3:String, param4:ShaderRegisterCache) : String
      {
         var _loc5_:* = null;
         var _loc8_:String = "";
         if(_isFirstLight)
         {
            _loc5_ = _totalLightColorReg;
         }
         else
         {
            _loc5_ = param4.getFreeFragmentVectorTemp();
            param4.addFragmentTempUsages(_loc5_,1);
         }
         var _loc6_:ShaderRegisterElement = _sharedRegisters.normalFragment;
         var _loc7_:ShaderRegisterElement = _sharedRegisters.viewDirFragment;
         _loc8_ = _loc8_ + ("dp3 " + _loc5_ + ".w, " + _loc6_ + ".xyz, " + _loc7_ + ".xyz\n" + "add " + _loc5_ + ".w, " + _loc5_ + ".w, " + _loc5_ + ".w\n" + "mul " + _loc5_ + ", " + _loc5_ + ".w, " + _loc6_ + "\n" + "sub " + _loc5_ + ", " + _loc5_ + ", " + _loc7_ + "\n" + "tex " + _loc5_ + ", " + _loc5_ + ", " + param2 + " <cube," + (!!param1.useSmoothTextures?"linear":"nearest") + ",miplinear>\n" + "mul " + _loc5_ + ".xyz, " + _loc5_ + ".xyz, " + param3 + "\n");
         if(_modulateMethod != null)
         {
            _loc8_ = _loc8_ + _modulateMethod(param1,_loc5_,param4,_sharedRegisters);
         }
         if(!_isFirstLight)
         {
            _loc8_ = _loc8_ + ("add " + _totalLightColorReg + ".xyz, " + _totalLightColorReg + ".xyz, " + _loc5_ + ".xyz\n");
            param4.removeFragmentTempUsage(_loc5_);
         }
         _isFirstLight = false;
         return _loc8_;
      }
      
      override function getFragmentPostLightingCode(param1:MethodVO, param2:ShaderRegisterCache, param3:ShaderRegisterElement) : String
      {
         var _loc4_:String = "";
         if(param1.numLights == 0)
         {
            return _loc4_;
         }
         if(_shadowRegister)
         {
            _loc4_ = _loc4_ + ("mul " + _totalLightColorReg + ".xyz, " + _totalLightColorReg + ".xyz, " + _shadowRegister + ".w\n");
         }
         if(_useTexture)
         {
            _loc4_ = _loc4_ + ("mul " + _totalLightColorReg + ".xyz, " + _totalLightColorReg + ".xyz, " + _specularTexData + ".x\n");
            param2.removeFragmentTempUsage(_specularTexData);
         }
         _loc4_ = _loc4_ + ("mul " + _totalLightColorReg + ".xyz, " + _totalLightColorReg + ".xyz, " + _specularDataRegister + ".xyz\n" + "add " + param3 + ".xyz, " + param3 + ".xyz, " + _totalLightColorReg + ".xyz\n");
         param2.removeFragmentTempUsage(_totalLightColorReg);
         return _loc4_;
      }
      
      override function activate(param1:MethodVO, param2:Stage3DProxy) : void
      {
         var _loc5_:Context3D = param2._context3D;
         if(param1.numLights == 0)
         {
            return;
         }
         if(_useTexture)
         {
            param2.setTextureAt(param1.texturesIndex,_texture.getTextureForStage3D(param2));
         }
         var _loc3_:int = param1.fragmentConstantsIndex;
         var _loc4_:Vector.<Number> = param1.fragmentData;
         _loc4_[_loc3_] = _specularR;
         _loc4_[_loc3_ + 1] = _specularG;
         _loc4_[_loc3_ + 2] = _specularB;
         _loc4_[_loc3_ + 3] = _gloss;
      }
      
      private function updateSpecular() : void
      {
         _specularR = (_specularColor >> 16 & 255) / 255 * _specular;
         _specularG = (_specularColor >> 8 & 255) / 255 * _specular;
         _specularB = (_specularColor & 255) / 255 * _specular;
      }
      
      function set shadowRegister(param1:ShaderRegisterElement) : void
      {
         _shadowRegister = param1;
      }
   }
}
