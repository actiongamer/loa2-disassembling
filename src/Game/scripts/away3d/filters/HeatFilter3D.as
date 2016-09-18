package away3d.filters
{
   import away3d.filters.tasks.HeatFilter3DTask;
   import away3d.textures.RenderTexture;
   import away3d.core.render.HeatFilterRenderer;
   import away3d.core.managers.Stage3DProxy;
   import away3d.core.traverse.EntityCollector;
   
   public class HeatFilter3D extends Filter3DBase
   {
       
      
      private var _heatFilterTask:HeatFilter3DTask;
      
      private var _renderTexture:RenderTexture;
      
      private var _render:HeatFilterRenderer;
      
      public function HeatFilter3D()
      {
         super();
         _renderTexture = new RenderTexture(2,2);
         _heatFilterTask = new HeatFilter3DTask();
         _render = new HeatFilterRenderer();
         addTask(_heatFilterTask);
      }
      
      override public function filterRender(param1:Stage3DProxy, param2:EntityCollector, param3:Number, param4:Number) : void
      {
         var _loc5_:int = param1.stage3DIndex;
         _render.stage3DProxy = param1;
         _render.textureRatioX = param3;
         _render.textureRatioY = param4;
         _heatFilterTask.heatMap = _renderTexture;
         _render.render(param2,_renderTexture.getTextureForStage3D(param1));
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _renderTexture.dispose();
      }
      
      public function get disturb() : Number
      {
         return _heatFilterTask.disturb;
      }
      
      public function set disturb(param1:Number) : void
      {
         _heatFilterTask.disturb = param1;
      }
      
      override public function set textureWidth(param1:int) : void
      {
         .super.textureWidth = param1;
         _renderTexture.width = param1;
      }
      
      override public function set textureHeight(param1:int) : void
      {
         .super.textureHeight = param1;
         _renderTexture.height = param1;
      }
   }
}
