package com.mz.core.net
{
   import com.mz.core.utils2.task.TaskBase;
   import flash.display.Loader;
   import flash.utils.ByteArray;
   import flash.system.LoaderContext;
   import flash.events.ProgressEvent;
   import flash.events.IOErrorEvent;
   import com.mz.core.logging.Log;
   import flash.events.Event;
   
   public class LoadByteTask extends TaskBase
   {
       
      
      public var loader:Loader;
      
      public var ba:ByteArray;
      
      public var loaderContext:LoaderContext;
      
      public function LoadByteTask(param1:ByteArray = null, param2:LoaderContext = null, param3:String = null)
      {
         super(param3);
         this.ba = param1;
         this.loaderContext = param2;
         if(this.loaderContext)
         {
            this.loaderContext.imageDecodingPolicy = "onDemand";
         }
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
         loader.loadBytes(this.ba,this.loaderContext);
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
         Log.warn(this,url,param1.toString());
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
      
      override public function stop() : void
      {
         removeListeners();
         if(loader)
         {
            loader.unloadAndStop(false);
            loader = null;
         }
         super.stop();
      }
   }
}
