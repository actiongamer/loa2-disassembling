package game.ui.playerHeaders
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class CardInfoRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="32" height="50">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" x="0" y="0" var="img_quality" sizeGrid="6,6,6,6" width="32" height="32"/>
			  <Image skin="png.comp.image" x="3" y="3" var="img_icon" width="26" height="26"/>
			  <Label text="1000" stroke="0xffffff" mouseEnabled="false" var="txt_desc" backgroundColor="0xcfbeaf" align="center" x="-10.5" y="32" width="53" height="20" style="普通绿色" mouseChildren="false"/>
			</View>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_desc:Label = null;
      
      public function CardInfoRenderUI()
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
