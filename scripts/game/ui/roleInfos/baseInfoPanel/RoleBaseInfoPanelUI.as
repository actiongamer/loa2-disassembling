package game.ui.roleInfos.baseInfoPanel
{
   import morn.customs.components.PanelView;
   import game.ui.roleInfos.equipPanels.RoleDetailPropPanelUI;
   import game.ui.commons.icons.PlayerTitleRenderUI;
   
   public class RoleBaseInfoPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="798" height="481">
			  <RoleDetailPropPanel x="442" y="33" var="panel_baseInfo" runtime="game.ui.roleInfos.equipPanels.RoleDetailPropPanelUI"/>
			  <PlayerTitleRender x="99" y="33" var="playerTitleRender" runtime="game.ui.commons.icons.PlayerTitleRenderUI"/>
			</PanelView>;
       
      
      public var panel_baseInfo:RoleDetailPropPanelUI = null;
      
      public var playerTitleRender:PlayerTitleRenderUI = null;
      
      public function RoleBaseInfoPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.PlayerTitleRenderUI"] = PlayerTitleRenderUI;
         viewClassMap["game.ui.roleInfos.equipPanels.RoleDetailPropPanelUI"] = RoleDetailPropPanelUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
