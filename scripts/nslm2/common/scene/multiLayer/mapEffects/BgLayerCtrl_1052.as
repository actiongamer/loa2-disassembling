package nslm2.common.scene.multiLayer.mapEffects
{
   import nslm2.common.scene.multiLayer.BgLayerCtrlBase;
   import com.greensock.TweenLite;
   import com.greensock.easing.Sine;
   import nslm2.common.scene.multiLayer.BgLayer;
   import nslm2.common.scene.multiLayer.configs.BgLayerCtrlKindVo;
   
   public class BgLayerCtrl_1052 extends BgLayerCtrlBase
   {
       
      
      public var speed:int;
      
      private var _sway:Number = 0;
      
      public function BgLayerCtrl_1052(param1:BgLayer, param2:BgLayerCtrlKindVo)
      {
         super(param1,param2);
         speed = -200;
      }
      
      override public function play() : void
      {
         this.sway = -1;
         this.swayA();
      }
      
      private function swayA() : void
      {
         TweenLite.to(this,3,{
            "sway":1,
            "onComplete":swayB,
            "ease":Sine.easeInOut
         });
      }
      
      private function swayB() : void
      {
         TweenLite.to(this,3,{
            "sway":-1,
            "onComplete":swayA,
            "ease":Sine.easeInOut
         });
      }
      
      public function get sway() : Number
      {
         return _sway;
      }
      
      public function set sway(param1:Number) : void
      {
         _sway = param1;
         this.bgLayer.extraLayer.rotationZ = param1 * 15;
      }
      
      override public function dispose() : void
      {
         TweenLite.killTweensOf(this);
         super.dispose();
      }
   }
}
