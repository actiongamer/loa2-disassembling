package game.ui.auctionShopModule.render
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class AuctionItemListRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="62" height="61" mouseChildren="false">
			  <Image skin="png.a5.bgs.listRenderBgs.renderBgS3Selected" sizeGrid="8,8,8,8" width="62" height="62" x="1" y="0" mouseEnabled="false" mouseChildren="false" var="img_selected"/>
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" x="7" y="6" var="img_quality" sizeGrid="6,6,6,6" width="50" height="50"/>
			  <Image skin="png.comp.image" x="10" y="9" var="img_icon" width="44" height="44"/>
			  <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_num" width="54" align="right" x="2" y="38" backgroundColor="0xcfbeaf" style="普通说明" mouseChildren="false"/>
			</WealthRender>;
       
      
      public var img_selected:Image = null;
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_num:Label = null;
      
      public function AuctionItemListRenderUI()
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
