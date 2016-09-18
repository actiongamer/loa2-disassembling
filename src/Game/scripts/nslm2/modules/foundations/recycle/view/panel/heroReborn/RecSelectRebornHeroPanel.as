package nslm2.modules.foundations.recycle.view.panel.heroReborn
{
   import game.ui.recycleModules.heroReborn.RecSelectRebornHeroPanelUI;
   import nslm2.modules.foundations.recycle.model.RecycleModel;
   
   public class RecSelectRebornHeroPanel extends RecSelectRebornHeroPanelUI
   {
       
      
      private var recModel:RecycleModel;
      
      public function RecSelectRebornHeroPanel()
      {
         recModel = RecycleModel.ins;
         super();
         this.panelBg.titleImgId = 11301;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         if(param1)
         {
            list_hero.dataSource = param1 as Array;
         }
         else
         {
            list_hero.dataSource = recModel.rebornHeroList;
         }
         super.preShow(param1);
      }
   }
}
