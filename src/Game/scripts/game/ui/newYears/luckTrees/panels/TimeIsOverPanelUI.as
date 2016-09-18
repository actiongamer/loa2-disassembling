package game.ui.newYears.luckTrees.panels
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class TimeIsOverPanelUI extends View
   {
      
      protected static var uiView:XML = <View width="600" height="400">
			  <Image skin="png.uiLuckTree.img_overBg" x="140" y="32"/>
			  <Label text="本次的时间为：XXXXXXXXX" autoSize="none" x="154" y="255" style="普通说明" width="288" height="105" var="txt_over" multiline="true" wordWrap="true" align="center"/>
			  <Label x="218" y="191" style="渐变4" mouseEnabled="false" mouseChildren="false" size="30" var="titleTxt2" width="337" height="78" rotation="-13" text="\l60800038"/>
			</View>;
       
      
      public var txt_over:Label = null;
      
      public var titleTxt2:Label = null;
      
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
