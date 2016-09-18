package game.ui.newYears.day51s.panels
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class TimeIsOverPanelUI extends View
   {
      
      protected static var uiView:XML = <View width="600" height="400">
			  <Image skin="png.uiFunnyCommon.img_overBg" x="140" y="32"/>
			  <Label text="本次的时间为：XXXXXXXXX" autoSize="none" x="165" y="254" style="普通说明" width="265" height="82" var="txt_over" multiline="true" wordWrap="true" align="center"/>
			  <Label text="\l300006068" autoSize="none" x="163" y="204" style="渐变_抽奖" width="265" height="82" multiline="true" wordWrap="true" align="center" rotation="-15"/>
			</View>;
       
      
      public var txt_over:Label = null;
      
      public function TimeIsOverPanelUI()
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
