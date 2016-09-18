package game.ui.recycleModules.treasureReborn
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.List;
   import game.ui.recycleModules.render.RecSelectRebornEquipRenderUI;
   import game.ui.recycleModules.render.RecSelectRebornTreasureRenderUI;
   
   public class RecSelectRebornTreasurePanelUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="548" height="375">
			  <PanelBgS3 width="548" height="375" frameStyle="2"/>
			  <List x="20" y="49" repeatX="2" repeatY="3" spaceX="3" width="510" height="300" var="list_hero" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3">
			    <RecSelectRebornTreasureRender name="render" runtime="game.ui.recycleModules.render.RecSelectRebornTreasureRenderUI"/>
			  </List>
			  <List x="20" y="49" repeatX="2" repeatY="3" spaceX="3" width="510" height="300" var="list_equip" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3">
			    <RecSelectRebornEquipRender name="render" runtime="game.ui.recycleModules.render.RecSelectRebornEquipRenderUI"/>
			  </List>
			</PopModuleView>;
       
      
      public var list_hero:List = null;
      
      public var list_equip:List = null;
      
      public function RecSelectRebornTreasurePanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.recycleModules.render.RecSelectRebornEquipRenderUI"] = RecSelectRebornEquipRenderUI;
         viewClassMap["game.ui.recycleModules.render.RecSelectRebornTreasureRenderUI"] = RecSelectRebornTreasureRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
