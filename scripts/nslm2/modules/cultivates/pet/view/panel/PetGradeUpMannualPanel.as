package nslm2.modules.cultivates.pet.view.panel
{
   import nslm2.modules.roleInfos.phaseUps.RoleShenjieTujianPanel;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.cultivates.pet.model.PetModel;
   import nslm2.common.ui.components.comps2d.pageBar.PageBarS2;
   import nslm2.modules.cultivates.pet.view.render.PetGradeUpMannualRender;
   
   public class PetGradeUpMannualPanel extends RoleShenjieTujianPanel
   {
       
      
      public function PetGradeUpMannualPanel()
      {
         super();
         this.list_info.itemRender = PetGradeUpMannualRender;
      }
      
      override public function updateInfo() : void
      {
         var _loc1_:Array = StcMgr.ins.getVoArrByColumnValue("static_hero_shengjie","kind",2);
         list_info.dataSource = _loc1_;
         list_info.page = PetModel.ins.crtPetInfo.grade - 1;
         (pageBar as PageBarS2).bindList(list_info);
      }
   }
}
