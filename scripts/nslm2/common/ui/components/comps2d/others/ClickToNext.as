package nslm2.common.ui.components.comps2d.others
{
   import game.ui.commons.comps.others.ClickToNextUI;
   import com.mz.core.mgrs.UIMgr;
   import flash.events.Event;
   import morn.core.handlers.Handler;
   import nslm2.common.compsEffects.FloatUpDownEffCtrl;
   
   public class ClickToNext extends ClickToNextUI
   {
       
      
      private var handler;
      
      public function ClickToNext()
      {
         super();
         this.parts.push(new FloatUpDownEffCtrl().init(this.img_icon,NaN,2,2));
      }
      
      public function addHandler(param1:*) : ClickToNext
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
