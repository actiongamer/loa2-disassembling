package nslm2.modules.funnies.busyActivity.dragonBoats.donates
{
   import game.ui.busyActivity.dragonBoats.donates.DragonBoatDonateRequestPanelUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.funnies.busyActivity.dragonBoats.services.DragonBoatService;
   
   public class DragonBoatDonateRequestPanel extends DragonBoatDonateRequestPanelUI
   {
       
      
      public function DragonBoatDonateRequestPanel()
      {
         super();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.titleImgId = this.moduleId;
         this.txt_list_title_1.text = LocaleMgr.ins.getStr(0);
         this.txt_list_title_2.text = LocaleMgr.ins.getStr(1);
         this.txt_list_title_3.text = LocaleMgr.ins.getStr(2);
         this.txt_list_title_4.text = LocaleMgr.ins.getStr(3);
         this.list_material.array = DragonBoatService.ins.stcModel.materialIdArr;
         super.preShow(param1);
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
