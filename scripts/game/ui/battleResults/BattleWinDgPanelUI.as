package game.ui.battleResults
{
   import morn.customs.components.FadeView;
   import morn.core.components.Box;
   import morn.customs.components.WealthList;
   import morn.core.components.Label;
   import morn.core.components.Image;
   import game.ui.commons.icons.WealthRenderS5UI;
   
   public class BattleWinDgPanelUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="665" height="504">
			  <Box x="81" y="-98" var="box_mainPanel" scaleY="1" centerX="0">
			    <Image skin="png.uiBattleResults.img_blue" x="150" scaleX="2" scaleY="2" smoothing="true"/>
			    <Box y="252" var="big_bg" width="788">
			      <Image skin="png.uiBattleResults.img_bg" x="788" scaleX="-1"/>
			      <Image skin="png.uiBattleResults.img_bg"/>
			    </Box>
			    <WealthList x="223" y="407" repeatX="5" var="list_item" spaceX="20" language="en" lgx="248,223" lgy="407,407">
			      <WealthRenderS5 name="render" runtime="game.ui.commons.icons.WealthRenderS5UI"/>
			    </WealthList>
			    <Label text="获得物品：" autoSize="none" x="138" y="407" style="加底标题" height="19" var="txt_item" size="13"/>
			    <BattleBtnsRender x="228" y="510" var="box_btns" centerX="0" runtime="game.ui.battleResults.BattleBtnsRenderUI"/>
			    <WealthList x="223" y="308" repeatX="5" var="list_award" spaceX="20" language="en" lgx="248,223" lgy="308,308">
			      <WealthRenderS5 name="render" runtime="game.ui.commons.icons.WealthRenderS5UI"/>
			    </WealthList>
			    <Label text="获得奖励：" autoSize="none" x="138" y="308" style="加底标题" height="19" var="txt_award" size="13"/>
			    <Label autoSize="none" x="169" y="269" style="加底标题" width="450" height="19" var="txt_desc" align="center" size="13"/>
			    <Image skin="png.uiBattleResults.img_line" x="142" y="370" centerX="0" var="img_line"/>
			    <Label text="本次造成伤害：123123123123" autoSize="none" x="128.5" y="358" style="加底标题" width="531" height="19" var="txt_tip" size="13" centerX="0" align="center"/>
			  </Box>
			</FadeView>;
       
      
      public var box_mainPanel:Box = null;
      
      public var big_bg:Box = null;
      
      public var list_item:WealthList = null;
      
      public var txt_item:Label = null;
      
      public var box_btns:game.ui.battleResults.BattleBtnsRenderUI = null;
      
      public var list_award:WealthList = null;
      
      public var txt_award:Label = null;
      
      public var txt_desc:Label = null;
      
      public var img_line:Image = null;
      
      public var txt_tip:Label = null;
      
      public function BattleWinDgPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.battleResults.BattleBtnsRenderUI"] = game.ui.battleResults.BattleBtnsRenderUI;
         viewClassMap["game.ui.commons.icons.WealthRenderS5UI"] = WealthRenderS5UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
