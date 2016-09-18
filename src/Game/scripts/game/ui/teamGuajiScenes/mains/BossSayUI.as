package game.ui.teamGuajiScenes.mains
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class BossSayUI extends View
   {
      
      protected static var uiView:XML = <View width="146" height="70">
			  <Image skin="png.uiTeamGuajis.气泡" x="-2" y="0"/>
			  <Label text="普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明" autoSize="none" x="3" y="7" style="普通说明" width="140" height="46" multiline="true" wordWrap="true" var="txt_talk"/>
			</View>;
       
      
      public var txt_talk:Label = null;
      
      public function BossSayUI()
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
