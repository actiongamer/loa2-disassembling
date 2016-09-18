package away3d.filters
{
   import away3d.filters.tasks.Filter3DBrightPassTask;
   import away3d.filters.tasks.Filter3DVBlurTask;
   import away3d.filters.tasks.Filter3DHBlurTask;
   import away3d.filters.tasks.Filter3DBloomCompositeTask;
   import flash.display3D.textures.Texture;
   import away3d.core.managers.Stage3DProxy;
   
   public class BloomFilter3D extends Filter3DBase
   {
       
      
      private var _brightPassTask:Filter3DBrightPassTask;
      
      private var _vBlurTask:Filter3DVBlurTask;
      
      private var _hBlurTask:Filter3DHBlurTask;
      
      private var _compositeTask:Filter3DBloomCompositeTask;
      
      public function BloomFilter3D(param1:uint = 15, param2:uint = 15, param3:Number = 0.75, param4:Number = 2, param5:int = 3)
      {
         super();
         _brightPassTask = new Filter3DBrightPassTask(param3);
         _hBlurTask = new Filter3DHBlurTask(param1);
         _vBlurTask = new Filter3DVBlurTask(param2);
         _compositeTask = new Filter3DBloomCompositeTask(param4);
         if(param5 > 4)
         {
            param5 = 4;
         }
         else if(param5 < 0)
         {
            param5 = 0;
         }
         _hBlurTask.textureScale = 4 - param5;
         _vBlurTask.textureScale = 4 - param5;
         _compositeTask.textureScale = 4 - param5;
         addTask(_brightPassTask);
         addTask(_hBlurTask);
         addTask(_vBlurTask);
         addTask(_compositeTask);
      }
      
      override public function setRenderTargets(param1:Texture, param2:Stage3DProxy) : void
      {
         _brightPassTask.target = _hBlurTask.getMainInputTexture(param2);
         _hBlurTask.target = _vBlurTask.getMainInputTexture(param2);
         _vBlurTask.target = _compositeTask.getMainInputTexture(param2);
         _compositeTask.overlayTexture = _brightPassTask.getMainInputTexture(param2);
         super.setRenderTargets(param1,param2);
      }
      
      public function get exposure() : Number
      {
         return _compositeTask.exposure;
      }
      
      public function set exposure(param1:Number) : void
      {
         _compositeTask.exposure = param1;
      }
      
      public function get blurX() : uint
      {
         return _hBlurTask.amount;
      }
      
      public function set blurX(param1:uint) : void
      {
         _hBlurTask.amount = param1;
      }
      
      public function get blurY() : uint
      {
         return _vBlurTask.amount;
      }
      
      public function set blurY(param1:uint) : void
      {
         _vBlurTask.amount = param1;
      }
      
      public function get threshold() : Number
      {
         return _brightPassTask.threshold;
      }
      
      public function set threshold(param1:Number) : void
      {
         _brightPassTask.threshold = param1;
      }
   }
}
