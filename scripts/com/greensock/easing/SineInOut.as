package com.greensock.easing
{
   public final class SineInOut extends Ease
   {
      
      public static var ease:com.greensock.easing.SineInOut = new com.greensock.easing.SineInOut();
       
      
      public function SineInOut()
      {
         super();
      }
      
      override public function getRatio(param1:Number) : Number
      {
         return -0.5 * (Math.cos(3.14159265358979 * param1) - 1);
      }
   }
}
