package away3d.materials.methods
{
   import away3d.textures.Texture2DBase;
   import away3d.materials.compilation.ShaderRegisterElement;
   import away3d.materials.compilation.ShaderRegisterCache;
   import away3d.core.managers.Stage3DProxy;
   import §away3d:arcane§._lightAmbientR;
   import §away3d:arcane§._lightAmbientG;
   import §away3d:arcane§._lightAmbientB;
   
   public class BasicAmbientMethod extends ShadingMethodBase
   {
       
      
      protected var _useTexture:Boolean;
      
      private var _texture:Texture2DBase;
      
      protected var _ambientInputRegister:ShaderRegisterElement;
      
      private var _ambientColor:uint = 16777215;
      
      private var _ambientR:Number = 0;
      
      private var _ambientG:Number = 0;
      
      private var _ambientB:Number = 0;
      
      private var _ambient:Number = 1;
      
      var _lightAmbientR:Number = 0;
      
      var _lightAmbientG:Number = 0;
      
      var _lightAmbientB:Number = 0;
      
      public function BasicAmbientMethod()
      {
         super();
      }
      
      override function initVO(param1:MethodVO) : void
      {
         param1.needsUV = _useTexture;
      }
      
      override function initConstants(param1:MethodVO) : void
      {
         param1.fragmentData[param1.fragmentConstantsIndex + 3] = 1;
      }
      
      public function get ambient() : Number
      {
         return _ambient;
      }
      
      public function set ambient(param1:Number) : void
      {
         _ambient = param1;
      }
      
      public function get ambientColor() : uint
      {
         return _ambientColor;
      }
      
      public function set ambientColor(param1:uint) : void
      {
         _ambientColor = param1;
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
         var _loc2_:BasicAmbientMethod = BasicAmbientMethod(param1);
         ambient = _loc2_.ambient;
         ambientColor = _loc2_.ambientColor;
      }
      
      override function cleanCompilationData() : void
      {
         super.cleanCompilationData();
         _ambientInputRegister = null;
      }
      
      function getFragmentCode(param1:MethodVO, param2:ShaderRegisterCache, param3:ShaderRegisterElement) : String
      {
         var _loc4_:String = "";
         if(_useTexture)
         {
            _ambientInputRegister = param2.getFreeTextureReg();
            param1.texturesIndex = _ambientInputRegister.index;
            _loc4_ = _loc4_ + (getTex2DSampleCode(param1,param3,_ambientInputRegister,_texture) + "div " + param3 + ".xyz, " + param3 + ".xyz, " + param3 + ".w\n");
         }
         else
         {
            _ambientInputRegister = param2.getFreeFragmentConstant();
            param1.fragmentConstantsIndex = _ambientInputRegister.index * 4;
            _loc4_ = _loc4_ + ("mov " + param3 + ", " + _ambientInputRegister + "\n");
         }
         return _loc4_;
      }
      
      override function activate(param1:MethodVO, param2:Stage3DProxy) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = undefined;
         updateAmbient();
         if(_useTexture)
         {
            param2.setTextureAt(param1.texturesIndex,_texture.getTextureForStage3D(param2));
         }
         else
         {
            _loc3_ = param1.fragmentConstantsIndex;
            _loc4_ = param1.fragmentData;
            _loc4_[_loc3_] = _ambientR;
            _loc4_[_loc3_ + 1] = _ambientG;
            _loc4_[_loc3_ + 2] = _ambientB;
         }
      }
      
      private final function updateAmbient() : void
      {
         _ambientR = (_ambientColor >> 16 & 255) / 255 * _ambient * _lightAmbientR;
         _ambientG = (_ambientColor >> 8 & 255) / 255 * _ambient * _lightAmbientG;
         _ambientB = (_ambientColor & 255) / 255 * _ambient * _lightAmbientB;
      }
   }
}
