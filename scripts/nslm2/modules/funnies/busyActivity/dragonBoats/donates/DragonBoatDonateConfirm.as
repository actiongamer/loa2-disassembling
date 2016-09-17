package nslm2.modules.funnies.busyActivity.dragonBoats.donates
{
   import game.ui.busyActivity.dragonBoats.donates.DragonBoatDonateConfirmUI;
   import nslm2.common.ui.components.comps2d.numBar.NumBarS1;
   import proto.DragonBoatDonatePanelRes.DonateInfo;
   import nslm2.utils.WealthUtil;
   import morn.customs.expands.MornExpandUtil;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.funnies.busyActivity.dragonBoats.services.DragonBoatService;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class DragonBoatDonateConfirm extends DragonBoatDonateConfirmUI
   {
       
      
      public var vo:DonateInfo;
      
      public function DragonBoatDonateConfirm()
      {
         super();
      }
      
      public function get numBar() : NumBarS1
      {
         return this.numBarUI as NumBarS1;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.titleImgId = this.moduleId;
         vo = param1 as DonateInfo;
         this.list_meterial.repeatX = 1;
         this.list_meterial.array = [WealthUtil.createStcItemVo(vo.itemId)];
         this.txt_score.text = "789";
         this.numBar.init(1,vo.donatedNum,1,1);
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         super.preShow(param1);
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.btn_get === _loc3_)
         {
            DragonBoatService.ins.protos.server_DRAGON_BOAT_DONATE(this.vo.id,this.vo.itemId,numBar.nowNum,vo.stamp,server_cpl);
         }
      }
      
      private function server_cpl() : void
      {
         ModuleMgr.ins.closeModule(13384);
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
      }
      
      override public function preClose(param1:Object = null) : void
      {
         super.preClose(param1);
      }
   }
}
