package com.display.game.anim
{
   public class TweenVO implements ITween
   {
       
      
      private var _tweenObj:Object;
      
      private var _time:Number;
      
      private var _vars:Object;
      
      public function TweenVO(param1:Object, param2:Number, param3:Object)
      {
         super();
         _tweenObj = param1;
         _time = param2;
         param3.overwrite = 0;
         _vars = param3;
      }
      
      public function getTweenObj() : Object
      {
         return _tweenObj;
      }
      
      public function getTweenTime() : Number
      {
         return _time;
      }
      
      public function getTweenPlayParams() : Object
      {
         return _vars;
      }
   }
}
