package nslm2.common.scene.multiLayer.scripts
{
   import nslm2.common.scene.multiLayer.configs.BgScriptValue;
   import com.greensock.TweenLite;
   
   public class BgScript103 extends BgScriptBase
   {
       
      
      private var oriY:Number;
      
      private var _yaoLayar:Number = 0;
      
      public function BgScript103()
      {
         super();
      }
      
      override public function start() : void
      {
         oriY = this.bgTarget.y;
         if(vo.max == null)
         {
            vo.max = new BgScriptValue();
            vo.max.value = 1.5;
         }
         yao1();
         TweenLite.delayedCall(vo.delay.newValue,this.yao1);
      }
      
      private function yao1() : void
      {
         TweenLite.to(this,1.5,{
            "yaoLayar":1.4,
            "onComplete":yao2
         });
      }
      
      private function yao2() : void
      {
         TweenLite.to(this,1.5,{
            "yaoLayar":-1.4,
            "onComplete":yao1
         });
      }
      
      public function get yaoLayar() : Number
      {
         return _yaoLayar;
      }
      
      public function set yaoLayar(param1:Number) : void
      {
         _yaoLayar = param1;
         this.bgTarget.y = oriY + param1 * vo.max.newValue;
      }
      
      override public function dispose() : void
      {
         TweenLite.killDelayedCallsTo(this.yao1);
         TweenLite.killTweensOf(this);
      }
   }
}
