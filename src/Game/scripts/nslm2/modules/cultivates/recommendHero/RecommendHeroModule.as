package nslm2.modules.cultivates.recommendHero
{
   import game.ui.recommendHero.RecommendHeroModuleUI;
   
   public class RecommendHeroModule extends RecommendHeroModuleUI
   {
       
      
      public function RecommendHeroModule()
      {
         super();
         this.fadeViewId = 13000;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.tab_group.selectHandler = onTabChanged;
         this.tab_group.labels = RecommendHeroModel.ins.getRecLabel();
         this.panelBg.titleImgId = this.moduleId;
         this.list_task.dataSource = RecommendHeroModel.ins.getRecommendTeamList(this.tab_group.selectedIndex + 1);
         this.preShowCpl();
      }
      
      private function onTabChanged(param1:int) : void
      {
         this.list_task.dataSource = RecommendHeroModel.ins.getRecommendTeamList(param1 + 1);
         this.fadeIn(0,13000);
      }
   }
}
