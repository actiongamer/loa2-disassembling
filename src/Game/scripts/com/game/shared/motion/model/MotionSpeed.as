package com.game.shared.motion.model
{
   import com.game.shared.motion.core.BaseMotion;
   import flash.geom.Point;
   
   public class MotionSpeed extends BaseMotion
   {
       
      
      protected var _curLoca:Point;
      
      public function MotionSpeed(param1:Number, param2:Number)
      {
         super();
         _curLoca = new Point();
         setLoca(param1,param2);
      }
      
      public function get x() : Number
      {
         return _curLoca.x;
      }
      
      public function get y() : Number
      {
         return _curLoca.y;
      }
      
      public function setLoca(param1:Number, param2:Number) : void
      {
         _curLoca.x = param1;
         _curLoca.y = param2;
      }
      
      override public function motionEnd() : Boolean
      {
         return false;
      }
      
      public function get speedX() : Number
      {
         return 0;
      }
      
      public function get speedY() : Number
      {
         return 0;
      }
      
      override public function motioning(param1:int) : void
      {
         setLoca(x + speedX,y + speedY);
      }
   }
}
