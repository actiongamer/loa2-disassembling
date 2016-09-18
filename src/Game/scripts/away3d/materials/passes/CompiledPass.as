package away3d.materials.passes
{
   import away3d.materials.compilation.ShaderCompiler;
   import away3d.materials.methods.ShaderMethodSetup;
   import away3d.materials.methods.BasicAmbientMethod;
   import §away3d:arcane§.invalidateShaderProgram;
   import away3d.materials.methods.BasicDiffuseMethod;
   import away3d.materials.methods.SceneLightMapMethod;
   import away3d.textures.Texture2DBase;
   import away3d.materials.methods.BasicNormalMethod;
   import away3d.materials.methods.ShadowMapMethodBase;
   import away3d.materials.methods.BasicSpecularMethod;
   import §away3d:arcane§._passes;
   import away3d.materials.methods.MethodVOSet;
   import away3d.materials.methods.OutlineMethod;
   import away3d.materials.methods.OutlineMethod2;
   import §away3d:arcane§._passesDirty;
   import away3d.errors.AbstractMethodError;
   import away3d.core.managers.Stage3DProxy;
   import away3d.cameras.Camera3D;
   import away3d.core.base.IRenderable;
   import flash.display3D.Context3D;
   import flash.geom.Matrix;
   import away3d.events.ShadingMethodEvent;
   import away3d.materials.MaterialBase;
   
   public class CompiledPass extends away3d.materials.passes.MaterialPassBase
   {
       
      
      protected var _ambientLightB:Number;
      
      protected var _ambientLightG:Number;
      
      protected var _ambientLightR:Number;
      
      protected var _animateUVs:Boolean;
      
      protected var _cameraPositionIndex:int;
      
      protected var _commonsDataIndex:int;
      
      protected var _compiler:ShaderCompiler;
      
      protected var _diffuseLightSources:uint = 3;
      
      protected var _fragmentAnimationCode:String;
      
      protected var _fragmentConstantData:Vector.<Number>;
      
      protected var _fragmentLightCode:String;
      
      protected var _framentPostLightCode:String;
      
      protected var _lightFragmentConstantIndex:int;
      
      protected var _lightProbeDiffuseIndices:Vector.<uint>;
      
      protected var _lightProbeSpecularIndices:Vector.<uint>;
      
      protected var _methodSetup:ShaderMethodSetup;
      
      protected var _normalBufferIndex:int;
      
      protected var _numDirectionalLights:uint;
      
      protected var _numLightProbes:uint;
      
      protected var _numPointLights:uint;
      
      protected var _preserveAlpha:Boolean = true;
      
      protected var _probeWeightsIndex:int;
      
      protected var _sceneMatrixIndex:int;
      
      protected var _sceneNormalMatrixIndex:int;
      
      protected var _secondaryUVBufferIndex:int;
      
      protected var _specularLightSources:uint = 1;
      
      protected var _tangentBufferIndex:int;
      
      protected var _usesNormals:Boolean;
      
      protected var _usingSpecularMethod:Boolean;
      
      protected var _uvBufferIndex:int;
      
      protected var _uvTransformIndex:int;
      
      protected var _vertexCode:String;
      
      protected var _vertexConstantData:Vector.<Number>;
      
      protected var _vertexConstantsOffset:uint;
      
      var _passes:Vector.<away3d.materials.passes.MaterialPassBase>;
      
      var _passesDirty:Boolean;
      
      public function CompiledPass(param1:MaterialBase)
      {
         _fragmentConstantData = new Vector.<Number>();
         _vertexConstantData = new Vector.<Number>();
         super();
         _material = param1;
         init();
      }
      
      public function get ambientMethod() : BasicAmbientMethod
      {
         return _methodSetup.ambientMethod;
      }
      
      public function set ambientMethod(param1:BasicAmbientMethod) : void
      {
         _methodSetup.ambientMethod = param1;
      }
      
      public function get animateUVs() : Boolean
      {
         return _animateUVs;
      }
      
      public function set animateUVs(param1:Boolean) : void
      {
         _animateUVs = param1;
         if(param1 && !_animateUVs || !param1 && _animateUVs)
         {
            invalidateShaderProgram();
         }
      }
      
      public function get diffuseLightSources() : uint
      {
         return _diffuseLightSources;
      }
      
      public function set diffuseLightSources(param1:uint) : void
      {
         _diffuseLightSources = param1;
      }
      
      public function get diffuseMethod() : BasicDiffuseMethod
      {
         return _methodSetup.diffuseMethod;
      }
      
      public function set diffuseMethod(param1:BasicDiffuseMethod) : void
      {
         _methodSetup.diffuseMethod = param1;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _methodSetup.removeEventListener("ShaderInvalidated",onShaderInvalidated);
         _methodSetup.dispose();
         cleanUp();
         _fragmentConstantData.length = 0;
         _vertexConstantData.length = 0;
         _lightProbeDiffuseIndices && _loc1_;
         _lightProbeSpecularIndices && _loc1_;
         _fragmentConstantData = null;
         _vertexConstantData = null;
         _lightProbeDiffuseIndices = null;
         _lightProbeSpecularIndices = null;
      }
      
      public function get lightMapMethod() : SceneLightMapMethod
      {
         return _methodSetup.lightMapMethod;
      }
      
      public function set lightMapMethod(param1:SceneLightMapMethod) : void
      {
         _methodSetup.lightMapMethod = param1;
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
         return _methodSetup._normalMethod.normalMap;
      }
      
      public function set normalMap(param1:Texture2DBase) : void
      {
         _methodSetup._normalMethod.normalMap = param1;
      }
      
      public function get normalMethod() : BasicNormalMethod
      {
         return _methodSetup.normalMethod;
      }
      
      public function set normalMethod(param1:BasicNormalMethod) : void
      {
         _methodSetup.normalMethod = param1;
      }
      
      public function get preserveAlpha() : Boolean
      {
         return _preserveAlpha;
      }
      
      public function set preserveAlpha(param1:Boolean) : void
      {
         if(_preserveAlpha == param1)
         {
            return;
         }
         _preserveAlpha = param1;
         invalidateShaderProgram();
      }
      
      public function get shadowMethod() : ShadowMapMethodBase
      {
         return _methodSetup.shadowMethod;
      }
      
      public function set shadowMethod(param1:ShadowMapMethodBase) : void
      {
         _methodSetup.shadowMethod = param1;
      }
      
      public function get specularLightSources() : uint
      {
         return _specularLightSources;
      }
      
      public function set specularLightSources(param1:uint) : void
      {
         _specularLightSources = param1;
      }
      
      public function get specularMethod() : BasicSpecularMethod
      {
         return _methodSetup.specularMethod;
      }
      
      public function set specularMethod(param1:BasicSpecularMethod) : void
      {
         _methodSetup.specularMethod = param1;
      }
      
      protected function addPasses(param1:Vector.<away3d.materials.passes.MaterialPassBase>) : void
      {
         var _loc3_:* = 0;
         if(!param1)
         {
            return;
         }
         var _loc2_:uint = param1.length;
         _loc3_ = uint(0);
         while(_loc3_ < _loc2_)
         {
            param1[_loc3_].material = material;
            param1[_loc3_].lightPicker = _lightPicker;
            _passes.push(param1[_loc3_]);
            _loc3_++;
         }
      }
      
      protected function addPassesFromMethods() : void
      {
         var _loc3_:int = 0;
         var _loc2_:Vector.<away3d.materials.passes.MaterialPassBase> = _passes;
         _passes = new Vector.<away3d.materials.passes.MaterialPassBase>();
         if(_methodSetup._normalMethod && _methodSetup._normalMethod.hasOutput)
         {
            addPasses(_methodSetup._normalMethod.passes);
         }
         if(_methodSetup._ambientMethod)
         {
            addPasses(_methodSetup._ambientMethod.passes);
         }
         if(_methodSetup._shadowMethod)
         {
            addPasses(_methodSetup._shadowMethod.passes);
         }
         if(_methodSetup._lightMapMethod)
         {
            addPasses(_methodSetup._lightMapMethod.passes);
         }
         if(_methodSetup._diffuseMethod)
         {
            addPasses(_methodSetup._diffuseMethod.passes);
         }
         if(_methodSetup._specularMethod)
         {
            addPasses(_methodSetup._specularMethod.passes);
         }
         var _loc5_:int = 0;
         var _loc4_:* = _methodSetup._methods;
         for each(var _loc1_ in _methodSetup._methods)
         {
            if(_loc1_.method is OutlineMethod)
            {
               _passes = _passes.concat(_loc1_.method.passes);
            }
            if(_loc1_.method is OutlineMethod2)
            {
               _passes = _passes.concat(_loc1_.method.passes);
            }
         }
         if(!_loc2_ || _passes.length != _loc2_.length)
         {
            _passesDirty = true;
            return;
         }
         _loc3_ = 0;
         while(_loc3_ < _passes.length)
         {
            if(_passes[_loc3_] != _loc2_[_loc3_])
            {
               _passesDirty = true;
               return;
            }
            _loc3_++;
         }
      }
      
      protected function cleanUp() : void
      {
         _compiler && _compiler.dispose();
         _compiler = null;
      }
      
      protected function createCompiler() : ShaderCompiler
      {
         throw new AbstractMethodError();
      }
      
      protected function initCommonsData() : void
      {
         _fragmentConstantData[_commonsDataIndex] = 0.5;
         _fragmentConstantData[_commonsDataIndex + 1] = 0;
         _fragmentConstantData[_commonsDataIndex + 2] = 0.00392156862745098;
         _fragmentConstantData[_commonsDataIndex + 3] = 1;
      }
      
      protected function initCompiler() : void
      {
         _compiler = createCompiler();
         _compiler.numPointLights = _numPointLights;
         _compiler.numDirectionalLights = _numDirectionalLights;
         _compiler.numLightProbes = _numLightProbes;
         _compiler.methodSetup = _methodSetup;
         _compiler.diffuseLightSources = _diffuseLightSources;
         _compiler.specularLightSources = _specularLightSources;
         _compiler.setTextureSampling(_smooth,_repeat,_mipmap);
         _compiler.setConstantDataBuffers(_vertexConstantData,_fragmentConstantData);
         _compiler.animateUVs = _animateUVs;
         _compiler.alphaPremultiplied = _alphaPremultiplied;
         _compiler.preserveAlpha = _preserveAlpha;
         _compiler.compile();
      }
      
      protected function initUVTransformData() : void
      {
         _vertexConstantData[_uvTransformIndex] = 1;
         _vertexConstantData[_uvTransformIndex + 1] = 0;
         _vertexConstantData[_uvTransformIndex + 2] = 0;
         _vertexConstantData[_uvTransformIndex + 3] = 0;
         _vertexConstantData[_uvTransformIndex + 4] = 0;
         _vertexConstantData[_uvTransformIndex + 5] = 1;
         _vertexConstantData[_uvTransformIndex + 6] = 0;
         _vertexConstantData[_uvTransformIndex + 7] = 0;
      }
      
      protected function updateLightConstants() : void
      {
      }
      
      override protected function updateLights() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < _passes.length)
         {
            _passes[_loc1_].lightPicker = _lightPicker;
            _loc1_++;
         }
      }
      
      protected function updateMethodConstants() : void
      {
         if(_methodSetup._normalMethod)
         {
            _methodSetup._normalMethod.initConstants(_methodSetup._normalMethodVO);
         }
         if(_methodSetup._diffuseMethod)
         {
            _methodSetup._diffuseMethod.initConstants(_methodSetup._diffuseMethodVO);
         }
         if(_methodSetup._ambientMethod)
         {
            _methodSetup._ambientMethod.initConstants(_methodSetup._ambientMethodVO);
         }
         if(_usingSpecularMethod)
         {
            _methodSetup._specularMethod.initConstants(_methodSetup._specularMethodVO);
         }
         if(_methodSetup._shadowMethod)
         {
            _methodSetup._shadowMethod.initConstants(_methodSetup._shadowMethodVO);
         }
         if(_methodSetup._lightMapMethod)
         {
            _methodSetup._lightMapMethod.initConstants(_methodSetup._lightMapMethodVO);
         }
      }
      
      protected function updateProbes(param1:Stage3DProxy) : void
      {
      }
      
      protected function updateRegisterIndices() : void
      {
         _vertexConstantsOffset = _compiler.vertexConstantsOffset;
         _uvBufferIndex = _compiler.uvBufferIndex;
         _uvTransformIndex = _compiler.uvTransformIndex;
         _secondaryUVBufferIndex = _compiler.secondaryUVBufferIndex;
         _normalBufferIndex = _compiler.normalBufferIndex;
         _tangentBufferIndex = _compiler.tangentBufferIndex;
         _lightFragmentConstantIndex = _compiler.lightFragmentConstantIndex;
         _cameraPositionIndex = _compiler.cameraPositionIndex;
         _commonsDataIndex = _compiler.commonsDataIndex;
         _sceneMatrixIndex = _compiler.sceneMatrixIndex;
         _sceneNormalMatrixIndex = _compiler.sceneNormalMatrixIndex;
         _probeWeightsIndex = _compiler.probeWeightsIndex;
         _lightProbeDiffuseIndices = _compiler.lightProbeDiffuseIndices;
         _lightProbeSpecularIndices = _compiler.lightProbeSpecularIndices;
      }
      
      protected function updateShaderProperties() : void
      {
         _animatableAttributes = _compiler.animatableAttributes;
         _animationTargetRegisters = _compiler.animationTargetRegisters;
         _vertexCode = _compiler.vertexCode;
         _fragmentLightCode = _compiler.fragmentLightCode;
         _framentPostLightCode = _compiler.framentPostLightCode;
         _shadedTarget = _compiler.shadedTarget;
         _usingSpecularMethod = _compiler.usingSpecularMethod;
         _usesNormals = _compiler.usesNormals;
         _needUVAnimation = _compiler.needUVAnimation;
         _UVSource = _compiler.UVSource;
         _UVTarget = _compiler.UVTarget;
         updateRegisterIndices();
         updateUsedOffsets();
      }
      
      protected function usesLights() : Boolean
      {
         return (_numPointLights > 0 || _numDirectionalLights > 0) && ((_diffuseLightSources | _specularLightSources) & 1) != 0;
      }
      
      protected function usesProbes() : Boolean
      {
         return _numLightProbes > 0 && ((_diffuseLightSources | _specularLightSources) & 2) != 0;
      }
      
      override function activate(param1:Stage3DProxy, param2:Camera3D, param3:Number, param4:Number) : void
      {
         super.activate(param1,param2,param3,param4);
         if(_usesNormals)
         {
            _methodSetup._normalMethod.activate(_methodSetup._normalMethodVO,param1);
         }
         _methodSetup._ambientMethod.activate(_methodSetup._ambientMethodVO,param1);
         if(_methodSetup._shadowMethod)
         {
            _methodSetup._shadowMethod.activate(_methodSetup._shadowMethodVO,param1);
         }
         if(_methodSetup._lightMapMethod)
         {
            _methodSetup._lightMapMethod.activate(_methodSetup._lightMapMethodVO,param1);
         }
         _methodSetup._diffuseMethod.activate(_methodSetup._diffuseMethodVO,param1);
         if(_usingSpecularMethod)
         {
            _methodSetup._specularMethod.activate(_methodSetup._specularMethodVO,param1);
         }
      }
      
      override function deactivate(param1:Stage3DProxy) : void
      {
         super.deactivate(param1);
         if(_usesNormals)
         {
            _methodSetup._normalMethod.deactivate(_methodSetup._normalMethodVO,param1);
         }
         _methodSetup._ambientMethod.deactivate(_methodSetup._ambientMethodVO,param1);
         if(_methodSetup._shadowMethod)
         {
            _methodSetup._shadowMethod.deactivate(_methodSetup._shadowMethodVO,param1);
         }
         if(_methodSetup._lightMapMethod)
         {
            _methodSetup._lightMapMethod.deactivate(_methodSetup._lightMapMethodVO,param1);
         }
         _methodSetup._diffuseMethod.deactivate(_methodSetup._diffuseMethodVO,param1);
         if(_usingSpecularMethod)
         {
            _methodSetup._specularMethod.deactivate(_methodSetup._specularMethodVO,param1);
         }
      }
      
      override function getFragmentCode(param1:String) : String
      {
         return _fragmentLightCode + param1 + _framentPostLightCode;
      }
      
      override function getVertexCode() : String
      {
         return _vertexCode;
      }
      
      override function invalidateShaderProgram(param1:Boolean = true) : void
      {
         super.invalidateShaderProgram(param1);
         addPassesFromMethods();
      }
      
      function get numDirectionalLights() : uint
      {
         return _numDirectionalLights;
      }
      
      function get numLightProbes() : uint
      {
         return _numLightProbes;
      }
      
      function get numPointLights() : uint
      {
         return _numPointLights;
      }
      
      override function render(param1:IRenderable, param2:Stage3DProxy, param3:Camera3D) : void
      {
         var _loc10_:* = 0;
         var _loc9_:* = null;
         var _loc5_:* = null;
         var _loc6_:Context3D = param2._context3D;
         if(_uvBufferIndex >= 0)
         {
            param1.activateUVBuffer(_uvBufferIndex,param2);
         }
         if(_secondaryUVBufferIndex >= 0)
         {
            param1.activateSecondaryUVBuffer(_secondaryUVBufferIndex,param2);
         }
         if(_normalBufferIndex >= 0)
         {
            param1.activateVertexNormalBuffer(_normalBufferIndex,param2);
         }
         if(_tangentBufferIndex >= 0)
         {
            param1.activateVertexTangentBuffer(_tangentBufferIndex,param2);
         }
         if(_animateUVs && _uvTransformIndex >= 0)
         {
            _loc9_ = param1.uvTransform;
            if(_loc9_)
            {
               _vertexConstantData[_uvTransformIndex] = _loc9_.a;
               _vertexConstantData[_uvTransformIndex + 1] = _loc9_.b;
               _vertexConstantData[_uvTransformIndex + 3] = _loc9_.tx;
               _vertexConstantData[_uvTransformIndex + 4] = _loc9_.c;
               _vertexConstantData[_uvTransformIndex + 5] = _loc9_.d;
               _vertexConstantData[_uvTransformIndex + 7] = _loc9_.ty;
            }
            else
            {
               _vertexConstantData[_uvTransformIndex] = 1;
               _vertexConstantData[_uvTransformIndex + 1] = 0;
               _vertexConstantData[_uvTransformIndex + 3] = 0;
               _vertexConstantData[_uvTransformIndex + 4] = 0;
               _vertexConstantData[_uvTransformIndex + 5] = 1;
               _vertexConstantData[_uvTransformIndex + 7] = 0;
            }
         }
         _ambientLightB = 0;
         _ambientLightG = 0;
         _ambientLightR = 0;
         if(usesLights())
         {
            updateLightConstants();
         }
         if(usesProbes())
         {
            updateProbes(param2);
         }
         if(_sceneMatrixIndex >= 0)
         {
            param1.sceneTransform.copyRawDataTo(_vertexConstantData,_sceneMatrixIndex,true);
         }
         if(_sceneNormalMatrixIndex >= 0)
         {
            param1.inverseSceneTransform.copyRawDataTo(_vertexConstantData,_sceneNormalMatrixIndex,false);
         }
         if(_usesNormals)
         {
            _methodSetup._normalMethod.setRenderState(_methodSetup._normalMethodVO,param1,param2,param3);
         }
         var _loc8_:BasicAmbientMethod = _methodSetup._ambientMethod;
         _loc8_.setRenderState(_methodSetup._ambientMethodVO,param1,param2,param3);
         _loc8_._lightAmbientR = _ambientLightR;
         _loc8_._lightAmbientG = _ambientLightG;
         _loc8_._lightAmbientB = _ambientLightB;
         if(_methodSetup._shadowMethod)
         {
            _methodSetup._shadowMethod.setRenderState(_methodSetup._shadowMethodVO,param1,param2,param3);
         }
         if(_methodSetup._lightMapMethod)
         {
            _methodSetup._lightMapMethod.setRenderState(_methodSetup._lightMapMethodVO,param1,param2,param3);
         }
         _methodSetup._diffuseMethod.setRenderState(_methodSetup._diffuseMethodVO,param1,param2,param3);
         if(_usingSpecularMethod)
         {
            _methodSetup._specularMethod.setRenderState(_methodSetup._specularMethodVO,param1,param2,param3);
         }
         if(_methodSetup._colorTransformMethod)
         {
            _methodSetup._colorTransformMethod.setRenderState(_methodSetup._colorTransformMethodVO,param1,param2,param3);
         }
         var _loc4_:Vector.<MethodVOSet> = _methodSetup._methods;
         var _loc7_:uint = _loc4_.length;
         _loc10_ = uint(0);
         while(_loc10_ < _loc7_)
         {
            _loc5_ = _loc4_[_loc10_];
            _loc5_.method.setRenderState(_loc5_.data,param1,param2,param3);
            _loc10_++;
         }
         _loc6_.setProgramConstantsFromVector("vertex",_vertexConstantsOffset,_vertexConstantData,_numUsedVertexConstants - _vertexConstantsOffset);
         _loc6_.setProgramConstantsFromVector("fragment",0,_fragmentConstantData,_numUsedFragmentConstants);
         _loc6_.setProgramConstantsFromMatrix("vertex",0,param1.getModelViewProjectionUnsafe(),true);
         param1.activateVertexBuffer(0,param2);
         _loc6_.drawTriangles(param1.getIndexBuffer(param2),0,param1.numTriangles);
         param2.drawCall++;
      }
      
      override function updateProgram(param1:Stage3DProxy) : void
      {
         reset();
         super.updateProgram(param1);
      }
      
      private function init() : void
      {
         _methodSetup = new ShaderMethodSetup();
         _methodSetup.addEventListener("ShaderInvalidated",onShaderInvalidated);
      }
      
      private function initConstantData() : void
      {
         _vertexConstantData.length = (_numUsedVertexConstants - _vertexConstantsOffset) * 4;
         _fragmentConstantData.length = _numUsedFragmentConstants * 4;
         initCommonsData();
         if(_uvTransformIndex >= 0)
         {
            initUVTransformData();
         }
         if(_cameraPositionIndex >= 0)
         {
            _vertexConstantData[_cameraPositionIndex + 3] = 1;
         }
         updateMethodConstants();
      }
      
      private function onShaderInvalidated(param1:ShadingMethodEvent) : void
      {
         invalidateShaderProgram();
      }
      
      private function reset() : void
      {
         initCompiler();
         updateShaderProperties();
         initConstantData();
         cleanUp();
      }
      
      private function updateUsedOffsets() : void
      {
         _numUsedVertexConstants = _compiler.numUsedVertexConstants;
         _numUsedFragmentConstants = _compiler.numUsedFragmentConstants;
         _numUsedStreams = _compiler.numUsedStreams;
         _numUsedTextures = _compiler.numUsedTextures;
         _numUsedVaryings = _compiler.numUsedVaryings;
      }
   }
}
