package
{
   import flash.display.Sprite;
   import flash.text.TextField;
   import flash.display.MovieClip;
   import flash.display.Loader;
   import nslm2.inits.MainLoadingScrollTipCtrl;
   import flash.net.URLRequest;
   import flash.events.Event;
   import com.mz.core.utils.MathUtil;
   import com.mz.core.configs.EnvConfig;
   import com.mz.core.configs.ClientConfig;
   import flash.events.TextEvent;
   import flash.external.ExternalInterface;
   import nslm2.common.configs.StcLanguageConfig;
   import mainLoadings.MainLoadingRes;
   
   public class MainLoadingPage extends Sprite
   {
      
      private static const PROGRESS_BAR_MAX_Y:int = 850;
       
      
      private var res:Sprite;
      
      private var txt_info:TextField;
      
      private var boxImg:Sprite;
      
      private var boxLoading:Sprite;
      
      private var loadingMask:Sprite;
      
      private var bg:Sprite;
      
      private var logoBox:Sprite;
      
      private var progressBar:MovieClip;
      
      public var imgPathArr:Array;
      
      private var logoLoader:Loader;
      
      private var bgLoader:Loader;
      
      private var imgCover:Sprite;
      
      private var progressBarNew:MovieClip;
      
      private var progressImg:Sprite;
      
      private var progressMask:Sprite;
      
      private var lightBarMask:Sprite;
      
      private var lightDotMask:Sprite;
      
      private var progressLightBar:Sprite;
      
      private var progressLightDot:MovieClip;
      
      public var scrollTipCtrl;
      
      private var _loadMaskPercent:Number = 0;
      
      private var oldPercent:int = 0;
      
      public function MainLoadingPage()
      {
         imgPathArr = [];
         super();
         res = new MainLoadingRes();
         boxLoading = res["boxLoading"];
         boxImg = res["boxImg"];
         imgCover = res["imgCover"];
         txt_info = boxLoading["txt_info"];
         progressBarNew = boxLoading["progress"];
         progressLightDot = progressBarNew["lightDot"];
         progressLightBar = progressBarNew["lightBar"];
         progressImg = progressBarNew["progressImg"];
         progressMask = progressBarNew["maskBar"];
         lightBarMask = progressBarNew["maskBar2"];
         lightDotMask = progressBarNew["maskBar3"];
         progressLightBar.mask = lightBarMask;
         progressImg.mask = progressMask;
         progressLightDot.mask = lightDotMask;
         bg = res["blackBg"];
         logoBox = res["logoBox"];
         this.addChild(res);
         reset();
         txt_info.addEventListener("link",onRefresh);
      }
      
      public function set tipArr(param1:*) : void
      {
         scrollTipCtrl.tipArr = param1;
      }
      
      public function init() : void
      {
         scrollTipCtrl = new MainLoadingScrollTipCtrl(boxLoading["scrollTip"]);
         logoLoader = new Loader();
         logoLoader.load(new URLRequest(imgPathArr[0]));
         logoBox.addChild(logoLoader);
         bgLoader = new Loader();
         bgLoader.load(new URLRequest(imgPathArr[1]));
         bgLoader.contentLoaderInfo.addEventListener("complete",bgImgLoaded);
         boxImg.addChild(bgLoader);
      }
      
      protected function bgImgLoaded(param1:Event) : void
      {
         var _loc2_:int = 0;
         if(stage)
         {
            this.logoBox.x = this.bg.x + 60;
            _loc2_ = MathUtil.maxMin(stage.stageHeight - EnvConfig.ins.shellY,ClientConfig.SCENE_FIXED_H,ClientConfig.SCENE_MIN_H);
            this.boxImg.x = (stage.stageWidth - boxImg.width) / 2;
            this.boxImg.y = (stage.stageHeight - EnvConfig.ins.shellY - _loc2_) / 2;
            this.imgCover.x = this.boxImg.x;
            this.imgCover.y = this.boxImg.y + this.bgLoader.height + 1;
         }
      }
      
      private function onRefresh(param1:TextEvent) : void
      {
         ExternalInterface.call("location.reload",true);
      }
      
      public function get loadMaskPercent() : Number
      {
         return _loadMaskPercent;
      }
      
      public function reset() : void
      {
         oldPercent = 0;
         txt_info.text = "";
         updateProgressBar(1);
      }
      
      public function show(param1:int, param2:String) : void
      {
         if(oldPercent < param1)
         {
            oldPercent = param1;
         }
         updateProgressBar(oldPercent);
         if(EnvConfig.ins.hideForBS)
         {
            txt_info.htmlText = param2 + " " + StcLanguageConfig.ins.getLanguage(999000545) + oldPercent + "%";
         }
         else if(ClientConfig.isRuLang())
         {
            txt_info.htmlText = param2 + "   " + oldPercent + "%";
         }
         else
         {
            txt_info.htmlText = param2 + "   Loading " + oldPercent + "%";
         }
      }
      
      private function updateProgressBar(param1:int) : void
      {
         progressMask.scaleX = param1 / 100;
         progressLightBar.visible = false;
         progressLightDot.x = progressMask.x + int(progressMask.width) - 220;
      }
      
      public function resize(param1:int, param2:int) : void
      {
         var _loc5_:int = MathUtil.maxMin(param1,ClientConfig.SCENE_FIXED_W,ClientConfig.SCENE_MIN_W);
         var _loc4_:int = MathUtil.maxMin(param2,ClientConfig.SCENE_FIXED_H,ClientConfig.SCENE_MIN_H);
         this.bg.x = (param1 - _loc5_) / 2;
         this.bg.y = (param2 - _loc4_) / 2;
         this.logoBox.x = this.bg.x + 60;
         this.boxImg.x = (param1 - boxImg.width) / 2;
         this.boxImg.y = (param2 - _loc4_) / 2;
         if(bgLoader)
         {
            this.imgCover.x = this.boxImg.x;
            this.imgCover.y = this.boxImg.y + this.bgLoader.height + 1;
         }
         this.boxLoading.x = param1 / 2;
         var _loc3_:int = param2 - boxLoading.height + 580;
         _loc3_ = Math.min(_loc3_,850);
         this.boxLoading.y = _loc3_ - 135;
      }
      
      public function dispose() : void
      {
         dispose2();
         this.logoLoader.unloadAndStop();
         this.bgLoader.unloadAndStop();
         bgLoader.contentLoaderInfo.removeEventListener("complete",bgImgLoaded);
         logoLoader = null;
         bgLoader = null;
      }
      
      public function dispose2() : void
      {
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
   }
}
