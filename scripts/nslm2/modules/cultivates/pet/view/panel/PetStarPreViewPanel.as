package nslm2.modules.cultivates.pet.view.panel
{
   import game.ui.petModule.star.PetStarPreViewPanelUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.cultivates.pet.model.PetModel;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   
   public class PetStarPreViewPanel extends PetStarPreViewPanelUI
   {
       
      
      public function PetStarPreViewPanel()
      {
         super();
      }
      
      public function updateInfo(param1:Object = null) : void
      {
         panelBg.txt_titleName.text = LocaleMgr.ins.getStr(32000012);
         var _loc2_:int = param1;
         var _loc3_:Array = StcMgr.ins.getVoArrByColumnValue("static_pet_star","node",_loc2_);
         _loc3_.sortOn("level",16);
         _loc3_.shift();
         list_data.dataSource = _loc3_;
         list_data.page = PetModel.ins.crtPetInfo.star - 1;
         (pageBarUI as IPageBar).bindList(list_data);
      }
   }
}
