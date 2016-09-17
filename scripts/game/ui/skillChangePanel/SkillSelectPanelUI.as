package game.ui.skillChangePanel
{
   import morn.customs.components.PanelView;
   import morn.core.components.List;
   import game.ui.commons.comps.pageBars.PageBarS1UI;
   
   public class SkillSelectPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="220" height="384">
			  <PanelBgS3 width="220" height="381" bgStyle="1" showTabLine="false" frameVisible="true" x="0" y="3" showLightBottom="false" showLightTop="false"/>
			  <List x="34" y="45" repeatX="2" repeatY="3" var="list_items" spaceX="40" spaceY="9">
			    <SkillChangeRender name="render" runtime="game.ui.skillChangePanel.SkillChangeRenderUI"/>
			  </List>
			  <PageBarS1 x="63" y="332" var="pageBarRef" runtime="game.ui.commons.comps.pageBars.PageBarS1UI"/>
			</PanelView>;
       
      
      public var list_items:List = null;
      
      public var pageBarRef:PageBarS1UI = null;
      
      public function SkillSelectPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS1UI"] = PageBarS1UI;
         viewClassMap["game.ui.skillChangePanel.SkillChangeRenderUI"] = SkillChangeRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
