package game.ui.newYears.charmStar
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Button;
   import morn.customs.components.GRect;
   import game.ui.newYears.charmStar.view.CharmShopViewUI;
   import game.ui.newYears.charmStar.view.CharmRankViewUI;
   import morn.core.components.Box;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class CharmStarModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="992" height="557">
			  <Image skin="png.uiCharmStar.大底框" x="0" y="0"/>
			  <Button skin="png.a5.btns.btn_closeS1" y="22" stateNum="1" var="closeBtn" x="875"/>
			  <GRect fillAlpha="0.5" radius="0,0,0,0" lineAlpha="0" x="96" y="49" width="800" height="503" var="mask_render1"/>
			  <GRect fillAlpha="0.5" radius="0,0,0,0" lineAlpha="0" x="96" y="49" width="800" height="503" var="mask_render2"/>
			  <GRect fillAlpha="0.5" radius="0,0,0,0" lineAlpha="0" x="96" y="49" width="800" height="503" var="mask_render3"/>
			  <CharmShopView x="109" y="51" var="shopView" runtime="game.ui.newYears.charmStar.view.CharmShopViewUI"/>
			  <CharmRankView x="106.5" y="51" var="rankView" runtime="game.ui.newYears.charmStar.view.CharmRankViewUI"/>
			  <Box x="422" y="52" var="box_eventTitle2">
			    <Image skin="png.a5.comps.img_block" var="img_eventTitle2" width="455" height="498"/>
			    <Image skin="png.uiCharmStar.情人节特惠" x="86" y="237"/>
			    <Image skin="png.uiCharmStar.边光" x="440" y="27"/>
			    <Label x="134" y="336" style="渐变2" width="400" height="53" rotation="-13" mouseEnabled="false" mouseChildren="false" size="35" var="titleTxt2"/>
			  </Box>
			  <Box x="95" y="51" var="box_eventTitle1">
			    <Image skin="png.a5.comps.img_block" y="1" var="img_eventTitle1" x="15" width="456" height="498"/>
			    <Image skin="png.uiCharmStar.女神之约" y="234" x="13"/>
			    <Image skin="png.uiCharmStar.分割线" x="325" y="0"/>
			    <Image skin="png.uiCharmStar.边光" y="28"/>
			    <Label x="53" y="350" style="渐变2" width="400" height="53" rotation="-14" mouseEnabled="false" mouseChildren="false" size="35" var="titleTxt1"/>
			  </Box>
			  <Box x="109" y="52" mouseChildren="false" mouseEnabled="false" var="charmSatrBox">
			    <Image skin="png.uiCharmStar.文字底" mouseChildren="false" mouseEnabled="false" x="0"/>
			    <Label x="9" style="渐变1" width="752" height="25" bold="true" leading="-1" multiline="true" wordWrap="true" align="center" size="16" var="charmStarTimeTxt" y="7" mouseChildren="false" mouseEnabled="false"/>
			  </Box>
			  <Image skin="png.uiCharmStar.标题头" x="179" y="-107"/>
			  <Label text="\l999003122" x="281" style="渐变4" height="49" size="35" bold="true" multiline="true" wordWrap="true" y="-3" width="429" align="center" mouseChildren="false" mouseEnabled="false" letterSpacing="5"/>
			</PopModuleView>;
       
      
      public var closeBtn:Button = null;
      
      public var mask_render1:GRect = null;
      
      public var mask_render2:GRect = null;
      
      public var mask_render3:GRect = null;
      
      public var shopView:CharmShopViewUI = null;
      
      public var rankView:CharmRankViewUI = null;
      
      public var box_eventTitle2:Box = null;
      
      public var img_eventTitle2:Image = null;
      
      public var titleTxt2:Label = null;
      
      public var box_eventTitle1:Box = null;
      
      public var img_eventTitle1:Image = null;
      
      public var titleTxt1:Label = null;
      
      public var charmSatrBox:Box = null;
      
      public var charmStarTimeTxt:Label = null;
      
      public function CharmStarModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.newYears.charmStar.view.CharmRankViewUI"] = CharmRankViewUI;
         viewClassMap["game.ui.newYears.charmStar.view.CharmShopViewUI"] = CharmShopViewUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
