package com.display.game.anim
{
   import flash.display.DisplayObject;
   import com.greensock.easing.Back;
   import com.greensock.easing.Expo;
   
   public class FrameAnimConst
   {
      
      public static const NORMAL_SCALE_SHOW:String = "normal_scale_show";
      
      public static const NORMAL_SCALE_HIDE:String = "normal_scale_hide";
      
      public static const FAST_SCALE_SHOW:String = "fast_scale";
      
      public static const FAST_SHOW_UP:String = "fast_scale_show_up";
      
      public static const FAST_HIDE_UP:String = "fast_scale_hide_up";
       
      
      public function FrameAnimConst()
      {
         super();
      }
      
      public static function getFrameAnim(param1:DisplayObject, param2:String, param3:Function, param4:Function) : TweenAnimVO
      {
         var _loc6_:* = null;
         var _loc5_:Vector.<ITween> = new Vector.<ITween>();
         var _loc7_:* = param2;
         if("normal_scale_show" !== _loc7_)
         {
            if("normal_scale_hide" !== _loc7_)
            {
               if("fast_scale" !== _loc7_)
               {
                  if("fast_scale_show_up" !== _loc7_)
                  {
                     if("fast_scale_hide_up" === _loc7_)
                     {
                        _loc5_.push(new TweenVO(param1,0.2,{
                           "y":param1.y - 40,
                           "ease":Expo.easeOut,
                           "alpha":0,
                           "onComplete":param3,
                           "onUpdate":param4
                        }));
                        _loc6_ = new TweenAnimVO(param1,{},_loc5_);
                     }
                  }
                  else
                  {
                     _loc5_.push(new TweenVO(param1,0.2,{
                        "alpha":1,
                        "y":0,
                        "ease":Expo.easeOut,
                        "onComplete":param3,
                        "onUpdate":param4
                     }));
                     _loc6_ = new TweenAnimVO(param1,{
                        "y":param1.height / 2 + 40,
                        "alpha":0
                     },_loc5_);
                  }
               }
               else
               {
                  _loc5_.push(new TweenVO(param1,0.2,{
                     "scaleX":1,
                     "scaleY":1,
                     "alpha":1,
                     "ease":Back.easeOut,
                     "onComplete":param3,
                     "onUpdate":param4
                  }));
                  _loc6_ = new TweenAnimVO(param1,{
                     "scaleX":0.2,
                     "scaleY":0.2,
                     "alpha":0
                  },_loc5_);
               }
            }
            else
            {
               _loc5_.push(new TweenVO(param1,0.4,{
                  "y":param1.y + 40,
                  "ease":Expo.easeOut,
                  "alpha":0,
                  "onComplete":param3,
                  "onUpdate":param4
               }));
               _loc6_ = new TweenAnimVO(param1,{},_loc5_);
            }
         }
         else
         {
            _loc5_.push(new TweenVO(param1,0.5,{
               "scaleX":1,
               "scaleY":1,
               "alpha":1,
               "ease":Back.easeOut,
               "onComplete":param3,
               "onUpdate":param4
            }));
            _loc6_ = new TweenAnimVO(param1,{
               "scaleX":0.2,
               "scaleY":0.2,
               "alpha":0
            },_loc5_);
         }
         return _loc6_;
      }
   }
}
