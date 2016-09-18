package away3d.materials.passes
{
   import away3d.textures.BitmapTexture;
   import away3d.core.base.IRenderable;
   import away3d.core.managers.Stage3DProxy;
   import away3d.cameras.Camera3D;
   
   public class LightMapPass extends MaterialPassBase
   {
       
      
      private var _lightMapTexture:BitmapTexture;
      
      private var _constVector:Vector.<Number>;
      
      private var _constClrVector:Vector.<Number>;
      
      public function LightMapPass()
      {
         super();
         _constVector = Vector.<Number>([0,1,0.1,0]);
         _constClrVector = Vector.<Number>([1,1,1,0]);
         _lightMapTexture = null;
      }
      
      public function set lightMapTexture(param1:BitmapTexture) : void
      {
         _lightMapTexture = param1;
      }
      
      public function setLightColor(param1:Number, param2:Number, param3:Number) : void
      {
         _constClrVector[0] = param1;
         _constClrVector[1] = param2;
         _constClrVector[2] = param3;
      }
      
      public function setLightIntensity(param1:Number) : void
      {
         _constVector[1] = param1;
      }
      
      override function getVertexCode() : String
      {
         var _loc1_:String = "m44 vt1, vt0, vc0\t\t\nmul op, vt1, vc4\n";
         var _loc2_:String = "";
         if(_lightMapTexture == null)
         {
            _loc2_ = _loc2_ + "mov v0, vt1";
         }
         else
         {
            _loc2_ = _loc2_ + "mov v0, vt1\nmov v1, va1\n";
         }
         _loc1_ = _loc1_ + _loc2_;
         return _loc1_;
      }
      
      override function getFragmentCode(param1:String) : String
      {
         if(_lightMapTexture == null)
         {
            param1 = param1 + "mov oc, fc0.z\n";
            return param1 + "mov oc, fc0.z\n";
         }
         param1 = param1 + "tex ft0, v1, fs0 <2d, linear, clamp>\nmul ft0, ft0, fc1\nmul ft0, ft0, fc0.y\nmov oc, ft0\n";
         return param1 + "tex ft0, v1, fs0 <2d, linear, clamp>\nmul ft0, ft0, fc1\nmul ft0, ft0, fc0.y\nmov oc, ft0\n";
      }
      
      override function render(param1:IRenderable, param2:Stage3DProxy, param3:Camera3D) : void
      {
         if(_lightMapTexture)
         {
            param1.activateUVBuffer(1,param2);
         }
         super.render(param1,param2,param3);
      }
      
      override function activate(param1:Stage3DProxy, param2:Camera3D, param3:Number, param4:Number) : void
      {
         super.activate(param1,param2,param3,param4);
         param1._context3D.setProgramConstantsFromVector("fragment",0,_constVector,1);
         param1._context3D.setProgramConstantsFromVector("fragment",1,_constClrVector,1);
         if(_lightMapTexture)
         {
            param1.setTextureAt(0,_lightMapTexture.getTextureForStage3D(param1));
         }
      }
      
      override function deactivate(param1:Stage3DProxy) : void
      {
         super.deactivate(param1);
      }
   }
}
