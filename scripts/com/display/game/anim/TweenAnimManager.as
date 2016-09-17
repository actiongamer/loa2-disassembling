package com.display.game.anim
{
   import flash.utils.Dictionary;
   import com.greensock.TimelineLite;
   import com.greensock.TweenLite;
   
   public class TweenAnimManager
   {
      
      private static var instance:com.display.game.anim.TweenAnimManager;
       
      
      private var _animDic:Dictionary;
      
      public function TweenAnimManager()
      {
         super();
         if(instance)
         {
            throw new Error("单例");
         }
         _animDic = new Dictionary(_animDic);
      }
      
      public static function getInstance() : com.display.game.anim.TweenAnimManager
      {
         if(!instance)
         {
            instance = new com.display.game.anim.TweenAnimManager();
         }
         return instance;
      }
      
      public function playAnim(param1:ITweenAnim, param2:Boolean = true) : void
      {
         var _loc5_:* = undefined;
         var _loc7_:* = 0;
         var _loc4_:* = null;
         var _loc8_:* = 0;
         var _loc3_:* = null;
         if(param1)
         {
            if(param2)
            {
               if(param1.getTweenResetObj() && param1.getTweenResetParams())
               {
                  var _loc10_:int = 0;
                  var _loc9_:* = param1.getTweenResetParams();
                  for(var _loc6_ in param1.getTweenResetParams())
                  {
                     if(param1.getTweenResetObj().hasOwnProperty(_loc6_))
                     {
                        param1.getTweenResetObj()[_loc6_] = param1.getTweenResetParams()[_loc6_];
                     }
                  }
               }
            }
            _loc5_ = param1.getTweens();
            if(_loc5_)
            {
               _loc7_ = uint(_loc5_.length);
               _loc4_ = new TimelineLite();
               _animDic[param1] = _loc4_;
               _loc8_ = uint(0);
               while(_loc8_ < _loc7_)
               {
                  _loc3_ = _loc5_[_loc8_];
                  _loc4_.append(new TweenLite(_loc3_.getTweenObj(),_loc3_.getTweenTime(),_loc3_.getTweenPlayParams()));
                  _loc8_++;
               }
               _loc4_.append(TweenLite.delayedCall(0,stopAnim,[param1]));
               _loc4_.play();
            }
         }
      }
      
      public function stopAnim(param1:ITweenAnim) : void
      {
         var _loc3_:* = null;
         if(param1)
         {
            TweenLite.killTweensOf(param1.getTweenResetObj());
            var _loc5_:int = 0;
            var _loc4_:* = param1.getTweens();
            for each(var _loc2_ in param1.getTweens())
            {
               TweenLite.killTweensOf(_loc2_.getTweenObj());
            }
            _loc3_ = _animDic[param1];
            if(_loc3_)
            {
               _loc3_.stop();
               _loc3_.kill();
               _animDic[param1] = null;
               delete _animDic[param1];
            }
         }
      }
   }
}
