package game.ui.dialModule.panels
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class DialOverPanelUI extends View
   {
      
      protected static var uiView:XML = <View width="600" height="400">
			  <Image skin="png.uiDialModules.img_overBg" x="140" y="32"/>
			  <Label text="本次幸运转盘的时间为：XXXXXXXXX" autoSize="none" x="165" y="254" style="普通说明" width="265" height="82" var="txt_over" multiline="true" wordWrap="true"/>
			  <Label x="218" y="191" style="渐变4" mouseEnabled="false" mouseChildren="false" size="30" var="titleTxt2" width="337" height="78" rotation="-13" text="\l60800038"/>
			</View>;
       
      
      public var txt_over:Label = null;
      
      public var titleTxt2:Label = null;
      
      public function DialOverPanelUI()
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
