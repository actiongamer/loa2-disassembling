package org.specter3d.display.particle
{
   import org.specter3d.utils.HashMap;
   import com.greensock.TimelineLite;
   import flash.utils.clearInterval;
   import com.greensock.TweenLite;
   import flash.geom.Point;
   import flash.utils.setInterval;
   import com.greensock.TweenMax;
   import com.greensock.easing.Sine;
   
   public class Shake
   {
      
      private static var shakeList:HashMap = new HashMap();
       
      
      public function Shake()
      {
         super();
      }
      
      public static function shake(param1:*, param2:uint, param3:uint, param4:uint, param5:Number) : void
      {
         if(shakeList.containsKey(param1))
         {
            return;
         }
         switch(int(param2) - 1)
         {
            case 0:
               shakeRound(param1,param3,param4,param5);
               break;
            case 1:
               shakeUpDown(param1,param3,param4,param5 / 1000);
               break;
            case 2:
               shakeRandom(param1,param3,param4,param5 / 1000);
               break;
            case 3:
               shakeZoom(param1,param3,param4,param5 / 1000);
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
      
      public static function shakeUpDown(param1:*, param2:uint, param3:uint, param4:Number) : void
      {
         dis = param1;
         times = param2;
         offset = param3;
         speed = param4;
         var timeline:TimelineLite = new TimelineLite();
         var oldX:Number = dis.x;
         var oldY:Number = dis.y;
         var i:int = 0;
         while(i < times)
         {
            offset = offset * (1 - i * 0.25);
            if(i != times - 1)
            {
               timeline.append(new TweenLite(dis,speed,{"y":dis.y + (i % 2 == 0?offset:-offset)}));
            }
            else
            {
               timeline.append(new TweenLite(dis,speed,{
                  "y":dis.y + (i % 2 == 0?offset:-offset),
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
      
      public static function shakeRound(param1:*, param2:uint, param3:uint, param4:Number) : void
      {
         dis = param1;
         times = param2;
         offset = param3;
         speed = param4;
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
            dis.x = offsetXYArray[0] + point.x;
            dis.y = offsetXYArray[1] + point.y;
         },speed);
         shakeList.put(dis,{
            "interval":interval,
            "point":point
         });
      }
      
      public static function shakeRandom(param1:*, param2:uint, param3:uint, param4:Number) : void
      {
         dis = param1;
         times = param2;
         offset = param3;
         speed = param4;
         var timeline:TimelineLite = new TimelineLite();
         var oldX:Number = dis.x;
         var oldY:Number = dis.y;
         var newX:Number = 0;
         var newY:Number = 0;
         var i:int = 0;
         while(i < times)
         {
            newX = oldX + (Math.random() > 0.5?offset:-offset);
            newY = oldY + (Math.random() > 0.5?offset:-offset);
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
      
      public static function shakeZoom(param1:*, param2:uint, param3:uint, param4:Number) : void
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
