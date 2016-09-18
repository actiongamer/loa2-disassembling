package nslm2.common.scene.multiLayer.mapEffects
{
   import nslm2.common.scene.multiLayer.BgLayerCtrlBase;
   import away3d.core.base.Object3D;
   import com.greensock.TweenLite;
   import morn.core.managers.timerMgrs.TimerHandlerVo;
   import nslm2.common.scene.multiLayer.BgLayer;
   import nslm2.common.scene.multiLayer.configs.BgLayerCtrlKindVo;
   
   public class BgLayerCtrl_1054 extends BgLayerCtrlBase
   {
       
      
      public var childParentLayer:Object3D;
      
      public var rotationZMax:Number;
      
      public var speed:int;
      
      private var _yaoLayar:Number = 0;
      
      public function BgLayerCtrl_1054(param1:BgLayer, param2:BgLayerCtrlKindVo)
      {
         super(param1,param2);
         childParentLayer = param1.childParent;
      }
      
      override public function play() : void
      {
         rotationZMax = 1.5;
         TweenLite.delayedCall(0.1,this.yao1);
      }
      
      private function doLoop(param1:TimerHandlerVo) : void
      {
      }
      
      override public function dispose() : void
      {
         TweenLite.killDelayedCallsTo(this.yao1);
         TweenLite.killTweensOf(this);
         super.dispose();
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
         childParentLayer.rotationZ = param1 * rotationZMax;
      }
   }
}
