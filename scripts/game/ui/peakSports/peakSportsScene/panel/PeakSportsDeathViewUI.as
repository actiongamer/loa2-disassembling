package game.ui.peakSports.peakSportsScene.panel
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Box;
   import morn.core.components.Label;
   
   public class PeakSportsDeathViewUI extends View
   {
      
      protected static var uiView:XML = <View width="1318" height="500">
			  <Image skin="png.uiPeakSports.黑" x="0" y="0" sizeGrid="5,5,5,5" width="1318" height="500" var="maskImage" alpha="0.3"/>
			  <Box x="0" y="0" var="itemBox">
			    <Image skin="png.uiPeakSports.死亡模式三角" x="516.5" y="100" centerX="0" var="triangle"/>
			    <Image skin="png.uiPeakSports.死亡模式右部分" x="612" y="99" var="rightBar"/>
			    <Image skin="png.uiPeakSports.死亡模式左部分" y="196" var="leftBar"/>
			    <Image skin="png.uiPeakSports.死亡模式线" x="441" var="light1"/>
			    <Image skin="png.uiPeakSports.死亡模式线2" x="553" y="68" var="light2"/>
			    <Image skin="png.uiPeakSports.死亡模式线" x="441" var="lightMask1" y="0"/>
			    <Image skin="png.uiPeakSports.死亡模式线2" x="553" y="68" var="lightMask2"/>
			    <Label text="死亡模式" autoSize="none" x="358.5" y="206" style="渐变红" width="601" height="82" align="center" size="70" bold="true" centerX="0" var="titleTxt"/>
			    <Label text="倒计时：60秒" autoSize="none" x="358.5" y="301" style="渐变橙" width="601" height="40" align="center" size="30" bold="true" centerX="0" var="timeTxt"/>
			  </Box>
			</View>;
       
      
      public var maskImage:Image = null;
      
      public var itemBox:Box = null;
      
      public var triangle:Image = null;
      
      public var rightBar:Image = null;
      
      public var leftBar:Image = null;
      
      public var light1:Image = null;
      
      public var light2:Image = null;
      
      public var lightMask1:Image = null;
      
      public var lightMask2:Image = null;
      
      public var titleTxt:Label = null;
      
      public var timeTxt:Label = null;
      
      public function PeakSportsDeathViewUI()
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
