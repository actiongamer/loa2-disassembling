package away3d.materials.passes
{
   import away3d.materials.compilation.ShaderCompiler;
   import away3d.materials.compilation.SuperShaderCompiler;
   import §away3d:arcane§.invalidateShaderProgram;
   import flash.geom.ColorTransform;
   import away3d.materials.methods.ColorTransformMethod;
   import away3d.materials.methods.EffectMethodBase;
   import away3d.core.managers.Stage3DProxy;
   import away3d.cameras.Camera3D;
   import away3d.materials.methods.MethodVOSet;
   import flash.geom.Vector3D;
   import away3d.lights.DirectionalLight;
   import away3d.lights.PointLight;
   import away3d.lights.LightProbe;
   import away3d.materials.MaterialBase;
   
   public class SuperShaderPass extends CompiledPass
   {
       
      
      private var _includeCasters:Boolean = true;
      
      public function SuperShaderPass(param1:MaterialBase)
      {
         super(param1);
         _needFragmentAnimation = true;
      }
      
      override protected function createCompiler() : ShaderCompiler
      {
         return new SuperShaderCompiler();
      }
      
      public function get includeCasters() : Boolean
      {
         return _includeCasters;
      }
      
      public function set includeCasters(param1:Boolean) : void
      {
         if(_includeCasters == param1)
         {
            return;
         }
         _includeCasters = param1;
         invalidateShaderProgram();
      }
      
      public function get colorTransform() : ColorTransform
      {
         return !!_methodSetup.colorTransformMethod?_methodSetup._colorTransformMethod.colorTransform:null;
      }
      
      public function set colorTransform(param1:ColorTransform) : void
      {
         if(param1)
         {
            if(!colorTransformMethod)
            {
               colorTransformMethod = new ColorTransformMethod();
            }
            _methodSetup._colorTransformMethod.colorTransform = param1;
         }
         else if(!param1)
         {
            if(_methodSetup._colorTransformMethod)
            {
               colorTransformMethod = null;
            }
            var _loc2_:* = null;
            _methodSetup._colorTransformMethod = _loc2_;
            colorTransformMethod = _loc2_;
         }
      }
      
      public function get colorTransformMethod() : ColorTransformMethod
      {
         return _methodSetup.colorTransformMethod;
      }
      
      public function set colorTransformMethod(param1:ColorTransformMethod) : void
      {
         _methodSetup.colorTransformMethod = param1;
      }
      
      public function addMethod(param1:EffectMethodBase) : void
      {
         _methodSetup.addMethod(param1);
      }
      
      public function get numMethods() : int
      {
         return _methodSetup.numMethods;
      }
      
      public function hasMethod(param1:EffectMethodBase) : Boolean
      {
         return _methodSetup.hasMethod(param1);
      }
      
      public function getMethodAt(param1:int) : EffectMethodBase
      {
         return _methodSetup.getMethodAt(param1);
      }
      
      public function addMethodAt(param1:EffectMethodBase, param2:int) : void
      {
         _methodSetup.addMethodAt(param1,param2);
      }
      
      public function removeMethod(param1:EffectMethodBase) : void
      {
         _methodSetup.removeMethod(param1);
      }
      
      override protected function updateLights() : void
      {
         super.updateLights();
         _numPointLights = _lightPicker.numPointLights;
         _numDirectionalLights = _lightPicker.numDirectionalLights;
         _numLightProbes = _lightPicker.numLightProbes;
         if(_includeCasters)
         {
            _numPointLights = _numPointLights + _lightPicker.numCastingPointLights;
            _numDirectionalLights = _numDirectionalLights + _lightPicker.numCastingDirectionalLights;
         }
         invalidateShaderProgram();
      }
      
      override function activate(param1:Stage3DProxy, param2:Camera3D, param3:Number, param4:Number) : void
      {
         var _loc9_:int = 0;
         var _loc6_:* = null;
         var _loc8_:* = null;
         super.activate(param1,param2,param3,param4);
         if(_methodSetup._colorTransformMethod)
         {
            _methodSetup._colorTransformMethod.activate(_methodSetup._colorTransformMethodVO,param1);
         }
         var _loc5_:Vector.<MethodVOSet> = _methodSetup._methods;
         var _loc7_:uint = _loc5_.length;
         _loc9_ = 0;
         while(_loc9_ < _loc7_)
         {
            _loc6_ = _loc5_[_loc9_];
            _loc6_.method.activate(_loc6_.data,param1);
            _loc9_++;
         }
         if(_cameraPositionIndex >= 0)
         {
            _loc8_ = param2.scenePosition;
            _vertexConstantData[_cameraPositionIndex] = _loc8_.x;
            _vertexConstantData[_cameraPositionIndex + 1] = _loc8_.y;
            _vertexConstantData[_cameraPositionIndex + 2] = _loc8_.z;
         }
      }
      
      override function deactivate(param1:Stage3DProxy) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = 0;
         var _loc5_:* = 0;
         super.deactivate(param1);
         if(_methodSetup._colorTransformMethod)
         {
            _methodSetup._colorTransformMethod.deactivate(_methodSetup._colorTransformMethodVO,param1);
         }
         var _loc2_:Vector.<MethodVOSet> = _methodSetup._methods;
         if(_loc2_)
         {
            _loc4_ = uint(_loc2_.length);
            _loc5_ = uint(0);
            while(_loc5_ < _loc4_)
            {
               _loc3_ = _loc2_[_loc5_];
               _loc3_.method.deactivate(_loc3_.data,param1);
               _loc5_++;
            }
         }
      }
      
      override protected function addPassesFromMethods() : void
      {
         var _loc2_:* = 0;
         super.addPassesFromMethods();
         if(_methodSetup._colorTransformMethod)
         {
            addPasses(_methodSetup._colorTransformMethod.passes);
         }
         var _loc1_:Vector.<MethodVOSet> = _methodSetup._methods;
         if(!_loc1_)
         {
            return;
         }
         _loc2_ = uint(0);
         while(_loc2_ < _loc1_.length)
         {
            addPasses(_loc1_[_loc2_].method.passes);
            _loc2_++;
         }
      }
      
      private function usesProbesForSpecular() : Boolean
      {
         return _numLightProbes > 0 && (_specularLightSources & 2) != 0;
      }
      
      private function usesProbesForDiffuse() : Boolean
      {
         return _numLightProbes > 0 && (_diffuseLightSources & 2) != 0;
      }
      
      override protected function updateMethodConstants() : void
      {
         var _loc3_:* = 0;
         super.updateMethodConstants();
         if(_methodSetup._colorTransformMethod)
         {
            _methodSetup._colorTransformMethod.initConstants(_methodSetup._colorTransformMethodVO);
         }
         var _loc1_:Vector.<MethodVOSet> = _methodSetup._methods;
         var _loc2_:uint = _loc1_.length;
         _loc3_ = uint(0);
         while(_loc3_ < _loc2_)
         {
            _loc1_[_loc3_].method.initConstants(_loc1_[_loc3_].data);
            _loc3_++;
         }
      }
      
      override protected function updateLightConstants() : void
      {
         var _loc3_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = 0;
         var _loc11_:* = 0;
         var _loc6_:int = 0;
         var _loc10_:* = null;
         var _loc2_:int = 0;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc1_:uint = 0;
         var _loc7_:uint = !!_includeCasters?2:1;
         _loc9_ = uint(_lightFragmentConstantIndex);
         _loc2_ = 0;
         while(_loc2_ < _loc7_)
         {
            _loc4_ = !!_loc2_?_lightPicker.castingDirectionalLights:_lightPicker.directionalLights;
            _loc6_ = _loc4_.length;
            _loc1_ = _loc1_ + _loc6_;
            _loc11_ = uint(0);
            while(_loc11_ < _loc6_)
            {
               _loc3_ = _loc4_[_loc11_];
               _loc10_ = _loc3_.sceneDirection;
               _ambientLightR = _ambientLightR + _loc3_._ambientR;
               _ambientLightG = _ambientLightG + _loc3_._ambientG;
               _ambientLightB = _ambientLightB + _loc3_._ambientB;
               _fragmentConstantData[_loc9_++] = -_loc10_.x;
               _fragmentConstantData[_loc9_++] = -_loc10_.y;
               _fragmentConstantData[_loc9_++] = -_loc10_.z;
               _fragmentConstantData[_loc9_++] = 1;
               _fragmentConstantData[_loc9_++] = _loc3_._diffuseR;
               _fragmentConstantData[_loc9_++] = _loc3_._diffuseG;
               _fragmentConstantData[_loc9_++] = _loc3_._diffuseB;
               _fragmentConstantData[_loc9_++] = 1;
               _fragmentConstantData[_loc9_++] = _loc3_._specularR;
               _fragmentConstantData[_loc9_++] = _loc3_._specularG;
               _fragmentConstantData[_loc9_++] = _loc3_._specularB;
               _fragmentConstantData[_loc9_++] = 1;
               _loc11_++;
            }
            _loc2_++;
         }
         if(_numDirectionalLights > _loc1_)
         {
            _loc11_ = uint(_loc9_ + (_numDirectionalLights - _loc1_) * 12);
            while(_loc9_ < _loc11_)
            {
               _fragmentConstantData[_loc9_++] = 0;
            }
         }
         _loc1_ = 0;
         _loc2_ = 0;
         while(_loc2_ < _loc7_)
         {
            _loc5_ = !!_loc2_?_lightPicker.castingPointLights:_lightPicker.pointLights;
            _loc6_ = _loc5_.length;
            _loc11_ = uint(0);
            while(_loc11_ < _loc6_)
            {
               _loc8_ = _loc5_[_loc11_];
               _loc10_ = _loc8_.scenePosition;
               _ambientLightR = _ambientLightR + _loc8_._ambientR;
               _ambientLightG = _ambientLightG + _loc8_._ambientG;
               _ambientLightB = _ambientLightB + _loc8_._ambientB;
               _fragmentConstantData[_loc9_++] = _loc10_.x;
               _fragmentConstantData[_loc9_++] = _loc10_.y;
               _fragmentConstantData[_loc9_++] = _loc10_.z;
               _fragmentConstantData[_loc9_++] = 1;
               _fragmentConstantData[_loc9_++] = _loc8_._diffuseR;
               _fragmentConstantData[_loc9_++] = _loc8_._diffuseG;
               _fragmentConstantData[_loc9_++] = _loc8_._diffuseB;
               _fragmentConstantData[_loc9_++] = _loc8_._radius;
               _fragmentConstantData[_loc9_++] = _loc8_._specularR;
               _fragmentConstantData[_loc9_++] = _loc8_._specularG;
               _fragmentConstantData[_loc9_++] = _loc8_._specularB;
               _fragmentConstantData[_loc9_++] = _loc8_._fallOffFactor;
               _loc11_++;
            }
            _loc2_++;
         }
         if(_numPointLights > _loc1_)
         {
            _loc11_ = uint(_loc9_ + (_loc1_ - _numPointLights) * 12);
            while(_loc9_ < _loc11_)
            {
               _fragmentConstantData[_loc9_] = 0;
               _loc9_++;
            }
         }
      }
      
      override protected function updateProbes(param1:Stage3DProxy) : void
      {
         var _loc8_:* = null;
         var _loc6_:* = 0;
         var _loc7_:Vector.<LightProbe> = _lightPicker.lightProbes;
         var _loc3_:Vector.<Number> = _lightPicker.lightProbeWeights;
         var _loc5_:int = _loc7_.length;
         var _loc4_:Boolean = usesProbesForDiffuse();
         var _loc2_:Boolean = _methodSetup._specularMethod && usesProbesForSpecular();
         if(!(_loc4_ || _loc2_))
         {
            return;
         }
         _loc6_ = uint(0);
         while(_loc6_ < _loc5_)
         {
            _loc8_ = _loc7_[_loc6_];
            if(_loc4_)
            {
               param1.setTextureAt(_lightProbeDiffuseIndices[_loc6_],_loc8_.diffuseMap.getTextureForStage3D(param1));
            }
            if(_loc2_)
            {
               param1.setTextureAt(_lightProbeSpecularIndices[_loc6_],_loc8_.specularMap.getTextureForStage3D(param1));
            }
            _loc6_++;
         }
         _fragmentConstantData[_probeWeightsIndex] = _loc3_[0];
         _fragmentConstantData[_probeWeightsIndex + 1] = _loc3_[1];
         _fragmentConstantData[_probeWeightsIndex + 2] = _loc3_[2];
         _fragmentConstantData[_probeWeightsIndex + 3] = _loc3_[3];
      }
   }
}
