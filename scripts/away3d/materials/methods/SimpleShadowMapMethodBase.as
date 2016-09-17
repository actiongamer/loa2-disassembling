package away3d.materials.methods
{
   import away3d.materials.compilation.ShaderRegisterElement;
   import away3d.materials.compilation.ShaderRegisterCache;
   import away3d.errors.AbstractMethodError;
   import away3d.core.base.IRenderable;
   import away3d.core.managers.Stage3DProxy;
   import away3d.cameras.Camera3D;
   import away3d.lights.shadowmaps.DirectionalShadowMapper;
   import flash.geom.Vector3D;
   import away3d.lights.PointLight;
   import away3d.lights.LightBase;
   
   public class SimpleShadowMapMethodBase extends ShadowMapMethodBase
   {
       
      
      protected var _depthMapCoordReg:ShaderRegisterElement;
      
      protected var _usePoint:Boolean;
      
      public function SimpleShadowMapMethodBase(param1:LightBase)
      {
         _usePoint = param1 is PointLight;
         _epsilon = !!_usePoint?0.01:0.002;
         super(param1);
      }
      
      override function initVO(param1:MethodVO) : void
      {
         param1.needsView = true;
         param1.needsGlobalVertexPos = true;
         param1.needsGlobalFragmentPos = _usePoint;
         param1.needsNormals = param1.numLights > 0;
      }
      
      override function initConstants(param1:MethodVO) : void
      {
         var _loc3_:Vector.<Number> = param1.fragmentData;
         var _loc4_:Vector.<Number> = param1.vertexData;
         var _loc2_:int = param1.fragmentConstantsIndex;
         _loc3_[_loc2_] = 1;
         _loc3_[_loc2_ + 1] = 0.00392156862745098;
         _loc3_[_loc2_ + 2] = 0.0000153787004998078;
         _loc3_[_loc2_ + 3] = 6.03086294110108e-8;
         _loc3_[_loc2_ + 6] = 0;
         _loc3_[_loc2_ + 7] = 1;
         if(_usePoint)
         {
            _loc3_[_loc2_ + 8] = 0;
            _loc3_[_loc2_ + 9] = 0;
            _loc3_[_loc2_ + 10] = 0;
            _loc3_[_loc2_ + 11] = 1;
         }
         _loc2_ = param1.vertexConstantsIndex;
         if(_loc2_ != -1)
         {
            _loc4_[_loc2_] = 0.5;
            _loc4_[_loc2_ + 1] = -0.5;
            _loc4_[_loc2_ + 2] = 0;
            _loc4_[_loc2_ + 3] = 1;
         }
      }
      
      function get depthMapCoordReg() : ShaderRegisterElement
      {
         return _depthMapCoordReg;
      }
      
      function set depthMapCoordReg(param1:ShaderRegisterElement) : void
      {
         _depthMapCoordReg = param1;
      }
      
      override function cleanCompilationData() : void
      {
         super.cleanCompilationData();
         _depthMapCoordReg = null;
      }
      
      override function getVertexCode(param1:MethodVO, param2:ShaderRegisterCache) : String
      {
         return !!_usePoint?getPointVertexCode(param1,param2):getPlanarVertexCode(param1,param2);
      }
      
      protected function getPointVertexCode(param1:MethodVO, param2:ShaderRegisterCache) : String
      {
         param1.vertexConstantsIndex = -1;
         return "";
      }
      
      protected function getPlanarVertexCode(param1:MethodVO, param2:ShaderRegisterCache) : String
      {
         var _loc6_:String = "";
         var _loc5_:ShaderRegisterElement = param2.getFreeVertexVectorTemp();
         var _loc4_:ShaderRegisterElement = param2.getFreeVertexConstant();
         var _loc3_:ShaderRegisterElement = param2.getFreeVertexConstant();
         param2.getFreeVertexConstant();
         param2.getFreeVertexConstant();
         param2.getFreeVertexConstant();
         _depthMapCoordReg = param2.getFreeVarying();
         param1.vertexConstantsIndex = (_loc4_.index - param1.vertexConstantsOffset) * 4;
         _loc6_ = _loc6_ + ("m44 " + _loc5_ + ", " + _sharedRegisters.globalPositionVertex + ", " + _loc3_ + "\n" + "div " + _loc5_ + ", " + _loc5_ + ", " + _loc5_ + ".w\n" + "mul " + _loc5_ + ".xy, " + _loc5_ + ".xy, " + _loc4_ + ".xy\n" + "add " + _depthMapCoordReg + ", " + _loc5_ + ", " + _loc4_ + ".xxwz\n");
         return _loc6_;
      }
      
      override function getFragmentCode(param1:MethodVO, param2:ShaderRegisterCache, param3:ShaderRegisterElement) : String
      {
         var _loc4_:String = !!_usePoint?getPointFragmentCode(param1,param2,param3):getPlanarFragmentCode(param1,param2,param3);
         _loc4_ = _loc4_ + ("add " + param3 + ".w, " + param3 + ".w, fc" + (param1.fragmentConstantsIndex / 4 + 1) + ".y\n" + "sat " + param3 + ".w, " + param3 + ".w\n");
         return _loc4_;
      }
      
      protected function getPlanarFragmentCode(param1:MethodVO, param2:ShaderRegisterCache, param3:ShaderRegisterElement) : String
      {
         throw new AbstractMethodError();
      }
      
      protected function getPointFragmentCode(param1:MethodVO, param2:ShaderRegisterCache, param3:ShaderRegisterElement) : String
      {
         throw new AbstractMethodError();
      }
      
      override function setRenderState(param1:MethodVO, param2:IRenderable, param3:Stage3DProxy, param4:Camera3D) : void
      {
         if(!_usePoint && _shadowMapper is DirectionalShadowMapper)
         {
            DirectionalShadowMapper(_shadowMapper).depthProjection.copyRawDataTo(param1.vertexData,param1.vertexConstantsIndex + 4,true);
         }
      }
      
      function getCascadeFragmentCode(param1:MethodVO, param2:ShaderRegisterCache, param3:ShaderRegisterElement, param4:ShaderRegisterElement, param5:ShaderRegisterElement, param6:ShaderRegisterElement) : String
      {
         throw new Error("This shadow method is incompatible with cascade shadows");
      }
      
      override function activate(param1:MethodVO, param2:Stage3DProxy) : void
      {
         var _loc6_:* = null;
         var _loc3_:Number = NaN;
         var _loc5_:Vector.<Number> = param1.fragmentData;
         var _loc4_:int = param1.fragmentConstantsIndex;
         if(_usePoint)
         {
            _loc5_[_loc4_ + 4] = -_epsilon;
         }
         else
         {
            param1.vertexData[param1.vertexConstantsIndex + 3] = -_epsilon;
         }
         _loc5_[_loc4_ + 5] = 1 - _alpha;
         if(_usePoint)
         {
            _loc6_ = _castingLight.scenePosition;
            _loc5_[_loc4_ + 8] = _loc6_.x;
            _loc5_[_loc4_ + 9] = _loc6_.y;
            _loc5_[_loc4_ + 10] = _loc6_.z;
            _loc3_ = PointLight(_castingLight)._fallOff;
            _loc5_[_loc4_ + 11] = 1 / (2 * _loc3_ * _loc3_);
         }
         param2.setTextureAt(param1.texturesIndex,_castingLight.shadowMapper.depthMap.getTextureForStage3D(param2));
      }
      
      function activateForCascade(param1:MethodVO, param2:Stage3DProxy) : void
      {
         throw new Error("This shadow method is incompatible with cascade shadows");
      }
   }
}
