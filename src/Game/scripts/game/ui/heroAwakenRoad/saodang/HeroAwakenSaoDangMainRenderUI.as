package game.ui.heroAwakenRoad.saodang
{
   import morn.core.components.View;
   import morn.core.components.Box;
   import game.ui.commons.icons.LotteryRenderS3UI;
   import morn.core.components.List;
   import morn.core.components.Label;
   import morn.core.components.Image;
   import game.ui.commons.icons.WealthRenderS4UI;
   import game.ui.commons.icons.WealthRenderS5UI;
   
   public class HeroAwakenSaoDangMainRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="257" height="137">
			  <Box x="7" y="1" var="box_main">
			    <Image skin="png.a5.commonImgs.img_saodangBg" y="23"/>
			    <LotteryRenderS3 x="3" y="34" var="render_exp" runtime="game.ui.commons.icons.LotteryRenderS3UI"/>
			    <List x="12" y="75" repeatX="4" spaceX="8" var="list_item">
			      <WealthRenderS5 name="render" runtime="game.ui.commons.icons.WealthRenderS5UI"/>
			    </List>
			    <Image skin="png.a5.commonImgs.img_diamond" y="3" x="3"/>
			    <Label text="\l40400007" autoSize="left" x="14" var="txt_title" width="155" height="18" style="小标题" y="0"/>
			    <Label text="\l40400050" x="13" y="88" width="221" height="20" var="txt_saodangResult" style="普通说明"/>
			    <LotteryRenderS3 x="86" y="34" var="render_gold" runtime="game.ui.commons.icons.LotteryRenderS3UI"/>
			  </Box>
			  <Box var="box_cpl" x="0" y="-22">
			    <Box y="86" var="box_total">
			      <List y="22" repeatX="4" var="list_has" spaceX="8" width="224" height="49" x="19">
			        <WealthRenderS4 name="render" runtime="game.ui.commons.icons.WealthRenderS4UI"/>
			      </List>
			      <Image skin="png.a5.commonImgs.img_totalBg"/>
			      <Image skin="png.a5.comps.img_block" x="72" anchorX="0.5" anchorY="0.5" var="img_total" y="9"/>
			    </Box>
			    <Label text="\l999900197" autoSize="none" x="1" y="28" style="重要提示橘黄" width="255" align="center" height="42" size="26"/>
			  </Box>
			</View>;
       
      
      public var box_main:Box = null;
      
      public var render_exp:LotteryRenderS3UI = null;
      
      public var list_item:List = null;
      
      public var txt_title:Label = null;
      
      public var txt_saodangResult:Label = null;
      
      public var render_gold:LotteryRenderS3UI = null;
      
      public var box_cpl:Box = null;
      
      public var box_total:Box = null;
      
      public var list_has:List = null;
      
      public var img_total:Image = null;
      
      public function HeroAwakenSaoDangMainRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.LotteryRenderS3UI"] = LotteryRenderS3UI;
         viewClassMap["game.ui.commons.icons.WealthRenderS4UI"] = WealthRenderS4UI;
         viewClassMap["game.ui.commons.icons.WealthRenderS5UI"] = WealthRenderS5UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
