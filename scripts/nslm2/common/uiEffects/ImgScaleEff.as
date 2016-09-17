package nslm2.common.uiEffects
{
   import com.mz.core.utils2.task.TaskBase;
   import morn.core.components.Image;
   import com.greensock.TweenLite;
   import com.greensock.easing.Back;
   import flash.utils.setTimeout;
   import flash.utils.clearTimeout;
   
   public class ImgScaleEff extends TaskBase
   {
       
      
      private var img:Image;
      
      private var tween:TweenLite;
      
      private var hideTimeoutId:int = -1;
      
      public function ImgScaleEff(param1:Image)
      {
         super();
         this.img = param1;
         this.img.visible = false;
      }
      
      override public function exec() : void
      {
         var _loc1_:* = 0.5;
         img.scaleX = _loc1_;
         img.scaleY = _loc1_;
         img.alpha = 0.5;
         img.visible = true;
         tween = TweenLite.to(img,0.3,{
            "scaleX":1,
            "scaleY":1,
            "alpha":1,
            "ease":Back.easeOut,
            "onComplete":onTweenComplete
         });
      }
      
      private function onTweenComplete() : void
      {
         tween = null;
         hideTimeoutId = setTimeout(onHide,500);
      }
      
      private function onHide() : void
      {
         hideTimeoutId = -1;
         img.visible = false;
         onComplete();
      }
      
      public function endPlay() : void
      {
         if(tween)
         {
            tween.kill();
            tween = null;
         }
         if(hideTimeoutId >= 0)
         {
            clearTimeout(hideTimeoutId);
         }
         img.visible = false;
         onComplete();
      }
   }
}
