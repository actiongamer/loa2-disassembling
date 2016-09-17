package away3d.materials
{
   import away3d.materials.methods.ColorMatrixMethod;
   import away3d.materials.passes.SuperShaderPass;
   import away3d.core.managers.Stage3DProxy;
   import away3d.cameras.Camera3D;
   import flash.geom.ColorTransform;
   import away3d.materials.methods.BasicAmbientMethod;
   import away3d.materials.methods.ShadowMapMethodBase;
   import away3d.materials.methods.SceneLightMapMethod;
   import away3d.materials.methods.BasicDiffuseMethod;
   import away3d.materials.methods.BasicNormalMethod;
   import away3d.materials.methods.BasicSpecularMethod;
   import away3d.materials.methods.EffectMethodBase;
   import away3d.textures.Texture2DBase;
   import flash.display3D.Context3D;
   import away3d.materials.lightpickers.LightPickerBase;
   
   public class SinglePassMaterialBase extends MaterialBase
   {
      
      private static var _add2Method:ColorMatrixMethod = new ColorMatrixMethod([2,0,0,0,0,0,2,0,0,0,0,0,2,0,0,0,0,0,1,0]);
       
      
      protected var _screenPass:SuperShaderPass;
      
      private var _alphaBlending:Boolean;
      
      public function SinglePassMaterialBase()
      {
         super();
         _screenPass = new SuperShaderPass(this);
         addPass(new SuperShaderPass(this));
      }
      
      public function get alphaThreshold() : Number
      {
         return _screenPass.diffuseMethod.alphaThreshold;
      }
      
      public function set alphaThreshold(param1:Number) : void
      {
         _screenPass.diffuseMethod.alphaThreshold = param1;
         _depthPass.alphaThreshold = param1;
         _distancePass.alphaThreshold = param1;
      }
      
      override public function set blendMode(param1:String) : void
      {
         .super.blendMode = param1;
         _screenPass.setBlendMode(param1,requiresBlending);
         if(param1 == "addx2" && !this.hasMethod(_add2Method))
         {
            addMethod(_add2Method);
         }
         else if(param1 != "addx2")
         {
            removeMethod(_add2Method);
         }
      }
      
      override public function set depthCompareMode(param1:String) : void
      {
         .super.depthCompareMode = param1;
         _screenPass.depthCompareMode = param1;
      }
      
      override function activateForDepth(param1:Stage3DProxy, param2:Camera3D, param3:Boolean = false, param4:Number = 1, param5:Number = 1) : void
      {
         if(param3)
         {
            _distancePass.alphaMask = _screenPass.diffuseMethod.texture;
         }
         else
         {
            _depthPass.alphaMask = _screenPass.diffuseMethod.texture;
         }
         super.activateForDepth(param1,param2,param3,param4,param5);
      }
      
      public function get specularLightSources() : uint
      {
         return _screenPass.specularLightSources;
      }
      
      public function set specularLightSources(param1:uint) : void
      {
         _screenPass.specularLightSources = param1;
      }
      
      public function get diffuseLightSources() : uint
      {
         return _screenPass.diffuseLightSources;
      }
      
      public function set diffuseLightSources(param1:uint) : void
      {
         _screenPass.diffuseLightSources = param1;
      }
      
      public function get colorTransform() : ColorTransform
      {
         return _screenPass.colorTransform;
      }
      
      public function set colorTransform(param1:ColorTransform) : void
      {
         _screenPass.colorTransform = param1;
      }
      
      override public function get requiresBlending() : Boolean
      {
         return super.requiresBlending || _alphaBlending || _screenPass.colorTransform && _screenPass.colorTransform.alphaMultiplier < 1;
      }
      
      public function get ambientMethod() : BasicAmbientMethod
      {
         return _screenPass.ambientMethod;
      }
      
      public function set ambientMethod(param1:BasicAmbientMethod) : void
      {
         _screenPass.ambientMethod = param1;
      }
      
      public function get shadowMethod() : ShadowMapMethodBase
      {
         return _screenPass.shadowMethod;
      }
      
      public function set shadowMethod(param1:ShadowMapMethodBase) : void
      {
         _screenPass.shadowMethod = param1;
      }
      
      public function get lightMapMethod() : SceneLightMapMethod
      {
         return _screenPass.lightMapMethod;
      }
      
      public function set lightMapMethod(param1:SceneLightMapMethod) : void
      {
         _screenPass.lightMapMethod = param1;
      }
      
      public function get diffuseMethod() : BasicDiffuseMethod
      {
         return _screenPass.diffuseMethod;
      }
      
      public function set diffuseMethod(param1:BasicDiffuseMethod) : void
      {
         _screenPass.diffuseMethod = param1;
      }
      
      public function get normalMethod() : BasicNormalMethod
      {
         return _screenPass.normalMethod;
      }
      
      public function set normalMethod(param1:BasicNormalMethod) : void
      {
         _screenPass.normalMethod = param1;
      }
      
      public function get specularMethod() : BasicSpecularMethod
      {
         return _screenPass.specularMethod;
      }
      
      public function set specularMethod(param1:BasicSpecularMethod) : void
      {
         _screenPass.specularMethod = param1;
      }
      
      public function addMethod(param1:EffectMethodBase) : void
      {
         _screenPass.addMethod(param1);
      }
      
      public function get numMethods() : int
      {
         return _screenPass.numMethods;
      }
      
      public function hasMethod(param1:EffectMethodBase) : Boolean
      {
         return _screenPass.hasMethod(param1);
      }
      
      public function getMethodAt(param1:int) : EffectMethodBase
      {
         return _screenPass.getMethodAt(param1);
      }
      
      public function addMethodAt(param1:EffectMethodBase, param2:int) : void
      {
         _screenPass.addMethodAt(param1,param2);
      }
      
      public function removeMethod(param1:EffectMethodBase) : void
      {
         _screenPass.removeMethod(param1);
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
         return _screenPass.normalMap;
      }
      
      public function set normalMap(param1:Texture2DBase) : void
      {
         _screenPass.normalMap = param1;
      }
      
      public function get specularMap() : Texture2DBase
      {
         return _screenPass.specularMethod.texture;
      }
      
      public function set specularMap(param1:Texture2DBase) : void
      {
         if(_screenPass.specularMethod)
         {
            _screenPass.specularMethod.texture = param1;
            return;
         }
         throw new Error("No specular method was set to assign the specularGlossMap to");
      }
      
      public function get gloss() : Number
      {
         return !!_screenPass.specularMethod?_screenPass.specularMethod.gloss:0;
      }
      
      public function set gloss(param1:Number) : void
      {
         if(_screenPass.specularMethod)
         {
            _screenPass.specularMethod.gloss = param1;
         }
      }
      
      public function get ambient() : Number
      {
         return _screenPass.ambientMethod.ambient;
      }
      
      public function set ambient(param1:Number) : void
      {
         _screenPass.ambientMethod.ambient = param1;
      }
      
      public function get specular() : Number
      {
         return !!_screenPass.specularMethod?_screenPass.specularMethod.specular:0;
      }
      
      public function set specular(param1:Number) : void
      {
         if(_screenPass.specularMethod)
         {
            _screenPass.specularMethod.specular = param1;
         }
      }
      
      public function get ambientColor() : uint
      {
         return _screenPass.ambientMethod.ambientColor;
      }
      
      public function set ambientColor(param1:uint) : void
      {
         _screenPass.ambientMethod.ambientColor = param1;
      }
      
      public function get specularColor() : uint
      {
         return _screenPass.specularMethod.specularColor;
      }
      
      public function set specularColor(param1:uint) : void
      {
         _screenPass.specularMethod.specularColor = param1;
      }
      
      public function get alphaBlending() : Boolean
      {
         return _alphaBlending;
      }
      
      public function set alphaBlending(param1:Boolean) : void
      {
         _alphaBlending = param1;
         _screenPass.setBlendMode(blendMode,requiresBlending);
         _screenPass.preserveAlpha = requiresBlending;
      }
      
      override function updateMaterial(param1:Context3D) : void
      {
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         if(_screenPass._passesDirty)
         {
            clearPasses();
            if(_screenPass._passes)
            {
               _loc2_ = uint(_screenPass._passes.length);
               _loc3_ = uint(0);
               while(_loc3_ < _loc2_)
               {
                  addPass(_screenPass._passes[_loc3_]);
                  _loc3_++;
               }
            }
            addPass(_screenPass);
            _screenPass._passesDirty = false;
         }
      }
      
      override public function set lightPicker(param1:LightPickerBase) : void
      {
         .super.lightPicker = param1;
         _screenPass.lightPicker = param1;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _screenPass = null;
      }
   }
}
