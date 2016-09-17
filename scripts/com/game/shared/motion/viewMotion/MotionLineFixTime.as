package com.game.shared.motion.viewMotion
{
   import morn.core.managers.timerMgrs.TimerManager;
   import flash.geom.Point;
   import com.mz.core.utils.MathUtil;
   import flash.display.DisplayObject;
   
   public class MotionLineFixTime extends MotionXYView
   {
       
      
      private var startTime:int;
      
      public var totalTime:int = 30;
      
      public function MotionLineFixTime(param1:DisplayObject, param2:Object)
      {
         super(param1,param2);
         if(param2 == null)
         {
            throw new Error("");
         }
         debug = true;
         this.startTime = TimerManager.ins.currFrame;
      }
      
      override public function setParam(param1:Object) : void
      {
         this.totalTime = (param1 as MotionLineFixTimeParam).totalTime;
      }
      
      override public function motionEnd() : Boolean
      {
         return TimerManager.ins.currFrame - this.startTime >= totalTime;
      }
      
      override protected function getSpeed() : Number
      {
         var _loc2_:Point = new Point(this._view.x,this._view.y);
         var _loc1_:Point = this.getTargetLoca();
         return MathUtil.disWith2Point(_loc2_,_loc1_) / (totalTime - (TimerManager.ins.currFrame - this.startTime));
      }
   }
}
