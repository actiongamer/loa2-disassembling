package nslm2.modules.funnies.pkCrossSer
{
   import nslm2.modules.Chapters.treasureBox.TreasureBoxCtrlBase;
   import flash.events.MouseEvent;
   import nslm2.modules.Chapters.treasureBox.TreasureBoxVo;
   import nslm2.modules.Chapters.TreasureBoxModuleVo;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import proto.CrossArenaGetLayerBoxReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.ProtocolStatusRes;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import com.greensock.TweenLite;
   import proto.CrossArenaBoxStatus;
   
   public class PKCrossBoxCtrl extends TreasureBoxCtrlBase
   {
       
      
      public var layer:int = 0;
      
      public function PKCrossBoxCtrl(param1:*, param2:* = null)
      {
         super(param1,param2);
      }
      
      override protected function onBoxClick(param1:MouseEvent) : void
      {
         var _loc3_:int = TreasureBoxVo(vo).state;
         super.onBoxClick(param1);
         vo.state = _loc3_;
         var _loc2_:TreasureBoxModuleVo = new TreasureBoxModuleVo(vo,moduleCloseHandler,rewardHandler);
         ModuleMgr.ins.showModule(40401,_loc2_);
      }
      
      override protected function rewardHandler() : void
      {
         var _loc1_:CrossArenaGetLayerBoxReq = new CrossArenaGetLayerBoxReq();
         _loc1_.layer = layer;
         ServerEngine.ins.send(4317,_loc1_,onGetReturn);
      }
      
      private function onGetReturn(param1:ProtocolStatusRes) : void
      {
         (this.vo as TreasureBoxVo).state = 3;
         this.moduleCloseState = 3;
         refreshBox();
         FloatUtil.showGetItemsDisplayPanel(this.vo.itemArr,null,null,0,false);
         TweenLite.delayedCall(0.5,ModuleMgr.ins.closeModule,[40401]);
         var _loc3_:Array = PKCrossModel.ins.info.boxes;
         var _loc5_:int = 0;
         var _loc4_:* = _loc3_;
         for each(var _loc2_ in _loc3_)
         {
            if(_loc2_.layer == layer)
            {
               _loc2_.status = 2;
               break;
            }
         }
      }
   }
}
