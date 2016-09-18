package com.greensock.easing
{
   public final class CircInOut extends Ease
   {
      
      public static var ease:com.greensock.easing.CircInOut = new com.greensock.easing.CircInOut();
       
      
      public function CircInOut()
      {
         super();
      }
      
      override public function getRatio(param1:Number) : Number
      {
         param1 = param1 * 2;
         if(param1 * 2 < 1)
         {
            §§push(-0.5 * (Math.sqrt(1 - param1 * param1) - 1));
         }
         else
         {
            param1 = param1 - 2;
            §§push(Number(0.5 * (Math.sqrt(1 - (param1 - 2) * param1) + 1)));
         }
         return §§pop();
      }
   }
}
