package away3d.filters.tasks
{
   import away3d.textures.RenderTexture;
   import away3d.core.managers.Stage3DProxy;
   import away3d.cameras.Camera3D;
   import flash.display3D.textures.Texture;
   
   public class HeatFilter3DTask extends Filter3DTaskBase
   {
       
      
      private var _data:Vector.<Number>;
      
      public var heatMap:RenderTexture;
      
      public function HeatFilter3DTask()
      {
         super();
         _data = Vector.<Number>([1,1,0.01,1]);
      }
      
      override protected function getFragmentCode() : String
      {
         var _loc1_:String = "";
         _loc1_ = _loc1_ + "tex ft0, v0, fs1 <2d,nearest>\nmul ft0, ft0, fc0.z\nadd ft0, v0, ft0\ntex oc, ft0, fs0 <2d,nearest>\n";
         return _loc1_;
      }
      
      override public function activate(param1:Stage3DProxy, param2:Camera3D, param3:Texture) : void
      {
         param1.context3D.setBlendFactors("one","zero");
         param1.context3D.setProgramConstantsFromVector("fragment",0,_data,1);
         param1.context3D.setTextureAt(1,heatMap.getTextureForStage3D(param1));
      }
      
      override public function deactivate(param1:Stage3DProxy) : void
      {
         param1.context3D.setTextureAt(1,null);
      }
      
      public function get disturb() : Number
      {
         return _data[2];
      }
      
      public function set disturb(param1:Number) : void
      {
         _data[2] = param1;
      }
   }
}
