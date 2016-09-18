package game.ui.chapters
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class BoxAlertRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="356" height="238">
			  <Label text="本章获得星数需达到   1 后领取" autoSize="left" var="txt_des" width="230" height="46.61146518707275" style="重要提示橘黄" size="14" x="72" y="40" multiline="true" wordWrap="true"/>
			</View>;
       
      
      public var txt_des:Label = null;
      
      public function BoxAlertRenderUI()
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
