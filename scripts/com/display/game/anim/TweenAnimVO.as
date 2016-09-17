package com.display.game.anim
{
   public class TweenAnimVO implements ITweenAnim
   {
       
      
      private var _resetObj:Object;
      
      private var _resetParams:Object;
      
      private var _tweens:Vector.<com.display.game.anim.ITween>;
      
      public function TweenAnimVO(param1:Object, param2:Object, param3:Vector.<com.display.game.anim.ITween>)
      {
         super();
         _resetObj = param1;
         _resetParams = param2;
         _tweens = param3;
      }
      
      public function getTweenResetObj() : Object
      {
         return _resetObj;
      }
      
      public function getTweenResetParams() : Object
      {
         return _resetParams;
      }
      
      public function getTweens() : Vector.<com.display.game.anim.ITween>
      {
         return _tweens;
      }
   }
}
