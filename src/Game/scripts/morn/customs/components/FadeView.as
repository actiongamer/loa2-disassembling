package morn.customs.components
{
   import morn.core.components.View;
   import com.mz.core.interFace.IFadeView;
   import flash.display.DisplayObject;
   import nslm2.mgrs.uiFades.UIFadeTask;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   
   public class FadeView extends View implements IFadeView
   {
       
      
      protected var _fadeViewId:int = -1;
      
      public var switchVisibleWhenFade:Boolean = false;
      
      private var _isFadeIn:Boolean = false;
      
      protected var fadeTask:UIFadeTask;
      
      public function FadeView()
      {
         super();
      }
      
      public function set fadeViewId(param1:int) : void
      {
         _fadeViewId = param1;
      }
      
      public function get fadeViewId() : int
      {
         if(_fadeViewId == -1)
         {
            return findParentFadeViewId(this);
         }
         return _fadeViewId;
      }
      
      private function findParentFadeViewId(param1:DisplayObject) : int
      {
         if(param1.parent)
         {
            if(param1.parent is FadeView)
            {
               return (param1.parent as FadeView).fadeViewId;
            }
            return findParentFadeViewId(param1.parent);
         }
         return -1;
      }
      
      public function get isFadeIn() : Boolean
      {
         return _isFadeIn;
      }
      
      public function set isFadeIn(param1:Boolean) : void
      {
         _isFadeIn = param1;
         if(switchVisibleWhenFade)
         {
            this.visible = _isFadeIn;
         }
      }
      
      public function fadeIn(param1:Number = 0, param2:int = 0) : void
      {
         this.isFadeIn = true;
         if(fadeTask != null)
         {
            fadeTask.resetOriAndStop();
            fadeTask = null;
         }
         if(param2 == 0)
         {
            param2 = this.fadeViewId;
         }
         fadeTask = new UIFadeTask(this as DisplayObjectContainer,param2,true,param1);
         fadeTask.addCompleteHandler(fadeView_fadeInCpl);
         fadeTask.exec();
      }
      
      public function fadeView_fadeInCpl() : void
      {
         this.dispatchEvent(new Event("fadeInCpl"));
      }
      
      public function fadeOut() : void
      {
         this.isFadeIn = false;
         if(fadeTask != null)
         {
            fadeTask.resetOriAndStop();
            fadeTask = null;
         }
         this.fadeView_fadeOutCpl();
      }
      
      public function fadeView_fadeOutCpl() : void
      {
         this.dispatchEvent(new Event("fadeOutCpl"));
      }
      
      public function fadeOutThenDispose() : void
      {
         this.addEventListener("fadeOutCpl",fadeOutThenDisposeHandler);
         this.fadeOut();
      }
      
      protected function fadeOutThenDisposeHandler(param1:Event) : void
      {
         this.removeEventListener("fadeOutCpl",fadeOutThenDisposeHandler);
         this.dispose();
      }
      
      override public function dispose() : void
      {
         if(fadeTask != null)
         {
            fadeTask.stop();
            fadeTask = null;
         }
         super.dispose();
      }
   }
}
