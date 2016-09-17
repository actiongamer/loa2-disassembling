package away3d.filters.tasks
{
   import flash.display3D.textures.TextureBase;
   import away3d.core.managers.Stage3DProxy;
   import away3d.cameras.Camera3D;
   import flash.display3D.textures.Texture;
   import flash.display3D.Context3D;
   
   public class Filter3DXFadeCompositeTask extends Filter3DTaskBase
   {
       
      
      private var _data:Vector.<Number>;
      
      private var _overlayTexture:TextureBase;
      
      public function Filter3DXFadeCompositeTask(param1:Number)
      {
         super();
         if(param1 < 0)
         {
            param1 = 0;
         }
         else if(param1 > 1)
         {
            param1 = 1;
         }
         _data = Vector.<Number>([param1,0,0,0]);
      }
      
      public function get overlayTexture() : TextureBase
      {
         return _overlayTexture;
      }
      
      public function set overlayTexture(param1:TextureBase) : void
      {
         _overlayTexture = param1;
      }
      
      public function get amount() : Number
      {
         return _data[0];
      }
      
      public function set amount(param1:Number) : void
      {
         _data[0] = param1;
      }
      
      override protected function getFragmentCode() : String
      {
         return "tex ft0, v0, fs0 <2d,nearest>\t\ntex ft1, v0, fs1 <2d,nearest>\t\nsub ft1, ft1, ft0\t\t\t\t\nmul ft1, ft1, fc0.x\t\t\t\nadd oc, ft1, ft0\t\t\t\t\n";
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
   }
}
