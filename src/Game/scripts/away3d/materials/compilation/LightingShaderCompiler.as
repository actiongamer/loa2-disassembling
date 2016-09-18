package away3d.materials.compilation
{
   public class LightingShaderCompiler extends ShaderCompiler
   {
       
      
      public var _pointLightFragmentConstants:Vector.<away3d.materials.compilation.ShaderRegisterElement>;
      
      public var _pointLightVertexConstants:Vector.<away3d.materials.compilation.ShaderRegisterElement>;
      
      public var _dirLightFragmentConstants:Vector.<away3d.materials.compilation.ShaderRegisterElement>;
      
      public var _dirLightVertexConstants:Vector.<away3d.materials.compilation.ShaderRegisterElement>;
      
      private var _lightVertexConstantIndex:int;
      
      private var _shadowRegister:away3d.materials.compilation.ShaderRegisterElement;
      
      public function LightingShaderCompiler()
      {
         super();
      }
      
      public function get lightVertexConstantIndex() : int
      {
         return _lightVertexConstantIndex;
      }
      
      override protected function initRegisterIndices() : void
      {
         super.initRegisterIndices();
         _lightVertexConstantIndex = -1;
      }
      
      override protected function compileMethodsCode() : void
      {
         createNormalRegisters();
         super.compileMethodsCode();
      }
      
      protected function createNormalRegisters() : void
      {
         if(tangentSpace)
         {
            _sharedRegisters.animatedTangent = _registerCache.getFreeVertexVectorTemp();
            _registerCache.addVertexTempUsages(_sharedRegisters.animatedTangent,1);
            _sharedRegisters.bitangent = _registerCache.getFreeVertexVectorTemp();
            _registerCache.addVertexTempUsages(_sharedRegisters.bitangent,1);
            _sharedRegisters.tangentInput = _registerCache.getFreeVertexAttribute();
            _tangentBufferIndex = _sharedRegisters.tangentInput.index;
            _animatableAttributes.push(_sharedRegisters.tangentInput.toString());
            _animationTargetRegisters.push(_sharedRegisters.animatedTangent.toString());
         }
         _sharedRegisters.normalInput = _registerCache.getFreeVertexAttribute();
         _normalBufferIndex = _sharedRegisters.normalInput.index;
         _sharedRegisters.animatedNormal = _registerCache.getFreeVertexVectorTemp();
         _registerCache.addVertexTempUsages(_sharedRegisters.animatedNormal,1);
         _animatableAttributes.push(_sharedRegisters.normalInput.toString());
         _animationTargetRegisters.push(_sharedRegisters.animatedNormal.toString());
      }
      
      public function get tangentSpace() : Boolean
      {
         return _numLightProbes == 0 && methodSetup._normalMethod.hasOutput && _methodSetup._normalMethod.tangentSpace;
      }
      
      override protected function initLightData() : void
      {
         super.initLightData();
         _pointLightVertexConstants = new Vector.<away3d.materials.compilation.ShaderRegisterElement>(_numPointLights,true);
         _pointLightFragmentConstants = new Vector.<away3d.materials.compilation.ShaderRegisterElement>(_numPointLights * 2,true);
         if(tangentSpace)
         {
            _dirLightVertexConstants = new Vector.<away3d.materials.compilation.ShaderRegisterElement>(_numDirectionalLights,true);
            _dirLightFragmentConstants = new Vector.<away3d.materials.compilation.ShaderRegisterElement>(_numDirectionalLights * 2,true);
         }
         else
         {
            _dirLightFragmentConstants = new Vector.<away3d.materials.compilation.ShaderRegisterElement>(_numDirectionalLights * 3,true);
         }
      }
      
      override protected function calculateDependencies() : void
      {
         super.calculateDependencies();
         if(!tangentSpace)
         {
            _dependencyCounter.addWorldSpaceDependencies(false);
         }
      }
      
      override protected function compileNormalCode() : void
      {
         var _loc1_:* = undefined;
         _sharedRegisters.normalFragment = _registerCache.getFreeFragmentVectorTemp();
         _registerCache.addFragmentTempUsages(_sharedRegisters.normalFragment,_dependencyCounter.normalDependencies);
         if(_methodSetup._normalMethod.hasOutput && !_methodSetup._normalMethod.tangentSpace)
         {
            _vertexCode = _vertexCode + _methodSetup._normalMethod.getVertexCode(_methodSetup._normalMethodVO,_registerCache);
            _fragmentCode = _fragmentCode + _methodSetup._normalMethod.getFragmentCode(_methodSetup._normalMethodVO,_registerCache,_sharedRegisters.normalFragment);
            return;
         }
         if(tangentSpace)
         {
            compileTangentSpaceNormalMapCode();
         }
         else
         {
            _loc1_ = new Vector.<away3d.materials.compilation.ShaderRegisterElement>(3,true);
            _loc1_[0] = _registerCache.getFreeVertexConstant();
            _loc1_[1] = _registerCache.getFreeVertexConstant();
            _loc1_[2] = _registerCache.getFreeVertexConstant();
            _registerCache.getFreeVertexConstant();
            _sceneNormalMatrixIndex = (_loc1_[0].index - _vertexConstantsOffset) * 4;
            _sharedRegisters.normalVarying = _registerCache.getFreeVarying();
            _vertexCode = _vertexCode + ("m33 " + _sharedRegisters.normalVarying + ".xyz, " + _sharedRegisters.animatedNormal + ".xyz, " + _loc1_[0] + "\n" + "mov " + _sharedRegisters.normalVarying + ".w, " + _sharedRegisters.animatedNormal + ".w\t\n");
            _fragmentCode = _fragmentCode + ("nrm " + _sharedRegisters.normalFragment + ".xyz, " + _sharedRegisters.normalVarying + ".xyz\t\n" + "mov " + _sharedRegisters.normalFragment + ".w, " + _sharedRegisters.normalVarying + ".w\t\t\n");
         }
         if(_dependencyCounter.tangentDependencies > 0)
         {
            _sharedRegisters.tangentInput = _registerCache.getFreeVertexAttribute();
            _tangentBufferIndex = _sharedRegisters.tangentInput.index;
            _sharedRegisters.tangentVarying = _registerCache.getFreeVarying();
            _vertexCode = _vertexCode + ("mov " + _sharedRegisters.tangentVarying + ", " + _sharedRegisters.tangentInput + "\n");
         }
      }
      
      private function compileTangentSpaceNormalMapCode() : void
      {
         _vertexCode = _vertexCode + ("nrm " + _sharedRegisters.animatedNormal + ".xyz, " + _sharedRegisters.animatedNormal + ".xyz\n" + "nrm " + _sharedRegisters.animatedTangent + ".xyz, " + _sharedRegisters.animatedTangent + ".xyz\n");
         _vertexCode = _vertexCode + ("crs " + _sharedRegisters.bitangent + ".xyz, " + _sharedRegisters.animatedNormal + ".xyz, " + _sharedRegisters.animatedTangent + ".xyz\t\n" + "mov " + _sharedRegisters.bitangent + ".w, " + _sharedRegisters.animatedNormal + ".w\n");
         _fragmentCode = _fragmentCode + _methodSetup._normalMethod.getFragmentCode(_methodSetup._normalMethodVO,_registerCache,_sharedRegisters.normalFragment);
         if(_methodSetup._normalMethodVO.needsView)
         {
            _registerCache.removeFragmentTempUsage(_sharedRegisters.viewDirFragment);
         }
         if(_methodSetup._normalMethodVO.needsGlobalFragmentPos || _methodSetup._normalMethodVO.needsGlobalVertexPos)
         {
            _registerCache.removeVertexTempUsage(_sharedRegisters.globalPositionVertex);
         }
      }
      
      override protected function compileViewDirCode() : void
      {
         var _loc2_:* = null;
         var _loc1_:away3d.materials.compilation.ShaderRegisterElement = _registerCache.getFreeVertexConstant();
         _sharedRegisters.viewDirVarying = _registerCache.getFreeVarying();
         _sharedRegisters.viewDirFragment = _registerCache.getFreeFragmentVectorTemp();
         _registerCache.addFragmentTempUsages(_sharedRegisters.viewDirFragment,_dependencyCounter.viewDirDependencies);
         _cameraPositionIndex = (_loc1_.index - _vertexConstantsOffset) * 4;
         if(tangentSpace)
         {
            _loc2_ = _registerCache.getFreeVertexVectorTemp();
            _vertexCode = _vertexCode + ("sub " + _loc2_ + ", " + _loc1_ + ", " + _sharedRegisters.localPosition + "\n" + "m33 " + _sharedRegisters.viewDirVarying + ".xyz, " + _loc2_ + ", " + _sharedRegisters.animatedTangent + "\n" + "mov " + _sharedRegisters.viewDirVarying + ".w, " + _sharedRegisters.localPosition + ".w\n");
         }
         else
         {
            _vertexCode = _vertexCode + ("sub " + _sharedRegisters.viewDirVarying + ", " + _loc1_ + ", " + _sharedRegisters.globalPositionVertex + "\n");
            _registerCache.removeVertexTempUsage(_sharedRegisters.globalPositionVertex);
         }
         _fragmentCode = _fragmentCode + ("nrm " + _sharedRegisters.viewDirFragment + ".xyz, " + _sharedRegisters.viewDirVarying + ".xyz\t\t\n" + "mov " + _sharedRegisters.viewDirFragment + ".w,   " + _sharedRegisters.viewDirVarying + ".w \t\t\n");
      }
      
      override protected function compileLightingCode() : void
      {
         if(_methodSetup._shadowMethod)
         {
            compileShadowCode();
         }
         _methodSetup._diffuseMethod.shadowRegister = _shadowRegister;
         _sharedRegisters.shadedTarget = _registerCache.getFreeFragmentVectorTemp();
         _registerCache.addFragmentTempUsages(_sharedRegisters.shadedTarget,1);
         _vertexCode = _vertexCode + _methodSetup._diffuseMethod.getVertexCode(_methodSetup._diffuseMethodVO,_registerCache);
         _fragmentCode = _fragmentCode + _methodSetup._diffuseMethod.getFragmentPreLightingCode(_methodSetup._diffuseMethodVO,_registerCache);
         if(_usingSpecularMethod)
         {
            _vertexCode = _vertexCode + _methodSetup._specularMethod.getVertexCode(_methodSetup._specularMethodVO,_registerCache);
            _fragmentCode = _fragmentCode + _methodSetup._specularMethod.getFragmentPreLightingCode(_methodSetup._specularMethodVO,_registerCache);
         }
         if(usesLights())
         {
            initLightRegisters();
            compileDirectionalLightCode();
            compilePointLightCode();
         }
         if(usesProbes())
         {
            compileLightProbeCode();
         }
         _vertexCode = _vertexCode + _methodSetup._ambientMethod.getVertexCode(_methodSetup._ambientMethodVO,_registerCache);
         _fragmentCode = _fragmentCode + _methodSetup._ambientMethod.getFragmentCode(_methodSetup._ambientMethodVO,_registerCache,_sharedRegisters.shadedTarget);
         if(_methodSetup._ambientMethodVO.needsNormals)
         {
            _registerCache.removeFragmentTempUsage(_sharedRegisters.normalFragment);
         }
         if(_methodSetup._ambientMethodVO.needsView)
         {
            _registerCache.removeFragmentTempUsage(_sharedRegisters.viewDirFragment);
         }
         _fragmentCode = _fragmentCode + _methodSetup._diffuseMethod.getFragmentPostLightingCode(_methodSetup._diffuseMethodVO,_registerCache,_sharedRegisters.shadedTarget);
         if(_alphaPremultiplied)
         {
            _fragmentCode = _fragmentCode + ("add " + _sharedRegisters.shadedTarget + ".w, " + _sharedRegisters.shadedTarget + ".w, " + _sharedRegisters.commons + ".z\n" + "div " + _sharedRegisters.shadedTarget + ".xyz, " + _sharedRegisters.shadedTarget + ".xyz, " + _sharedRegisters.shadedTarget + ".w\n" + "sub " + _sharedRegisters.shadedTarget + ".w, " + _sharedRegisters.shadedTarget + ".w, " + _sharedRegisters.commons + ".z\n" + "sat " + _sharedRegisters.shadedTarget + ".xyz, " + _sharedRegisters.shadedTarget + ".xyz\n");
         }
         if(_methodSetup._diffuseMethodVO.needsNormals)
         {
            _registerCache.removeFragmentTempUsage(_sharedRegisters.normalFragment);
         }
         if(_methodSetup._diffuseMethodVO.needsView)
         {
            _registerCache.removeFragmentTempUsage(_sharedRegisters.viewDirFragment);
         }
         if(_usingSpecularMethod)
         {
            _methodSetup._specularMethod.shadowRegister = _shadowRegister;
            _fragmentCode = _fragmentCode + _methodSetup._specularMethod.getFragmentPostLightingCode(_methodSetup._specularMethodVO,_registerCache,_sharedRegisters.shadedTarget);
            if(_methodSetup._specularMethodVO.needsNormals)
            {
               _registerCache.removeFragmentTempUsage(_sharedRegisters.normalFragment);
            }
            if(_methodSetup._specularMethodVO.needsView)
            {
               _registerCache.removeFragmentTempUsage(_sharedRegisters.viewDirFragment);
            }
         }
         if(_methodSetup._shadowMethod)
         {
            _registerCache.removeFragmentTempUsage(_shadowRegister);
         }
      }
      
      private function compileShadowCode() : void
      {
         if(_sharedRegisters.normalFragment)
         {
            _shadowRegister = _sharedRegisters.normalFragment;
         }
         else
         {
            _shadowRegister = _registerCache.getFreeFragmentVectorTemp();
         }
         _registerCache.addFragmentTempUsages(_shadowRegister,1);
         _vertexCode = _vertexCode + _methodSetup._shadowMethod.getVertexCode(_methodSetup._shadowMethodVO,_registerCache);
         _fragmentCode = _fragmentCode + _methodSetup._shadowMethod.getFragmentCode(_methodSetup._shadowMethodVO,_registerCache,_shadowRegister);
      }
      
      private function initLightRegisters() : void
      {
         var _loc1_:* = 0;
         var _loc2_:* = 0;
         if(_dirLightVertexConstants)
         {
            _loc1_ = uint(_dirLightVertexConstants.length);
            _loc2_ = uint(0);
            while(_loc2_ < _loc1_)
            {
               _dirLightVertexConstants[_loc2_] = _registerCache.getFreeVertexConstant();
               if(_lightVertexConstantIndex == -1)
               {
                  _lightVertexConstantIndex = (_dirLightVertexConstants[_loc2_].index - _vertexConstantsOffset) * 4;
               }
               _loc2_++;
            }
         }
         _loc1_ = uint(_pointLightVertexConstants.length);
         _loc2_ = uint(0);
         while(_loc2_ < _loc1_)
         {
            _pointLightVertexConstants[_loc2_] = _registerCache.getFreeVertexConstant();
            if(_lightVertexConstantIndex == -1)
            {
               _lightVertexConstantIndex = (_pointLightVertexConstants[_loc2_].index - _vertexConstantsOffset) * 4;
            }
            _loc2_++;
         }
         _loc1_ = uint(_dirLightFragmentConstants.length);
         _loc2_ = uint(0);
         while(_loc2_ < _loc1_)
         {
            _dirLightFragmentConstants[_loc2_] = _registerCache.getFreeFragmentConstant();
            if(_lightFragmentConstantIndex == -1)
            {
               _lightFragmentConstantIndex = _dirLightFragmentConstants[_loc2_].index * 4;
            }
            _loc2_++;
         }
         _loc1_ = uint(_pointLightFragmentConstants.length);
         _loc2_ = uint(0);
         while(_loc2_ < _loc1_)
         {
            _pointLightFragmentConstants[_loc2_] = _registerCache.getFreeFragmentConstant();
            if(_lightFragmentConstantIndex == -1)
            {
               _lightFragmentConstantIndex = _pointLightFragmentConstants[_loc2_].index * 4;
            }
            _loc2_++;
         }
      }
      
      private function compileDirectionalLightCode() : void
      {
         var _loc4_:* = null;
         var _loc8_:* = null;
         var _loc7_:* = null;
         var _loc1_:int = 0;
         var _loc5_:int = 0;
         var _loc9_:* = 0;
         var _loc6_:* = null;
         var _loc2_:Boolean = _usingSpecularMethod && usesLightsForSpecular();
         var _loc3_:Boolean = usesLightsForDiffuse();
         if(!(_loc2_ || _loc3_))
         {
            return;
         }
         _loc9_ = uint(0);
         while(_loc9_ < _numDirectionalLights)
         {
            if(tangentSpace)
            {
               _loc1_++;
               _loc7_ = _dirLightVertexConstants[_loc1_];
               _loc6_ = _registerCache.getFreeVarying();
               _vertexCode = _vertexCode + ("m33 " + _loc6_ + ".xyz, " + _loc7_ + ", " + _sharedRegisters.animatedTangent + "\n" + "mov " + _loc6_ + ".w, " + _loc7_ + ".w\n");
               _loc7_ = _registerCache.getFreeFragmentVectorTemp();
               _registerCache.addVertexTempUsages(_loc7_,1);
               _fragmentCode = _fragmentCode + ("nrm " + _loc7_ + ".xyz, " + _loc6_ + ".xyz\n");
               _fragmentCode = _fragmentCode + ("mov " + _loc7_ + ".w, " + _loc6_ + ".w\n");
            }
            else
            {
               _loc5_++;
               _loc7_ = _dirLightFragmentConstants[_loc5_];
            }
            _loc5_++;
            _loc4_ = _dirLightFragmentConstants[_loc5_];
            _loc5_++;
            _loc8_ = _dirLightFragmentConstants[_loc5_];
            if(_loc3_)
            {
               _fragmentCode = _fragmentCode + _methodSetup._diffuseMethod.getFragmentCodePerLight(_methodSetup._diffuseMethodVO,_loc7_,_loc4_,_registerCache);
            }
            if(_loc2_)
            {
               _fragmentCode = _fragmentCode + _methodSetup._specularMethod.getFragmentCodePerLight(_methodSetup._specularMethodVO,_loc7_,_loc8_,_registerCache);
            }
            if(tangentSpace)
            {
               _registerCache.removeVertexTempUsage(_loc7_);
            }
            _loc9_++;
         }
      }
      
      private function compilePointLightCode() : void
      {
         var _loc6_:* = null;
         var _loc10_:* = null;
         var _loc5_:* = null;
         var _loc9_:* = null;
         var _loc1_:int = 0;
         var _loc7_:int = 0;
         var _loc11_:* = 0;
         var _loc8_:* = null;
         var _loc4_:* = null;
         var _loc2_:Boolean = _usingSpecularMethod && usesLightsForSpecular();
         var _loc3_:Boolean = usesLightsForDiffuse();
         if(!(_loc2_ || _loc3_))
         {
            return;
         }
         _loc11_ = uint(0);
         while(_loc11_ < _numPointLights)
         {
            _loc1_++;
            _loc5_ = _pointLightVertexConstants[_loc1_];
            _loc7_++;
            _loc6_ = _pointLightFragmentConstants[_loc7_];
            _loc7_++;
            _loc10_ = _pointLightFragmentConstants[_loc7_];
            _loc9_ = _registerCache.getFreeFragmentVectorTemp();
            _registerCache.addFragmentTempUsages(_loc9_,1);
            _loc8_ = _registerCache.getFreeVarying();
            if(tangentSpace)
            {
               _loc4_ = _registerCache.getFreeVertexVectorTemp();
               _vertexCode = _vertexCode + ("sub " + _loc4_ + ", " + _loc5_ + ", " + _sharedRegisters.localPosition + "\n" + "m33 " + _loc8_ + ".xyz, " + _loc4_ + ", " + _sharedRegisters.animatedTangent + "\n" + "mov " + _loc8_ + ".w, " + _sharedRegisters.localPosition + ".w\n");
            }
            else
            {
               _vertexCode = _vertexCode + ("sub " + _loc8_ + ", " + _loc5_ + ", " + _sharedRegisters.globalPositionVertex + "\n");
            }
            if(_enableLightFallOff)
            {
               _fragmentCode = _fragmentCode + ("dp3 " + _loc9_ + ".w, " + _loc8_ + ", " + _loc8_ + "\n" + "sub " + _loc9_ + ".w, " + _loc9_ + ".w, " + _loc6_ + ".w\n" + "mul " + _loc9_ + ".w, " + _loc9_ + ".w, " + _loc10_ + ".w\n" + "sat " + _loc9_ + ".w, " + _loc9_ + ".w\n" + "sub " + _loc9_ + ".w, " + _sharedRegisters.commons + ".w, " + _loc9_ + ".w\n" + "nrm " + _loc9_ + ".xyz, " + _loc8_ + "\n");
            }
            else
            {
               _fragmentCode = _fragmentCode + ("nrm " + _loc9_ + ".xyz, " + _loc8_ + "\n" + "mov " + _loc9_ + ".w, " + _loc8_ + ".w\n");
            }
            if(_lightFragmentConstantIndex == -1)
            {
               _lightFragmentConstantIndex = _loc5_.index * 4;
            }
            if(_loc3_)
            {
               _fragmentCode = _fragmentCode + _methodSetup._diffuseMethod.getFragmentCodePerLight(_methodSetup._diffuseMethodVO,_loc9_,_loc6_,_registerCache);
            }
            if(_loc2_)
            {
               _fragmentCode = _fragmentCode + _methodSetup._specularMethod.getFragmentCodePerLight(_methodSetup._specularMethodVO,_loc9_,_loc10_,_registerCache);
            }
            _registerCache.removeFragmentTempUsage(_loc9_);
            _loc11_++;
         }
      }
      
      private function compileLightProbeCode() : void
      {
         var _loc3_:* = null;
         var _loc7_:* = 0;
         var _loc2_:* = null;
         var _loc5_:Array = [".x",".y",".z",".w"];
         var _loc6_:Vector.<away3d.materials.compilation.ShaderRegisterElement> = new Vector.<away3d.materials.compilation.ShaderRegisterElement>();
         var _loc1_:Boolean = _usingSpecularMethod && usesProbesForSpecular();
         var _loc4_:Boolean = usesProbesForDiffuse();
         if(!(_loc1_ || _loc4_))
         {
            return;
         }
         if(_loc4_)
         {
            _lightProbeDiffuseIndices = new Vector.<uint>();
         }
         if(_loc1_)
         {
            _lightProbeSpecularIndices = new Vector.<uint>();
         }
         _loc7_ = uint(0);
         while(_loc7_ < _numProbeRegisters)
         {
            _loc6_[_loc7_] = _registerCache.getFreeFragmentConstant();
            if(_loc7_ == 0)
            {
               _probeWeightsIndex = _loc6_[_loc7_].index * 4;
            }
            _loc7_++;
         }
         _loc7_ = uint(0);
         while(_loc7_ < _numLightProbes)
         {
            _loc3_ = _loc6_[Math.floor(_loc7_ / 4)].toString() + _loc5_[_loc7_ % 4];
            if(_loc4_)
            {
               _loc2_ = _registerCache.getFreeTextureReg();
               _lightProbeDiffuseIndices[_loc7_] = _loc2_.index;
               _fragmentCode = _fragmentCode + _methodSetup._diffuseMethod.getFragmentCodePerProbe(_methodSetup._diffuseMethodVO,_loc2_,_loc3_,_registerCache);
            }
            if(_loc1_)
            {
               _loc2_ = _registerCache.getFreeTextureReg();
               _lightProbeSpecularIndices[_loc7_] = _loc2_.index;
               _fragmentCode = _fragmentCode + _methodSetup._specularMethod.getFragmentCodePerProbe(_methodSetup._specularMethodVO,_loc2_,_loc3_,_registerCache);
            }
            _loc7_++;
         }
      }
   }
}
