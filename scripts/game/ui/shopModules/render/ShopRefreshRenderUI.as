package game.ui.shopModules.render
{
   import morn.core.components.View;
   import morn.core.components.Button;
   import morn.core.components.Label;
   
   public class ShopRefreshRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="102" height="102">
			  <Button skin="png.uiShop.btn_refresh" x="0" y="0" var="btn_refresh"/>
			  <Image skin="png.uiShop.img_refreshBg" x="-1.5" y="80"/>
			  <Label text="\l60300006" x="-36" y="84" height="18" style="小标题" width="174" align="center" var="txt_refresh"/>
			</View>;
       
      
      public var btn_refresh:Button = null;
      
      public var txt_refresh:Label = null;
      
      public function ShopRefreshRenderUI()
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
