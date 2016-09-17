package game.ui.roleInfos.equipPanels
{
   import morn.customs.components.PanelView;
   import game.ui.commons.comps.pageBars.PageBarS1UI;
   import morn.customs.components.WealthList;
   import morn.core.components.List;
   
   public class RoleSelectEquipPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView var="equipSelectPanel" width="372" height="278">
			  <PanelBgS3 x="0" y="0" width="372" height="278" panelDragEnabled="false"/>
			  <PageBarS1 x="139" y="228" var="pageBar" runtime="game.ui.commons.comps.pageBars.PageBarS1UI"/>
			  <WealthList x="44" y="50" repeatX="4" repeatY="2" spaceX="28" var="list_equipSelect" spaceY="36" visible="true">
			    <RoleSelectEquipRender name="render" runtime="game.ui.roleInfos.equipPanels.RoleSelectEquipRenderUI"/>
			  </WealthList>
			  <List x="44" y="50" repeatX="4" repeatY="2" spaceX="28" var="list_petSelect" spaceY="36" visible="true">
			    <RoleSelectPetRender name="render" runtime="game.ui.roleInfos.equipPanels.RoleSelectPetRenderUI"/>
			  </List>
			</PanelView>;
       
      
      public var equipSelectPanel:PanelView = null;
      
      public var pageBar:PageBarS1UI = null;
      
      public var list_equipSelect:WealthList = null;
      
      public var list_petSelect:List = null;
      
      public function RoleSelectEquipPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS1UI"] = PageBarS1UI;
         viewClassMap["game.ui.roleInfos.equipPanels.RoleSelectEquipRenderUI"] = RoleSelectEquipRenderUI;
         viewClassMap["game.ui.roleInfos.equipPanels.RoleSelectPetRenderUI"] = RoleSelectPetRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
