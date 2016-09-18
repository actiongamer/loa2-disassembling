package nslm2.modules.footstones.tooltipsModules
{
   import morn.customs.components.FadeView;
   import nslm2.modules.footstones.tooltipsModules.uis.ToolTipHeroInfoDetail;
   import morn.core.utils.DelayCall;
   import flash.events.MouseEvent;
   import flash.display.DisplayObject;
   
   public class TooltipHeroInfoCompare extends FadeView
   {
       
      
      private var mouseEventType:String;
      
      private var ctrlMain:ToolTipHeroInfoDetail;
      
      private var ctrlCompare:ToolTipHeroInfoDetail;
      
      public function TooltipHeroInfoCompare(param1:String)
      {
         super();
         this.mouseEventType = param1;
      }
      
      public function get showWidth() : int
      {
         return this.width;
      }
      
      public function get showHeight() : int
      {
         return this.height;
      }
      
      public function show(param1:*, param2:* = null) : void
      {
         if(param1 == null || (param1 as ToolTipHeroInfoDetailVo).hasHero == false)
         {
            return;
         }
         ctrlMain = new ToolTipHeroInfoDetail();
         ctrlMain.btn_close.addEventListener("click",onBtnCloseClick);
         ctrlMain.show(param1);
         this.addChild(ctrlMain);
         if((param1 as ToolTipHeroInfoDetailVo).isPlayer == false)
         {
            ctrlCompare = new ToolTipHeroInfoDetail(true);
            ctrlCompare.btn_close.addEventListener("click",onBtnCloseClick);
            ctrlCompare.show((param1 as ToolTipHeroInfoDetailVo).getPlayerCompareVo());
            this.addChild(ctrlCompare);
         }
         fadeIn(0,10220);
         validateSize();
         if(mouseEventType == "click")
         {
            DelayCall(addHideClickHandler,1);
         }
         else
         {
            App.stage.addEventListener("mouseUp",onMouseUp);
         }
      }
      
      protected function validateSize() : void
      {
         ctrlMain.validateSize();
         if(ctrlCompare)
         {
            ctrlCompare.validateSize();
            ctrlMain.y = Math.min(ctrlMain.y,ctrlCompare.y);
            ctrlCompare.y = Math.min(ctrlMain.y,ctrlCompare.y);
            ctrlCompare.x = ctrlMain.x + ctrlMain.width + 10;
         }
      }
      
      protected function onMouseUp(param1:MouseEvent) : void
      {
         App.stage.removeEventListener("mouseUp",onMouseUp);
         addHideClickHandler();
      }
      
      private function addHideClickHandler() : void
      {
         App.stage.addEventListener(mouseEventType,onStageClickHandler);
      }
      
      protected function onStageClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:DisplayObject = param1.target as DisplayObject;
         if(_loc2_ && !this.contains(_loc2_))
         {
            App.stage.removeEventListener(mouseEventType,onStageClickHandler);
            fadeOutThenDispose();
         }
      }
      
      protected function onBtnCloseClick(param1:MouseEvent) : void
      {
         App.stage.removeEventListener(mouseEventType,onStageClickHandler);
         fadeOutThenDispose();
      }
      
      override public function dispose() : void
      {
         if(ctrlMain)
         {
            ctrlMain.dispose();
            ctrlMain = null;
         }
         if(ctrlCompare)
         {
            ctrlCompare.dispose();
            ctrlCompare = null;
         }
         App.stage.removeEventListener(mouseEventType,onStageClickHandler);
         super.dispose();
      }
   }
}
