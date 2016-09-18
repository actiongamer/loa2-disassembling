package away3d.materials
{
   import away3d.materials.passes.ShadowCasterPass;
   import away3d.materials.passes.LightingPass;
   import away3d.materials.passes.SuperShaderPass;
   import away3d.materials.methods.BasicAmbientMethod;
   import away3d.materials.methods.ShadowMapMethodBase;
   import away3d.materials.methods.BasicDiffuseMethod;
   import away3d.materials.methods.BasicNormalMethod;
   import away3d.materials.methods.BasicSpecularMethod;
   import away3d.core.managers.Stage3DProxy;
   import away3d.cameras.Camera3D;
   import away3d.materials.lightpickers.LightPickerBase;
   import away3d.materials.methods.EffectMethodBase;
   import away3d.textures.Texture2DBase;
   import flash.display3D.Context3D;
   import away3d.materials.passes.CompiledPass;
   import away3d.materials.lightpickers.StaticLightPicker;
   import flash.events.Event;
   
   public class MultiPassMaterialBase extends MaterialBase
   {
       
      
      protected var _casterLightPass:ShadowCasterPass;
      
      protected var _nonCasterLightPasses:Vector.<LightingPass>;
      
      protected var _effectsPass:SuperShaderPass;
      
      private var _alphaThreshold:Number = 0;
      
      private var _specularLightSources:uint = 1;
      
      private var _diffuseLightSources:uint = 3;
      
      private var _ambientMethod:BasicAmbientMethod;
      
      private var _shadowMethod:ShadowMapMethodBase;
      
      private var _diffuseMethod:BasicDiffuseMethod;
      
      private var _normalMethod:BasicNormalMethod;
      
      private var _specularMethod:BasicSpecularMethod;
      
      private var _screenPassesInvalid:Boolean = true;
      
      public function MultiPassMaterialBase()
      {
         _ambientMethod = new BasicAmbientMethod();
         _diffuseMethod = new BasicDiffuseMethod();
         _normalMethod = new BasicNormalMethod();
         _specularMethod = new BasicSpecularMethod();
         super();
      }
      
      public function get alphaThreshold() : Number
      {
         return _alphaThreshold;
      }
      
      public function set alphaThreshold(param1:Number) : void
      {
         _alphaThreshold = param1;
         _diffuseMethod.alphaThreshold = param1;
         _depthPass.alphaThreshold = param1;
         _distancePass.alphaThreshold = param1;
      }
      
      override public function set depthCompareMode(param1:String) : void
      {
         .super.depthCompareMode = param1;
         invalidateScreenPasses();
      }
      
      override public function set blendMode(param1:String) : void
      {
         .super.blendMode = param1;
         invalidateScreenPasses();
      }
      
      override function activateForDepth(param1:Stage3DProxy, param2:Camera3D, param3:Boolean = false, param4:Number = 1, param5:Number = 1) : void
      {
         if(param3)
         {
            _distancePass.alphaMask = _diffuseMethod.texture;
         }
         else
         {
            _depthPass.alphaMask = _diffuseMethod.texture;
         }
         super.activateForDepth(param1,param2,param3,param4,param5);
      }
      
      public function get specularLightSources() : uint
      {
         return _specularLightSources;
      }
      
      public function set specularLightSources(param1:uint) : void
      {
         _specularLightSources = param1;
      }
      
      public function get diffuseLightSources() : uint
      {
         return _diffuseLightSources;
      }
      
      public function set diffuseLightSources(param1:uint) : void
      {
         _diffuseLightSources = param1;
      }
      
      override public function set lightPicker(param1:LightPickerBase) : void
      {
         if(_lightPicker)
         {
            _lightPicker.removeEventListener("change",onLightsChange);
         }
         .super.lightPicker = param1;
         if(_lightPicker)
         {
            _lightPicker.addEventListener("change",onLightsChange);
         }
         invalidateScreenPasses();
      }
      
      override public function get requiresBlending() : Boolean
      {
         return false;
      }
      
      public function get ambientMethod() : BasicAmbientMethod
      {
         return _ambientMethod;
      }
      
      public function set ambientMethod(param1:BasicAmbientMethod) : void
      {
         param1.copyFrom(_ambientMethod);
         _ambientMethod = param1;
         invalidateScreenPasses();
      }
      
      public function get shadowMethod() : ShadowMapMethodBase
      {
         return _shadowMethod;
      }
      
      public function set shadowMethod(param1:ShadowMapMethodBase) : void
      {
         if(param1 && _shadowMethod)
         {
            param1.copyFrom(_shadowMethod);
         }
         _shadowMethod = param1;
         invalidateScreenPasses();
      }
      
      public function get diffuseMethod() : BasicDiffuseMethod
      {
         return _diffuseMethod;
      }
      
      public function set diffuseMethod(param1:BasicDiffuseMethod) : void
      {
         param1.copyFrom(_diffuseMethod);
         _diffuseMethod = param1;
         invalidateScreenPasses();
      }
      
      public function get normalMethod() : BasicNormalMethod
      {
         return _normalMethod;
      }
      
      public function set normalMethod(param1:BasicNormalMethod) : void
      {
         param1.copyFrom(_normalMethod);
         _normalMethod = param1;
         invalidateScreenPasses();
      }
      
      public function get specularMethod() : BasicSpecularMethod
      {
         return _specularMethod;
      }
      
      public function set specularMethod(param1:BasicSpecularMethod) : void
      {
         if(param1 && _specularMethod)
         {
            param1.copyFrom(_specularMethod);
         }
         _specularMethod = param1;
         invalidateScreenPasses();
      }
      
      public function addMethod(param1:EffectMethodBase) : void
      {
         if(!_effectsPass)
         {
            _effectsPass = new SuperShaderPass(this);
         }
         _effectsPass.addMethod(param1);
         invalidateScreenPasses();
      }
      
      public function get numMethods() : int
      {
         return !!_effectsPass?_effectsPass.numMethods:0;
      }
      
      public function hasMethod(param1:EffectMethodBase) : Boolean
      {
         return !!_effectsPass?_effectsPass.hasMethod(param1):false;
      }
      
      public function getMethodAt(param1:int) : EffectMethodBase
      {
         return _effectsPass.getMethodAt(param1);
      }
      
      public function addMethodAt(param1:EffectMethodBase, param2:int) : void
      {
         if(!_effectsPass)
         {
            _effectsPass = new SuperShaderPass(this);
         }
         _effectsPass.addMethodAt(param1,param2);
         invalidateScreenPasses();
      }
      
      public function removeMethod(param1:EffectMethodBase) : void
      {
         if(_effectsPass)
         {
            return;
         }
         _effectsPass.removeMethod(param1);
         if(_effectsPass.numMethods == 0)
         {
            invalidateScreenPasses();
         }
      }
      
      override public function set mipmap(param1:Boolean) : void
      {
         if(_mipmap == param1)
         {
            return;
         }
         .super.mipmap = param1;
      }
      
      public function get normalMap() : Texture2DBase
      {
         return _normalMethod.normalMap;
      }
      
      public function set normalMap(param1:Texture2DBase) : void
      {
         _normalMethod.normalMap = param1;
      }
      
      public function get specularMap() : Texture2DBase
      {
         return _specularMethod.texture;
      }
      
      public function set specularMap(param1:Texture2DBase) : void
      {
         if(_specularMethod)
         {
            _specularMethod.texture = param1;
            return;
         }
         throw new Error("No specular method was set to assign the specularGlossMap to");
      }
      
      public function get gloss() : Number
      {
         return !!_specularMethod?_specularMethod.gloss:0;
      }
      
      public function set gloss(param1:Number) : void
      {
         if(_specularMethod)
         {
            _specularMethod.gloss = param1;
         }
      }
      
      public function get ambient() : Number
      {
         return _ambientMethod.ambient;
      }
      
      public function set ambient(param1:Number) : void
      {
         _ambientMethod.ambient = param1;
      }
      
      public function get specular() : Number
      {
         return !!_specularMethod?_specularMethod.specular:0;
      }
      
      public function set specular(param1:Number) : void
      {
         if(_specularMethod)
         {
            _specularMethod.specular = param1;
         }
      }
      
      public function get ambientColor() : uint
      {
         return _ambientMethod.ambientColor;
      }
      
      public function set ambientColor(param1:uint) : void
      {
         _ambientMethod.ambientColor = param1;
      }
      
      public function get specularColor() : uint
      {
         return _specularMethod.specularColor;
      }
      
      public function set specularColor(param1:uint) : void
      {
         _specularMethod.specularColor = param1;
      }
      
      override function updateMaterial(param1:Context3D) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         if(_screenPassesInvalid)
         {
            updateScreenPasses();
            _loc2_ = true;
         }
         if(_loc2_ || isAnyScreenPassInvalid())
         {
            clearPasses();
            addChildPassesFor(_casterLightPass);
            if(_nonCasterLightPasses)
            {
               _loc3_ = 0;
               while(_loc3_ < _nonCasterLightPasses.length)
               {
                  addChildPassesFor(_nonCasterLightPasses[_loc3_]);
                  _loc3_++;
               }
            }
            addChildPassesFor(_effectsPass);
            addScreenPass(_casterLightPass);
            if(_nonCasterLightPasses)
            {
               _loc3_ = 0;
               while(_loc3_ < _nonCasterLightPasses.length)
               {
                  addScreenPass(_nonCasterLightPasses[_loc3_]);
                  _loc3_++;
               }
            }
            addScreenPass(_effectsPass);
         }
      }
      
      private function addScreenPass(param1:CompiledPass) : void
      {
         if(param1)
         {
            addPass(param1);
            param1._passesDirty = false;
         }
      }
      
      private function isAnyScreenPassInvalid() : Boolean
      {
         var _loc1_:int = 0;
         if(_casterLightPass && _casterLightPass._passesDirty || _effectsPass && _effectsPass._passesDirty)
         {
            return true;
         }
         if(_nonCasterLightPasses)
         {
            _loc1_ = 0;
            while(_loc1_ < _nonCasterLightPasses.length)
            {
               if(_nonCasterLightPasses[_loc1_]._passesDirty)
               {
                  return true;
               }
               _loc1_++;
            }
         }
         return false;
      }
      
      private function addChildPassesFor(param1:CompiledPass) : void
      {
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         if(!param1)
         {
            return;
         }
         if(param1._passes)
         {
            _loc2_ = uint(param1._passes.length);
            _loc3_ = uint(0);
            while(_loc3_ < _loc2_)
            {
               addPass(param1._passes[_loc3_]);
               _loc3_++;
            }
         }
      }
      
      override function activatePass(param1:uint, param2:Stage3DProxy, param3:Camera3D, param4:Number, param5:Number) : void
      {
         if(param1 == 0)
         {
            param2._context3D.setBlendFactors("one","zero");
         }
         super.activatePass(param1,param2,param3,param4,param5);
      }
      
      override function deactivate(param1:Stage3DProxy) : void
      {
         super.deactivate(param1);
         param1._context3D.setBlendFactors("one","zero");
      }
      
      protected function updateScreenPasses() : void
      {
         initPasses();
         setBlendAndCompareModes();
         _screenPassesInvalid = false;
      }
      
      private function initPasses() : void
      {
         if(numLights == 0 || numMethods > 0)
         {
            initEffectsPass();
         }
         else if(_effectsPass && numMethods == 0)
         {
            removeEffectsPass();
         }
         if(_shadowMethod)
         {
            initCasterLightPass();
         }
         else
         {
            removeCasterLightPass();
         }
         if(numNonCasters > 0)
         {
            initNonCasterLightPasses();
         }
         else
         {
            removeNonCasterLightPasses();
         }
      }
      
      private function setBlendAndCompareModes() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = 0;
         if(_casterLightPass)
         {
            _casterLightPass.setBlendMode("normal",false);
            _casterLightPass.depthCompareMode = depthCompareMode;
         }
         if(_nonCasterLightPasses)
         {
            _loc2_ = 0;
            if(!_casterLightPass)
            {
               _nonCasterLightPasses[0].setBlendMode("normal",false);
               _nonCasterLightPasses[0].depthCompareMode = depthCompareMode;
               _loc2_ = 1;
            }
            _loc1_ = _loc2_;
            while(_loc1_ < _nonCasterLightPasses.length)
            {
               _nonCasterLightPasses[_loc1_].setBlendMode("add",false);
               _nonCasterLightPasses[_loc1_].depthCompareMode = "equal";
               _loc1_++;
            }
         }
         if(_casterLightPass || _nonCasterLightPasses)
         {
            if(_effectsPass)
            {
               _effectsPass.depthCompareMode = "equal";
               _effectsPass.setBlendMode("normal",true);
            }
         }
         else if(_effectsPass)
         {
            _effectsPass.depthCompareMode = depthCompareMode;
            _effectsPass.setBlendMode("normal",false);
         }
      }
      
      private function initCasterLightPass() : void
      {
         if(!_casterLightPass)
         {
            _casterLightPass = new ShadowCasterPass(this);
         }
         _casterLightPass.diffuseMethod = null;
         _casterLightPass.ambientMethod = null;
         _casterLightPass.normalMethod = null;
         _casterLightPass.specularMethod = null;
         _casterLightPass.shadowMethod = null;
         _casterLightPass.lightPicker = new StaticLightPicker([_shadowMethod.castingLight]);
         _casterLightPass.shadowMethod = _shadowMethod;
         _casterLightPass.diffuseMethod = _diffuseMethod;
         _casterLightPass.ambientMethod = _ambientMethod;
         _casterLightPass.normalMethod = _normalMethod;
         _casterLightPass.specularMethod = _specularMethod;
         _casterLightPass.diffuseLightSources = _diffuseLightSources;
         _casterLightPass.specularLightSources = _specularLightSources;
      }
      
      private function removeCasterLightPass() : void
      {
         if(!_casterLightPass)
         {
            return;
         }
         _casterLightPass.dispose();
         removePass(_casterLightPass);
         _casterLightPass = null;
      }
      
      private function initNonCasterLightPasses() : void
      {
         var _loc7_:* = null;
         removeNonCasterLightPasses();
         var _loc2_:int = _lightPicker.numDirectionalLights;
         var _loc5_:int = _lightPicker.numPointLights;
         var _loc6_:int = _lightPicker.numLightProbes;
         var _loc3_:int = 0;
         var _loc1_:int = 0;
         var _loc4_:int = 0;
         if(!_casterLightPass)
         {
            _loc2_ = _loc2_ + _lightPicker.numCastingDirectionalLights;
            _loc5_ = _loc5_ + _lightPicker.numCastingPointLights;
         }
         _nonCasterLightPasses = new Vector.<LightingPass>();
         while(_loc3_ < _loc2_ || _loc1_ < _loc5_ || _loc4_ < _loc6_)
         {
            _loc7_ = new LightingPass(this);
            _loc7_.includeCasters = _shadowMethod == null;
            _loc7_.directionalLightsOffset = _loc3_;
            _loc7_.pointLightsOffset = _loc1_;
            _loc7_.lightProbesOffset = _loc4_;
            _loc7_.diffuseMethod = null;
            _loc7_.ambientMethod = null;
            _loc7_.normalMethod = null;
            _loc7_.specularMethod = null;
            _loc7_.lightPicker = _lightPicker;
            _loc7_.diffuseMethod = _diffuseMethod;
            _loc7_.ambientMethod = _ambientMethod;
            _loc7_.normalMethod = _normalMethod;
            _loc7_.specularMethod = _specularMethod;
            _loc7_.diffuseLightSources = _diffuseLightSources;
            _loc7_.specularLightSources = _specularLightSources;
            _nonCasterLightPasses.push(_loc7_);
            _loc3_ = _loc3_ + _loc7_.numDirectionalLights;
            _loc1_ = _loc1_ + _loc7_.numPointLights;
            _loc4_ = _loc4_ + _loc7_.numLightProbes;
         }
      }
      
      private function removeNonCasterLightPasses() : void
      {
         var _loc1_:int = 0;
         if(!_nonCasterLightPasses)
         {
            return;
         }
         _loc1_ = 0;
         while(_loc1_ < _nonCasterLightPasses.length)
         {
            removePass(_nonCasterLightPasses[_loc1_]);
            _nonCasterLightPasses[_loc1_].dispose();
            _loc1_++;
         }
         _nonCasterLightPasses = null;
      }
      
      private function removeEffectsPass() : void
      {
         if(_effectsPass.diffuseMethod != _diffuseMethod)
         {
            _effectsPass.diffuseMethod.dispose();
         }
         removePass(_effectsPass);
         _effectsPass.dispose();
         _effectsPass = null;
      }
      
      private function initEffectsPass() : SuperShaderPass
      {
         if(!_effectsPass)
         {
            _effectsPass = new SuperShaderPass(this);
         }
         if(numLights == 0)
         {
            _effectsPass.diffuseMethod = null;
            _effectsPass.diffuseMethod = _diffuseMethod;
         }
         else
         {
            _effectsPass.diffuseMethod = null;
            _effectsPass.diffuseMethod = new BasicDiffuseMethod();
            _effectsPass.diffuseMethod.diffuseColor = 0;
            _effectsPass.diffuseMethod.diffuseAlpha = 0;
         }
         _effectsPass.preserveAlpha = false;
         _effectsPass.normalMethod = null;
         _effectsPass.normalMethod = _normalMethod;
         return _effectsPass;
      }
      
      private function get numLights() : int
      {
         return !!_lightPicker?_lightPicker.numLightProbes + _lightPicker.numDirectionalLights + _lightPicker.numPointLights + _lightPicker.numCastingDirectionalLights + _lightPicker.numCastingPointLights:0;
      }
      
      private function get numNonCasters() : int
      {
         return !!_lightPicker?_lightPicker.numLightProbes + _lightPicker.numDirectionalLights + _lightPicker.numPointLights:0;
      }
      
      protected function invalidateScreenPasses() : void
      {
         _screenPassesInvalid = true;
      }
      
      private function onLightsChange(param1:Event) : void
      {
         invalidateScreenPasses();
      }
   }
}
