package nslm2.common.ui.components.comps2d
{
   import game.ui.lotteryHeroModules.ClickToNextButtonTimeUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import nslm2.modules.footstones.newerGuideModules.NewerGuideModule;
   import flash.events.MouseEvent;
   import com.mz.core.mgrs.UIMgr;
   import flash.events.Event;
   import morn.core.handlers.Handler;
   
   public class ClickToNextButtonTime extends ClickToNextButtonTimeUI
   {
       
      
      private var handler;
      
      private var _textCdCtrl:nslm2.common.ui.components.comps2d.TextCDCtrl;
      
      public function ClickToNextButtonTime()
      {
         super();
         init();
      }
      
      private function init() : void
      {
         var _loc1_:BmcSpriteSheet = new BmcSpriteSheet();
         _loc1_.init(6000006,1,"all",true);
         _loc1_.x = this.txt_alert.x - 30 + 130;
         _loc1_.y = -5;
         this.addChild(_loc1_);
         _textCdCtrl = new nslm2.common.ui.components.comps2d.TextCDCtrl(timeCdTxt,txtCdFormatFunc,txtCdCpl);
      }
      
      private function txtCdFormatFunc(param1:int) : String
      {
         return "(" + param1 + LocaleMgr.ins.getStr(998001150) + ")";
      }
      
      private function txtCdCpl() : void
      {
         var _loc1_:* = null;
         _textCdCtrl.stop();
         if(NGUtil.isShow)
         {
            _loc1_ = NGUtil.getRef();
            _loc1_.arrowComp.talkRim.dispatchEvent(new MouseEvent("click"));
         }
         else
         {
            UIMgr.stage.dispatchEvent(new MouseEvent("click"));
         }
      }
      
      public function show() : void
      {
         _textCdCtrl.start(10);
      }
      
      public function hide() : void
      {
         _textCdCtrl.stop();
      }
      
      public function addHandler(param1:*) : ClickToNextButtonTime
      {
         UIMgr.stage.addEventListener("click",stage_click);
         handler = param1;
         return this;
      }
      
      private function stage_click(param1:Event) : void
      {
         var _loc2_:* = undefined;
         UIMgr.stage.removeEventListener("click",stage_click);
         if(handler)
         {
            _loc2_ = handler;
            handler = null;
            Handler.execute(_loc2_);
         }
      }
      
      override public function dispose() : void
      {
         UIMgr.stage.removeEventListener("click",stage_click);
         if(handler)
         {
            handler = null;
         }
         _textCdCtrl.dispose();
         _textCdCtrl = null;
         super.dispose();
      }
   }
}
