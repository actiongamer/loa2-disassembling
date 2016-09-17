package com.greensock.easing
{
   public class SlowMo extends Ease
   {
      
      public static var ease:com.greensock.easing.SlowMo = new com.greensock.easing.SlowMo();
       
      
      private var _p:Number;
      
      public function SlowMo(param1:Number = 0.7, param2:Number = 0.7, param3:Boolean = false)
      {
         super();
         if(param1 > 1)
         {
            param1 = 1;
         }
         _p = param1 != 1?param2:0;
         _p1 = (1 - param1) / 2;
         _p2 = param1;
         _p3 = _p1 + _p2;
         _calcEnd = param3;
      }
      
      override public function getRatio(param1:Number) : Number
      {
         var _loc2_:Number = param1 + (0.5 - param1) * _p;
         if(param1 < _p1)
         {
            if(_calcEnd)
            {
               param1 = 1 - param1 / _p1;
               return 1 - (1 - param1 / _p1) * param1;
            }
            else
            {
               param1 = 1 - param1 / _p1;
               return Number(_loc2_ - (1 - param1 / _p1) * param1 * param1 * param1 * _loc2_);
            }
         }
         if(param1 > _p3)
         {
            if(_calcEnd)
            {
               param1 = (param1 - _p3) / _p1;
               return 1 - (param1 - _p3) / _p1 * param1;
            }
            else
            {
               param1 = (param1 - _p3) / _p1;
               return Number(_loc2_ + (param1 - _loc2_) * ((param1 - _p3) / _p1) * param1 * param1 * param1);
            }
         }
         return !!_calcEnd?1:Number(_loc2_);
      }
      
      public function config(param1:Number = 0.7, param2:Number = 0.7, param3:Boolean = false) : com.greensock.easing.SlowMo
      {
         return new com.greensock.easing.SlowMo(param1,param2,param3);
      }
   }
}
