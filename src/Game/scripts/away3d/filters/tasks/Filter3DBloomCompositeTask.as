package away3d.filters.tasks
{
   import flash.display3D.textures.TextureBase;
   import away3d.core.managers.Stage3DProxy;
   import away3d.cameras.Camera3D;
   import flash.display3D.textures.Texture;
   import flash.display3D.Context3D;
   
   public class Filter3DBloomCompositeTask extends Filter3DTaskBase
   {
       
      
      private var _data:Vector.<Number>;
      
      private var _overlayTexture:TextureBase;
      
      private var _exposure:Number;
      
      public function Filter3DBloomCompositeTask(param1:Number)
      {
         super();
         _data = Vector.<Number>([0.299,0.587,0.114,1]);
         this.exposure = param1;
      }
      
      public function get overlayTexture() : TextureBase
      {
         return _overlayTexture;
      }
      
      public function set overlayTexture(param1:TextureBase) : void
      {
         _overlayTexture = param1;
      }
      
      override protected function getFragmentCode() : String
      {
         var _loc1_:* = null;
         _loc1_ = "tex ft0, v0, fs0 <2d,linear,clamp>\t\ntex ft1, v0, fs1 <2d,linear,clamp>\t\ndp3 ft2.x, ft1, fc0\nsub ft2.x, fc0.w, ft2.x\nmul ft0, ft0, ft2.x\n";
         _loc1_ = _loc1_ + "add oc, ft0, ft1\t\t\t\t\t\n";
         return _loc1_;
      }
      
      override public function activate(param1:Stage3DProxy, param2:Camera3D, param3:Texture) : void
      {
         var _loc4_:Context3D = param1._context3D;
         _loc4_.setProgramConstantsFromVector("fragment",0,_data,1);
         _loc4_.setTextureAt(1,_overlayTexture);
      }
      
      override public function deactivate(param1:Stage3DProxy) : void
      {
         param1._context3D.setTextureAt(1,null);
      }
      
      public function get exposure() : Number
      {
         return _exposure;
      }
      
      public function set exposure(param1:Number) : void
      {
         _exposure = param1;
         _data[4] = 1 + _exposure / 10;
      }
   }
}
