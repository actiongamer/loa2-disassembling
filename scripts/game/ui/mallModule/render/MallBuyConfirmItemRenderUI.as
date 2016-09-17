package game.ui.mallModule.render
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class MallBuyConfirmItemRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="60" height="60">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_3" x="0" var="img_quality" y="0" sizeGrid="8,8,8,8" width="60" height="60"/>
			  <Image skin="png.a5.comps.img_block" x="3" y="3" width="54" height="54" var="img_icon"/>
			  <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_num" width="62" align="right" x="-5" y="41" style="普通说明" height="22"/>
			</WealthRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_num:Label = null;
      
      public function MallBuyConfirmItemRenderUI()
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
