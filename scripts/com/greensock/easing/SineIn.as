package com.greensock.easing
{
   public final class SineIn extends Ease
   {
      
      private static const _HALF_PI:Number = 1.5707963267948966;
      
      public static var ease:com.greensock.easing.SineIn = new com.greensock.easing.SineIn();
       
      
      public function SineIn()
      {
         super();
      }
      
      override public function getRatio(param1:Number) : Number
      {
         return -Math.cos(param1 * 1.5707963267949) + 1;
      }
   }
}
