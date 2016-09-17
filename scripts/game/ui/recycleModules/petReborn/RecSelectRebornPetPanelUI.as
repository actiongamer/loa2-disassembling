package game.ui.recycleModules.petReborn
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.List;
   
   public class RecSelectRebornPetPanelUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="548" height="375">
			  <PanelBgS3 width="548" height="375" frameStyle="2"/>
			  <List x="20" y="49" repeatX="2" repeatY="3" spaceX="3" width="510" height="300" var="list_hero" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3">
			    <RecSelectRebornPetRender name="render" runtime="game.ui.recycleModules.petReborn.RecSelectRebornPetRenderUI"/>
			  </List>
			</PopModuleView>;
       
      
      public var list_hero:List = null;
      
      public function RecSelectRebornPetPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.recycleModules.petReborn.RecSelectRebornPetRenderUI"] = RecSelectRebornPetRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
