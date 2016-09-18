package nslm2.common.compsEffects
{
   import flash.display.DisplayObject;
   import com.greensock.TweenLite;
   
   public class ScaleTweenEff
   {
       
      
      public function ScaleTweenEff()
      {
         super();
      }
      
      public function init(param1:DisplayObject, param2:Number, param3:Number, param4:Number = 1, param5:Object = null, param6:Boolean = false) : void
      {
         disp = param1;
         dur = param2;
         scale = param3;
         alpha = param4;
         ease = param5;
         isTo = param6;
         tweenComp = function():void
         {
            disp.visible = false;
            var _loc1_:* = disp.scaleZ;
            disp.scaleY = _loc1_;
            disp.scaleX = _loc1_;
            disp.x = ox;
            disp.y = oy;
            disp.width = ow;
            disp.height = oh;
            disp.alpha = oalpha;
         };
         var ox:Number = disp.x;
         var oy:Number = disp.y;
         var ow:Number = disp.width;
         var oh:Number = disp.height;
         var oscale:Number = disp.scaleX;
         var oalpha:Number = disp.alpha;
         if(disp.visible == false)
         {
            disp.visible = true;
         }
         var obj:Object = {
            "scaleX":scale,
            "scaleY":scale,
            "x":ox + (ow - ow * scale) / 2,
            "y":oy + (oh - oh * scale) / 2,
            "alpha":alpha
         };
         if(ease)
         {
            obj.ease = ease;
         }
         if(isTo)
         {
            obj.onComplete = tweenComp;
            TweenLite.to(disp,dur,obj);
         }
         else
         {
            TweenLite.from(disp,dur,obj);
         }
      }
   }
}
