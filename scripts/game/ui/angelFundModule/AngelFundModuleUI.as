package game.ui.angelFundModule
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Button;
   import morn.core.components.Tab;
   import morn.core.components.List;
   import game.ui.commons.comps.pageBars.PageBarS1UI;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.customs.components.ClipList;
   import game.ui.commons.icons.LotteryRenderS3UI;
   import game.ui.angelFundModule.render.AngelFundTitleRenderUI;
   import game.ui.commons.icons.WealthRenderS56UI;
   
   public class AngelFundModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="804" height="517">
			  <PanelBg x="11" y="7" width="804" height="517"/>
			  <Image skin="png.uiAngelFund.img_grid" x="26" y="40"/>
			  <Image skin="png.uiAngelFund.img_total" x="257" y="401"/>
			  <Button label="已认购" x="509" y="210" style="按钮大黄" var="btn_buy"/>
			  <Button label="领取" x="507" y="404" style="按钮大蓝" var="btn_get"/>
			  <Tab labels="标 签,标 签,标 签,标 签,标 签" x="246" y="286" selectedIndex="1" style="TAB短" var="tabBar"/>
			  <List x="381" y="331" repeatX="6" spaceX="7" var="list_reward" centerX="164">
			    <WealthRenderS56 name="render" runtime="game.ui.commons.icons.WealthRenderS56UI"/>
			  </List>
			  <List x="34" y="51" var="list_title" repeatY="8" spaceY="5">
			    <AngelFundTitleRender name="render" runtime="game.ui.angelFundModule.render.AngelFundTitleRenderUI"/>
			  </List>
			  <PageBarS1 x="71" y="473" var="pageBarUI" runtime="game.ui.commons.comps.pageBars.PageBarS1UI"/>
			  <Image skin="png.a5.comps.img_block" x="255" y="382" var="img_diamond2" width="26" height="26" smoothing="true"/>
			  <Label text="\l999900508" autoSize="none" x="434" y="108" style="普通说明" var="txt_buyTitle"/>
			  <Label text="\l999900509" autoSize="none" x="434" y="129" style="普通说明" var="txt_rewardTitle"/>
			  <Label text="11月" autoSize="none" x="534" y="108" style="普通说明" width="250" height="20" var="txt_buyTime" color="0x9ff063"/>
			  <Label text="11月" autoSize="none" x="534" y="129" style="普通说明" width="249" height="20" var="txt_rewardTime" color="0x9ff063"/>
			  <Label text="认购" autoSize="none" x="230" y="466" style="普通说明" width="554" height="36" var="txt_extra" multiline="true" wordWrap="true"/>
			  <Label text="前往充值" autoSize="none" x="640" y="216" style="普通说明" width="149" height="20" var="txt_charge" buttonMode="true" color="0xffea00"/>
			  <ClipList value="7500" clipWidth="12" align="left" url="png.a5.comps.clipList.clipList_S27" x="283" y="387" var="clip_totalValue"/>
			  <LotteryRenderS3 x="537" y="246" var="costRender" runtime="game.ui.commons.icons.LotteryRenderS3UI"/>
			  <Image skin="png.a5.commonImgs.img_redPoint" x="311" y="283" var="img_red0" visible="false"/>
			  <Image skin="png.a5.commonImgs.img_redPoint" x="391" y="283" var="img_red1" visible="false"/>
			  <Image skin="png.a5.commonImgs.img_redPoint" x="471" y="283" var="img_red2" visible="false"/>
			  <Image skin="png.a5.commonImgs.img_redPoint" x="551" y="283" var="img_red3" visible="false"/>
			  <Image skin="png.a5.commonImgs.img_redPoint" x="631" y="283" var="img_red4" visible="false"/>
			  <HBox x="656" y="65" right="20">
			    <Label text="\l999900510" autoSize="none" style="渐变黄" bold="true" size="18" height="22" y="13" x="0" var="l1" width="30"/>
			    <Label text="5000钻石" autoSize="none" style="渐变蓝2" bold="true" x="10" var="lDiamond" y="0" size="32" width="38" height="38"/>
			    <Label text="\l999900512" autoSize="none" style="渐变黄" bold="true" size="18" height="22" y="13" x="48" var="l2" width="30"/>
			    <Label text="500%！" autoSize="none" style="渐变蓝2" bold="true" var="lPercent" x="115" y="0" size="32" height="38" width="30"/>
			  </HBox>
			  <HBox x="532" y="157" right="20">
			    <Label text="\l999900514" autoSize="none" style="渐变1" var="l3" y="7" width="38" height="28" x="0" size="24"/>
			    <Box x="90">
			      <Image skin="png.uiAngelFund.img_title2"/>
			      <Image skin="png.a5.comps.img_block" x="11" y="7" var="img_diamond" width="26" height="26" smoothing="true"/>
			      <Label text="1000/1000" autoSize="none" style="渐变橙" bold="true" x="42" y="6" size="24" width="136" height="26" align="center" var="lCur"/>
			    </Box>
			    <Label text="\l999900515" autoSize="none" style="渐变1" var="l4" y="7" size="24" width="38" height="28" x="225"/>
			  </HBox>
			  <Label text="\l999900516" autoSize="none" style="渐变1" bold="true" size="18" height="27" y="356" x="242" width="108" align="center"/>
			  <Box x="368" y="212">
			    <Image skin="png.a5.commonImgs.img_rule_bg" x="137" y="1" scaleX="-1"/>
			    <Image skin="png.a5.commonImgs.img_rule" var="btn_rule" x="103"/>
			    <Label text="\l41500003" autoSize="none" y="7" style="普通说明" mouseEnabled="false" mouseChildren="false" width="102" height="20" align="right"/>
			  </Box>
			</PopModuleView>;
       
      
      public var btn_buy:Button = null;
      
      public var btn_get:Button = null;
      
      public var tabBar:Tab = null;
      
      public var list_reward:List = null;
      
      public var list_title:List = null;
      
      public var pageBarUI:PageBarS1UI = null;
      
      public var img_diamond2:Image = null;
      
      public var txt_buyTitle:Label = null;
      
      public var txt_rewardTitle:Label = null;
      
      public var txt_buyTime:Label = null;
      
      public var txt_rewardTime:Label = null;
      
      public var txt_extra:Label = null;
      
      public var txt_charge:Label = null;
      
      public var clip_totalValue:ClipList = null;
      
      public var costRender:LotteryRenderS3UI = null;
      
      public var img_red0:Image = null;
      
      public var img_red1:Image = null;
      
      public var img_red2:Image = null;
      
      public var img_red3:Image = null;
      
      public var img_red4:Image = null;
      
      public var l1:Label = null;
      
      public var lDiamond:Label = null;
      
      public var l2:Label = null;
      
      public var lPercent:Label = null;
      
      public var l3:Label = null;
      
      public var img_diamond:Image = null;
      
      public var lCur:Label = null;
      
      public var l4:Label = null;
      
      public var btn_rule:Image = null;
      
      public function AngelFundModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.angelFundModule.render.AngelFundTitleRenderUI"] = AngelFundTitleRenderUI;
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS1UI"] = PageBarS1UI;
         viewClassMap["game.ui.commons.icons.LotteryRenderS3UI"] = LotteryRenderS3UI;
         viewClassMap["game.ui.commons.icons.WealthRenderS56UI"] = WealthRenderS56UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
