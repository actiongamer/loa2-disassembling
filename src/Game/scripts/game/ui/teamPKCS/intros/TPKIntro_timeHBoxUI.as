package game.ui.teamPKCS.intros
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class TPKIntro_timeHBoxUI extends View
   {
      
      protected static var uiView:XML = <View width="325" height="20">
			  <Label text="time" autoSize="none" x="0" y="0" style="普通说明" multiline="false" wordWrap="false" var="txt_t3_1" leading="0" width="85" height="20" align="center"/>
			  <Label text="time" autoSize="none" x="82" y="0" style="普通说明" multiline="false" wordWrap="false" var="txt_t3_2" leading="0" width="85" height="20" align="center"/>
			  <Label text="time" autoSize="none" x="160" y="0" style="普通说明" multiline="false" wordWrap="false" var="txt_t3_3" leading="0" width="85" height="20" align="center"/>
			  <Label text="time" autoSize="none" x="240" y="0" style="普通说明" multiline="false" wordWrap="false" var="txt_t3_4" leading="0" width="85" height="20" align="center"/>
			</View>;
       
      
      public var txt_t3_1:Label = null;
      
      public var txt_t3_2:Label = null;
      
      public var txt_t3_3:Label = null;
      
      public var txt_t3_4:Label = null;
      
      public function TPKIntro_timeHBoxUI()
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
