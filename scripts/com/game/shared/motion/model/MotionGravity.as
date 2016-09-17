package com.game.shared.motion.model
{
   public class MotionGravity extends MotionSpeedTarget
   {
       
      
      private var _speedX:Number = 0;
      
      private var _speedY:Number = 0;
      
      private var _rawSpeed:Number;
      
      private var _rawAangel:Number;
      
      private var _gMax:Number;
      
      private var _gravity:Number;
      
      private var _maxGravityTime:Number;
      
      private var _f:uint;
      
      private var _curTime:int;
      
      public function MotionGravity(param1:int, param2:int, param3:Number, param4:Number = 900, param5:Number = 500, param6:uint = 1000, param7:Number = 1.5)
      {
         _rawSpeed = param4;
         _rawAangel = param3;
         _gMax = param5;
         _f = param6;
         _gravity = 0;
         _maxGravityTime = param7;
         super(param1,param2);
      }
      
      protected function get gravity() : Number
      {
         if(_gravity < _gMax)
         {
            _gravity = _gravity + _gMax * _curTime / (_maxGravityTime * 1000);
         }
         return _gravity;
      }
      
      override public function motionEnd() : Boolean
      {
         return _targetLoca == null || !isNaN(curDis) && curDis < 15;
      }
      
      override public function motioning(param1:int) : void
      {
         super.motioning(param1);
         _curTime = param1;
      }
      
      override public function onMotionHanle() : void
      {
         super.onMotionHanle();
         if(_rawSpeed > 0)
         {
            _rawSpeed = _rawSpeed - _f * _curTime / 1000;
            if(_rawSpeed < 0)
            {
               _rawSpeed = 0;
            }
         }
         _speedX = (_rawSpeed * Math.cos(_rawAangel) + gravity * Math.cos(curAng)) * _curTime / 1000;
         _speedY = (_rawSpeed * Math.sin(_rawAangel) + gravity * Math.sin(curAng)) * _curTime / 1000;
      }
      
      override public function get speedX() : Number
      {
         return _speedX;
      }
      
      override public function get speedY() : Number
      {
         return _speedY;
      }
   }
}
