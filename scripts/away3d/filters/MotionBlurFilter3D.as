package away3d.filters
{
   import away3d.filters.tasks.Filter3DXFadeCompositeTask;
   import away3d.filters.tasks.Filter3DDoubleBufferCopyTask;
   import away3d.core.managers.Stage3DProxy;
   import away3d.cameras.Camera3D;
   
   public class MotionBlurFilter3D extends Filter3DBase
   {
       
      
      private var _compositeTask:Filter3DXFadeCompositeTask;
      
      private var _copyTask:Filter3DDoubleBufferCopyTask;
      
      public function MotionBlurFilter3D(param1:Number = 0.65)
      {
         super();
         _compositeTask = new Filter3DXFadeCompositeTask(param1);
         _copyTask = new Filter3DDoubleBufferCopyTask();
         addTask(_compositeTask);
         addTask(_copyTask);
      }
      
      public function get strength() : Number
      {
         return _compositeTask.amount;
      }
      
      public function set strength(param1:Number) : void
      {
         _compositeTask.amount = param1;
      }
      
      override public function update(param1:Stage3DProxy, param2:Camera3D) : void
      {
         param2 = param2;
         _compositeTask.overlayTexture = _copyTask.getMainInputTexture(param1);
         _compositeTask.target = _copyTask.secondaryInputTexture;
      }
   }
}
