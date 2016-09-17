package game.ui.peakSports
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.Box;
   import morn.core.components.Label;
   import morn.core.components.Button;
   
   public class PeakSportsModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="800" height="550">
			  <PanelBg width="804" height="551" showTabLine="false" x="0" y="0" panelDragEnabled="true"/>
			  <Image x="4" y="27" var="bgImage" width="797" height="518"/>
			  <Image skin="png.uiPeakSports.img_titleBg" y="34" centerX="0" x="254"/>
			  <Label text="\l999600100" autoSize="none" x="100" y="37" style="渐变1" width="600" height="40" align="center" size="28" centerX="0"/>
			  <Image skin="png.uiPeakSports.跨服竞技入口半透黑底" x="63" y="337" centerX="0"/>
			  <Box x="151" y="344" var="applyBox" centerX="0">
			    <Label autoSize="none" y="36" style="渐变绿" align="center" bold="true" visible="true" width="500" height="34" var="timeTxt" text="20:30" size="25"/>
			    <Label text="\l999600104" autoSize="none" style="渐变1" width="500" height="30" align="center" size="23" wordWrap="true" var="startInfoTxt"/>
			    <Button label="\l999600102" y="90" style="按钮大绿" x="193" var="applyBtn" centerX="0"/>
			    <Label text="\l999600101" autoSize="none" x="0" y="3" style="普通说明" width="500" centerX="0" multiline="true" wordWrap="true" var="descTxt"/>
			  </Box>
			  <Box y="345" var="punishTimeBox" centerX="0" x="158" width="503" height="70">
			    <Label autoSize="none" x="168" y="36" style="渐变红" align="center" bold="true" visible="true" width="168" height="34" var="punishTimeTxt" text="20:30" size="25"/>
			    <Label text="\l999600103" autoSize="none" style="渐变红" width="499" height="30" align="center" size="23" wordWrap="true"/>
			  </Box>
			  <Box x="589" y="463">
			    <Image skin="png.a5.commonImgs.img_bg" x="19" scale="0.8" smoothing="true" width="80" height="80" y="1"/>
			    <Button skin="png.uiPeakSports.btn_50532" x="17" stateNum="1" var="rewardBtn" y="0" width="64" height="64"/>
			    <Label text="\l9050505" autoSize="none" y="51" style="渐变1" width="100" height="30" align="center" size="16" mouseChildren="false" mouseEnabled="false" multiline="true" wordWrap="true"/>
			  </Box>
			  <Box x="688" y="464">
			    <Image skin="png.a5.commonImgs.img_bg" x="20" scale="0.8" smoothing="true" width="80" height="80"/>
			    <Button skin="png.uiPeakSports.btn_50506" x="25" y="2" stateNum="1" var="infoBtn"/>
			    <Label text="\l50500013" autoSize="none" y="50" style="渐变1" width="100" height="30" align="center" size="16" mouseChildren="false" mouseEnabled="false" multiline="true" wordWrap="true"/>
			  </Box>
			</PopModuleView>;
       
      
      public var bgImage:Image = null;
      
      public var applyBox:Box = null;
      
      public var timeTxt:Label = null;
      
      public var startInfoTxt:Label = null;
      
      public var applyBtn:Button = null;
      
      public var descTxt:Label = null;
      
      public var punishTimeBox:Box = null;
      
      public var punishTimeTxt:Label = null;
      
      public var rewardBtn:Button = null;
      
      public var infoBtn:Button = null;
      
      public function PeakSportsModuleUI()
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
