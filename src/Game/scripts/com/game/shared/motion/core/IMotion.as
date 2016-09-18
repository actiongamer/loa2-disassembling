package com.game.shared.motion.core
{
   public interface IMotion
   {
       
      
      function motioning(param1:int) : void;
      
      function onMotionStart() : void;
      
      function onMotionEnd() : void;
      
      function motionEnd() : Boolean;
      
      function onMotionHanle() : void;
   }
}
