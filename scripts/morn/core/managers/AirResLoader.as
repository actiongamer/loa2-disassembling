package morn.core.managers
{
   import flash.display.Loader;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.system.LoaderContext;
   import morn.core.handlers.Handler;
   import com.mz.core.logging.Log;
   import flash.events.HTTPStatusEvent;
   import flash.events.Event;
   import flash.events.ProgressEvent;
   import com.mz.core.utils2.reflects.GetSWFClassName;
   import morn.core.managers.parseImgMgrs.ParseImgMgr;
   import flash.utils.ByteArray;
   import flash.display.Bitmap;
   import morn.core.utils.ObjectUtils;
   import flash.display.BitmapData;
   import flash.system.ApplicationDomain;
   
   public class AirResLoader implements IResLoader
   {
      
      public static const SWF:uint = 0;
      
      public static const BMD:uint = 1;
      
      public static const AMF:uint = 2;
      
      public static const TXT:uint = 3;
      
      public static const DB:uint = 4;
      
      public static const BYTE:uint = 5;
      
      public static var minBytePre5Second:int = 512;
      
      public static const SWF_CONTENT_VAL:int = 1;
       
      
      private var _loader:Loader;
      
      private var _urlLoader:URLLoader;
      
      private var _urlRequest:URLRequest;
      
      private var _loaderContext:LoaderContext;
      
      private var _url:String;
      
      private var _type:int;
      
      private var _complete:Handler;
      
      private var _progress:Handler;
      
      private var _isLoading:Boolean;
      
      private var _loaded:Number;
      
      private var _lastLoaded:Number;
      
      private var tryTimes:int = 0;
      
      private var _isNative:Boolean = false;
      
      private var swfClasses:Vector.<String>;
      
      public function AirResLoader()
      {
         _loader = new Loader();
         _urlLoader = new URLLoader();
         _urlRequest = new URLRequest();
         _loaderContext = new LoaderContext(false,ApplicationDomain.currentDomain);
         super();
         createLoader();
      }
      
      private function createLoader() : void
      {
         _loaderContext.allowCodeImport = true;
      }
      
      private function switchLoaderEvent(param1:Boolean) : void
      {
         if(_loader)
         {
            if(param1)
            {
               _loader.contentLoaderInfo.addEventListener("complete",onComplete);
               _loader.contentLoaderInfo.addEventListener("ioError",onError);
               _loader.contentLoaderInfo.addEventListener("httpStatus",onStatus);
            }
            else
            {
               _loader.contentLoaderInfo.removeEventListener("complete",onComplete);
               _loader.contentLoaderInfo.removeEventListener("ioError",onError);
               _loader.contentLoaderInfo.removeEventListener("httpStatus",onStatus);
            }
         }
         if(_urlLoader)
         {
            if(param1)
            {
               _urlLoader.addEventListener("progress",onProgress);
               _urlLoader.addEventListener("complete",onComplete);
               _urlLoader.addEventListener("ioError",urlLoader_onIOError);
               _urlLoader.addEventListener("httpStatus",onStatus);
               _urlLoader.addEventListener("securityError",urlLoader_onSecurityError);
            }
            else
            {
               _urlLoader.removeEventListener("progress",onProgress);
               _urlLoader.removeEventListener("complete",onComplete);
               _urlLoader.removeEventListener("ioError",urlLoader_onIOError);
               _urlLoader.removeEventListener("httpStatus",onStatus);
               _urlLoader.removeEventListener("securityError",urlLoader_onSecurityError);
            }
         }
      }
      
      public function tryLoad() : void
      {
         if(tryTimes < 2)
         {
            tryTimes = Number(tryTimes) + 1;
            Log.debug(this,this.url,"tryLoad",tryTimes);
            tryToCloseLoad();
            createLoader();
            doLoad();
         }
         else
         {
            tryToCloseLoad();
            endLoad(null);
         }
      }
      
      public function tryToCloseLoad() : void
      {
         try
         {
            App.timer.clearTimer(checkLoad);
            _loader.contentLoaderInfo.removeEventListener("complete",onComplete);
            _loader.contentLoaderInfo.removeEventListener("ioError",onError);
            _loader.contentLoaderInfo.removeEventListener("httpStatus",onStatus);
            _urlLoader.removeEventListener("progress",onProgress);
            _urlLoader.removeEventListener("complete",onComplete);
            _urlLoader.removeEventListener("ioError",urlLoader_onIOError);
            _urlLoader.removeEventListener("httpStatus",onStatus);
            _urlLoader.removeEventListener("securityError",urlLoader_onSecurityError);
            _loader.unloadAndStop();
            _urlLoader.close();
            _isLoading = false;
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      private function doLoad() : void
      {
         _isLoading = true;
         _urlRequest = new URLRequest();
         var _loc1_:String = App.getAirResPath(_url);
         _isNative = _loc1_.indexOf("http:") < 0;
         _urlRequest.url = _loc1_;
         if(_type == 1 || _type == 2 || _type == 4 || _type == 5 || _type == 0)
         {
            _loader = new Loader();
            switchLoaderEvent(true);
            _urlLoader.dataFormat = "binary";
            _urlLoader.load(_urlRequest);
            return;
         }
         if(_type == 3)
         {
            _urlLoader = new URLLoader();
            switchLoaderEvent(true);
            _urlLoader.dataFormat = "text";
            _urlLoader.load(_urlRequest);
            return;
         }
      }
      
      private function onStatus(param1:HTTPStatusEvent) : void
      {
      }
      
      private function onError(param1:Event) : void
      {
         Log.error(this,this.url,param1.toString());
         this.tryLoad();
      }
      
      private function urlLoader_onIOError(param1:Event) : void
      {
         Log.error(this,this.url,param1.toString());
         this.tryLoad();
      }
      
      private function urlLoader_onSecurityError(param1:Event) : void
      {
         Log.error(this,this.url,param1.toString());
         this.tryLoad();
      }
      
      private function onProgress(param1:ProgressEvent) : void
      {
         var _loc2_:Number = NaN;
         if(_progress != null)
         {
            _loc2_ = param1.bytesLoaded / param1.bytesTotal;
            _progress.executeWith([_loc2_]);
         }
         _loaded = param1.bytesLoaded;
      }
      
      private function onComplete(param1:Event) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         if(_type == 0 || _type == 1)
         {
            if(_urlLoader.data != null)
            {
               if(_type == 0)
               {
                  if(!this._isNative)
                  {
                     App.airSaveFile(this.url,_urlLoader.data);
                  }
                  swfClasses = GetSWFClassName.parse(_urlLoader.data,this.url);
                  _loader.loadBytes(_urlLoader.data,_loaderContext);
                  _urlLoader.data = null;
                  return;
               }
               if(!this._isNative)
               {
                  App.airSaveFile(this.url,_urlLoader.data);
               }
               ParseImgMgr.ins.add(this.url,_urlLoader.data as ByteArray,parseImg_cpl);
               return;
            }
            if(_type == 0)
            {
               _loader.unloadAndStop();
               _loc2_ = 1;
               parseResSwf_start();
               return;
            }
            _loc2_ = Bitmap(_loader.content).bitmapData;
            _loader.unloadAndStop();
            return;
         }
         if(_type == 2)
         {
            if(!this._isNative)
            {
               App.airSaveFile(this.url,_urlLoader.data);
            }
            _loc2_ = ObjectUtils.readAMF(_urlLoader.data);
         }
         else if(_type == 4)
         {
            if(!this._isNative)
            {
               App.airSaveFile(this.url,_urlLoader.data);
            }
            _loc3_ = _urlLoader.data as ByteArray;
            _loc3_.uncompress();
            _loc2_ = _loc3_.readObject();
         }
         else if(_type == 5)
         {
            if(!this._isNative)
            {
               App.airSaveFile(this.url,_urlLoader.data);
            }
            _loc2_ = _urlLoader.data as ByteArray;
         }
         else if(_type == 3)
         {
            _loc2_ = _urlLoader.data;
         }
         endLoad(_loc2_);
      }
      
      private function parseResSwf_start() : void
      {
         App.timer.clearTimer(checkLoad);
         new ParseResSwfTask(swfClasses).addCompleteHandler(parseResSwf_cpl).exec();
      }
      
      private function parseResSwf_cpl(param1:ParseResSwfTask) : void
      {
         endLoad(endLoad);
      }
      
      private function parseImg_cpl(param1:BitmapData) : void
      {
         endLoad(param1);
      }
      
      private function endLoad(param1:*) : void
      {
         var _loc2_:* = null;
         App.timer.clearTimer(checkLoad);
         switchLoaderEvent(false);
         _isLoading = false;
         _progress = null;
         if(_complete != null)
         {
            _loc2_ = _complete;
            _complete = null;
            _loc2_.executeWith([param1]);
         }
         try
         {
            if(this._loader)
            {
               this._loader.unloadAndStop(false);
            }
            if(this._urlLoader)
            {
               this._urlLoader.close();
            }
            return;
         }
         catch(err:Error)
         {
            return;
         }
      }
      
      public function load(param1:String, param2:int, param3:Handler, param4:Handler, param5:Boolean = true) : void
      {
         if(_isLoading)
         {
            Log.warn("Loader is try to close.",_url);
            tryToCloseLoad();
         }
         _url = param1;
         _type = param2;
         _complete = param3;
         _progress = param4;
         _lastLoaded = 0;
         _loaded = 0;
         App.timer.doLoop(5000,checkLoad);
         doLoad();
      }
      
      private function checkLoad() : void
      {
         if(_loaded - _lastLoaded < minBytePre5Second)
         {
            Log.warn(this,this.url,"load time out");
            this.tryLoad();
         }
         else
         {
            _lastLoaded = _loaded;
         }
      }
      
      public function get url() : String
      {
         return _url;
      }
   }
}
