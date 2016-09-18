package nslm2.modules.cultivates.roleTeam.view.panel
{
   import game.ui.roleTeam.panel.SelectYuanJunPanelUI;
   import nslm2.common.model.HeroModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.ui.components.comps2d.pageBar.PageBarS1;
   
   public class SelectYuanJunPanel extends SelectYuanJunPanelUI
   {
       
      
      public function SelectYuanJunPanel()
      {
         super();
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(999000085);
         this.txt_tip.visible = false;
         (this.pageBar as PageBarS1).bindList(this.list_hero);
      }
      
      public function show() : void
      {
         this.list_hero.dataSource = HeroModel.ins.getNotInYuanJunHeroList();
      }
   }
}
