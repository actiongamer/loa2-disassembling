package nslm2.common.uiEffects
{
   import com.mz.core.utils2.task.TaskBase;
   import flash.display.DisplayObject;
   import flash.geom.Point;
   import morn.core.managers.timerMgrs.TimerManager;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.utils.getTimer;
   import com.greensock.TweenLite;
   import com.greensock.easing.Bounce;
   import com.mz.core.utils.DisplayUtils;
   import morn.core.components.Image;
   import com.mz.core.logging.Log;
   
   public class IconShakeAndDropAndFlyEff extends TaskBase
   {
      
      private static const STATE_SHAKE:int = 1;
      
      private static const STATE_DOWN:int = 2;
      
      private static const STATE_FLY:int = 3;
       
      
      private var icon:DisplayObject;
      
      private var sourcePoint:Point;
      
      private var source:DisplayObject;
      
      private var targetPoint:Point;
      
      public var curState:int;
      
      private var hideSourceTime:int = 500;
      
      private var shakeTime:int = 500;
      
      private var shakeCount:int = 2;
      
      private var shakeOffsetX:Number = 3;
      
      private var downSpeedX:Number;
      
      private var downSpeedRandom:Number = 2;
      
      public var downPosY:Number;
      
      private var downPosYRandom:Number = 30;
      
      public var delayExec:int = 0;
      
      private var tempStartTime:int;
      
      private var tween:TweenLite;
      
      public function IconShakeAndDropAndFlyEff(param1:DisplayObject, param2:DisplayObject)
      {
         super();
         if(param1.hasOwnProperty("clone"))
         {
            icon = param1["clone"]() as DisplayObject;
         }
         else if(param1 is Image)
         {
            icon = new Image((icon as Image).url);
         }
         else
         {
            Log.error(this,"不支持的资源类型");
         }
         this.source = param1;
         sourcePoint = ModuleMgr.ins.toGlobalPoi(param1);
         targetPoint = ModuleMgr.ins.toGlobalPoi(param2);
      }
      
      override public function exec() : void
      {
         if(delayExec > 0)
         {
            TimerManager.ins.doOnce(delayExec,doExec);
         }
         else
         {
            doExec();
         }
      }
      
      private function doExec() : void
      {
         if(this.isStop)
         {
            return;
         }
         icon.x = sourcePoint.x;
         icon.y = sourcePoint.y;
         var _loc1_:DisplayObjectContainer = ModuleMgr.ins.topEffectLayer;
         _loc1_.addChild(icon);
         if(source && source.parent)
         {
            source.visible = false;
         }
         setState(1);
      }
      
      protected function onRender(param1:Event) : void
      {
         var _loc3_:Number = NaN;
         var _loc2_:int = getTimer() - tempStartTime;
         if(curState == 1)
         {
            _loc3_ = 3.14159265358979 * 2 * shakeCount * _loc2_ / shakeTime;
            icon.x = sourcePoint.x + Math.sin(_loc3_) * shakeOffsetX;
            if(_loc2_ > shakeTime)
            {
               setState(2);
            }
         }
         else if(curState == 2)
         {
            icon.x = icon.x + downSpeedX;
            if(source && source.parent && source.visible == false && _loc2_ > hideSourceTime)
            {
               source.visible = true;
            }
         }
      }
      
      private function setState(param1:int) : void
      {
         curState = param1;
         if(curState == 1)
         {
            tempStartTime = getTimer();
            icon.addEventListener("enterFrame",onRender);
         }
         else if(curState == 2)
         {
            tempStartTime = getTimer();
            downSpeedX = Math.random() * downSpeedRandom * (Math.random() > 0.5?1:-1);
            downPosY = downPosY + Math.random() * downPosYRandom * (Math.random() > 0.5?1:-1);
            tween = TweenLite.to(icon,1,{
               "y":downPosY,
               "ease":Bounce.easeOut,
               "onComplete":onTweenDownComplete
            });
            icon.addEventListener("enterFrame",onRender);
         }
         else
         {
            icon.removeEventListener("enterFrame",onRender);
            tween = TweenLite.to(icon,1,{
               "x":targetPoint.x,
               "y":targetPoint.y,
               "onComplete":onTweenFlyComplete
            });
         }
      }
      
      private function onTweenDownComplete() : void
      {
         setState(3);
      }
      
      private function onTweenFlyComplete() : void
      {
         setState(0);
         endPlay();
      }
      
      public function endPlay() : void
      {
         if(tween)
         {
            tween.kill();
            tween = null;
         }
         if(icon)
         {
            icon.removeEventListener("enterFrame",onRender);
            DisplayUtils.removeSelf(icon);
            icon = null;
         }
         this.onComplete();
      }
   }
}
