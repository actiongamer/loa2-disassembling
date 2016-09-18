package nslm2.common.compsEffects
{
   import com.mz.core.interFace.IDispose;
   import com.greensock.TweenLite;
   import com.mz.core.utils.MathUtil;
   
   public class FloatUpDownEffCtrl implements IDispose
   {
       
      
      private var target:Object;
      
      public var initY:Number;
      
      public var floatMax:Number;
      
      public var floatMin:Number;
      
      public var duration:Number = 0.9;
      
      public function FloatUpDownEffCtrl()
      {
         super();
      }
      
      public function config(param1:Number = 0.9) : FloatUpDownEffCtrl
      {
         duration = param1;
         return this;
      }
      
      public function init(param1:Object, param2:Number = NaN, param3:Number = 4, param4:Number = 2) : FloatUpDownEffCtrl
      {
         this.target = param1;
         if(isNaN(param2))
         {
            initY = param1.y;
         }
         else
         {
            initY = param2;
         }
         floatMax = param3;
         floatMin = param4;
         toUp();
         return this;
      }
      
      public function reStart() : void
      {
         toUp();
      }
      
      private function toUp() : void
      {
         TweenLite.to(target,duration,{
            "y":initY - MathUtil.randomInt(floatMax,floatMin),
            "onComplete":toDown
         });
      }
      
      private function toDown() : void
      {
         TweenLite.to(target,duration,{
            "y":initY + MathUtil.randomInt(floatMax,floatMin),
            "onComplete":toUp
         });
      }
      
      public function dispose() : void
      {
         if(target)
         {
            target.y = initY;
         }
         TweenLite.killTweensOf(target);
         target = null;
      }
      
      public function play() : void
      {
         toUp();
      }
      
      public function pause() : void
      {
         if(target)
         {
            target.y = initY;
         }
         TweenLite.killTweensOf(target);
      }
   }
}
