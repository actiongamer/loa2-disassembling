package com.greensock.easing
{
   public final class BackInOut extends Ease
   {
      
      public static var ease:com.greensock.easing.BackInOut = new com.greensock.easing.BackInOut();
       
      
      public function BackInOut(param1:Number = 1.70158)
      {
         super();
         _p1 = param1;
         _p2 = _p1 * 1.525;
      }
      
      override public function getRatio(param1:Number) : Number
      {
         param1 = param1 * 2;
         if(param1 * 2 < 1)
         {
            §§push(0.5 * param1 * param1 * ((_p2 + 1) * param1 - _p2));
         }
         else
         {
            param1 = param1 - 2;
            §§push(Number(0.5 * ((param1 - 2) * param1 * ((_p2 + 1) * param1 + _p2) + 2)));
         }
         return §§pop();
      }
      
      public function config(param1:Number = 1.70158) : com.greensock.easing.BackInOut
      {
         return new com.greensock.easing.BackInOut(param1);
      }
   }
}
