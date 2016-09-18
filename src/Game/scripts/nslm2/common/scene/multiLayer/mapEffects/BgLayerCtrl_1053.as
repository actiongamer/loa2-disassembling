package nslm2.common.scene.multiLayer.mapEffects
{
   import nslm2.common.scene.multiLayer.BgLayerCtrlBase;
   import nslm2.common.compsEffects.FloatUpDownEffCtrl;
   import com.greensock.TweenLite;
   import nslm2.common.scene.multiLayer.BgLayer;
   import nslm2.common.scene.multiLayer.configs.BgLayerCtrlKindVo;
   
   public class BgLayerCtrl_1053 extends BgLayerCtrlBase
   {
       
      
      private var ctrl:FloatUpDownEffCtrl;
      
      public function BgLayerCtrl_1053(param1:BgLayer, param2:BgLayerCtrlKindVo)
      {
         super(param1,param2);
         ctrl = new FloatUpDownEffCtrl();
      }
      
      override public function play() : void
      {
         if(this.bgLayer.configVo && ctrlKind.startDelay)
         {
            TweenLite.delayedCall(this.ctrlKind.startDelay / 1000,this.delayStart);
         }
         else
         {
            delayStart();
         }
      }
      
      private function delayStart() : void
      {
         ctrl.init(this.bgLayer.childObject3D,NaN,this.ctrlKind.floatMax,this.ctrlKind.floatMin);
      }
      
      override public function dispose() : void
      {
         TweenLite.killTweensOf(this.delayStart);
         if(ctrl)
         {
            ctrl.dispose();
            ctrl = null;
         }
         super.dispose();
      }
   }
}
