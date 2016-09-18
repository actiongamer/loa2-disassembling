package com.greensock.easing
{
   public final class SineOut extends Ease
   {
      
      private static const _HALF_PI:Number = 1.5707963267948966;
      
      public static var ease:com.greensock.easing.SineOut = new com.greensock.easing.SineOut();
       
      
      public function SineOut()
      {
         super();
      }
      
      override public function getRatio(param1:Number) : Number
      {
         return Math.sin(param1 * 1.5707963267949);
      }
   }
}
