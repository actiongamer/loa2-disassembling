package nslm2.modules.foundations.recycle.view.panel.petReborn
{
   import game.ui.recycleModules.petReborn.RecSelectRebornPetPanelUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.cultivates.pet.model.PetModel;
   
   public class RecSelectRebornPetPanel extends RecSelectRebornPetPanelUI
   {
       
      
      public function RecSelectRebornPetPanel()
      {
         super();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(32000054);
         list_hero.dataSource = PetModel.ins.canRebornPetList;
         super.preShow(param1);
      }
   }
}
