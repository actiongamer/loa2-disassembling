package nslm2.modules.battles.battle
{
   import flash.display.DisplayObject;
   import flash.display.Shape;
   import com.mz.core.utils.DisplayUtils;
   import com.greensock.TweenMax;
   import com.greensock.TweenLite;
   import com.greensock.easing.Linear;
   
   public class HPTween
   {
       
      
      public function HPTween(param1:DisplayObject, param2:uint = 16711680, param3:Boolean = true)
      {
         bar = param1;
         color = param2;
         rightToLeft = param3;
         onCom = function():void
         {
            DisplayUtils.removeSelf(gr);
         };
         onUp = function():void
         {
            gr.x = bar.x + (bar.width - gr.width);
         };
         super();
         var maxW:Number = bar.parent.width;
         if(!bar.parent)
         {
            return;
         }
         var nHpWidth:Number = bar.width;
         var gr:Shape = new Shape();
         gr.graphics.clear();
         gr.graphics.beginFill(color);
         var pad:int = 10;
         gr.graphics.drawRect(0,0,nHpWidth,bar.height);
         gr.graphics.endFill();
         bar.parent.addChildAt(gr,0);
         var s:Number = 1 * nHpWidth / maxW;
         TweenMax.from(gr,0.15,{
            "colorTransform":{
               "tint":16777215,
               "tintAmount":1
            },
            "delay":0.05
         });
         if(rightToLeft)
         {
            gr.x = bar.x;
            TweenLite.to(gr,s,{
               "width":0,
               "onComplete":onCom,
               "ease":Linear.easeNone
            });
         }
         else
         {
            gr.x = bar.x + (bar.width - gr.width);
            TweenLite.to(gr,s,{
               "width":0,
               "onComplete":onCom,
               "onUpdate":onUp,
               "ease":Linear.easeNone
            });
         }
      }
   }
}
