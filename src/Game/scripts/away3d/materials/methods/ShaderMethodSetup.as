package away3d.materials.methods
{
   import flash.events.EventDispatcher;
   import away3d.events.ShadingMethodEvent;
   import §away3d:arcane§._normalMethod;
   import §away3d:arcane§._normalMethodVO;
   import §away3d:arcane§._ambientMethod;
   import §away3d:arcane§._ambientMethodVO;
   import §away3d:arcane§._shadowMethod;
   import §away3d:arcane§._shadowMethodVO;
   import §away3d:arcane§._diffuseMethod;
   import §away3d:arcane§._diffuseMethodVO;
   import §away3d:arcane§._specularMethod;
   import §away3d:arcane§._specularMethodVO;
   import §away3d:arcane§._colorTransformMethod;
   import §away3d:arcane§._colorTransformMethodVO;
   import §away3d:arcane§._lightMapMethod;
   import §away3d:arcane§._methods;
   import §away3d:arcane§._lightMapMethodVO;
   
   public class ShaderMethodSetup extends EventDispatcher
   {
       
      
      var _colorTransformMethod:away3d.materials.methods.ColorTransformMethod;
      
      var _colorTransformMethodVO:away3d.materials.methods.MethodVO;
      
      var _normalMethod:away3d.materials.methods.BasicNormalMethod;
      
      var _normalMethodVO:away3d.materials.methods.MethodVO;
      
      var _ambientMethod:away3d.materials.methods.BasicAmbientMethod;
      
      var _ambientMethodVO:away3d.materials.methods.MethodVO;
      
      var _shadowMethod:away3d.materials.methods.ShadowMapMethodBase;
      
      var _shadowMethodVO:away3d.materials.methods.MethodVO;
      
      var _diffuseMethod:away3d.materials.methods.BasicDiffuseMethod;
      
      var _diffuseMethodVO:away3d.materials.methods.MethodVO;
      
      var _specularMethod:away3d.materials.methods.BasicSpecularMethod;
      
      var _specularMethodVO:away3d.materials.methods.MethodVO;
      
      var _methods:Vector.<away3d.materials.methods.MethodVOSet>;
      
      var _lightMapMethod:away3d.materials.methods.SceneLightMapMethod;
      
      var _lightMapMethodVO:away3d.materials.methods.MethodVO;
      
      public function ShaderMethodSetup()
      {
         super();
         _methods = new Vector.<away3d.materials.methods.MethodVOSet>();
         _normalMethod = new away3d.materials.methods.BasicNormalMethod();
         _ambientMethod = new away3d.materials.methods.BasicAmbientMethod();
         _diffuseMethod = new away3d.materials.methods.BasicDiffuseMethod();
         _specularMethod = new away3d.materials.methods.BasicSpecularMethod();
         _normalMethod.addEventListener("ShaderInvalidated",onShaderInvalidated);
         _diffuseMethod.addEventListener("ShaderInvalidated",onShaderInvalidated);
         _specularMethod.addEventListener("ShaderInvalidated",onShaderInvalidated);
         _ambientMethod.addEventListener("ShaderInvalidated",onShaderInvalidated);
         _normalMethodVO = _normalMethod.createMethodVO();
         _ambientMethodVO = _ambientMethod.createMethodVO();
         _diffuseMethodVO = _diffuseMethod.createMethodVO();
         _specularMethodVO = _specularMethod.createMethodVO();
      }
      
      private function onShaderInvalidated(param1:ShadingMethodEvent) : void
      {
         invalidateShaderProgram();
      }
      
      private function invalidateShaderProgram() : void
      {
         dispatchEvent(new ShadingMethodEvent("ShaderInvalidated"));
      }
      
      public function get normalMethod() : away3d.materials.methods.BasicNormalMethod
      {
         return _normalMethod;
      }
      
      public function set normalMethod(param1:away3d.materials.methods.BasicNormalMethod) : void
      {
         if(_normalMethod)
         {
            _normalMethod.removeEventListener("ShaderInvalidated",onShaderInvalidated);
         }
         if(param1)
         {
            if(_normalMethod)
            {
               param1.copyFrom(_normalMethod);
            }
            _normalMethodVO = param1.createMethodVO();
            param1.addEventListener("ShaderInvalidated",onShaderInvalidated);
         }
         _normalMethod = param1;
         if(param1)
         {
            invalidateShaderProgram();
         }
      }
      
      public function get ambientMethod() : away3d.materials.methods.BasicAmbientMethod
      {
         return _ambientMethod;
      }
      
      public function set ambientMethod(param1:away3d.materials.methods.BasicAmbientMethod) : void
      {
         if(_ambientMethod)
         {
            _ambientMethod.removeEventListener("ShaderInvalidated",onShaderInvalidated);
         }
         if(param1)
         {
            if(_ambientMethod)
            {
               param1.copyFrom(_ambientMethod);
            }
            param1.addEventListener("ShaderInvalidated",onShaderInvalidated);
            _ambientMethodVO = param1.createMethodVO();
         }
         _ambientMethod = param1;
         if(param1)
         {
            invalidateShaderProgram();
         }
      }
      
      public function get shadowMethod() : away3d.materials.methods.ShadowMapMethodBase
      {
         return _shadowMethod;
      }
      
      public function set shadowMethod(param1:away3d.materials.methods.ShadowMapMethodBase) : void
      {
         if(_shadowMethod)
         {
            _shadowMethod.removeEventListener("ShaderInvalidated",onShaderInvalidated);
         }
         _shadowMethod = param1;
         if(_shadowMethod)
         {
            _shadowMethod.addEventListener("ShaderInvalidated",onShaderInvalidated);
            _shadowMethodVO = _shadowMethod.createMethodVO();
         }
         else
         {
            _shadowMethodVO = null;
         }
         invalidateShaderProgram();
      }
      
      public function get diffuseMethod() : away3d.materials.methods.BasicDiffuseMethod
      {
         return _diffuseMethod;
      }
      
      public function set diffuseMethod(param1:away3d.materials.methods.BasicDiffuseMethod) : void
      {
         if(_diffuseMethod)
         {
            _diffuseMethod.removeEventListener("ShaderInvalidated",onShaderInvalidated);
         }
         if(param1)
         {
            if(_diffuseMethod)
            {
               param1.copyFrom(_diffuseMethod);
            }
            param1.addEventListener("ShaderInvalidated",onShaderInvalidated);
            _diffuseMethodVO = param1.createMethodVO();
         }
         _diffuseMethod = param1;
         if(param1)
         {
            invalidateShaderProgram();
         }
      }
      
      public function get specularMethod() : away3d.materials.methods.BasicSpecularMethod
      {
         return _specularMethod;
      }
      
      public function set specularMethod(param1:away3d.materials.methods.BasicSpecularMethod) : void
      {
         if(_specularMethod)
         {
            _specularMethod.removeEventListener("ShaderInvalidated",onShaderInvalidated);
            if(param1)
            {
               param1.copyFrom(_specularMethod);
            }
         }
         _specularMethod = param1;
         if(_specularMethod)
         {
            _specularMethod.addEventListener("ShaderInvalidated",onShaderInvalidated);
            _specularMethodVO = _specularMethod.createMethodVO();
         }
         else
         {
            _specularMethodVO = null;
         }
         invalidateShaderProgram();
      }
      
      function get colorTransformMethod() : away3d.materials.methods.ColorTransformMethod
      {
         return _colorTransformMethod;
      }
      
      function set colorTransformMethod(param1:away3d.materials.methods.ColorTransformMethod) : void
      {
         if(_colorTransformMethod == param1)
         {
            return;
         }
         if(_colorTransformMethod)
         {
            _colorTransformMethod.removeEventListener("ShaderInvalidated",onShaderInvalidated);
         }
         if(!_colorTransformMethod || !param1)
         {
            invalidateShaderProgram();
         }
         _colorTransformMethod = param1;
         if(_colorTransformMethod)
         {
            _colorTransformMethod.addEventListener("ShaderInvalidated",onShaderInvalidated);
            _colorTransformMethodVO = _colorTransformMethod.createMethodVO();
         }
         else
         {
            _colorTransformMethodVO = null;
         }
      }
      
      public function dispose() : void
      {
         clearListeners(_normalMethod);
         _normalMethod = null;
         clearListeners(_diffuseMethod);
         _diffuseMethod = null;
         clearListeners(_shadowMethod);
         _shadowMethod = null;
         clearListeners(_lightMapMethod);
         _lightMapMethod = null;
         clearListeners(_ambientMethod);
         _ambientMethod = null;
         clearListeners(_specularMethod);
         _specularMethod = null;
         if(!_methods)
         {
            return;
         }
         while(_methods.length)
         {
            clearListeners(_methods.shift().method);
         }
         _methods.length = 0;
      }
      
      private function clearListeners(param1:ShadingMethodBase) : void
      {
         if(param1)
         {
            param1.removeEventListener("ShaderInvalidated",onShaderInvalidated);
            param1.dispose();
         }
      }
      
      public function addMethod(param1:EffectMethodBase) : void
      {
         _methods.push(new away3d.materials.methods.MethodVOSet(param1));
         param1.addEventListener("ShaderInvalidated",onShaderInvalidated);
         invalidateShaderProgram();
      }
      
      public function hasMethod(param1:EffectMethodBase) : Boolean
      {
         return getMethodSetForMethod(param1) != null;
      }
      
      public function addMethodAt(param1:EffectMethodBase, param2:int) : void
      {
         _methods.splice(param2,0,new away3d.materials.methods.MethodVOSet(param1));
         param1.addEventListener("ShaderInvalidated",onShaderInvalidated);
         invalidateShaderProgram();
      }
      
      public function getMethodAt(param1:int) : EffectMethodBase
      {
         return EffectMethodBase(_methods[param1].method);
      }
      
      public function get numMethods() : int
      {
         return _methods.length;
      }
      
      public function removeMethod(param1:EffectMethodBase) : void
      {
         var _loc2_:int = 0;
         var _loc3_:away3d.materials.methods.MethodVOSet = getMethodSetForMethod(param1);
         if(_loc3_ != null)
         {
            _loc2_ = _methods.indexOf(_loc3_);
            _methods.splice(_loc2_,1);
            param1.removeEventListener("ShaderInvalidated",onShaderInvalidated);
            invalidateShaderProgram();
         }
      }
      
      private function getMethodSetForMethod(param1:EffectMethodBase) : away3d.materials.methods.MethodVOSet
      {
         var _loc3_:int = 0;
         if(!_methods)
         {
            return null;
         }
         var _loc2_:int = _methods.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            if(_methods[_loc3_].method == param1)
            {
               return _methods[_loc3_];
            }
            _loc3_++;
         }
         return null;
      }
      
      public function get lightMapMethod() : away3d.materials.methods.SceneLightMapMethod
      {
         return _lightMapMethod;
      }
      
      public function set lightMapMethod(param1:away3d.materials.methods.SceneLightMapMethod) : void
      {
         if(_lightMapMethod)
         {
            _lightMapMethod.removeEventListener("ShaderInvalidated",onShaderInvalidated);
         }
         _lightMapMethod = param1;
         if(_lightMapMethod)
         {
            _lightMapMethod.addEventListener("ShaderInvalidated",onShaderInvalidated);
            _lightMapMethodVO = _lightMapMethod.createMethodVO();
         }
         else
         {
            _lightMapMethod = null;
         }
         invalidateShaderProgram();
      }
   }
}
