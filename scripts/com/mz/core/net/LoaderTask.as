package com.mz.core.net
{
   import com.mz.core.utils2.task.TaskBase;
   import flash.display.Loader;
   import flash.display.BitmapData;
   import flash.system.LoaderContext;
   import flash.net.URLRequest;
   import flash.events.ProgressEvent;
   import flash.events.IOErrorEvent;
   import flash.events.Event;
   import flash.display.Bitmap;
   
   public class LoaderTask extends TaskBase
   {
       
      
      public var loader:Loader;
      
      public var bmd:BitmapData;
      
      public var loaderContext:LoaderContext;
      
      private var _needUnloadAndStop:Boolean = true;
      
      public function LoaderTask(param1:String = null, param2:LoaderContext = null)
      {
         super(param1);
         this.loaderContext = param2;
      }
      
      public function get url() : String
      {
         return this.tag as String;
      }
      
      override public function exec() : void
      {
         super.exec();
         loader = new Loader();
         this.addListeners();
         loader.load(new URLRequest(this.url),this.loaderContext);
      }
      
      protected function addListeners() : void
      {
         if(loader)
         {
            loader.contentLoaderInfo.addEventListener("ioError",ioErrorHandler);
            loader.contentLoaderInfo.addEventListener("progress",progress_handler);
            loader.contentLoaderInfo.addEventListener("complete",loader_completeHandler);
         }
      }
      
      protected function removeListeners() : void
      {
         if(loader)
         {
            loader.contentLoaderInfo.removeEventListener("ioError",ioErrorHandler);
            loader.contentLoaderInfo.removeEventListener("progress",progress_handler);
            loader.contentLoaderInfo.removeEventListener("complete",loader_completeHandler);
         }
      }
      
      protected function progress_handler(param1:ProgressEvent) : void
      {
         if(!this.isStop)
         {
            if(param1.bytesTotal > 0)
            {
               this.onProcess(param1.bytesLoaded / param1.bytesTotal * 100);
            }
            else
            {
               this.onProcess(0);
            }
         }
      }
      
      private function ioErrorHandler(param1:IOErrorEvent) : void
      {
         if(!this.isStop)
         {
            removeListeners();
            this.onError();
         }
      }
      
      protected function loader_completeHandler(param1:Event) : void
      {
         if(!this.isStop)
         {
            removeListeners();
            if(this.loader.content is Bitmap)
            {
               this.bmd = (this.loader.content as Bitmap).bitmapData;
            }
            this.onParse();
            this.onComplete();
         }
      }
      
      protected function onParse() : void
      {
      }
      
      protected function timeoutHandler() : void
      {
         if(!this.isStop)
         {
            this.onError();
         }
      }
      
      public function changeNeedStop(param1:Boolean) : TaskBase
      {
         _needUnloadAndStop = param1;
         return this;
      }
      
      override public function stop() : void
      {
         removeListeners();
         if(loader)
         {
            if(_needUnloadAndStop)
            {
               loader.unloadAndStop(false);
            }
            loader = null;
         }
         super.stop();
      }
   }
}
