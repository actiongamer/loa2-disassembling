package com.game.shared.motion.model
{
   import flash.geom.Point;
   
   public class MotionSpeedTarget extends MotionSpeed
   {
       
      
      private var _curDis:Number;
      
      private var _curAng:Number;
      
      protected var _targetLoca:Point;
      
      private var _reCount:Boolean;
      
      private var _reCount2:Boolean;
      
      public function MotionSpeedTarget(param1:int, param2:int)
      {
         super(param1,param2);
      }
      
      public function setParam(param1:Object) : void
      {
      }
      
      protected function getTargetLoca() : Point
      {
         return null;
      }
      
      override public function motionEnd() : Boolean
      {
         return _targetLoca == null || curDis < 1;
      }
      
      override public function onMotionHanle() : void
      {
         _reCount2 = true;
         _reCount = true;
         _targetLoca = getTargetLoca();
      }
      
      override public function motioning(param1:int) : void
      {
         if(_targetLoca)
         {
            super.motioning(param1);
         }
      }
      
      protected function get curDis() : Number
      {
         if(_reCount)
         {
            _curDis = Point.distance(_targetLoca,_curLoca);
            _reCount = false;
         }
         return _curDis;
      }
      
      protected function get curAng() : Number
      {
         if(_reCount2)
         {
            if(_targetLoca)
            {
               _curAng = Math.atan2(_targetLoca.y - _curLoca.y,_targetLoca.x - _curLoca.x);
            }
            else
            {
               _curAng = 0;
            }
            _reCount2 = false;
         }
         return _curAng;
      }
   }
}
