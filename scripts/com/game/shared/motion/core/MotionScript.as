package com.game.shared.motion.core
{
   import com.game.plot.script.BaseScript;
   import flash.utils.getTimer;
   import org.specter3d.context.AppGlobalContext;
   import flash.events.Event;
   import com.game.plot.script.ScriptEvent;
   
   public class MotionScript extends BaseScript
   {
       
      
      protected var _motionView:com.game.shared.motion.core.IMotion;
      
      private var _time:int;
      
      protected var _curTime:int;
      
      private var _curTotalTime:int;
      
      public function MotionScript(param1:com.game.shared.motion.core.IMotion)
      {
         super();
         _motionView = param1;
         if(!_motionView)
         {
            throw new Error("error");
         }
      }
      
      public function get motionView() : com.game.shared.motion.core.IMotion
      {
         return _motionView;
      }
      
      override protected function playHandle() : void
      {
         _time = getTimer();
         _curTotalTime = 0;
         AppGlobalContext.stage2d.addEventListener("enterFrame",motionHandle);
         _motionView.onMotionStart();
      }
      
      override protected function stopHandle() : void
      {
         AppGlobalContext.stage2d.removeEventListener("enterFrame",motionHandle);
         _motionView.onMotionEnd();
      }
      
      public function get curTotalTime() : int
      {
         return _curTotalTime;
      }
      
      private function motionHandle(param1:Event) : void
      {
         var _loc2_:int = getTimer();
         _curTime = _loc2_ - _time;
         _curTotalTime = _curTotalTime + _curTime;
         if(_motionView)
         {
            _motionView.onMotionHanle();
            if(_motionView.motionEnd())
            {
               stop();
               finish();
            }
            else
            {
               _motionView.motioning(_curTime);
               dispatchEvent(new ScriptEvent("script_update",this));
            }
         }
         _time = _loc2_;
      }
      
      protected function motionEnd() : Boolean
      {
         return false;
      }
      
      override protected function free() : void
      {
         _motionView = null;
      }
   }
}
