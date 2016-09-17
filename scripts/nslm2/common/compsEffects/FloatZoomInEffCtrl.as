package nslm2.common.compsEffects
{
   import com.mz.core.interFace.IDispose;
   import flash.utils.Dictionary;
   import morn.core.components.Component;
   import com.greensock.TweenLite;
   import com.greensock.easing.Sine;
   import morn.core.handlers.Handler;
   
   public class FloatZoomInEffCtrl implements IDispose
   {
      
      public static const lib:Dictionary = new Dictionary();
       
      
      private var target:Component;
      
      public var initScale:Number;
      
      public var initX:Number;
      
      public var initY:Number;
      
      private var handler;
      
      public function FloatZoomInEffCtrl(param1:Component, param2:Number = NaN)
      {
         super();
         this.target = param1;
         if(lib[target])
         {
            (lib[target] as FloatZoomInEffCtrl).stop();
         }
         lib[target] = this;
         if(isNaN(param2))
         {
            initScale = param1.scale;
         }
         else
         {
            initScale = param2;
         }
         initX = target.x;
         initY = target.y;
         toBig();
      }
      
      public function addHandler(param1:*) : void
      {
         handler = param1;
      }
      
      private function toBig() : void
      {
         lib[target] = this;
         TweenLite.to(target,0.3,{
            "scale":initScale + 0.8,
            "y":target.y - target.height * 0.4,
            "x":initX - target.width * 0.4,
            "onComplete":toSmall,
            "ease":Sine.easeIn
         });
      }
      
      private function toSmall() : void
      {
         TweenLite.to(target,0.3,{
            "scale":initScale,
            "y":initY,
            "x":initX,
            "onComplete":dispose,
            "ease":Sine.easeIn
         });
      }
      
      public function stop() : void
      {
         TweenLite.killTweensOf(target);
         target.scale = initScale;
         target.x = initX;
         target.y = initY;
      }
      
      public function dispose() : void
      {
         if(lib[target] == this)
         {
            delete lib[target];
         }
         if(handler)
         {
            Handler.execute(handler);
            handler = null;
         }
         TweenLite.killTweensOf(Component);
         target = null;
      }
   }
}
