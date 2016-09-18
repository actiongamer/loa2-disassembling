package nslm2.modules.battles.battlefields
{
   import game.ui.battlefield.BattlefieldRank.BattlefieldRankModuleUI;
   import morn.core.components.ViewStack;
   import nslm2.modules.battles.battlefields.consts.BattlefieldConsts;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   
   public class BattlefieldRankModule extends BattlefieldRankModuleUI
   {
       
      
      public var subViewStack:ViewStack;
      
      public function BattlefieldRankModule()
      {
         subViewStack = new ViewStack();
         super();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.titleImgId = this.moduleId;
         this.list_tab.dataSource = [1,2,3];
         this.list_tab.selectHandler = onTabChanged;
         this.subViewStack.subViewClasses = BattlefieldConsts.RANK_PANELS;
         this.list_tab.selectedIndex = 0;
         this.addChild(subViewStack);
         this.img_bg.skin = UrlLib.battlefieldUI("img_rankBg");
         this.preShowCpl();
      }
      
      private function onTabChanged(param1:int) : void
      {
         this.subViewStack.selectedIndex = param1;
      }
   }
}
