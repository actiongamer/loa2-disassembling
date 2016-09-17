package nslm2.common.scene.multiLayer.mapEffects
{
   import nslm2.common.scene.multiLayer.BgLayerCtrlBase;
   import morn.core.managers.timerMgrs.TimerManager;
   import morn.core.managers.timerMgrs.TimerHandlerVo;
   import nslm2.common.scene.multiLayer.BgLayer;
   import nslm2.common.scene.multiLayer.configs.BgLayerCtrlKindVo;
   
   public class BgLayerCtrl_1051 extends BgLayerCtrlBase
   {
       
      
      public var speed:int;
      
      public function BgLayerCtrl_1051(param1:BgLayer, param2:BgLayerCtrlKindVo)
      {
         super(param1,param2);
         speed = this.ctrlKind.speed;
      }
      
      override public function play() : void
      {
         TimerManager.ins.doFrameLoop(1,this.doLoop);
      }
      
      private function doLoop(param1:TimerHandlerVo) : void
      {
         if(this.bgLayer.childParent != this.bgLayer)
         {
            this.bgLayer.childParent.x = this.bgLayer.childParent.x + param1.overTimeMs * speed / 1000;
         }
         else if(this.bgLayer.tileImg)
         {
            this.bgLayer.tileImg.repeatStartX = this.bgLayer.tileImg.repeatStartX + param1.overTimeMs * speed / 1000;
         }
         else
         {
            this.bgLayer.img3D.x = this.bgLayer.img3D.x + param1.overTimeMs * speed / 1000;
         }
      }
      
      override public function dispose() : void
      {
         TimerManager.ins.clearTimer(this.doLoop);
         super.dispose();
      }
   }
}
