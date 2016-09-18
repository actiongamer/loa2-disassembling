package com.mz.core.net
{
   import com.mz.core.utils2.task.TaskBase;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.events.ProgressEvent;
   import flash.events.IOErrorEvent;
   import flash.events.Event;
   
   public class UrlLoaderTask extends TaskBase
   {
       
      
      public var requestMethod:String;
      
      public var loader:URLLoader;
      
      public function UrlLoaderTask(param1:String = null, param2:String = "text", param3:String = "GET")
      {
         super(param1);
         loader = new URLLoader();
         loader.dataFormat = param2;
         this.requestMethod = param3;
      }
      
      public function get url() : String
      {
         return this.tag as String;
      }
      
      public function set url(param1:String) : void
      {
         this.tag = param1;
      }
      
      override public function exec() : void
      {
         super.exec();
         loader.addEventListener("ioError",ioErrorHandler);
         loader.addEventListener("progress",progress_handler);
         loader.addEventListener("complete",loader_completeHandler);
         loader.load(this.urlRequest);
      }
      
      protected function get urlRequest() : URLRequest
      {
         var _loc1_:URLRequest = new URLRequest(this.url);
         _loc1_.method = this.requestMethod;
         return _loc1_;
      }
      
      protected function progress_handler(param1:ProgressEvent) : void
      {
         if(isStop)
         {
            return;
         }
         if(param1.bytesTotal > 0)
         {
            this.onProcess(param1.bytesLoaded / param1.bytesTotal * 100);
         }
         else
         {
            this.onProcess(0);
         }
      }
      
      private function ioErrorHandler(param1:IOErrorEvent) : void
      {
         if(!this.isStop)
         {
            this.onError();
         }
      }
      
      protected function loader_completeHandler(param1:Event) : void
      {
         if(!this.isStop)
         {
            this.onParse();
            this.onComplete();
         }
      }
      
      protected function onParse() : void
      {
      }
      
      override public function stop() : void
      {
         removeListeners();
         super.stop();
      }
      
      protected function removeListeners() : void
      {
         loader.removeEventListener("ioError",ioErrorHandler);
         loader.removeEventListener("progress",progress_handler);
         loader.removeEventListener("complete",loader_completeHandler);
      }
   }
}
