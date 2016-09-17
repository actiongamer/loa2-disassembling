package game.ui.TencentModule.render
{
   import morn.core.components.View;
   
   public class TencentFriendProgressRenderFakeUI extends View
   {
      
      protected static var uiView:XML = <View width="559" height="78">
			  <GRect fillAlpha="0.5" radius="6,6,6,6" lineAlpha="0.8" x="0" y="0" lineColor="0x0" lineThickness="2" height="78" width="559" fillColor="0xFFFFFF"/>
			</View>;
       
      
      public function TencentFriendProgressRenderFakeUI()
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
