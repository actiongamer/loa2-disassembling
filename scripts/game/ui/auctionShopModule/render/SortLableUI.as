package game.ui.auctionShopModule.render
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Image;
   
   public class SortLableUI extends View
   {
      
      protected static var uiView:XML = <View width="100" height="22" buttonMode="true" mouseEnabled="false">
			  <Label text="竞拍价" autoSize="none" style="加底标题" width="84" height="20" align="right" x="2" y="2" var="txt_label" mouseChildren="false" mouseEnabled="false"/>
			  <Image skin="png.uiAuctionShop.img_sort" x="91" y="12" var="img_arrow" anchorX=".5" anchorY=".5" rotation="180"/>
			</View>;
       
      
      public var txt_label:Label = null;
      
      public var img_arrow:Image = null;
      
      public function SortLableUI()
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
