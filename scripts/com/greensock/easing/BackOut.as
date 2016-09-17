package com.greensock.easing
{
   public final class BackOut extends Ease
   {
      
      public static var ease:com.greensock.easing.BackOut = new com.greensock.easing.BackOut();
       
      
      public function BackOut(param1:Number = 1.70158)
      {
         super();
         _p1 = param1;
      }
      
      override public function getRatio(param1:Number) : Number
      {
         param1 = param1 - 1;
         return (param1 - 1) * param1 * ((_p1 + 1) * param1 + _p1) + 1;
      }
      
      public function config(param1:Number = 1.70158) : com.greensock.easing.BackOut
      {
         return new com.greensock.easing.BackOut(param1);
      }
   }
}
