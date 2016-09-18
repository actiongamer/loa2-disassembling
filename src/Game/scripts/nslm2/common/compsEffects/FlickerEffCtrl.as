package nslm2.common.compsEffects
{
   import com.mz.core.interFace.IDispose;
   import com.greensock.TweenLite;
   import com.greensock.easing.Sine;
   
   public class FlickerEffCtrl implements IDispose
   {
       
      
      private var target:Object;
      
      public var duration:Number;
      
      public function FlickerEffCtrl(param1:Object, param2:Number = 0.4)
      {
         super();
         this.target = param1;
         duration = param2;
         toUp();
      }
      
      public function pause() : void
      {
         TweenLite.killTweensOf(target);
      }
      
      public function resume() : void
      {
         toUp();
      }
      
      private function toUp() : void
      {
         TweenLite.to(target,duration,{
            "alpha":0,
            "onComplete":toDown,
            "ease":Sine.easeIn
         });
      }
      
      private function toDown() : void
      {
         TweenLite.to(target,duration,{
            "alpha":1,
            "onComplete":toUp,
            "ease":Sine.easeIn
         });
      }
      
      public function dispose() : void
      {
         TweenLite.killTweensOf(target);
         target = null;
      }
   }
}
