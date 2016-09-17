package game.ui.petModule.star
{
   import morn.customs.components.PanelView;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import morn.core.components.List;
   import game.ui.petModule.comps.PetStarPreViewListRenderUI;
   
   public class PetStarPreViewPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView visible="true" mouseEnabled="true" mouseChildren="true" width="352" height="430">
			  <PanelBgS3 x="7" y="4" width="339" height="427" showLightBottom="true" frameStyle="1" frameVisible="true"/>
			  <PageBarS2 x="105.5" y="384" var="pageBarUI" centerX="0" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			  <List x="66" y="40" var="list_data">
			    <PetStarPreViewListRender name="render" runtime="game.ui.petModule.comps.PetStarPreViewListRenderUI"/>
			  </List>
			</PanelView>;
       
      
      public var pageBarUI:PageBarS2UI = null;
      
      public var list_data:List = null;
      
      public function PetStarPreViewPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         viewClassMap["game.ui.petModule.comps.PetStarPreViewListRenderUI"] = PetStarPreViewListRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
