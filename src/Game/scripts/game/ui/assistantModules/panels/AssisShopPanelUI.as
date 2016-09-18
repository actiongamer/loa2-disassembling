package game.ui.assistantModules.panels
{
   import morn.customs.components.PanelView;
   import morn.core.components.Image;
   import morn.core.components.Tab;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import morn.core.components.List;
   import morn.core.components.Button;
   import game.ui.assistantModules.renders.AssisShopRenderUI;
   
   public class AssisShopPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="690" height="515">
			  <PanelBg x="0" y="0" width="690" height="515">
			    <Image skin="png.a5.bgs.panelBgs.raw.面板分割线" x="4" y="63" var="img_tabLine" width="620" left="12" right="12"/>
			  </PanelBg>
			  <Image skin="png.a5.bgs.panelBgs.底板上小黑底框九宫格" x="20" y="74" sizeGrid="20,20,20,20" width="650" height="396"/>
			  <Tab labels="竞技场商店,工会商店,装备商店,圣物商店,荣誉商店" x="22" y="39" selectedIndex="0" space="2" var="shopTab" style="TAB长"/>
			  <PageBarS2 x="269.5" y="476" var="pageView" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			  <List x="35" y="84.5" repeatX="2" repeatY="3" spaceX="0" spaceY="0" var="itemList">
			    <AssisShopRender name="render" runtime="game.ui.assistantModules.renders.AssisShopRenderUI"/>
			  </List>
			  <Button label="\l60200009" x="568" style="按钮中绿" y="476" var="saveBtn"/>
			</PanelView>;
       
      
      public var img_tabLine:Image = null;
      
      public var shopTab:Tab = null;
      
      public var pageView:PageBarS2UI = null;
      
      public var itemList:List = null;
      
      public var saveBtn:Button = null;
      
      public function AssisShopPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.assistantModules.renders.AssisShopRenderUI"] = AssisShopRenderUI;
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
