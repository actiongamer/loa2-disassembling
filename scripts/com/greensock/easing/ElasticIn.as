package com.greensock.easing
{
   public final class ElasticIn extends Ease
   {
      
      private static const _2PI:Number = 6.283185307179586;
      
      public static var ease:com.greensock.easing.ElasticIn = new com.greensock.easing.ElasticIn();
       
      
      public function ElasticIn(param1:Number = 1, param2:Number = 0.3)
      {
         super();
         _p1 = param1 || 1;
         _p2 = param2 || 0.3;
         _p3 = _p2 / 6.28318530717959 * (Math.asin(1 / _p1) || 0);
      }
      
      override public function getRatio(param1:Number) : Number
      {
         param1 = param1 - 1;
         return -(_p1 * Math.pow(2,10 * (param1 - 1)) * Math.sin((param1 - _p3) * 6.28318530717959 / _p2));
      }
      
      public function config(param1:Number = 1, param2:Number = 0.3) : com.greensock.easing.ElasticIn
      {
         return new com.greensock.easing.ElasticIn(param1,param2);
      }
   }
}
