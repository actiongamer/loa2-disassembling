package game.ui.teamGuajiScenes.pvp
{
   import morn.customs.components.PanelView;
   import morn.core.components.Image;
   import morn.core.components.Button;
   import morn.core.components.Label;
   import game.ui.commons.icons.WealthRenderS14UI;
   import game.ui.commons.icons.LotteryRenderS3UI;
   
   public class BuyPvPCountPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="371" height="268">
			  <GRect fillAlpha="0.1" radius="0,0,0,0" lineAlpha="0" width="1600" height="900" centerX="0" centerY="0" fillColor="0x000000"/>
			  <PanelBgS3 width="371" height="268" showLightBottom="true" frameStyle="1" frameVisible="false"/>
			  <Image skin="png.a5.bgs.panelBgs.底板上小黑底框九宫格" sizeGrid="20,20,20,20" top="33" var="img_frame" x="13" y="33" width="345" height="145" left="13" right="13"/>
			  <Box x="47" y="192" centerX="0">
			    <Button label="使用" x="174" style="按钮大绿" var="btn_use"/>
			    <Button label="\l9060320" style="按钮大黄" var="btn_buy" labelMargin="42" x="10"/>
			    <Label text="还可购买:202/123次" autoSize="none" y="40" style="普通说明" width="139" height="20" align="center" var="txt_buyCnt"/>
			    <Label text="还可购买:20次" autoSize="none" x="176" y="40" style="普通说明" width="115" height="20" align="center" var="txt_haveCnt"/>
			  </Box>
			  <Label text="是否消耗夺宝次数卡？" autoSize="none" x="19" y="52" style="普通说明" width="333" height="40" align="center" var="txt_tip" centerX="0" multiline="true" wordWrap="true" language="en" lgx="19,19" lgy="42,52"/>
			  <WealthRenderS14 x="159" y="84" centerX="0" var="itemRender" runtime="game.ui.commons.icons.WealthRenderS14UI"/>
			  <LotteryRenderS3 x="54" y="198" var="costRender" runtime="game.ui.commons.icons.LotteryRenderS3UI"/>
			  <Label autoSize="none" y="199" style="重要提示橘黄" width="333" height="36" align="center" var="txt_des" centerX="0" text="12123213" x="30" multiline="true" wordWrap="true" lgx="19,19" lgy="140,151" language="en"/>
			</PanelView>;
       
      
      public var img_frame:Image = null;
      
      public var btn_use:Button = null;
      
      public var btn_buy:Button = null;
      
      public var txt_buyCnt:Label = null;
      
      public var txt_haveCnt:Label = null;
      
      public var txt_tip:Label = null;
      
      public var itemRender:WealthRenderS14UI = null;
      
      public var costRender:LotteryRenderS3UI = null;
      
      public var txt_des:Label = null;
      
      public function BuyPvPCountPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.LotteryRenderS3UI"] = LotteryRenderS3UI;
         viewClassMap["game.ui.commons.icons.WealthRenderS14UI"] = WealthRenderS14UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
