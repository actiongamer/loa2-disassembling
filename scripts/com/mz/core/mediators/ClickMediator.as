package com.mz.core.mediators
{
   import flash.display.InteractiveObject;
   import flash.geom.Point;
   import flash.events.MouseEvent;
   import morn.core.managers.timerMgrs.TimerManager;
   import com.mz.core.utils.MathUtil;
   import morn.core.handlers.Handler;
   
   public class ClickMediator
   {
      
      public static const CLICK_INTERVAL_TIMER:int = 800;
      
      public static const CLICK_INTERVAL_DIS:int = 6;
       
      
      public var target:InteractiveObject;
      
      public var clickHandler;
      
      public var doubleClickHandler;
      
      private var lastDownTimer:int;
      
      private var lastDownPos:Point;
      
      private var lastClickTimer:int;
      
      private var lastClickPos:Point;
      
      public function ClickMediator(param1:InteractiveObject, param2:* = null, param3:* = null)
      {
         super();
         this.target = param1;
         this.clickHandler = param2;
         this.doubleClickHandler = param3;
         target.addEventListener("mouseDown",onMouseDown);
         target.addEventListener("mouseUp",onMouseUp);
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         lastDownTimer = TimerManager.ins.currTimer;
         lastDownPos = new Point(param1.stageX,param1.stageY);
      }
      
      private function onMouseUp(param1:MouseEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:Boolean = false;
         if(lastDownPos)
         {
            if(TimerManager.ins.currTimer - lastDownTimer <= 800)
            {
               _loc3_ = new Point(param1.stageX,param1.stageY);
               if(MathUtil.disWith2Point(_loc3_,this.lastDownPos) < 6)
               {
                  if(this.clickHandler != null)
                  {
                     Handler.execute(this.clickHandler);
                  }
                  if(this.doubleClickHandler != null)
                  {
                     _loc2_ = false;
                     if(lastClickPos)
                     {
                        if(TimerManager.ins.currTimer - lastClickTimer <= 800)
                        {
                           if(MathUtil.disWith2Point(_loc3_,this.lastClickPos) < 6)
                           {
                              _loc2_ = true;
                           }
                        }
                        lastClickPos = null;
                     }
                     if(_loc2_)
                     {
                        Handler.execute(this.doubleClickHandler);
                     }
                     else
                     {
                        lastClickPos = _loc3_;
                     }
                  }
               }
            }
            lastDownPos = null;
         }
      }
      
      public function dispose() : void
      {
         if(target)
         {
            target.removeEventListener("mouseDown",onMouseDown);
            target.removeEventListener("mouseUp",onMouseUp);
            target = null;
         }
         this.clickHandler = null;
         this.doubleClickHandler = null;
      }
   }
}
