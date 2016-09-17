package game.ui.peakSports.peakSportsScene
{
   import morn.customs.components.SceneModuleView;
   import morn.core.components.Box;
   import morn.core.components.Image;
   import morn.core.components.List;
   import morn.core.components.Button;
   import morn.core.components.Label;
   import game.ui.peakSports.peakSportsScene.panel.PeakSportsSceneTopPanelUI;
   import game.ui.peakSports.peakSportsScene.panel.PeakSportsMyInfoPanelUI;
   import morn.customs.components.Placeholder;
   import game.ui.peakSports.peakSportsScene.panel.PeakSportsHeroInfoRenderUI;
   
   public class PeakSportsSceneModuleUI extends SceneModuleView
   {
      
      protected static var uiView:XML = <SceneModuleView width="1000" height="600">
			  <Box x="0" y="175" var="leftBox">
			    <Image skin="png.uiPeakSports.蓝色底" sizeGrid="50,50,50,50" var="leftBgImage"/>
			    <List x="5" y="40" repeatX="1" repeatY="6" var="leftList" spaceY="10">
			      <PeakSportsHeroInfoRender name="render" runtime="game.ui.peakSports.peakSportsScene.panel.PeakSportsHeroInfoRenderUI"/>
			    </List>
			    <Button skin="png.uiPeakSports.btn_left" var="leftBtn" stateNum="1" y="180" x="201" rotation="0"/>
			    <Label text="\l999600139" autoSize="none" x="0" y="9" width="195" align="center" size="14" height="20" style="渐变蓝"/>
			  </Box>
			  <Box x="777" y="248" var="rightBox">
			    <Image skin="png.uiPeakSports.绿色底" sizeGrid="50,50,50,50" var="rightBgImage" x="16"/>
			    <List x="27" y="41" repeatX="1" repeatY="6" var="rightList" spaceY="10">
			      <PeakSportsHeroInfoRender name="render" runtime="game.ui.peakSports.peakSportsScene.panel.PeakSportsHeroInfoRenderUI"/>
			    </List>
			    <Button skin="png.uiPeakSports.btn_left" var="rightBtn" stateNum="1" y="180" rotation="0" x="0"/>
			    <Label text="\l999600140" autoSize="none" x="29" y="9" width="192" align="center" size="14" height="20" style="渐变绿"/>
			  </Box>
			  <Label text="离复活还有：00:00" autoSize="none" x="297" y="266" style="渐变1" width="205" height="26" align="center" size="18" var="txt_reviveCountDown" centerY="0" centerX="0" mouseChildren="false" mouseEnabled="false"/>
			  <Box var="box_starCon" centerX="100" centerY="70" x="-1" y="0">
			    <Image skin="png.a5.commonImgs.img_star2" var="img_star" anchorX=".5" anchorY=".5" x="1"/>
			    <Image skin="png.a5.commonImgs.img_star2" var="img_starC" anchorX=".5" anchorY=".5"/>
			  </Box>
			  <PeakSportsSceneTopPanel x="230" y="-116" var="topInfoView" top="0" centerX="0" runtime="game.ui.peakSports.peakSportsScene.panel.PeakSportsSceneTopPanelUI"/>
			  <PeakSportsMyInfoPanel x="814" y="260" var="myInfoView" left="0" top="0" runtime="game.ui.peakSports.peakSportsScene.panel.PeakSportsMyInfoPanelUI"/>
			  <Box var="box_horseLamp" bottom="100" mouseEnabled="false" x="543" y="384" right="0">
			    <Placeholder width="446" height="100" var="txt_horseLamp" mouseEnabled="false" mouseChildren="false"/>
			    <Button skin="png.a5.commonImgs.btn_small" stateNum="1" var="btn_suofang" x="431" y="101"/>
			    <Image skin="png.a5.commonImgs.img_suofang" x="443" y="113" anchorX="0.5" anchorY="0.5" var="img_arrow" rotation="-90" mouseEnabled="false" mouseChildren="false"/>
			  </Box>
			  <Box bottom="0" var="fogBox" centerX="0" x="0" y="10">
			    <Image skin="png.a5.bgs.panelBgs.img_panelBg11" width="304" height="111" sizeGrid="20,20,20,20" y="-0.5"/>
			    <Image skin="png.uiPeakSports.迷雾" x="8" y="23"/>
			    <Label text="\l999600038" autoSize="none" x="85" y="8" style="渐变绿" width="104" height="22" align="left"/>
			    <Label text="\l999600039" autoSize="none" x="85" y="31" style="普通说明" width="210" multiline="true" wordWrap="true"/>
			    <Button label="\l11300024" style="按钮中绿" var="buyBtn" x="111" y="80"/>
			  </Box>
			</SceneModuleView>;
       
      
      public var leftBox:Box = null;
      
      public var leftBgImage:Image = null;
      
      public var leftList:List = null;
      
      public var leftBtn:Button = null;
      
      public var rightBox:Box = null;
      
      public var rightBgImage:Image = null;
      
      public var rightList:List = null;
      
      public var rightBtn:Button = null;
      
      public var txt_reviveCountDown:Label = null;
      
      public var box_starCon:Box = null;
      
      public var img_star:Image = null;
      
      public var img_starC:Image = null;
      
      public var topInfoView:PeakSportsSceneTopPanelUI = null;
      
      public var myInfoView:PeakSportsMyInfoPanelUI = null;
      
      public var box_horseLamp:Box = null;
      
      public var txt_horseLamp:Placeholder = null;
      
      public var btn_suofang:Button = null;
      
      public var img_arrow:Image = null;
      
      public var fogBox:Box = null;
      
      public var buyBtn:Button = null;
      
      public function PeakSportsSceneModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.peakSports.peakSportsScene.panel.PeakSportsHeroInfoRenderUI"] = PeakSportsHeroInfoRenderUI;
         viewClassMap["game.ui.peakSports.peakSportsScene.panel.PeakSportsMyInfoPanelUI"] = PeakSportsMyInfoPanelUI;
         viewClassMap["game.ui.peakSports.peakSportsScene.panel.PeakSportsSceneTopPanelUI"] = PeakSportsSceneTopPanelUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
