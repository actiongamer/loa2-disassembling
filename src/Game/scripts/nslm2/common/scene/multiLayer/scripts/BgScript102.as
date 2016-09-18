package nslm2.common.scene.multiLayer.scripts
{
   import nslm2.common.scene.multiLayer.configs.BgScriptValue;
   import com.greensock.TweenLite;
   
   public class BgScript102 extends BgScriptBase
   {
       
      
      private var _yaoLayar:Number = 0;
      
      public function BgScript102()
      {
         super();
      }
      
      override public function start() : void
      {
         if(vo.max == null)
         {
            vo.max = new BgScriptValue();
            vo.max.value = 2;
         }
         if(vo.duration == null)
         {
            vo.duration = new BgScriptValue();
            vo.duration.value = 1.5;
         }
         yao1();
         TweenLite.delayedCall(vo.delay.newValue,this.yao1);
      }
      
      private function yao1() : void
      {
         TweenLite.to(this,vo.duration.value,{
            "yaoLayar":vo.max.newValue,
            "onComplete":yao2
         });
      }
      
      private function yao2() : void
      {
         TweenLite.to(this,vo.duration.value,{
            "yaoLayar":-vo.max.newValue,
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
         this.bgTarget.rotationZ = param1;
      }
      
      override public function dispose() : void
      {
         TweenLite.killDelayedCallsTo(this.yao1);
         TweenLite.killTweensOf(this);
      }
   }
}
