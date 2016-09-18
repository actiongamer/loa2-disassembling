package com.game.shared.motion.model
{
   public class MotionXY extends MotionSpeedTarget
   {
       
      
      private var _curSpeed:Number = 0;
      
      private var _curSpeedX:Number = 0;
      
      private var _curSpeedY:Number = 0;
      
      public function MotionXY(param1:int, param2:int)
      {
         super(param1,param2);
      }
      
      protected function getSpeed() : Number
      {
         return 0;
      }
      
      override public function get speedX() : Number
      {
         return _curSpeedX;
      }
      
      override public function get speedY() : Number
      {
         return _curSpeedY;
      }
      
      override public function onMotionHanle() : void
      {
         super.onMotionHanle();
         _curSpeed = getSpeed();
         _curSpeedX = _curSpeed * Math.cos(curAng);
         _curSpeedY = _curSpeed * Math.sin(curAng);
      }
   }
}
