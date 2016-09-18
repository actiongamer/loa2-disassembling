package away3d.materials.compilation
{
   import away3d.materials.methods.ShaderMethodSetup;
   import com.mz.core.configs.Client3DConfig;
   import away3d.materials.methods.MethodVOSet;
   import away3d.materials.methods.ShadingMethodBase;
   import away3d.materials.methods.MethodVO;
   import org.specter3d.context.AppGlobalContext;
   import away3d.materials.methods.EffectMethodBase;
   
   public class ShaderCompiler
   {
       
      
      protected var _sharedRegisters:away3d.materials.compilation.ShaderRegisterData;
      
      protected var _registerCache:away3d.materials.compilation.ShaderRegisterCache;
      
      protected var _dependencyCounter:away3d.materials.compilation.MethodDependencyCounter;
      
      protected var _methodSetup:ShaderMethodSetup;
      
      protected var _vertexConstantsOffset:uint;
      
      protected var _smooth:Boolean;
      
      protected var _repeat:Boolean;
      
      protected var _mipmap:Boolean;
      
      protected var _enableLightFallOff:Boolean = false;
      
      protected var _preserveAlpha:Boolean = true;
      
      protected var _animateUVs:Boolean;
      
      protected var _alphaPremultiplied:Boolean;
      
      protected var _vertexConstantData:Vector.<Number>;
      
      protected var _fragmentConstantData:Vector.<Number>;
      
      protected var _vertexCode:String;
      
      protected var _fragmentCode:String;
      
      protected var _fragmentLightCode:String;
      
      protected var _framentPostLightCode:String;
      
      private var _commonsDataIndex:int = -1;
      
      protected var _animatableAttributes:Vector.<String>;
      
      protected var _animationTargetRegisters:Vector.<String>;
      
      protected var _lightProbeDiffuseIndices:Vector.<uint>;
      
      protected var _lightProbeSpecularIndices:Vector.<uint>;
      
      protected var _uvBufferIndex:int = -1;
      
      protected var _uvTransformIndex:int = -1;
      
      protected var _secondaryUVBufferIndex:int = -1;
      
      protected var _normalBufferIndex:int = -1;
      
      protected var _tangentBufferIndex:int = -1;
      
      protected var _lightFragmentConstantIndex:int = -1;
      
      protected var _sceneMatrixIndex:int = -1;
      
      protected var _sceneNormalMatrixIndex:int = -1;
      
      protected var _cameraPositionIndex:int = -1;
      
      protected var _probeWeightsIndex:int = -1;
      
      protected var _specularLightSources:uint;
      
      protected var _diffuseLightSources:uint;
      
      protected var _numLights:int;
      
      protected var _numLightProbes:uint;
      
      protected var _numPointLights:uint;
      
      protected var _numDirectionalLights:uint;
      
      protected var _numProbeRegisters:Number;
      
      protected var _combinedLightSources:uint;
      
      protected var _usingSpecularMethod:Boolean;
      
      protected var _needUVAnimation:Boolean;
      
      protected var _UVTarget:String;
      
      protected var _UVSource:String;
      
      public function ShaderCompiler()
      {
         super();
         _sharedRegisters = new away3d.materials.compilation.ShaderRegisterData();
         _dependencyCounter = new away3d.materials.compilation.MethodDependencyCounter();
         initRegisterCache();
      }
      
      public function get needUVAnimation() : Boolean
      {
         return _needUVAnimation;
      }
      
      public function get UVTarget() : String
      {
         return _UVTarget;
      }
      
      public function get UVSource() : String
      {
         return _UVSource;
      }
      
      private function initRegisterCache() : void
      {
         _registerCache = new away3d.materials.compilation.ShaderRegisterCache();
         var _loc1_:int = 5;
         _registerCache.vertexConstantOffset = _loc1_;
         _vertexConstantsOffset = _loc1_;
         _registerCache.vertexAttributesOffset = 1;
         _registerCache.reset();
      }
      
      public function get animateUVs() : Boolean
      {
         return _animateUVs;
      }
      
      public function set animateUVs(param1:Boolean) : void
      {
         _animateUVs = param1;
      }
      
      public function get alphaPremultiplied() : Boolean
      {
         return _alphaPremultiplied;
      }
      
      public function set alphaPremultiplied(param1:Boolean) : void
      {
         _alphaPremultiplied = param1;
      }
      
      public function get preserveAlpha() : Boolean
      {
         return _preserveAlpha;
      }
      
      public function set preserveAlpha(param1:Boolean) : void
      {
         _preserveAlpha = param1;
      }
      
      public function setTextureSampling(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         _smooth = param1;
         _repeat = param2;
         _mipmap = param3;
      }
      
      public function setConstantDataBuffers(param1:Vector.<Number>, param2:Vector.<Number>) : void
      {
         _vertexConstantData = param1;
         _fragmentConstantData = param2;
      }
      
      public function get methodSetup() : ShaderMethodSetup
      {
         return _methodSetup;
      }
      
      public function set methodSetup(param1:ShaderMethodSetup) : void
      {
         _methodSetup = param1;
      }
      
      public function compile() : void
      {
         initRegisterIndices();
         initLightData();
         _animatableAttributes = Vector.<String>(["va0"]);
         _animationTargetRegisters = Vector.<String>(["vt0"]);
         _vertexCode = "";
         _fragmentCode = "";
         _sharedRegisters.localPosition = _registerCache.getFreeVertexVectorTemp();
         _registerCache.addVertexTempUsages(_sharedRegisters.localPosition,1);
         createCommons();
         calculateDependencies();
         updateMethodRegisters();
         compileMethodsCode();
         compileProjectionCode();
         compileFragmentOutput();
         _framentPostLightCode = fragmentCode;
      }
      
      protected function compileMethodsCode() : void
      {
         if(_dependencyCounter.projectionDependencies > 0)
         {
            compileProjCode();
         }
         if(_dependencyCounter.uvDependencies > 0)
         {
            compileUVCode();
         }
         if(_dependencyCounter.secondaryUVDependencies > 0)
         {
            compileSecondaryUVCode();
         }
         if(_dependencyCounter.globalPosDependencies > 0)
         {
            compileGlobalPositionCode();
         }
         if(_dependencyCounter.normalDependencies > 0)
         {
            compileNormalCode();
         }
         if(_dependencyCounter.viewDirDependencies > 0)
         {
            compileViewDirCode();
         }
         compileLightingCode();
         _fragmentLightCode = _fragmentCode;
         _fragmentCode = "";
         compileMethods();
      }
      
      protected function compileLightingCode() : void
      {
      }
      
      protected function compileViewDirCode() : void
      {
      }
      
      protected function compileNormalCode() : void
      {
      }
      
      private function compileProjCode() : void
      {
         _sharedRegisters.projectionFragment = _registerCache.getFreeVarying();
         _sharedRegisters.projectedTarget = _registerCache.getFreeVertexVectorTemp();
         _vertexCode = _vertexCode + ("mov " + _sharedRegisters.projectionFragment + ", " + _sharedRegisters.projectedTarget + "\n");
      }
      
      private function compileUVCode() : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:ShaderRegisterElement = _registerCache.getFreeVertexAttribute();
         _uvBufferIndex = _loc2_.index;
         var _loc1_:ShaderRegisterElement = _registerCache.getFreeVarying();
         _sharedRegisters.uvVarying = _loc1_;
         if(animateUVs)
         {
            _loc3_ = _registerCache.getFreeVertexConstant();
            _loc4_ = _registerCache.getFreeVertexConstant();
            _uvTransformIndex = (_loc3_.index - vertexConstantsOffset) * 4;
            _vertexCode = _vertexCode + ("dp4 " + _loc1_ + ".x, " + _loc2_ + ", " + _loc3_ + "\n" + "dp4 " + _loc1_ + ".y, " + _loc2_ + ", " + _loc4_ + "\n" + "mov " + _loc1_ + ".zw, " + _loc2_ + ".zw \n");
         }
         else
         {
            _uvTransformIndex = -1;
            _needUVAnimation = true;
            _UVTarget = _loc1_.toString();
            _UVSource = _loc2_.toString();
         }
      }
      
      private function compileSecondaryUVCode() : void
      {
         var _loc1_:ShaderRegisterElement = _registerCache.getFreeVertexAttribute();
         _secondaryUVBufferIndex = _loc1_.index;
         _sharedRegisters.secondaryUVVarying = _registerCache.getFreeVarying();
         _vertexCode = _vertexCode + ("mov " + _sharedRegisters.secondaryUVVarying + ", " + _loc1_ + "\n");
      }
      
      protected function compileGlobalPositionCode() : void
      {
         var _loc1_:* = null;
         _sharedRegisters.globalPositionVertex = _registerCache.getFreeVertexVectorTemp();
         _registerCache.addVertexTempUsages(_sharedRegisters.globalPositionVertex,_dependencyCounter.globalPosDependencies);
         _loc1_ = _registerCache.getFreeVertexConstant();
         _registerCache.getFreeVertexConstant();
         _registerCache.getFreeVertexConstant();
         _registerCache.getFreeVertexConstant();
         _sceneMatrixIndex = (_loc1_.index - _vertexConstantsOffset) * 4;
         _vertexCode = _vertexCode + ("m44 " + _sharedRegisters.globalPositionVertex + ", " + _sharedRegisters.localPosition + ", " + _loc1_ + "\n");
         if(_dependencyCounter.usesGlobalPosFragment)
         {
            _sharedRegisters.globalPositionVarying = _registerCache.getFreeVarying();
            _vertexCode = _vertexCode + ("mov " + _sharedRegisters.globalPositionVarying + ", " + _sharedRegisters.globalPositionVertex + "\n");
         }
      }
      
      private function compileFragmentOutput() : void
      {
         if(Client3DConfig.useGamma)
         {
            _fragmentCode = _fragmentCode + ("sqt " + _sharedRegisters.shadedTarget + ", " + _sharedRegisters.shadedTarget + "\n");
         }
         _fragmentCode = _fragmentCode + ("mov " + _registerCache.fragmentOutputRegister + ", " + _sharedRegisters.shadedTarget + "\n");
         _registerCache.removeFragmentTempUsage(_sharedRegisters.shadedTarget);
      }
      
      private function compileProjectionCode() : void
      {
         var _loc2_:* = null;
         var _loc3_:String = _animationTargetRegisters[0];
         var _loc1_:ShaderRegisterElement = _sharedRegisters.projectedTarget;
         if(_loc1_)
         {
            _loc2_ = "m44 " + _loc1_ + ", " + _loc3_ + ", vc0\t\t\n" + "mov vt7, " + _loc1_ + "\n" + "mul op, vt7, vc4\n";
         }
         else
         {
            _loc2_ = "m44 vt7, " + _loc3_ + ", vc0\t\t\n" + "mul op, vt7, vc4\n";
         }
         _vertexCode = _loc2_ + _vertexCode;
      }
      
      protected function initRegisterIndices() : void
      {
         _commonsDataIndex = -1;
         _cameraPositionIndex = -1;
         _uvBufferIndex = -1;
         _uvTransformIndex = -1;
         _secondaryUVBufferIndex = -1;
         _normalBufferIndex = -1;
         _tangentBufferIndex = -1;
         _lightFragmentConstantIndex = -1;
         _sceneMatrixIndex = -1;
         _sceneNormalMatrixIndex = -1;
         _probeWeightsIndex = -1;
      }
      
      protected function initLightData() : void
      {
         _numLights = _numPointLights + _numDirectionalLights;
         _numProbeRegisters = Math.ceil(_numLightProbes / 4);
         if(_methodSetup._specularMethod)
         {
            _combinedLightSources = _specularLightSources | _diffuseLightSources;
         }
         else
         {
            _combinedLightSources = _diffuseLightSources;
         }
         _usingSpecularMethod = _methodSetup._specularMethod && (usesLightsForSpecular() || usesProbesForSpecular());
      }
      
      private function createCommons() : void
      {
         _sharedRegisters.commons = _registerCache.getFreeFragmentConstant();
         _commonsDataIndex = _sharedRegisters.commons.index * 4;
      }
      
      protected function calculateDependencies() : void
      {
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         _dependencyCounter.reset();
         var _loc1_:Vector.<MethodVOSet> = _methodSetup._methods;
         setupAndCountMethodDependencies(_methodSetup._diffuseMethod,_methodSetup._diffuseMethodVO);
         if(_methodSetup._shadowMethod)
         {
            setupAndCountMethodDependencies(_methodSetup._shadowMethod,_methodSetup._shadowMethodVO);
         }
         if(_methodSetup._lightMapMethod)
         {
            setupAndCountMethodDependencies(_methodSetup._lightMapMethod,_methodSetup._lightMapMethodVO);
         }
         setupAndCountMethodDependencies(_methodSetup._ambientMethod,_methodSetup._ambientMethodVO);
         if(_usingSpecularMethod)
         {
            setupAndCountMethodDependencies(_methodSetup._specularMethod,_methodSetup._specularMethodVO);
         }
         if(_methodSetup._colorTransformMethod)
         {
            setupAndCountMethodDependencies(_methodSetup._colorTransformMethod,_methodSetup._colorTransformMethodVO);
         }
         _loc2_ = uint(_loc1_.length);
         _loc3_ = uint(0);
         while(_loc3_ < _loc2_)
         {
            setupAndCountMethodDependencies(_loc1_[_loc3_].method,_loc1_[_loc3_].data);
            _loc3_++;
         }
         if(usesNormals)
         {
            setupAndCountMethodDependencies(_methodSetup._normalMethod,_methodSetup._normalMethodVO);
         }
         _dependencyCounter.setPositionedLights(_numPointLights,_combinedLightSources);
      }
      
      private function setupAndCountMethodDependencies(param1:ShadingMethodBase, param2:MethodVO) : void
      {
         setupMethod(param1,param2);
         _dependencyCounter.includeMethodVO(param2);
      }
      
      private function setupMethod(param1:ShadingMethodBase, param2:MethodVO) : void
      {
         param1.reset();
         param2.reset();
         param2.vertexData = _vertexConstantData;
         param2.fragmentData = _fragmentConstantData;
         param2.vertexConstantsOffset = _vertexConstantsOffset;
         param2.useSmoothTextures = _smooth;
         param2.repeatTextures = _repeat;
         param2.useMipmapping = _mipmap;
         param2.numLights = _numLights + _numLightProbes;
         if(AppGlobalContext.stage3d.view3d.stage3DProxy.driverInfo.indexOf("baselineConstrained") > -1)
         {
            _enableLightFallOff = false;
         }
         param2.useLightFallOff = _enableLightFallOff;
         param1.initVO(param2);
      }
      
      public function get commonsDataIndex() : int
      {
         return _commonsDataIndex;
      }
      
      private function updateMethodRegisters() : void
      {
         var _loc3_:* = 0;
         _methodSetup._normalMethod.sharedRegisters = _sharedRegisters;
         _methodSetup._diffuseMethod.sharedRegisters = _sharedRegisters;
         if(_methodSetup._shadowMethod)
         {
            _methodSetup._shadowMethod.sharedRegisters = _sharedRegisters;
         }
         if(_methodSetup._lightMapMethod)
         {
            _methodSetup._lightMapMethod.sharedRegisters = _sharedRegisters;
         }
         _methodSetup._ambientMethod.sharedRegisters = _sharedRegisters;
         if(_methodSetup._specularMethod)
         {
            _methodSetup._specularMethod.sharedRegisters = _sharedRegisters;
         }
         if(_methodSetup._colorTransformMethod)
         {
            _methodSetup._colorTransformMethod.sharedRegisters = _sharedRegisters;
         }
         var _loc1_:Vector.<MethodVOSet> = _methodSetup._methods;
         var _loc2_:int = _loc1_.length;
         _loc3_ = uint(0);
         while(_loc3_ < _loc2_)
         {
            _loc1_[_loc3_].method.sharedRegisters = _sharedRegisters;
            _loc3_++;
         }
      }
      
      public function get numUsedVertexConstants() : uint
      {
         return _registerCache.numUsedVertexConstants;
      }
      
      public function get numUsedFragmentConstants() : uint
      {
         return _registerCache.numUsedFragmentConstants;
      }
      
      public function get numUsedStreams() : uint
      {
         return _registerCache.numUsedStreams;
      }
      
      public function get numUsedTextures() : uint
      {
         return _registerCache.numUsedTextures;
      }
      
      public function get numUsedVaryings() : uint
      {
         return _registerCache.numUsedVaryings;
      }
      
      protected function usesLightsForSpecular() : Boolean
      {
         return _numLights > 0 && (_specularLightSources & 1) != 0;
      }
      
      protected function usesLightsForDiffuse() : Boolean
      {
         return _numLights > 0 && (_diffuseLightSources & 1) != 0;
      }
      
      public function dispose() : void
      {
         cleanUpMethods();
         _registerCache.dispose();
         _registerCache = null;
         _sharedRegisters = null;
      }
      
      private function cleanUpMethods() : void
      {
         var _loc3_:* = 0;
         if(_methodSetup._normalMethod)
         {
            _methodSetup._normalMethod.cleanCompilationData();
         }
         if(_methodSetup._diffuseMethod)
         {
            _methodSetup._diffuseMethod.cleanCompilationData();
         }
         if(_methodSetup._ambientMethod)
         {
            _methodSetup._ambientMethod.cleanCompilationData();
         }
         if(_methodSetup._specularMethod)
         {
            _methodSetup._specularMethod.cleanCompilationData();
         }
         if(_methodSetup._shadowMethod)
         {
            _methodSetup._shadowMethod.cleanCompilationData();
         }
         if(_methodSetup._lightMapMethod)
         {
            _methodSetup._lightMapMethod.cleanCompilationData();
         }
         if(_methodSetup._colorTransformMethod)
         {
            _methodSetup._colorTransformMethod.cleanCompilationData();
         }
         var _loc1_:Vector.<MethodVOSet> = _methodSetup._methods;
         var _loc2_:uint = _loc1_.length;
         _loc3_ = uint(0);
         while(_loc3_ < _loc2_)
         {
            _loc1_[_loc3_].method.cleanCompilationData();
            _loc3_++;
         }
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
      
      protected function usesProbesForSpecular() : Boolean
      {
         return _numLightProbes > 0 && (_specularLightSources & 2) != 0;
      }
      
      protected function usesProbesForDiffuse() : Boolean
      {
         return _numLightProbes > 0 && (_diffuseLightSources & 2) != 0;
      }
      
      protected function usesProbes() : Boolean
      {
         return _numLightProbes > 0 && ((_diffuseLightSources | _specularLightSources) & 2) != 0;
      }
      
      public function get vertexConstantsOffset() : uint
      {
         return _vertexConstantsOffset;
      }
      
      public function get uvBufferIndex() : int
      {
         return _uvBufferIndex;
      }
      
      public function get uvTransformIndex() : int
      {
         return _uvTransformIndex;
      }
      
      public function get secondaryUVBufferIndex() : int
      {
         return _secondaryUVBufferIndex;
      }
      
      public function get normalBufferIndex() : int
      {
         return _normalBufferIndex;
      }
      
      public function get tangentBufferIndex() : int
      {
         return _tangentBufferIndex;
      }
      
      public function get lightFragmentConstantIndex() : int
      {
         return _lightFragmentConstantIndex;
      }
      
      public function get cameraPositionIndex() : int
      {
         return _cameraPositionIndex;
      }
      
      public function get sceneMatrixIndex() : int
      {
         return _sceneMatrixIndex;
      }
      
      public function get sceneNormalMatrixIndex() : int
      {
         return _sceneNormalMatrixIndex;
      }
      
      public function get probeWeightsIndex() : int
      {
         return _probeWeightsIndex;
      }
      
      public function get vertexCode() : String
      {
         return _vertexCode;
      }
      
      public function get fragmentCode() : String
      {
         return _fragmentCode;
      }
      
      public function get fragmentLightCode() : String
      {
         return _fragmentLightCode;
      }
      
      public function get framentPostLightCode() : String
      {
         return _framentPostLightCode;
      }
      
      public function get shadedTarget() : String
      {
         return _sharedRegisters.shadedTarget.toString();
      }
      
      public function get numPointLights() : uint
      {
         return _numPointLights;
      }
      
      public function set numPointLights(param1:uint) : void
      {
         _numPointLights = param1;
      }
      
      public function get numDirectionalLights() : uint
      {
         return _numDirectionalLights;
      }
      
      public function set numDirectionalLights(param1:uint) : void
      {
         _numDirectionalLights = param1;
      }
      
      public function get numLightProbes() : uint
      {
         return _numLightProbes;
      }
      
      public function set numLightProbes(param1:uint) : void
      {
         _numLightProbes = param1;
      }
      
      public function get usingSpecularMethod() : Boolean
      {
         return _usingSpecularMethod;
      }
      
      public function get animatableAttributes() : Vector.<String>
      {
         return _animatableAttributes;
      }
      
      public function get animationTargetRegisters() : Vector.<String>
      {
         return _animationTargetRegisters;
      }
      
      public function get usesNormals() : Boolean
      {
         return _dependencyCounter.normalDependencies > 0 && _methodSetup._normalMethod.hasOutput;
      }
      
      protected function usesLights() : Boolean
      {
         return _numLights > 0 && (_combinedLightSources & 1) != 0;
      }
      
      protected function compileMethods() : void
      {
         var _loc5_:* = null;
         var _loc4_:* = null;
         var _loc2_:* = null;
         var _loc6_:* = 0;
         var _loc1_:Vector.<MethodVOSet> = _methodSetup._methods;
         var _loc3_:uint = _loc1_.length;
         if(_preserveAlpha)
         {
            _loc2_ = _registerCache.getFreeFragmentSingleTemp();
            _registerCache.addFragmentTempUsages(_loc2_,1);
            _fragmentCode = _fragmentCode + ("mov " + _loc2_ + ", " + _sharedRegisters.shadedTarget + ".w\n");
         }
         _loc6_ = uint(0);
         while(_loc6_ < _loc3_)
         {
            _loc5_ = _loc1_[_loc6_].method;
            _loc4_ = _loc1_[_loc6_].data;
            _vertexCode = _vertexCode + _loc5_.getVertexCode(_loc4_,_registerCache);
            if(_loc4_.needsGlobalVertexPos || _loc4_.needsGlobalFragmentPos)
            {
               _registerCache.removeVertexTempUsage(_sharedRegisters.globalPositionVertex);
            }
            _fragmentCode = _fragmentCode + _loc5_.getFragmentCode(_loc4_,_registerCache,_sharedRegisters.shadedTarget);
            if(_loc4_.needsNormals)
            {
               _registerCache.removeFragmentTempUsage(_sharedRegisters.normalFragment);
            }
            if(_loc4_.needsView)
            {
               _registerCache.removeFragmentTempUsage(_sharedRegisters.viewDirFragment);
            }
            _loc6_++;
         }
         if(_preserveAlpha)
         {
            _fragmentCode = _fragmentCode + ("mov " + _sharedRegisters.shadedTarget + ".w, " + _loc2_ + "\n");
            _registerCache.removeFragmentTempUsage(_loc2_);
         }
         if(_methodSetup._colorTransformMethod)
         {
            _vertexCode = _vertexCode + _methodSetup._colorTransformMethod.getVertexCode(_methodSetup._colorTransformMethodVO,_registerCache);
            _fragmentCode = _fragmentCode + _methodSetup._colorTransformMethod.getFragmentCode(_methodSetup._colorTransformMethodVO,_registerCache,_sharedRegisters.shadedTarget);
         }
      }
      
      public function get lightProbeDiffuseIndices() : Vector.<uint>
      {
         return _lightProbeDiffuseIndices;
      }
      
      public function get lightProbeSpecularIndices() : Vector.<uint>
      {
         return _lightProbeSpecularIndices;
      }
   }
}
