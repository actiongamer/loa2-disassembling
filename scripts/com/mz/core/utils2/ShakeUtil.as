package com.mz.core.utils2
{
   import com.mz.core.utils.DictHash;
   import com.greensock.TimelineLite;
   import flash.utils.clearInterval;
   import com.greensock.TweenLite;
   import flash.geom.Point;
   import flash.utils.setInterval;
   import com.greensock.TweenMax;
   import com.greensock.easing.Sine;
   
   public class ShakeUtil
   {
      
      public static const UP_DOWN:int = 0;
      
      public static const LEFT_RIGHT:int = 1;
      
      public static const ROUND:int = 2;
      
      public static const RANDOM:int = 3;
      
      public static const ZOOM:int = 4;
      
      public static const SCALE:int = 5;
      
      public static const DEGREE:int = 6;
      
      private static var shakeList:DictHash = new DictHash();
       
      
      public function ShakeUtil()
      {
         super();
      }
      
      public static function shake(param1:Boolean, param2:*, param3:uint, param4:uint, param5:Number, param6:Number, param7:Number = 0) : void
      {
         if(param2 == null)
         {
            return;
         }
         if(shakeList.containsKey(param2))
         {
            return;
         }
         switch(int(param3))
         {
            case 0:
               shakeUpDown(param1,param2,param4,param5,param6 / 1000);
               break;
            case 1:
               shakeLeftRight(param2,param4,param5,param6 / 1000);
               break;
            case 2:
               shakeRound(param1,param2,param4,param5,param6 / 1000);
               break;
            case 3:
               shakeRandom(param1,param2,param4,param5,param6 / 1000);
               break;
            case 4:
               shakeZoom(param2,param4,param5,param6 / 1000);
               break;
            case 5:
               shakeScale(param1,param2,param4,param5,param6 / 1000);
               break;
            case 6:
               shakeDegree(param1,param2,param4,param5,param6 / 1000,param7);
         }
      }
      
      public static function unshake(param1:*) : void
      {
         var _loc2_:* = null;
         if(shakeList.containsKey(param1))
         {
            _loc2_ = shakeList.getValue(param1);
            if(_loc2_.timelineLite != undefined)
            {
               (_loc2_.timelineLite as TimelineLite).clear();
            }
            if(_loc2_.interval != undefined)
            {
               clearInterval(uint(_loc2_.interval));
            }
            if(_loc2_.point != undefined)
            {
               param1.x = _loc2_.point.x;
               param1.y = _loc2_.point.y;
            }
            shakeList.remove(param1);
         }
      }
      
      public static function shakeLeftRight(param1:*, param2:uint, param3:int, param4:Number) : void
      {
         dis = param1;
         times = param2;
         offset = param3;
         speed = param4;
         var timeline:TimelineLite = new TimelineLite();
         var oldX:Number = dis.x;
         var i:int = 0;
         while(i < times)
         {
            var $offset:int = offset * (1 - i * 1 / times);
            if(i != times - 1)
            {
               timeline.append(new TweenLite(dis,speed,{"x":dis.x + (i % 2 == 0?$offset:-$offset)}));
            }
            else
            {
               timeline.append(new TweenLite(dis,speed,{
                  "x":dis.x + (i % 2 == 0?$offset:-$offset),
                  "onComplete":function():void
                  {
                     dis.x = oldX;
                     shakeList.remove(dis);
                  }
               }));
            }
            i = Number(i) + 1;
         }
         shakeList.put(dis,{"timelineLite":timeline});
         timeline.play();
      }
      
      public static function shakeUpDown(param1:Boolean, param2:*, param3:uint, param4:int, param5:Number, param6:Boolean = false) : void
      {
         $is2D = param1;
         dis = param2;
         times = param3;
         offset = param4;
         speed = param5;
         $isDamping = param6;
         var timeline:TimelineLite = new TimelineLite();
         var oldY:Number = dis.y;
         if($is2D)
         {
            offset = offset * -1;
         }
         var i:int = 0;
         while(i < times)
         {
            var $offset:int = offset * (1 - i * 1 / times);
            if(i != times - 1)
            {
               timeline.append(new TweenLite(dis,speed,{"y":dis.y + (i % 2 == 0?$offset:-$offset)}));
            }
            else
            {
               timeline.append(new TweenLite(dis,speed,{
                  "y":oldY,
                  "onComplete":function():void
                  {
                     dis.y = oldY;
                     shakeList.remove(dis);
                  }
               }));
            }
            i = Number(i) + 1;
         }
         shakeList.put(dis,{"timelineLite":timeline});
         timeline.play();
      }
      
      public static function shakeDegree(param1:Boolean, param2:*, param3:uint, param4:int, param5:Number, param6:Number) : void
      {
         $is2D = param1;
         dis = param2;
         times = param3;
         offset = param4;
         speed = param5;
         degree = param6;
         var timeline:TimelineLite = new TimelineLite();
         var oldY:Number = dis.y;
         var oldX:Number = dis.x;
         if($is2D)
         {
            offset = offset * -1;
         }
         var i:int = 0;
         while(i < times)
         {
            var $offset:int = offset * (1 - i * 1 / times);
            if(i != times - 1)
            {
               timeline.append(new TweenLite(dis,speed,{
                  "y":dis.y + (i % 2 == 0?$offset:-$offset) * Math.cos(degree + 90),
                  "x":dis.x + (i % 2 == 0?$offset:-$offset) * Math.sin(degree + 90)
               }));
            }
            else
            {
               timeline.append(new TweenLite(dis,speed,{
                  "y":dis.y + (i % 2 == 0?$offset:-$offset) * Math.cos(degree + 90),
                  "x":dis.x + (i % 2 == 0?$offset:-$offset) * Math.sin(degree + 90),
                  "onComplete":function():void
                  {
                     dis.y = oldY;
                     dis.x = oldX;
                     shakeList.remove(dis);
                  }
               }));
            }
            i = Number(i) + 1;
         }
         shakeList.put(dis,{"timelineLite":timeline});
         timeline.play();
      }
      
      public static function shakeScale(param1:Boolean, param2:*, param3:uint, param4:Number, param5:Number) : void
      {
         $is2D = param1;
         dis = param2;
         times = param3;
         offset = param4;
         speed = param5;
         var timeline:TimelineLite = new TimelineLite();
         var oldX:Number = dis.scaleX;
         var oldY:Number = dis.scaleY;
         if($is2D)
         {
            offset = offset * -1;
         }
         var i:int = 0;
         while(i < times)
         {
            var $offset:Number = offset * (1 - i * 1 / times);
            if(i != times - 1)
            {
               timeline.append(new TweenLite(dis,speed,{
                  "scaleX":dis.scaleX + (i % 2 == 0?$offset:Number(-$offset)),
                  "scaleY":dis.scaleY + (i % 2 == 0?$offset:Number(-$offset))
               }));
            }
            else
            {
               timeline.append(new TweenLite(dis,speed,{
                  "scaleX":dis.scaleX + (i % 2 == 0?$offset:Number(-$offset)),
                  "scaleY":dis.scaleY + (i % 2 == 0?$offset:Number(-$offset)),
                  "onComplete":function():void
                  {
                     dis.scaleX = oldX;
                     dis.scaleY = oldY;
                     shakeList.remove(dis);
                  }
               }));
            }
            i = Number(i) + 1;
         }
         shakeList.put(dis,{"timelineLite":timeline});
         timeline.play();
      }
      
      public static function shakeRound(param1:Boolean, param2:*, param3:uint, param4:int, param5:Number) : void
      {
         $is2D = param1;
         dis = param2;
         times = param3;
         offset = param4;
         speed = param5;
         var point:Point = new Point(dis.x,dis.y);
         var offsetXYArray:Array = [0,0];
         var num:int = 0;
         var interval:uint = setInterval(function():void
         {
            num = Number(num) + 1;
            offsetXYArray[num % 2] = num % 4 < 2?0:offset;
            if(num > times * 4 + 1)
            {
               clearInterval(interval);
               num = 0;
               shakeList.remove(dis);
            }
            if($is2D == false)
            {
               var _loc1_:int = 1;
               var _loc2_:* = offsetXYArray[_loc1_] * -1;
               offsetXYArray[_loc1_] = _loc2_;
            }
            dis.x = offsetXYArray[0] + point.x;
            dis.y = offsetXYArray[1] + point.y;
         },speed);
         shakeList.put(dis,{
            "interval":interval,
            "point":point
         });
      }
      
      public static function shakeRandom(param1:Boolean, param2:*, param3:uint, param4:int, param5:Number) : void
      {
         $is2D = param1;
         dis = param2;
         times = param3;
         offset = param4;
         speed = param5;
         var timeline:TimelineLite = new TimelineLite();
         var oldX:Number = dis.x;
         var oldY:Number = dis.y;
         var newX:Number = 0;
         var newY:Number = 0;
         var i:int = 0;
         while(i < times)
         {
            newX = oldX + (Math.random() > 0.5?offset:-offset);
            if($is2D == false)
            {
               newY = oldY + (Math.random() > 0.5?offset:-offset);
            }
            else
            {
               newY = oldY - (Math.random() > 0.5?offset:-offset);
            }
            if(i != times - 1)
            {
               timeline.append(new TweenMax(dis,speed,{
                  "x":newX,
                  "y":newY,
                  "ease":Sine.easeInOut,
                  "onComplete":function():void
                  {
                     dis.x = oldX;
                     dis.y = oldY;
                  }
               }));
            }
            else
            {
               timeline.append(new TweenMax(dis,speed,{
                  "x":newX,
                  "y":newY,
                  "ease":Sine.easeInOut,
                  "onComplete":function():void
                  {
                     dis.x = oldX;
                     dis.y = oldY;
                     shakeList.remove(dis);
                  }
               }));
            }
            i = Number(i) + 1;
         }
         shakeList.put(dis,{"timelineLite":timeline});
         timeline.play();
      }
      
      public static function shakeZoom(param1:*, param2:uint, param3:int, param4:Number) : void
      {
         dis = param1;
         times = param2;
         offset = param3;
         speed = param4;
         var timeline:TimelineLite = new TimelineLite();
         var oProjectionHeight:Number = dis.projectionHeight;
         var i:int = 0;
         while(i < times)
         {
            if(i != times - 1)
            {
               timeline.append(new TweenLite(dis,speed,{"projectionHeight":dis.projectionHeight + (i % 2 == 0?offset:-offset)}));
            }
            else
            {
               timeline.append(new TweenLite(dis,speed,{
                  "projectionHeight":dis.projectionHeight + (i % 2 == 0?offset:-offset),
                  "onComplete":function():void
                  {
                     dis.projectionHeight = oProjectionHeight;
                     shakeList.remove(dis);
                  }
               }));
            }
            i = Number(i) + 1;
         }
         shakeList.put(dis,{"timelineLite":timeline});
         timeline.play();
      }
   }
}
