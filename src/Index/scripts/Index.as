package
{
   import flash.display.Sprite;
   import flash.display.MovieClip;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.external.ExternalInterface;
   import com.mz.core.configs.ClientConfig;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import morn.core.utils.BaUtil;
   import com.mz.core.mgrs.resMgrs.ZipBaVo;
   import com.mz.core.mgrs.VerListMgr;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.utils.ByteArray;
   import flash.system.LoaderContext;
   import flash.system.ApplicationDomain;
   
   public class Index extends Sprite
   {
       
      
      private var flashVars:Object;
      
      private var publishPath:String = "";
      
      private var version:String = "20160323";
      
      private var logo:MovieClip;
      
      private var _shell:DisplayObject;
      
      private var logoLoaded:Boolean = false;
      
      private var loadingLoaded:Boolean = false;
      
      private var shellLoaded:Boolean = false;
      
      private var logoPlayed:Boolean = false;
      
      public function Index()
      {
         super();
         if(stage)
         {
            init();
         }
         else
         {
            addEventListener("addedToStage",init);
         }
      }
      
      private function init(param1:Event = null) : void
      {
         removeEventListener("addedToStage",init);
         stage.scaleMode = "noScale";
         stage.align = "TL";
         var _loc2_:Boolean = true;
         stage.addEventListener("resize",onResize);
         flashVars = this.loaderInfo.parameters;
         if(flashVars.hasOwnProperty("cdn"))
         {
            _loc2_ = false;
            publishPath = flashVars["cdn"];
            version = flashVars["version"];
         }
         try
         {
            ExternalInterface.call("findDimensions");
         }
         catch(err:Error)
         {
         }
         if(!_loc2_)
         {
            publishPath = publishPath + "/";
         }
         ClientConfig.publishPath = publishPath;
         initVersion();
      }
      
      private function initVersion() : void
      {
         var _loc2_:URLLoader = new URLLoader();
         _loc2_.dataFormat = "binary";
         _loc2_.addEventListener("complete",ver_list_onCpl);
         var _loc1_:String = publishPath + "ver_list.ba?v=" + version;
         _loc2_.load(new URLRequest(_loc1_));
      }
      
      private function ver_list_onCpl(param1:Event) : void
      {
         param1.currentTarget.removeEventListener("complete",ver_list_onCpl);
         var _loc3_:ZipBaVo = BaUtil.unzipOne(param1.currentTarget.data) as ZipBaVo;
         var _loc2_:String = _loc3_.ba.readUTFBytes(_loc3_.ba.length);
         VerListMgr.ins.init(_loc2_);
         loadLogo();
      }
      
      private function checkStart() : void
      {
         if(loadingLoaded && logoPlayed && shellLoaded)
         {
            logo.parent.removeChild(logo);
            logo = null;
            _shell["init"](flashVars,true);
            _shell.visible = true;
         }
      }
      
      private function loadMainLoadingPage() : void
      {
         var _loc1_:* = null;
         var _loc2_:Loader = new Loader();
         _loc2_.contentLoaderInfo.addEventListener("complete",onLoadingLoadComplete);
         var _loc3_:URLRequest = new URLRequest(VerListMgr.ins.getAllUrl("MainLoadingPage.swf"));
         _loc2_.load(_loc3_);
         try
         {
            ExternalInterface.call("findDimensions");
            return;
         }
         catch(err:Error)
         {
            return;
         }
      }
      
      protected function onLoadingLoadComplete(param1:Event) : void
      {
         var _loc2_:* = (param1.currentTarget as LoaderInfo).content;
         ClientConfig.mainLoadingPage = _loc2_;
         loadingLoaded = true;
         checkStart();
      }
      
      private function initShell() : void
      {
         onShellLoaded = function(param1:Event):void
         {
            urlLoader.removeEventListener("complete",onShellLoaded);
            var _loc4_:ByteArray = urlLoader.data;
            var _loc3_:Loader = new Loader();
            _loc3_.contentLoaderInfo.addEventListener("complete",shell_loadCpl);
            var _loc2_:LoaderContext = new LoaderContext();
            _loc2_.allowCodeImport = true;
            _loc2_.applicationDomain = ApplicationDomain.currentDomain;
            _loc3_.loadBytes(_loc4_,_loc2_);
            urlLoader.close();
            urlLoader = null;
         };
         var urlLoader:URLLoader = new URLLoader();
         urlLoader.dataFormat = "binary";
         urlLoader.addEventListener("complete",onShellLoaded);
         var $url:String = VerListMgr.ins.getAllUrl("Shell.swf");
         urlLoader.load(new URLRequest($url));
      }
      
      protected function shell_loadCpl(param1:Event) : void
      {
         (param1.currentTarget as LoaderInfo).removeEventListener("complete",shell_loadCpl);
         loadMainLoadingPage();
         _shell = (param1.currentTarget as LoaderInfo).content as DisplayObject;
         shellLoaded = true;
         this.addChild(_shell);
         _shell.visible = false;
         checkStart();
      }
      
      private function loadLogo() : void
      {
         LogoLoad.instance.startLoad(publishPath,int(flashVars["op_id"]),flashVars["game_id"]);
         LogoLoad.instance.addEventListener("init_logo_complete",onInitLogoCompleteHandler);
      }
      
      private function onInitLogoCompleteHandler(param1:Event) : void
      {
         event = param1;
         onLogoComplete = function(param1:Event):void
         {
            logoLoaded = true;
            logoPlayed = true;
            logo.removeEventListener("movie_stop_event",onLogoComplete);
            checkStart();
         };
         initShell();
         LogoLoad.instance.removeEventListener("init_logo_complete",onInitLogoCompleteHandler);
         logo = LogoLoad.instance.getLogo();
         addChild(logo);
         onResize();
         logo.addEventListener("movie_stop_event",onLogoComplete);
      }
      
      private function onResize(param1:Event = null) : void
      {
         if(logo)
         {
            logo.x = int(stage.stageWidth / 2);
            logo.y = int(stage.stageHeight / 2) - 50;
         }
      }
   }
}
