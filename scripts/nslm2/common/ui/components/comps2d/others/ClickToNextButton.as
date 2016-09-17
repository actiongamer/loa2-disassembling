package nslm2.common.ui.components.comps2d.others
{
   import game.ui.commons.comps.others.ClickToNextButtonUI;
   import com.mz.core.mgrs.UIMgr;
   import flash.events.Event;
   import morn.core.handlers.Handler;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   
   public class ClickToNextButton extends ClickToNextButtonUI
   {
       
      
      private var handler;
      
      public function ClickToNextButton()
      {
         super();
         var _loc1_:BmcSpriteSheet = new BmcSpriteSheet();
         _loc1_.init(6000006,1,"all",true);
         _loc1_.x = this.txt_alert.x - 30 + 130;
         _loc1_.y = -5;
         this.addChild(_loc1_);
      }
      
      public function addHandler(param1:*) : ClickToNextButton
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
         super.dispose();
      }
   }
}
