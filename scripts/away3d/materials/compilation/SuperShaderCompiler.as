package away3d.materials.compilation
{
   public class SuperShaderCompiler extends ShaderCompiler
   {
       
      
      public var _pointLightRegisters:Vector.<away3d.materials.compilation.ShaderRegisterElement>;
      
      public var _dirLightRegisters:Vector.<away3d.materials.compilation.ShaderRegisterElement>;
      
      public function SuperShaderCompiler()
      {
         super();
      }
      
      override protected function initLightData() : void
      {
         super.initLightData();
         _pointLightRegisters = new Vector.<away3d.materials.compilation.ShaderRegisterElement>(_numPointLights * 3,true);
         _dirLightRegisters = new Vector.<away3d.materials.compilation.ShaderRegisterElement>(_numDirectionalLights * 3,true);
      }
      
      override protected function calculateDependencies() : void
      {
         super.calculateDependencies();
         _dependencyCounter.addWorldSpaceDependencies(true);
      }
      
      override protected function compileNormalCode() : void
      {
         var _loc1_:Vector.<away3d.materials.compilation.ShaderRegisterElement> = new Vector.<away3d.materials.compilation.ShaderRegisterElement>(3,true);
         _sharedRegisters.animatedNormal = _registerCache.getFreeVertexVectorTemp();
         _registerCache.addVertexTempUsages(_sharedRegisters.animatedNormal,1);
         _sharedRegisters.normalFragment = _registerCache.getFreeFragmentVectorTemp();
         _registerCache.addFragmentTempUsages(_sharedRegisters.normalFragment,_dependencyCounter.normalDependencies);
         if(_methodSetup._normalMethod.hasOutput && !_methodSetup._normalMethod.tangentSpace)
         {
            _vertexCode = _vertexCode + _methodSetup._normalMethod.getVertexCode(_methodSetup._normalMethodVO,_registerCache);
            _fragmentCode = _fragmentCode + _methodSetup._normalMethod.getFragmentCode(_methodSetup._normalMethodVO,_registerCache,_sharedRegisters.normalFragment);
            return;
         }
         _sharedRegisters.normalInput = _registerCache.getFreeVertexAttribute();
         _normalBufferIndex = _sharedRegisters.normalInput.index;
         _sharedRegisters.normalVarying = _registerCache.getFreeVarying();
         _animatableAttributes.push(_sharedRegisters.normalInput.toString());
         _animationTargetRegisters.push(_sharedRegisters.animatedNormal.toString());
         _loc1_[0] = _registerCache.getFreeVertexConstant();
         _loc1_[1] = _registerCache.getFreeVertexConstant();
         _loc1_[2] = _registerCache.getFreeVertexConstant();
         _registerCache.getFreeVertexConstant();
         _sceneNormalMatrixIndex = (_loc1_[0].index - _vertexConstantsOffset) * 4;
         if(_methodSetup._normalMethod.hasOutput)
         {
            compileTangentVertexCode(_loc1_);
            compileTangentNormalMapFragmentCode();
         }
         else
         {
            _vertexCode = _vertexCode + ("m33 " + _sharedRegisters.normalVarying + ".xyz, " + _sharedRegisters.animatedNormal + ".xyz, " + _loc1_[0] + "\n" + "mov " + _sharedRegisters.normalVarying + ".w, " + _sharedRegisters.animatedNormal + ".w\t\n");
            _fragmentCode = _fragmentCode + ("nrm " + _sharedRegisters.normalFragment + ".xyz, " + _sharedRegisters.normalVarying + ".xyz\t\n" + "mov " + _sharedRegisters.normalFragment + ".w, " + _sharedRegisters.normalVarying + ".w\t\t\n");
            if(_dependencyCounter.tangentDependencies > 0)
            {
               _sharedRegisters.tangentInput = _registerCache.getFreeVertexAttribute();
               _tangentBufferIndex = _sharedRegisters.tangentInput.index;
               _sharedRegisters.tangentVarying = _registerCache.getFreeVarying();
               _vertexCode = _vertexCode + ("mov " + _sharedRegisters.tangentVarying + ", " + _sharedRegisters.tangentInput + "\n");
            }
         }
         _registerCache.removeVertexTempUsage(_sharedRegisters.animatedNormal);
      }
      
      private function compileTangentVertexCode(param1:Vector.<away3d.materials.compilation.ShaderRegisterElement>) : void
      {
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc3_:* = null;
         _sharedRegisters.tangentVarying = _registerCache.getFreeVarying();
         _sharedRegisters.bitangentVarying = _registerCache.getFreeVarying();
         _sharedRegisters.tangentInput = _registerCache.getFreeVertexAttribute();
         _tangentBufferIndex = _sharedRegisters.tangentInput.index;
         _sharedRegisters.animatedTangent = _registerCache.getFreeVertexVectorTemp();
         _registerCache.addVertexTempUsages(_sharedRegisters.animatedTangent,1);
         _animatableAttributes.push(_sharedRegisters.tangentInput.toString());
         _animationTargetRegisters.push(_sharedRegisters.animatedTangent.toString());
         _loc2_ = _registerCache.getFreeVertexVectorTemp();
         _registerCache.addVertexTempUsages(_loc2_,1);
         _vertexCode = _vertexCode + ("m33 " + _loc2_ + ".xyz, " + _sharedRegisters.animatedNormal + ".xyz, " + param1[0].toString() + "\n" + "nrm " + _loc2_ + ".xyz, " + _loc2_ + ".xyz\t\n");
         _loc4_ = _registerCache.getFreeVertexVectorTemp();
         _registerCache.addVertexTempUsages(_loc4_,1);
         _vertexCode = _vertexCode + ("m33 " + _loc4_ + ".xyz, " + _sharedRegisters.animatedTangent + ".xyz, " + param1[0].toString() + "\n" + "nrm " + _loc4_ + ".xyz, " + _loc4_ + ".xyz\t\n");
         _loc5_ = _registerCache.getFreeVertexVectorTemp();
         _registerCache.addVertexTempUsages(_loc5_,1);
         _loc3_ = _registerCache.getFreeVertexVectorTemp();
         _vertexCode = _vertexCode + ("mul " + _loc5_ + ".xyz, " + _loc2_ + ".yzx, " + _loc4_ + ".zxy\t\n" + "mul " + _loc3_ + ".xyz, " + _loc2_ + ".zxy, " + _loc4_ + ".yzx\t\n" + "sub " + _loc3_ + ".xyz, " + _loc5_ + ".xyz, " + _loc3_ + ".xyz\t\n" + "mov " + _sharedRegisters.tangentVarying + ".x, " + _loc4_ + ".x\t\n" + "mov " + _sharedRegisters.tangentVarying + ".y, " + _loc3_ + ".x\t\n" + "mov " + _sharedRegisters.tangentVarying + ".z, " + _loc2_ + ".x\t\n" + "mov " + _sharedRegisters.tangentVarying + ".w, " + _sharedRegisters.normalInput + ".w\t\n" + "mov " + _sharedRegisters.bitangentVarying + ".x, " + _loc4_ + ".y\t\n" + "mov " + _sharedRegisters.bitangentVarying + ".y, " + _loc3_ + ".y\t\n" + "mov " + _sharedRegisters.bitangentVarying + ".z, " + _loc2_ + ".y\t\n" + "mov " + _sharedRegisters.bitangentVarying + ".w, " + _sharedRegisters.normalInput + ".w\t\n" + "mov " + _sharedRegisters.normalVarying + ".x, " + _loc4_ + ".z\t\n" + "mov " + _sharedRegisters.normalVarying + ".y, " + _loc3_ + ".z\t\n" + "mov " + _sharedRegisters.normalVarying + ".z, " + _loc2_ + ".z\t\n" + "mov " + _sharedRegisters.normalVarying + ".w, " + _sharedRegisters.normalInput + ".w\t\n");
         _registerCache.removeVertexTempUsage(_loc2_);
         _registerCache.removeVertexTempUsage(_loc4_);
         _registerCache.removeVertexTempUsage(_loc5_);
         _registerCache.removeVertexTempUsage(_sharedRegisters.animatedTangent);
      }
      
      private function compileTangentNormalMapFragmentCode() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         _loc1_ = _registerCache.getFreeFragmentVectorTemp();
         _registerCache.addFragmentTempUsages(_loc1_,1);
         _loc2_ = _registerCache.getFreeFragmentVectorTemp();
         _registerCache.addFragmentTempUsages(_loc2_,1);
         _loc3_ = _registerCache.getFreeFragmentVectorTemp();
         _registerCache.addFragmentTempUsages(_loc3_,1);
         _fragmentCode = _fragmentCode + ("nrm " + _loc1_ + ".xyz, " + _sharedRegisters.tangentVarying + ".xyz\t\n" + "mov " + _loc1_ + ".w, " + _sharedRegisters.tangentVarying + ".w\t\n" + "nrm " + _loc2_ + ".xyz, " + _sharedRegisters.bitangentVarying + ".xyz\t\n" + "nrm " + _loc3_ + ".xyz, " + _sharedRegisters.normalVarying + ".xyz\t\n");
         var _loc4_:away3d.materials.compilation.ShaderRegisterElement = _registerCache.getFreeFragmentVectorTemp();
         _registerCache.addFragmentTempUsages(_loc4_,1);
         _fragmentCode = _fragmentCode + (_methodSetup._normalMethod.getFragmentCode(_methodSetup._normalMethodVO,_registerCache,_loc4_) + "m33 " + _sharedRegisters.normalFragment + ".xyz, " + _loc4_ + ".xyz, " + _loc1_ + "\t\n" + "mov " + _sharedRegisters.normalFragment + ".w,   " + _sharedRegisters.normalVarying + ".w\t\t\t\n");
         _registerCache.removeFragmentTempUsage(_loc4_);
         if(_methodSetup._normalMethodVO.needsView)
         {
            _registerCache.removeFragmentTempUsage(_sharedRegisters.viewDirFragment);
         }
         if(_methodSetup._normalMethodVO.needsGlobalVertexPos || _methodSetup._normalMethodVO.needsGlobalFragmentPos)
         {
            _registerCache.removeVertexTempUsage(_sharedRegisters.globalPositionVertex);
         }
         _registerCache.removeFragmentTempUsage(_loc2_);
         _registerCache.removeFragmentTempUsage(_loc1_);
         _registerCache.removeFragmentTempUsage(_loc3_);
      }
      
      override protected function compileViewDirCode() : void
      {
         var _loc1_:away3d.materials.compilation.ShaderRegisterElement = _registerCache.getFreeVertexConstant();
         _sharedRegisters.viewDirVarying = _registerCache.getFreeVarying();
         _sharedRegisters.viewDirFragment = _registerCache.getFreeFragmentVectorTemp();
         _registerCache.addFragmentTempUsages(_sharedRegisters.viewDirFragment,_dependencyCounter.viewDirDependencies);
         _cameraPositionIndex = (_loc1_.index - _vertexConstantsOffset) * 4;
         _vertexCode = _vertexCode + ("sub " + _sharedRegisters.viewDirVarying + ", " + _loc1_ + ", " + _sharedRegisters.globalPositionVertex + "\n");
         _fragmentCode = _fragmentCode + ("nrm " + _sharedRegisters.viewDirFragment + ".xyz, " + _sharedRegisters.viewDirVarying + ".xyz\t\t\n" + "mov " + _sharedRegisters.viewDirFragment + ".w,   " + _sharedRegisters.viewDirVarying + ".w \t\t\n");
         _registerCache.removeVertexTempUsage(_sharedRegisters.globalPositionVertex);
      }
      
      override protected function compileLightingCode() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
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
         if(_methodSetup._lightMapMethod)
         {
            _vertexCode = _vertexCode + _methodSetup._lightMapMethod.getVertexCode(_methodSetup._lightMapMethodVO,_registerCache);
            _loc2_ = _registerCache.getFreeFragmentVectorTemp();
            _registerCache.addFragmentTempUsages(_loc2_,1);
            _methodSetup._diffuseMethod.lightmapRegister = _loc2_;
            _fragmentCode = _fragmentCode + _methodSetup._lightMapMethod.getFragmentCode(_methodSetup._lightMapMethodVO,_registerCache,_loc2_);
         }
         if(_methodSetup._shadowMethod)
         {
            _vertexCode = _vertexCode + _methodSetup._shadowMethod.getVertexCode(_methodSetup._shadowMethodVO,_registerCache);
            if(_dependencyCounter.normalDependencies == 0)
            {
               _loc1_ = _registerCache.getFreeFragmentVectorTemp();
               _registerCache.addFragmentTempUsages(_loc1_,1);
            }
            else
            {
               _loc1_ = _sharedRegisters.normalFragment;
            }
            _methodSetup._diffuseMethod.shadowRegister = _loc1_;
            _fragmentCode = _fragmentCode + _methodSetup._shadowMethod.getFragmentCode(_methodSetup._shadowMethodVO,_registerCache,_loc1_);
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
            _methodSetup._specularMethod.shadowRegister = _loc1_;
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
      }
      
      private function initLightRegisters() : void
      {
         var _loc1_:* = 0;
         var _loc2_:* = 0;
         _loc1_ = uint(_dirLightRegisters.length);
         _loc2_ = uint(0);
         while(_loc2_ < _loc1_)
         {
            _dirLightRegisters[_loc2_] = _registerCache.getFreeFragmentConstant();
            if(_lightFragmentConstantIndex == -1)
            {
               _lightFragmentConstantIndex = _dirLightRegisters[_loc2_].index * 4;
            }
            _loc2_++;
         }
         _loc1_ = uint(_pointLightRegisters.length);
         _loc2_ = uint(0);
         while(_loc2_ < _loc1_)
         {
            _pointLightRegisters[_loc2_] = _registerCache.getFreeFragmentConstant();
            if(_lightFragmentConstantIndex == -1)
            {
               _lightFragmentConstantIndex = _pointLightRegisters[_loc2_].index * 4;
            }
            _loc2_++;
         }
      }
      
      private function compileDirectionalLightCode() : void
      {
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc4_:* = null;
         var _loc7_:int = 0;
         var _loc6_:* = 0;
         var _loc1_:Boolean = _usingSpecularMethod && usesLightsForSpecular();
         var _loc2_:Boolean = usesLightsForDiffuse();
         if(!(_loc1_ || _loc2_))
         {
            return;
         }
         _loc6_ = uint(0);
         while(_loc6_ < _numDirectionalLights)
         {
            _loc7_++;
            _loc4_ = _dirLightRegisters[_loc7_];
            _loc7_++;
            _loc3_ = _dirLightRegisters[_loc7_];
            _loc7_++;
            _loc5_ = _dirLightRegisters[_loc7_];
            if(_loc2_)
            {
               _fragmentCode = _fragmentCode + _methodSetup._diffuseMethod.getFragmentCodePerLight(_methodSetup._diffuseMethodVO,_loc4_,_loc3_,_registerCache);
            }
            if(_loc1_)
            {
               _fragmentCode = _fragmentCode + _methodSetup._specularMethod.getFragmentCodePerLight(_methodSetup._specularMethodVO,_loc4_,_loc5_,_registerCache);
            }
            _loc6_++;
         }
      }
      
      private function compilePointLightCode() : void
      {
         var _loc4_:* = null;
         var _loc6_:* = null;
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc8_:int = 0;
         var _loc7_:* = 0;
         var _loc1_:Boolean = _usingSpecularMethod && usesLightsForSpecular();
         var _loc2_:Boolean = usesLightsForDiffuse();
         if(!(_loc1_ || _loc2_))
         {
            return;
         }
         _loc7_ = uint(0);
         while(_loc7_ < _numPointLights)
         {
            _loc8_++;
            _loc3_ = _pointLightRegisters[_loc8_];
            _loc8_++;
            _loc4_ = _pointLightRegisters[_loc8_];
            _loc8_++;
            _loc6_ = _pointLightRegisters[_loc8_];
            _loc5_ = _registerCache.getFreeFragmentVectorTemp();
            _registerCache.addFragmentTempUsages(_loc5_,1);
            _fragmentCode = _fragmentCode + ("sub " + _loc5_ + ", " + _loc3_ + ", " + _sharedRegisters.globalPositionVarying + "\n" + "dp3 " + _loc5_ + ".w, " + _loc5_ + ".xyz, " + _loc5_ + ".xyz\n" + "sqt " + _loc5_ + ".w, " + _loc5_ + ".w\n" + "sub " + _loc5_ + ".w, " + _loc5_ + ".w, " + _loc4_ + ".w\n" + "mul " + _loc5_ + ".w, " + _loc5_ + ".w, " + _loc6_ + ".w\n" + "sat " + _loc5_ + ".w, " + _loc5_ + ".w\n" + "sub " + _loc5_ + ".w, " + _loc3_ + ".w, " + _loc5_ + ".w\n" + "nrm " + _loc5_ + ".xyz, " + _loc5_ + ".xyz\t\n");
            if(_lightFragmentConstantIndex == -1)
            {
               _lightFragmentConstantIndex = _loc3_.index * 4;
            }
            if(_loc2_)
            {
               _fragmentCode = _fragmentCode + _methodSetup._diffuseMethod.getFragmentCodePerLight(_methodSetup._diffuseMethodVO,_loc5_,_loc4_,_registerCache);
            }
            if(_loc1_)
            {
               _fragmentCode = _fragmentCode + _methodSetup._specularMethod.getFragmentCodePerLight(_methodSetup._specularMethodVO,_loc5_,_loc6_,_registerCache);
            }
            _registerCache.removeFragmentTempUsage(_loc5_);
            _loc7_++;
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
