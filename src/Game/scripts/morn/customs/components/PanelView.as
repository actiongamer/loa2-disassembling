package morn.customs.components
{
   import com.greensock.TweenLite;
   import com.greensock.easing.Back;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class PanelView extends PanelViewBase
   {
       
      
      protected var oriVars:Object;
      
      public var panelFadeInType:int = 2;
      
      public var panelFadeOutType:int = 2;
      
      public function PanelView()
      {
         super();
      }
      
      protected function saveOriVars() : void
      {
         oriVars = {};
         oriVars.x = this.x;
         oriVars.y = this.y;
         oriVars.alpha = this.alpha;
         oriVars.scale = this.scale;
      }
      
      public function panelFadeIn() : void
      {
         if(oriVars == null)
         {
            this.saveOriVars();
         }
         switch(int(this.panelFadeInType) - 2)
         {
            case 0:
               this.y = oriVars.y + 20;
               this.alpha = 0;
               TweenLite.to(this,0.2,{
                  "y":oriVars.y,
                  "alpha":oriVars.alpha,
                  "onComplete":this.panelFadeInCpl
               });
               this.fadeIn(0.2);
               break;
            case 1:
               this.x = oriVars.x + this.width / 2;
               this.y = oriVars.y + this.height / 2;
               this.alpha = 0;
               this.scale = 0.01;
               TweenLite.to(this,0.4,{
                  "x":oriVars.x,
                  "y":oriVars.y,
                  "scale":oriVars.scale,
                  "alpha":oriVars.alpha,
                  "ease":Back.easeInOut,
                  "onComplete":this.panelFadeInCpl
               });
               this.fadeIn(0.4);
               break;
            case 2:
               this.y = oriVars.y - 450 - this.height / 2 - 10;
               this.alpha = 0;
               TweenLite.to(this,0.4,{
                  "y":oriVars.y,
                  "alpha":oriVars.alpha,
                  "ease":Back.easeInOut,
                  "onComplete":this.panelFadeInCpl
               });
               this.fadeIn(0.4);
         }
      }
      
      protected function panelFadeInCpl() : void
      {
      }
      
      public function panelFadeOut() : void
      {
         if(!(int(this.panelFadeOutType) - 2))
         {
            TweenLite.to(this,0.2,{
               "y":this.y + 20,
               "alpha":0,
               "onComplete":this.panelFadeOutCpl
            });
         }
         else
         {
            this.panelFadeOutCpl();
         }
      }
      
      protected function panelFadeOutCpl() : void
      {
         this.fadeOut();
      }
      
      public function panelFadeOutAndDispose() : void
      {
         this.addEventListener("fadeOutCpl",panelFadeOutThenDisposeHandler);
         this.panelFadeOut();
      }
      
      protected function panelFadeOutThenDisposeHandler(param1:Event) : void
      {
         this.removeEventListener("fadeOutCpl",panelFadeOutThenDisposeHandler);
         this.dispose();
      }
      
      override public function btnCloseHandler(param1:MouseEvent = null) : void
      {
         super.btnCloseHandler(param1);
         this.dispatchEvent(new Event("close"));
      }
   }
}
