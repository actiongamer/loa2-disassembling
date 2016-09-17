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
   import away3d.materials.MaterialBase;
   
   public class ShadowCasterPass extends CompiledPass
   {
       
      
      private var _tangentSpace:Boolean;
      
      private var _lightVertexConstantIndex:int;
      
      private var _inverseSceneMatrix:Vector.<Number>;
      
      public function ShadowCasterPass(param1:MaterialBase)
      {
         _inverseSceneMatrix = new Vector.<Number>();
         super(param1);
      }
      
      override protected function createCompiler() : ShaderCompiler
      {
         return new LightingShaderCompiler();
      }
      
      override protected function updateLights() : void
      {
         super.updateLights();
         var _loc2_:int = _lightPicker.numCastingPointLights > 0?1:0;
         var _loc1_:int = _lightPicker.numCastingDirectionalLights > 0?1:0;
         _numLightProbes = 0;
         if(_loc2_ == _loc1_)
         {
            throw new Error("Must have exactly one light!");
         }
         if(_loc2_ != _numPointLights || _loc1_ != _numDirectionalLights)
         {
            _numPointLights = _loc2_;
            _numDirectionalLights = _loc1_;
            invalidateShaderProgram();
         }
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
      
      override protected function updateLightConstants() : void
      {
         var _loc1_:* = null;
         var _loc3_:* = null;
         var _loc2_:* = 0;
         var _loc5_:* = 0;
         var _loc8_:* = null;
         var _loc7_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc4_:Number = NaN;
         _loc2_ = uint(_lightVertexConstantIndex);
         _loc5_ = uint(_lightFragmentConstantIndex);
         if(_numDirectionalLights > 0)
         {
            _loc1_ = _lightPicker.castingDirectionalLights[0];
            _loc8_ = _loc1_.sceneDirection;
            _ambientLightR = _ambientLightR + _loc1_._ambientR;
            _ambientLightG = _ambientLightG + _loc1_._ambientG;
            _ambientLightB = _ambientLightB + _loc1_._ambientB;
            if(_tangentSpace)
            {
               _loc7_ = -_loc8_.x;
               _loc6_ = -_loc8_.y;
               _loc4_ = -_loc8_.z;
               _vertexConstantData[_loc2_++] = _inverseSceneMatrix[0] * _loc7_ + _inverseSceneMatrix[4] * _loc6_ + _inverseSceneMatrix[8] * _loc4_;
               _vertexConstantData[_loc2_++] = _inverseSceneMatrix[1] * _loc7_ + _inverseSceneMatrix[5] * _loc6_ + _inverseSceneMatrix[9] * _loc4_;
               _vertexConstantData[_loc2_++] = _inverseSceneMatrix[2] * _loc7_ + _inverseSceneMatrix[6] * _loc6_ + _inverseSceneMatrix[10] * _loc4_;
               _vertexConstantData[_loc2_++] = 1;
            }
            else
            {
               _fragmentConstantData[_loc5_++] = -_loc8_.x;
               _fragmentConstantData[_loc5_++] = -_loc8_.y;
               _fragmentConstantData[_loc5_++] = -_loc8_.z;
               _fragmentConstantData[_loc5_++] = 1;
            }
            _fragmentConstantData[_loc5_++] = _loc1_._diffuseR;
            _fragmentConstantData[_loc5_++] = _loc1_._diffuseG;
            _fragmentConstantData[_loc5_++] = _loc1_._diffuseB;
            _fragmentConstantData[_loc5_++] = 1;
            _fragmentConstantData[_loc5_++] = _loc1_._specularR;
            _fragmentConstantData[_loc5_++] = _loc1_._specularG;
            _fragmentConstantData[_loc5_++] = _loc1_._specularB;
            _fragmentConstantData[_loc5_++] = 1;
            return;
         }
         if(_numPointLights > 0)
         {
            _loc3_ = _lightPicker.castingPointLights[0];
            _loc8_ = _loc3_.scenePosition;
            _ambientLightR = _ambientLightR + _loc3_._ambientR;
            _ambientLightG = _ambientLightG + _loc3_._ambientG;
            _ambientLightB = _ambientLightB + _loc3_._ambientB;
            if(_tangentSpace)
            {
               _loc7_ = _loc8_.x;
               _loc6_ = _loc8_.y;
               _loc4_ = _loc8_.z;
               _vertexConstantData[_loc2_++] = _inverseSceneMatrix[0] * _loc7_ + _inverseSceneMatrix[4] * _loc6_ + _inverseSceneMatrix[8] * _loc4_ + _inverseSceneMatrix[12];
               _vertexConstantData[_loc2_++] = _inverseSceneMatrix[1] * _loc7_ + _inverseSceneMatrix[5] * _loc6_ + _inverseSceneMatrix[9] * _loc4_ + _inverseSceneMatrix[13];
               _vertexConstantData[_loc2_++] = _inverseSceneMatrix[2] * _loc7_ + _inverseSceneMatrix[6] * _loc6_ + _inverseSceneMatrix[10] * _loc4_ + _inverseSceneMatrix[14];
            }
            else
            {
               _vertexConstantData[_loc2_++] = _loc8_.x;
               _vertexConstantData[_loc2_++] = _loc8_.y;
               _vertexConstantData[_loc2_++] = _loc8_.z;
            }
            _vertexConstantData[_loc2_++] = 1;
            _fragmentConstantData[_loc5_++] = _loc3_._diffuseR;
            _fragmentConstantData[_loc5_++] = _loc3_._diffuseG;
            _fragmentConstantData[_loc5_++] = _loc3_._diffuseB;
            _fragmentConstantData[_loc5_++] = _loc3_._radius;
            _fragmentConstantData[_loc5_++] = _loc3_._specularR;
            _fragmentConstantData[_loc5_++] = _loc3_._specularG;
            _fragmentConstantData[_loc5_++] = _loc3_._specularB;
            _fragmentConstantData[_loc5_++] = _loc3_._fallOffFactor;
         }
      }
      
      override protected function usesProbes() : Boolean
      {
         return false;
      }
      
      override protected function usesLights() : Boolean
      {
         return true;
      }
      
      override protected function updateProbes(param1:Stage3DProxy) : void
      {
      }
   }
}
