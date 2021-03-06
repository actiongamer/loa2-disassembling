package nslm2.common.compsEffects
{
   import com.mz.core.interFace.IDispose;
   import com.greensock.TweenLite;
   import morn.core.handlers.Handler;
   
   public class SummaryZoomInEffCtrl2 implements IDispose
   {
       
      
      private var target:Object;
      
      public var duration:Number = 0.3;
      
      public var showDelay:Number;
      
      public var hideDelay:Number;
      
      public var showHandler;
      
      public var hideHandler;
      
      private var _tarHeight:Number;
      
      public function SummaryZoomInEffCtrl2(param1:Object, param2:Number = 2, param3:Number = 5, param4:* = null, param5:* = null)
      {
         super();
         this.target = param1;
         this.showDelay = param2;
         this.hideDelay = param3;
         this.showHandler = param5;
         this.hideHandler = param4;
         _tarHeight = target.height;
         target.alpha = 0;
         target.scale = 0;
         target.y = 0;
         toShow();
      }
      
      public function config(param1:Number = 0.3) : SummaryZoomInEffCtrl2
      {
         duration = param1;
         return this;
      }
      
      private function toShow() : void
      {
         TweenLite.to(target,duration,{
            "scale":1,
            "onComplete":toHide,
            "delay":showDelay,
            "alpha":1,
            "onStart":onStartShow,
            "y":-_tarHeight
         });
      }
      
      private function onStartShow() : void
      {
         if(this.showHandler)
         {
            Handler.execute(this.showHandler);
         }
      }
      
      private function toHide() : void
      {
         TweenLite.to(target,duration,{
            "scale":0,
            "delay":hideDelay,
            "alpha":0,
            "onComplete":toShow,
            "onStart":onStartHide,
            "y":0
         });
      }
      
      private function onStartHide() : void
      {
         if(this.hideHandler)
         {
            Handler.execute(this.hideHandler);
         }
      }
      
      public function dispose() : void
      {
         TweenLite.killTweensOf(target);
         target = null;
      }
   }
}
