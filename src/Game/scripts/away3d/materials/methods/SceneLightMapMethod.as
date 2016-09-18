package away3d.materials.methods
{
   import away3d.lights.LightBase;
   import away3d.materials.compilation.ShaderRegisterElement;
   import flash.geom.Matrix3D;
   import away3d.core.managers.Stage3DProxy;
   import away3d.materials.compilation.ShaderRegisterCache;
   import away3d.core.base.IRenderable;
   import away3d.cameras.Camera3D;
   
   public class SceneLightMapMethod extends EffectMethodBase
   {
       
      
      private var _castingLight:LightBase;
      
      private var _lightMapVar:ShaderRegisterElement;
      
      private var _projMatrix:Matrix3D;
      
      public function SceneLightMapMethod(param1:LightBase)
      {
         _projMatrix = new Matrix3D();
         super();
         param1.castsLightMap = true;
         _castingLight = param1;
      }
      
      override function activate(param1:MethodVO, param2:Stage3DProxy) : void
      {
         param2.setTextureAt(param1.texturesIndex,_castingLight.lightMapper.lightMap.getTextureForStage3D(param2));
      }
      
      override function deactivate(param1:MethodVO, param2:Stage3DProxy) : void
      {
      }
      
      override function getFragmentCode(param1:MethodVO, param2:ShaderRegisterCache, param3:ShaderRegisterElement) : String
      {
         var _loc6_:ShaderRegisterElement = param2.getFreeTextureReg();
         var _loc7_:ShaderRegisterElement = param2.getFreeFragmentConstant();
         var _loc5_:ShaderRegisterElement = param2.getFreeFragmentConstant();
         var _loc4_:ShaderRegisterElement = param2.getFreeFragmentVectorTemp();
         param1.fragmentConstantsIndex = _loc7_.index * 4;
         param1.texturesIndex = _loc6_.index;
         var _loc8_:String = "";
         _loc8_ = _loc8_ + ("tex " + _loc4_ + ", " + _lightMapVar + ", " + _loc6_ + " <2d, linear, repeat>\n" + "mov " + param3 + ", " + _loc4_ + "\n");
         return _loc8_;
      }
      
      override function getVertexCode(param1:MethodVO, param2:ShaderRegisterCache) : String
      {
         var _loc5_:ShaderRegisterElement = param2.getFreeVertexConstant();
         var _loc3_:ShaderRegisterElement = param2.getFreeVertexConstant();
         param2.getFreeVertexConstant();
         param2.getFreeVertexConstant();
         param2.getFreeVertexConstant();
         param1.vertexConstantsIndex = (_loc5_.index - param1.vertexConstantsOffset) * 4;
         var _loc4_:ShaderRegisterElement = param2.getFreeVertexVectorTemp();
         _lightMapVar = param2.getFreeVarying();
         var _loc6_:String = "";
         _loc6_ = _loc6_ + ("m44 " + _loc4_ + ", vt0, " + _loc3_ + "\n" + "rcp " + _loc4_ + ".w, " + _loc4_ + ".w\n" + "mul " + _loc4_ + ".xyz, " + _loc4_ + ".xyz, " + _loc4_ + ".w\n" + "mul " + _loc4_ + ".xy, " + _loc4_ + ".xy, " + _loc5_ + ".xy\n" + "add " + _loc4_ + ".xy, " + _loc4_ + ".xy, " + _loc5_ + ".xx\n" + "mov " + _lightMapVar + ".xyz, " + _loc4_ + ".xyz\n" + "mov " + _lightMapVar + ".w, va0.w\n");
         return _loc6_;
      }
      
      override function initConstants(param1:MethodVO) : void
      {
         var _loc3_:Vector.<Number> = param1.fragmentData;
         var _loc4_:Vector.<Number> = param1.vertexData;
         var _loc2_:int = param1.fragmentConstantsIndex;
         _loc3_[_loc2_] = 0;
         _loc3_[_loc2_ + 1] = 0;
         _loc3_[_loc2_ + 2] = 0;
         _loc3_[_loc2_ + 3] = 0;
         _loc3_[_loc2_ + 6] = -0.0003;
         _loc3_[_loc2_ + 7] = 0;
         _loc3_[_loc2_ + 6] = 0.2;
         _loc3_[_loc2_ + 7] = 1;
         _loc2_ = param1.vertexConstantsIndex;
         if(_loc2_ != -1)
         {
            _loc4_[_loc2_] = 0.5;
            _loc4_[_loc2_ + 1] = -0.5;
            _loc4_[_loc2_ + 2] = 1;
            _loc4_[_loc2_ + 3] = 1;
         }
      }
      
      override function initVO(param1:MethodVO) : void
      {
      }
      
      override function setRenderState(param1:MethodVO, param2:IRenderable, param3:Stage3DProxy, param4:Camera3D) : void
      {
         _projMatrix.copyFrom(_castingLight.lightMapper.lightProjection);
         _projMatrix.prepend(param2.sceneTransform);
         _projMatrix.copyRawDataTo(param1.vertexData,param1.vertexConstantsIndex + 4,true);
      }
   }
}
