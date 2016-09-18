package nslm2.modules.cultivates.roleTeam.view.panel
{
   import game.ui.roleTeam.panel.SelectTeamHeroPanelUI;
   import nslm2.modules.footstones.newerGuideModules.INewerGuideGetComp;
   import nslm2.common.model.HeroModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.greensock.TweenLite;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import morn.core.components.Component;
   import nslm2.mgrs.stcMgrs.vos.StcGuideVo;
   import nslm2.modules.cultivates.roleTeam.view.render.SelectTeamHeroRender;
   import nslm2.common.ui.components.comps2d.pageBar.PageBarS1;
   
   public class SelectTeamMemberPanel extends SelectTeamHeroPanelUI implements INewerGuideGetComp
   {
      
      private static const NG_COMP_NAME:String = "list_hero_1";
       
      
      public function SelectTeamMemberPanel()
      {
         super();
         (this.pageBar as PageBarS1).bindList(this.list_hero);
      }
      
      public function show() : void
      {
         this.list_hero.dataSource = HeroModel.ins.notOnPosHeroList;
         App.render.renderAll();
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(999000084);
      }
      
      override public function dispose() : void
      {
         TweenLite.killDelayedCallsTo(HeroModel.ins.sortHeroList);
         super.dispose();
      }
      
      override public function fadeView_fadeInCpl() : void
      {
         super.fadeView_fadeInCpl();
         checkNg();
         if(HeroModel.ins.needSortPanelBaseInfoList)
         {
            TweenLite.delayedCall(0.3,HeroModel.ins.sortHeroList);
         }
         super.panelFadeInCpl();
      }
      
      private function checkNg() : void
      {
         NGUtil.checkModuleShow(30812,this);
      }
      
      public function getCompById(param1:String, param2:StcGuideVo) : Component
      {
         if(param1 == "list_hero_1")
         {
            return (list_hero.getCell(0) as SelectTeamHeroRender).btn_select;
         }
         return null;
      }
   }
}
