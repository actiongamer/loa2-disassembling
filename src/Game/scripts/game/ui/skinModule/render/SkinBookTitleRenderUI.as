package game.ui.skinModule.render
{
   import morn.core.components.View;
   import morn.core.components.Image;
   
   public class SkinBookTitleRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="113" height="123">
			  <Image skin="png.uiSkin.img_icon" x="10" y="10" var="img_normal"/>
			  <Image skin="png.uiSkin.img_iconselected" x="0" y="0" name="selectBoxAll" var="img_selected"/>
			</View>;
       
      
      public var img_normal:Image = null;
      
      public var img_selected:Image = null;
      
      public function SkinBookTitleRenderUI()
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
