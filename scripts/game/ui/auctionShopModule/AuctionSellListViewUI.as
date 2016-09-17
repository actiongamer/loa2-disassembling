package game.ui.auctionShopModule
{
   import morn.core.components.View;
   import morn.core.components.List;
   import game.ui.auctionShopModule.render.AuctionListRenderUI;
   
   public class AuctionSellListViewUI extends View
   {
      
      protected static var uiView:XML = <View width="562" height="328">
			  <List repeatY="10" spaceY="4" var="list_item" x="0" y="0">
			    <AuctionListRender name="render" runtime="game.ui.auctionShopModule.render.AuctionListRenderUI"/>
			  </List>
			</View>;
       
      
      public var list_item:List = null;
      
      public function AuctionSellListViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.auctionShopModule.render.AuctionListRenderUI"] = AuctionListRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
