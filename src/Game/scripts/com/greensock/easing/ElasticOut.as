package com.greensock.easing
{
   public final class ElasticOut extends Ease
   {
      
      private static const _2PI:Number = 6.283185307179586;
      
      public static var ease:com.greensock.easing.ElasticOut = new com.greensock.easing.ElasticOut();
       
      
      public function ElasticOut(param1:Number = 1, param2:Number = 0.3)
      {
         super();
         _p1 = param1 || 1;
         _p2 = param2 || 0.3;
         _p3 = _p2 / 6.28318530717959 * (Math.asin(1 / _p1) || 0);
      }
      
      override public function getRatio(param1:Number) : Number
      {
         return _p1 * Math.pow(2,-10 * param1) * Math.sin((param1 - _p3) * 6.28318530717959 / _p2) + 1;
      }
      
      public function config(param1:Number = 1, param2:Number = 0.3) : com.greensock.easing.ElasticOut
      {
         return new com.greensock.easing.ElasticOut(param1,param2);
      }
   }
}
