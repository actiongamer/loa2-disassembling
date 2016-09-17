package game.ui.newYears.day51s.panels
{
   import morn.core.components.View;
   import morn.core.components.Box;
   import morn.core.components.List;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import game.ui.commons.icons.LotteryRenderS7UI;
   import game.ui.commons.icons.WealthRenderS16UI;
   import game.ui.newYears.day51s.renders.Day51CostRenderUI;
   import game.ui.commons.icons.WealthRenderSize56UI;
   import game.ui.newYears.day51s.renders.Day51RewardIconUI;
   
   public class Day51FirstPanelUI extends View
   {
      
      protected static var uiView:XML = <View width="800" height="600">
			  <Box x="557" y="57" var="box_best">
			    <Image skin="png.uiFunnyCommon.img_ruleBg" width="230" height="220" sizeGrid="16,16,16,16"/>
			    <List x="23" y="66" repeatX="3" repeatY="2" spaceX="7" spaceY="7" var="list_bag">
			      <WealthRenderSize56 name="render" runtime="game.ui.commons.icons.WealthRenderSize56UI"/>
			    </List>
			    <Image skin="png.a5.commonImgs.img_txtBg" y="34" x="14"/>
			    <Label text="bag name" autoSize="none" x="13" style="渐变1" width="203" height="21" align="center" var="txt_bagName" size="16" y="37"/>
			  </Box>
			  <Image skin="png.uiDay51.img_avatar" x="-310" y="-73"/>
			  <Image skin="png.a5.bgs.panelBgs.img_panelBgS3" x="94" y="-9" width="456" height="456" sizeGrid="20,20,20,20"/>
			  <Label text="Date Time CD" autoSize="none" x="550" y="12" style="重要提示黄" var="txt_cd" align="center" width="246" height="20"/>
			  <Box x="584" y="389" var="box_btns">
			    <Button label="按钮" style="按钮中绿" var="btn_do1"/>
			    <Button label="按钮" x="98" style="按钮中黄" var="btn_do10"/>
			    <LotteryRenderS7 x="2" y="27" var="costRender1" runtime="game.ui.commons.icons.LotteryRenderS7UI"/>
			    <WealthRenderS16 x="99" y="27" var="costRender10" runtime="game.ui.commons.icons.WealthRenderS16UI"/>
			  </Box>
			  <List x="99" y="-5" repeatX="8" repeatY="8" var="list_reward">
			    <Day51RewardIcon name="render" runtime="game.ui.newYears.day51s.renders.Day51RewardIconUI"/>
			  </List>
			  <Day51CostRender x="617" y="345" var="render_cost2" runtime="game.ui.newYears.day51s.renders.Day51CostRenderUI"/>
			  <Label text="score:999" autoSize="none" x="618" y="292" style="小标题" width="162" height="21" align="left" var="txt_score"/>
			  <Day51CostRender x="617" y="316" var="render_cost" style="小标题" runtime="game.ui.newYears.day51s.renders.Day51CostRenderUI"/>
			  <Image skin="png.a5.bgs.panelBgs.raw.底部黄光" x="558" y="269" width="236" height="11"/>
			  <Button label="按钮" style="按钮中绿" var="btn_help" x="631" y="42"/>
			  <Label text="Cpl Tip 1" autoSize="center" x="102" y="203.5" style="重要提示黄" var="txt_cpl_tip1" align="center" size="28" width="672" height="41"/>
			  <Box x="524" y="27" var="box_help_tip">
			    <Image skin="png.a5.commonImgs.img_alertBgS2"/>
			    <Label text="Cpl Tip 1" autoSize="none" x="48" y="68" style="重要提示黄" var="txt_help_tip" align="center" size="15" width="198" height="74"/>
			  </Box>
			</View>;
       
      
      public var box_best:Box = null;
      
      public var list_bag:List = null;
      
      public var txt_bagName:Label = null;
      
      public var txt_cd:Label = null;
      
      public var box_btns:Box = null;
      
      public var btn_do1:Button = null;
      
      public var btn_do10:Button = null;
      
      public var costRender1:LotteryRenderS7UI = null;
      
      public var costRender10:WealthRenderS16UI = null;
      
      public var list_reward:List = null;
      
      public var render_cost2:Day51CostRenderUI = null;
      
      public var txt_score:Label = null;
      
      public var render_cost:Day51CostRenderUI = null;
      
      public var btn_help:Button = null;
      
      public var txt_cpl_tip1:Label = null;
      
      public var box_help_tip:Box = null;
      
      public var txt_help_tip:Label = null;
      
      public function Day51FirstPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.LotteryRenderS7UI"] = LotteryRenderS7UI;
         viewClassMap["game.ui.commons.icons.WealthRenderS16UI"] = WealthRenderS16UI;
         viewClassMap["game.ui.commons.icons.WealthRenderSize56UI"] = WealthRenderSize56UI;
         viewClassMap["game.ui.newYears.day51s.renders.Day51CostRenderUI"] = Day51CostRenderUI;
         viewClassMap["game.ui.newYears.day51s.renders.Day51RewardIconUI"] = Day51RewardIconUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
