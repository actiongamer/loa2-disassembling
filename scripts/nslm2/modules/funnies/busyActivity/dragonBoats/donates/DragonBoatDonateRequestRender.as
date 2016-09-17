package nslm2.modules.funnies.busyActivity.dragonBoats.donates
{
   import game.ui.busyActivity.dragonBoats.donates.DragonBoatDonateRequestRenderUI;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.funnies.busyActivity.dragonBoats.services.DragonBoatService;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import morn.customs.expands.MornExpandUtil;
   
   public class DragonBoatDonateRequestRender extends DragonBoatDonateRequestRenderUI
   {
       
      
      public function DragonBoatDonateRequestRender()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.btn_request === _loc3_)
         {
            DragonBoatService.ins.protos.server_DRAGON_BOAT_REQ_DONATE(this.materialId,1,server_cpl);
         }
      }
      
      public function get materialId() : int
      {
         return this.dataSource as int;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(this.materialId > 0)
         {
            this.render_item.wealthVo = WealthUtil.createStcItemVo(this.materialId,1);
            this.txt_num.text = BagModel.ins.getStcCount(this.materialId).toString();
            this.txt_count.text = DragonBoatService.ins.stcModel.priceMode.hasDonatedLimit.toString();
         }
      }
      
      private function server_cpl() : void
      {
         ModuleMgr.ins.closeModule(13385);
      }
   }
}
