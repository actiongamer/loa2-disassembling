package com.greensock.easing
{
   public final class BounceIn extends Ease
   {
      
      public static var ease:com.greensock.easing.BounceIn = new com.greensock.easing.BounceIn();
       
      
      public function BounceIn()
      {
         super();
      }
      
      override public function getRatio(param1:Number) : Number
      {
         param1 = 1 - param1;
         if(1 - param1 < 0.363636363636364)
         {
            return 1 - 7.5625 * param1 * param1;
         }
         if(param1 < 0.727272727272727)
         {
            param1 = param1 - 0.545454545454545;
            return 1 - (7.5625 * (param1 - 0.545454545454545) * param1 + 0.75);
         }
         if(param1 < 0.909090909090909)
         {
            param1 = param1 - 0.818181818181818;
            return 1 - (7.5625 * (param1 - 0.818181818181818) * param1 + 0.9375);
         }
         param1 = param1 - 0.954545454545455;
         return 1 - (7.5625 * (param1 - 0.954545454545455) * param1 + 0.984375);
      }
   }
}
