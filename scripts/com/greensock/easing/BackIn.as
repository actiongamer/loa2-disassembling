package com.greensock.easing
{
   public final class BackIn extends Ease
   {
      
      public static var ease:com.greensock.easing.BackIn = new com.greensock.easing.BackIn();
       
      
      public function BackIn(param1:Number = 1.70158)
      {
         super();
         _p1 = param1;
      }
      
      override public function getRatio(param1:Number) : Number
      {
         return param1 * param1 * ((_p1 + 1) * param1 - _p1);
      }
      
      public function config(param1:Number = 1.70158) : com.greensock.easing.BackIn
      {
         return new com.greensock.easing.BackIn(param1);
      }
   }
}
