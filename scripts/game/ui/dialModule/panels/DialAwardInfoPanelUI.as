package game.ui.dialModule.panels
{
   import morn.core.components.View;
   import morn.customs.components.Placeholder;
   import morn.core.components.Label;
   
   public class DialAwardInfoPanelUI extends View
   {
      
      protected static var uiView:XML = <View width="195" height="120">
			  <Image skin="png.uiDialModules.img_awardBg" x="-4" y="-31"/>
			  <Image skin="png.uiDialModules.img_awardTitle" x="3" y="8"/>
			  <Placeholder width="205" height="66" x="-5" y="34" var="txt_horseLamp"/>
			  <Label text="\l60800031" autoSize="none" x="21" y="13" style="小标题" width="149" height="19" var="txt_over" multiline="true" wordWrap="true" align="center"/>
			</View>;
       
      
      public var txt_horseLamp:Placeholder = null;
      
      public var txt_over:Label = null;
      
      public function DialAwardInfoPanelUI()
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
