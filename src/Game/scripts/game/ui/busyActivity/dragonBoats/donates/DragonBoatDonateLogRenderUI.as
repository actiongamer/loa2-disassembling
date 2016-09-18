package game.ui.busyActivity.dragonBoats.donates
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class DragonBoatDonateLogRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="280" height="40">
			  <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_time" width="51" align="left" x="0" y="0" backgroundColor="0xcfbeaf" height="27" style="普通说明" multiline="true" wordWrap="true" size="14"/>
			  <Label text="999\n999" stroke="0xffffff" mouseEnabled="false" var="txt_content" width="478" align="left" x="46" backgroundColor="0xcfbeaf" height="40" style="普通说明" multiline="true" wordWrap="true" y="0"/>
			</View>;
       
      
      public var txt_time:Label = null;
      
      public var txt_content:Label = null;
      
      public function DragonBoatDonateLogRenderUI()
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
