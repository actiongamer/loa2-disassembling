package game.ui.peakSports.peakSportsScene.panel
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Box;
   
   public class PeakSportsSceneTopPanelUI extends View
   {
      
      protected static var uiView:XML = <View width="670" height="132">
			  <Image skin="png.uiPeakSports.上方阵营" x="0" y="0"/>
			  <Image skin="png.uiPeakSports.绿阵营logo" x="80.5" y="0"/>
			  <Image skin="png.uiPeakSports.蓝阵营logo" x="527.5"/>
			  <Label text="战场时间: 10:00" autoSize="none" x="232.5" y="36" style="渐变1" width="205" height="26" align="center" size="18" var="timeTxt" centerX="0"/>
			  <Label text="死亡模式" autoSize="none" x="231.5" y="3" style="渐变红" width="205" height="26" align="center" size="18" centerX="0" var="titleTxt"/>
			  <Label text="\l999600139" autoSize="none" x="67" y="68" width="85" align="center" size="14" height="20" style="渐变蓝"/>
			  <Label text="\l999600140" autoSize="none" x="516" y="68" width="85" align="center" size="14" height="20" style="渐变绿"/>
			  <Label text="杀人王 S.100 顾村张学友 15杀" autoSize="none" x="221" y="68" style="普通说明" align="center" size="12" centerX="0" width="228" height="20" var="firstKillPlayerTxt" isHtml="true"/>
			  <Label text="1000/1000" autoSize="none" x="152" y="70" style="普通说明" align="left" size="12" width="73" height="20" var="leftNumTxt"/>
			  <Label text="1000/1000" autoSize="none" x="444" y="70" style="普通说明" align="right" size="12" width="72" height="20" var="rightNumTxt"/>
			  <Box x="604" y="40" var="buffBox2" visible="false">
			    <Label text="00:00" y="35" style="不足禁止红" width="71" height="20" align="center" var="fogTimeTxt2"/>
			    <Image skin="png.uiPeakSports.迷雾" x="20" smoothing="true" width="32" height="32"/>
			  </Box>
			  <Box x="-7" y="40" var="buffBox1" visible="false">
			    <Label text="00:00" y="35" style="不足禁止红" width="71" height="20" align="center" var="fogTimeTxt1"/>
			    <Image skin="png.uiPeakSports.迷雾" x="20" smoothing="true" width="32" height="32"/>
			  </Box>
			  <Label autoSize="none" x="73" y="95" style="普通说明" align="left" size="12" width="119" height="20" var="myNameTxt"/>
			  <Label text="99/99" autoSize="none" x="141" y="36" style="渐变1" width="93" height="26" align="left" size="18" var="leftTxt"/>
			  <Label text="99/99" autoSize="none" x="442" y="36" style="渐变1" width="86" height="26" align="right" size="18" var="rightTxt"/>
			</View>;
       
      
      public var timeTxt:Label = null;
      
      public var titleTxt:Label = null;
      
      public var firstKillPlayerTxt:Label = null;
      
      public var leftNumTxt:Label = null;
      
      public var rightNumTxt:Label = null;
      
      public var buffBox2:Box = null;
      
      public var fogTimeTxt2:Label = null;
      
      public var buffBox1:Box = null;
      
      public var fogTimeTxt1:Label = null;
      
      public var myNameTxt:Label = null;
      
      public var leftTxt:Label = null;
      
      public var rightTxt:Label = null;
      
      public function PeakSportsSceneTopPanelUI()
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
