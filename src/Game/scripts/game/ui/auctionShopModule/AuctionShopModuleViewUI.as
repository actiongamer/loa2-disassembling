package game.ui.auctionShopModule
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Tab;
   import morn.core.components.Label;
   
   public class AuctionShopModuleViewUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="824" height="554">
			  <PanelBg x="10" y="4" width="804" height="551" showTabLine="true"/>
			  <Image skin="png.uiAuctionShop.bg1" x="22" y="74"/>
			  <Image skin="png.uiAuctionShop.bg2" x="242" y="74"/>
			  <Tab labels=",," x="35" y="44" style="TAB长" var="tabBar" selectedIndex="0"/>
			  <Label text="\l30610004" autoSize="none" x="496" y="44" style="普通说明" align="right" width="300" height="20" var="txt_openTime"/>
			</PopModuleView>;
       
      
      public var tabBar:Tab = null;
      
      public var txt_openTime:Label = null;
      
      public function AuctionShopModuleViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         createView(uiView);
      }
   }
}
