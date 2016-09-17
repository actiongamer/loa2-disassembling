package com.game.shared.motion.viewMotion
{
   import morn.core.managers.timerMgrs.TimerManager;
   import com.mz.core.configs.ClientConfig;
   import flash.display.DisplayObject;
   
   public class MotionLine extends MotionXYView
   {
      
      public static const MIN_SPEED:int = 20;
       
      
      public function MotionLine(param1:DisplayObject, param2:Object)
      {
         super(param1,param2);
         if(param2 == null)
         {
            throw new Error("");
         }
         debug = true;
      }
      
      override public function motionEnd() : Boolean
      {
         return curDis <= getSpeed();
      }
      
      override protected function getSpeed() : Number
      {
         return 20 * TimerManager.ins.overTimerMs / ClientConfig.msPerFrame;
      }
   }
}
