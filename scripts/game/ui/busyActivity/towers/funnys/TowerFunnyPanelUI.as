package game.ui.busyActivity.towers.funnys
{
   import morn.core.components.View;
   import morn.core.components.List;
   import morn.core.components.Label;
   import morn.core.components.Box;
   import morn.core.components.Button;
   import game.ui.commons.icons.LotteryRenderS7UI;
   import game.ui.commons.comps.pageBars.PageBarS1UI;
   import game.ui.dialModule.renders.DialWealthRenderUI;
   import game.ui.commons.icons.WealthRenderSize50UI;
   
   public class TowerFunnyPanelUI extends View
   {
      
      protected static var uiView:XML = <View width="790" height="444">
			  <List x="209" y="97" repeatX="1" repeatY="6" var="list_layer" spaceX="10" spaceY="9">
			    <TowerFunnyLayerRender name="render" runtime="game.ui.busyActivity.towers.funnys.TowerFunnyLayerRenderUI"/>
			  </List>
			  <Label text="我的积分" autoSize="none" y="193" style="渐变1" width="200" align="left" var="txt_score1" x="652" size="14"/>
			  <Label text="time" autoSize="none" y="8" style="普通说明" width="147" height="50" align="left" size="13" var="txt_cd" x="177" multiline="true" wordWrap="true"/>
			  <Box x="249" y="381" var="box_btns">
			    <Button label="按钮" style="按钮大绿" var="btn_do1"/>
			    <Button label="按钮" x="150" style="按钮大蓝" var="btn_do10"/>
			    <LotteryRenderS7 x="28" y="35" var="costRender1" runtime="game.ui.commons.icons.LotteryRenderS7UI"/>
			    <LotteryRenderS7 x="176" y="35" var="costRender10" runtime="game.ui.commons.icons.LotteryRenderS7UI"/>
			  </Box>
			  <Box x="585" y="-9" var="box_best" width="204" height="214">
			    <Image skin="png.uiTower.img_8"/>
			    <List x="18" y="49" repeatX="3" repeatY="2" var="list_bag" spaceX="8" spaceY="6">
			      <WealthRenderSize50 name="render" runtime="game.ui.commons.icons.WealthRenderSize50UI"/>
			    </List>
			    <PageBarS1 x="58" y="162" var="pageBar_bagUI" runtime="game.ui.commons.comps.pageBars.PageBarS1UI"/>
			    <Label text="\l60800024" autoSize="none" x="30" y="23" style="渐变1" width="144" height="22" align="center" var="txt_60800024"/>
			  </Box>
			  <Box x="26" y="378" var="box_avatar">
			    <Label text="Avatar" autoSize="none" style="普通说明" width="200" height="18" align="left" var="txt_avatar"/>
			  </Box>
			  <DialWealthRender x="629" y="242" var="renderWealth0" runtime="game.ui.dialModule.renders.DialWealthRenderUI"/>
			  <DialWealthRender x="629" y="269" var="renderWealth1" runtime="game.ui.dialModule.renders.DialWealthRenderUI"/>
			  <DialWealthRender x="629" y="215" var="renderWealthFree" runtime="game.ui.dialModule.renders.DialWealthRenderUI"/>
			  <Box x="-1" y="-6" var="box_help">
			    <Image skin="png.uiTower.img_13"/>
			    <Label text="time" autoSize="none" y="43" style="普通说明" width="172" height="126" align="left" size="12" var="txt_rule" x="6" multiline="true" wordWrap="true" leading="3"/>
			    <Label text="time" autoSize="none" y="21" style="普通说明" width="163" align="center" size="14" var="txt_ruleTitle" x="6" multiline="true" wordWrap="true"/>
			  </Box>
			</View>;
       
      
      public var list_layer:List = null;
      
      public var txt_score1:Label = null;
      
      public var txt_cd:Label = null;
      
      public var box_btns:Box = null;
      
      public var btn_do1:Button = null;
      
      public var btn_do10:Button = null;
      
      public var costRender1:LotteryRenderS7UI = null;
      
      public var costRender10:LotteryRenderS7UI = null;
      
      public var box_best:Box = null;
      
      public var list_bag:List = null;
      
      public var pageBar_bagUI:PageBarS1UI = null;
      
      public var txt_60800024:Label = null;
      
      public var box_avatar:Box = null;
      
      public var txt_avatar:Label = null;
      
      public var renderWealth0:DialWealthRenderUI = null;
      
      public var renderWealth1:DialWealthRenderUI = null;
      
      public var renderWealthFree:DialWealthRenderUI = null;
      
      public var box_help:Box = null;
      
      public var txt_rule:Label = null;
      
      public var txt_ruleTitle:Label = null;
      
      public function TowerFunnyPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.busyActivity.towers.funnys.TowerFunnyLayerRenderUI"] = TowerFunnyLayerRenderUI;
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS1UI"] = PageBarS1UI;
         viewClassMap["game.ui.commons.icons.LotteryRenderS7UI"] = LotteryRenderS7UI;
         viewClassMap["game.ui.commons.icons.WealthRenderSize50UI"] = WealthRenderSize50UI;
         viewClassMap["game.ui.dialModule.renders.DialWealthRenderUI"] = DialWealthRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
