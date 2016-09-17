package away3d.filters.tasks
{
   import away3d.core.managers.Stage3DProxy;
   import away3d.cameras.Camera3D;
   import flash.display3D.textures.Texture;
   
   public class Filter3DBrightPassTask extends Filter3DTaskBase
   {
       
      
      private var _brightPassData:Vector.<Number>;
      
      private var _threshold:Number;
      
      public function Filter3DBrightPassTask(param1:Number = 0.75)
      {
         super();
         _threshold = param1;
         _brightPassData = Vector.<Number>([param1,1 / (1 - param1),0,0]);
      }
      
      public function get threshold() : Number
      {
         return _threshold;
      }
      
      public function set threshold(param1:Number) : void
      {
         _threshold = param1;
         _brightPassData[0] = param1;
         _brightPassData[1] = 1 / (1 - param1);
      }
      
      override protected function getFragmentCode() : String
      {
         return "tex ft0, v0, fs0 <2d,linear,clamp>\t\ndp3 ft1.x, ft0.xyz, ft0.xyz\t\nsqt ft1.x, ft1.x\t\t\t\t\nsub ft1.y, ft1.x, fc0.x\t\t\nmul ft1.y, ft1.y, fc0.y\t\t\nsat ft1.y, ft1.y\t\t\t\t\nmul ft0.xyz, ft0.xyz, ft1.y\t\nmov oc, ft0\t\t\t\t\t\n";
      }
      
      override public function activate(param1:Stage3DProxy, param2:Camera3D, param3:Texture) : void
      {
         param1.context3D.setProgramConstantsFromVector("fragment",0,_brightPassData,1);
      }
   }
}
