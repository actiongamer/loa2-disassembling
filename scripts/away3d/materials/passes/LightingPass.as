package away3d.materials.passes
{
   import away3d.materials.compilation.ShaderCompiler;
   import away3d.materials.compilation.LightingShaderCompiler;
   import §away3d:arcane§.invalidateShaderProgram;
   import away3d.core.base.IRenderable;
   import away3d.core.managers.Stage3DProxy;
   import away3d.cameras.Camera3D;
   import flash.geom.Vector3D;
   import away3d.lights.DirectionalLight;
   import away3d.lights.PointLight;
   import away3d.lights.LightProbe;
   import away3d.materials.MaterialBase;
   
   public class LightingPass extends CompiledPass
   {
       
      
      private var _includeCasters:Boolean = true;
      
      private var _tangentSpace:Boolean;
      
      private var _lightVertexConstantIndex:int;
      
      private var _inverseSceneMatrix:Vector.<Number>;
      
      private var _directionalLightsOffset:uint;
      
      private var _pointLightsOffset:uint;
      
      private var _lightProbesOffset:uint;
      
      public function LightingPass(param1:MaterialBase)
      {
         _inverseSceneMatrix = new Vector.<Number>();
         super(param1);
      }
      
      public function get directionalLightsOffset() : uint
      {
         return _directionalLightsOffset;
      }
      
      public function set directionalLightsOffset(param1:uint) : void
      {
         _directionalLightsOffset = param1;
      }
      
      public function get pointLightsOffset() : uint
      {
         return _pointLightsOffset;
      }
      
      public function set pointLightsOffset(param1:uint) : void
      {
         _pointLightsOffset = param1;
      }
      
      public function get lightProbesOffset() : uint
      {
         return _lightProbesOffset;
      }
      
      public function set lightProbesOffset(param1:uint) : void
      {
         _lightProbesOffset = param1;
      }
      
      override protected function createCompiler() : ShaderCompiler
      {
         return new LightingShaderCompiler();
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
      
      override protected function updateLights() : void
      {
         super.updateLights();
         var _loc1_:int = calculateNumDirectionalLights(_lightPicker.numDirectionalLights);
         var _loc2_:int = calculateNumPointLights(_lightPicker.numPointLights);
         var _loc3_:int = calculateNumProbes(_lightPicker.numLightProbes);
         if(_includeCasters)
         {
            _loc2_ = _loc2_ + _lightPicker.numCastingPointLights;
            _loc1_ = _loc1_ + _lightPicker.numCastingDirectionalLights;
         }
         if(_loc2_ != _numPointLights || _loc1_ != _numDirectionalLights || _loc3_ != _numLightProbes)
         {
            _numPointLights = _loc2_;
            _numDirectionalLights = _loc1_;
            _numLightProbes = _loc3_;
            invalidateShaderProgram();
         }
      }
      
      private function calculateNumDirectionalLights(param1:uint) : int
      {
         return Math.min(param1 - _directionalLightsOffset,3);
      }
      
      private function calculateNumPointLights(param1:uint) : int
      {
         var _loc2_:int = 3 - _numDirectionalLights;
         return Math.min(param1 - _pointLightsOffset,_loc2_);
      }
      
      private function calculateNumProbes(param1:uint) : int
      {
         var _loc2_:int = 0;
         if((_specularLightSources & 2) != 0)
         {
            _loc2_++;
         }
         if((_diffuseLightSources & 2) != 0)
         {
            _loc2_++;
         }
         return Math.min(param1 - _lightProbesOffset,int(4 / _loc2_));
      }
      
      override protected function updateShaderProperties() : void
      {
         super.updateShaderProperties();
         _tangentSpace = LightingShaderCompiler(_compiler).tangentSpace;
      }
      
      override protected function updateRegisterIndices() : void
      {
         super.updateRegisterIndices();
         _lightVertexConstantIndex = LightingShaderCompiler(_compiler).lightVertexConstantIndex;
      }
      
      override function render(param1:IRenderable, param2:Stage3DProxy, param3:Camera3D) : void
      {
         var _loc7_:* = null;
         var _loc6_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc4_:Number = NaN;
         param1.inverseSceneTransform.copyRawDataTo(_inverseSceneMatrix);
         if(_tangentSpace && _cameraPositionIndex >= 0)
         {
            _loc7_ = param3.scenePosition;
            _loc6_ = _loc7_.x;
            _loc5_ = _loc7_.y;
            _loc4_ = _loc7_.z;
            _vertexConstantData[_cameraPositionIndex] = _inverseSceneMatrix[0] * _loc6_ + _inverseSceneMatrix[4] * _loc5_ + _inverseSceneMatrix[8] * _loc4_ + _inverseSceneMatrix[12];
            _vertexConstantData[_cameraPositionIndex + 1] = _inverseSceneMatrix[1] * _loc6_ + _inverseSceneMatrix[5] * _loc5_ + _inverseSceneMatrix[9] * _loc4_ + _inverseSceneMatrix[13];
            _vertexConstantData[_cameraPositionIndex + 2] = _inverseSceneMatrix[2] * _loc6_ + _inverseSceneMatrix[6] * _loc5_ + _inverseSceneMatrix[10] * _loc4_ + _inverseSceneMatrix[14];
         }
         super.render(param1,param2,param3);
      }
      
      override function activate(param1:Stage3DProxy, param2:Camera3D, param3:Number, param4:Number) : void
      {
         var _loc5_:* = null;
         super.activate(param1,param2,param3,param4);
         if(!_tangentSpace && _cameraPositionIndex >= 0)
         {
            _loc5_ = param2.scenePosition;
            _vertexConstantData[_cameraPositionIndex] = _loc5_.x;
            _vertexConstantData[_cameraPositionIndex + 1] = _loc5_.y;
            _vertexConstantData[_cameraPositionIndex + 2] = _loc5_.z;
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
      
      override protected function updateLightConstants() : void
      {
         var _loc8_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = 0;
         var _loc7_:* = 0;
         var _loc4_:int = 0;
         var _loc15_:* = null;
         var _loc3_:int = 0;
         var _loc12_:int = 0;
         var _loc16_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc1_:uint = 0;
         var _loc11_:uint = !!_includeCasters?2:1;
         _loc3_ = _lightVertexConstantIndex;
         _loc6_ = uint(_lightFragmentConstantIndex);
         var _loc9_:int = 0;
         var _loc2_:Vector.<DirectionalLight> = _lightPicker.directionalLights;
         _loc12_ = _directionalLightsOffset;
         _loc4_ = _lightPicker.directionalLights.length;
         if(_loc12_ > _loc4_)
         {
            _loc9_ = 1;
            _loc12_ = _loc12_ - _loc4_;
         }
         while(_loc9_ < _loc11_)
         {
            if(_loc9_)
            {
               _loc2_ = _lightPicker.castingDirectionalLights;
            }
            _loc4_ = _loc2_.length;
            if(_loc4_ > _numDirectionalLights)
            {
               _loc4_ = _numDirectionalLights;
            }
            _loc7_ = uint(0);
            while(_loc7_ < _loc4_)
            {
               _loc8_ = _loc2_[_loc12_ + _loc7_];
               _loc15_ = _loc8_.sceneDirection;
               _ambientLightR = _ambientLightR + _loc8_._ambientR;
               _ambientLightG = _ambientLightG + _loc8_._ambientG;
               _ambientLightB = _ambientLightB + _loc8_._ambientB;
               if(_tangentSpace)
               {
                  _loc16_ = -_loc15_.x;
                  _loc14_ = -_loc15_.y;
                  _loc13_ = -_loc15_.z;
                  _loc3_++;
                  _vertexConstantData[_loc3_] = _inverseSceneMatrix[0] * _loc16_ + _inverseSceneMatrix[4] * _loc14_ + _inverseSceneMatrix[8] * _loc13_;
                  _loc3_++;
                  _vertexConstantData[_loc3_] = _inverseSceneMatrix[1] * _loc16_ + _inverseSceneMatrix[5] * _loc14_ + _inverseSceneMatrix[9] * _loc13_;
                  _loc3_++;
                  _vertexConstantData[_loc3_] = _inverseSceneMatrix[2] * _loc16_ + _inverseSceneMatrix[6] * _loc14_ + _inverseSceneMatrix[10] * _loc13_;
                  _loc3_++;
                  _vertexConstantData[_loc3_] = 1;
               }
               else
               {
                  _fragmentConstantData[_loc6_++] = -_loc15_.x;
                  _fragmentConstantData[_loc6_++] = -_loc15_.y;
                  _fragmentConstantData[_loc6_++] = -_loc15_.z;
                  _fragmentConstantData[_loc6_++] = 1;
               }
               _fragmentConstantData[_loc6_++] = _loc8_._diffuseR;
               _fragmentConstantData[_loc6_++] = _loc8_._diffuseG;
               _fragmentConstantData[_loc6_++] = _loc8_._diffuseB;
               _fragmentConstantData[_loc6_++] = 1;
               _fragmentConstantData[_loc6_++] = _loc8_._specularR;
               _fragmentConstantData[_loc6_++] = _loc8_._specularG;
               _fragmentConstantData[_loc6_++] = _loc8_._specularB;
               _fragmentConstantData[_loc6_++] = 1;
               if(++_loc1_ == _numDirectionalLights)
               {
                  _loc7_ = uint(_loc4_);
                  _loc9_ = _loc11_;
               }
               _loc7_++;
            }
            _loc9_++;
         }
         if(_numDirectionalLights > _loc1_)
         {
            _loc7_ = uint(_loc6_ + (_numDirectionalLights - _loc1_) * 12);
            while(_loc6_ < _loc7_)
            {
               _fragmentConstantData[_loc6_++] = 0;
            }
         }
         _loc1_ = 0;
         var _loc10_:Vector.<PointLight> = _lightPicker.pointLights;
         _loc12_ = _pointLightsOffset;
         _loc4_ = _lightPicker.pointLights.length;
         if(_loc12_ > _loc4_)
         {
            _loc9_ = 1;
            _loc12_ = _loc12_ - _loc4_;
         }
         else
         {
            _loc9_ = 0;
         }
         while(_loc9_ < _loc11_)
         {
            if(_loc9_)
            {
               _loc10_ = _lightPicker.castingPointLights;
            }
            _loc4_ = _loc10_.length;
            _loc7_ = uint(0);
            while(_loc7_ < _loc4_)
            {
               _loc5_ = _loc10_[_loc12_ + _loc7_];
               _loc15_ = _loc5_.scenePosition;
               _ambientLightR = _ambientLightR + _loc5_._ambientR;
               _ambientLightG = _ambientLightG + _loc5_._ambientG;
               _ambientLightB = _ambientLightB + _loc5_._ambientB;
               if(_tangentSpace)
               {
                  _loc16_ = _loc15_.x;
                  _loc14_ = _loc15_.y;
                  _loc13_ = _loc15_.z;
                  _loc3_++;
                  _vertexConstantData[_loc3_] = _inverseSceneMatrix[0] * _loc16_ + _inverseSceneMatrix[4] * _loc14_ + _inverseSceneMatrix[8] * _loc13_ + _inverseSceneMatrix[12];
                  _loc3_++;
                  _vertexConstantData[_loc3_] = _inverseSceneMatrix[1] * _loc16_ + _inverseSceneMatrix[5] * _loc14_ + _inverseSceneMatrix[9] * _loc13_ + _inverseSceneMatrix[13];
                  _loc3_++;
                  _vertexConstantData[_loc3_] = _inverseSceneMatrix[2] * _loc16_ + _inverseSceneMatrix[6] * _loc14_ + _inverseSceneMatrix[10] * _loc13_ + _inverseSceneMatrix[14];
               }
               else
               {
                  _loc3_++;
                  _vertexConstantData[_loc3_] = _loc15_.x;
                  _loc3_++;
                  _vertexConstantData[_loc3_] = _loc15_.y;
                  _loc3_++;
                  _vertexConstantData[_loc3_] = _loc15_.z;
               }
               _loc3_++;
               _vertexConstantData[_loc3_] = 1;
               _fragmentConstantData[_loc6_++] = _loc5_._diffuseR;
               _fragmentConstantData[_loc6_++] = _loc5_._diffuseG;
               _fragmentConstantData[_loc6_++] = _loc5_._diffuseB;
               _fragmentConstantData[_loc6_++] = _loc5_._radius;
               _fragmentConstantData[_loc6_++] = _loc5_._specularR;
               _fragmentConstantData[_loc6_++] = _loc5_._specularG;
               _fragmentConstantData[_loc6_++] = _loc5_._specularB;
               _fragmentConstantData[_loc6_++] = _loc5_._fallOffFactor;
               if(++_loc1_ == _numPointLights)
               {
                  _loc7_ = uint(_loc4_);
                  _loc9_ = _loc11_;
               }
               _loc7_++;
            }
            _loc9_++;
         }
         if(_numPointLights > _loc1_)
         {
            _loc7_ = uint(_loc6_ + (_loc1_ - _numPointLights) * 12);
            while(_loc6_ < _loc7_)
            {
               _fragmentConstantData[_loc6_] = 0;
               _loc6_++;
            }
         }
      }
      
      override protected function updateProbes(param1:Stage3DProxy) : void
      {
         var _loc8_:* = null;
         var _loc6_:* = 0;
         var _loc7_:Vector.<LightProbe> = _lightPicker.lightProbes;
         var _loc3_:Vector.<Number> = _lightPicker.lightProbeWeights;
         var _loc5_:int = _loc7_.length - _lightProbesOffset;
         var _loc4_:Boolean = usesProbesForDiffuse();
         var _loc2_:Boolean = _methodSetup._specularMethod && usesProbesForSpecular();
         if(!(_loc4_ || _loc2_))
         {
            return;
         }
         if(_loc5_ > _numLightProbes)
         {
            _loc5_ = _numLightProbes;
         }
         _loc6_ = uint(0);
         while(_loc6_ < _loc5_)
         {
            _loc8_ = _loc7_[_lightProbesOffset + _loc6_];
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
         _loc6_ = uint(0);
         while(_loc6_ < _loc5_)
         {
            _fragmentConstantData[_probeWeightsIndex + _loc6_] = _loc3_[_lightProbesOffset + _loc6_];
            _loc6_++;
         }
      }
   }
}
