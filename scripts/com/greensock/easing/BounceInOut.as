package com.greensock.easing
{
   public final class BounceInOut extends Ease
   {
      
      public static var ease:com.greensock.easing.BounceInOut = new com.greensock.easing.BounceInOut();
       
      
      public function BounceInOut()
      {
         super();
      }
      
      override public function getRatio(param1:Number) : Number
      {
         var _loc2_:Boolean = false;
         if(param1 < 0.5)
         {
            _loc2_ = true;
            param1 = 1 - param1 * 2;
         }
         else
         {
            param1 = param1 * 2 - 1;
         }
         if(param1 < 0.363636363636364)
         {
            param1 = 7.5625 * param1 * param1;
         }
         else if(param1 < 0.727272727272727)
         {
            param1 = param1 - 0.545454545454545;
            param1 = 7.5625 * (param1 - 0.545454545454545) * param1 + 0.75;
         }
         else if(param1 < 0.909090909090909)
         {
            param1 = param1 - 0.818181818181818;
            param1 = 7.5625 * (param1 - 0.818181818181818) * param1 + 0.9375;
         }
         else
         {
            param1 = param1 - 0.954545454545455;
            param1 = 7.5625 * (param1 - 0.954545454545455) * param1 + 0.984375;
         }
         return !!_loc2_?(1 - param1) * 0.5:Number(param1 * 0.5 + 0.5);
      }
   }
}
