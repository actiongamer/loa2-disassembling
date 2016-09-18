package nslm2.modules.roleInfos.phaseUps
{
   import game.ui.roleInfos.phaseUps.ShenJieTuJianPanelUI;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.roleInfos.RoleInfoModel;
   import nslm2.common.ui.components.comps2d.pageBar.PageBarS2;
   
   public class RoleShenjieTujianPanel extends ShenJieTuJianPanelUI
   {
       
      
      public function RoleShenjieTujianPanel()
      {
         super();
         this.panelBg.titleImgId = 30105;
      }
      
      public function updateInfo() : void
      {
         var _loc1_:Array = StcMgr.ins.getVoArrByColumnValue("static_hero_shengjie","kind",1);
         list_info.dataSource = _loc1_;
         list_info.page = RoleInfoModel.ins.heroInfo.baseInfo.sjLevel - 1;
         (pageBar as PageBarS2).bindList(list_info);
      }
   }
}
