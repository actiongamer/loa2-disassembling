package game.ui.championship
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import game.ui.commons.props.FightValueBoxUI;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import morn.core.components.List;
   import game.ui.commons.icons.LotteryRenderS3UI;
   import morn.customs.components.GRect;
   import morn.core.components.Box;
   import game.ui.championship.comp.FightReportListRenderUI;
   
   public class ChampionGambleViewUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="804" height="554">
			  <PanelBg width="804" height="550" x="0" y="-2"/>
			  <Image skin="jpg.uiChampionship.img_bg" x="2" y="29" var="img_funBg"/>
			  <Image skin="png.uiChampionship.VS" x="399" y="229" var="img_vs" anchorX=".5" anchorY=".5"/>
			  <Image skin="png.a5.commonImgs.角色-红底" x="141" y="74" width="172" height="24"/>
			  <Image skin="png.a5.commonImgs.角色-红底" x="500" y="74" width="172" height="24"/>
			  <FightValueBox x="159.5" y="73" var="fightValue1" runtime="game.ui.commons.props.FightValueBoxUI"/>
			  <FightValueBox x="529.5" y="74" var="fightValue2" runtime="game.ui.commons.props.FightValueBoxUI"/>
			  <Label text="啦啦啦啦了" autoSize="none" x="60" y="101" style="人名1不随品质变化" width="322" height="36" align="center" var="txt_nameLeft" size="14"/>
			  <Label text="啦啦啦啦了" autoSize="none" x="424" y="101" style="人名1不随品质变化" width="322" height="36" align="center" var="txt_nameRight" size="14"/>
			  <Button label="按钮" x="156" style="按钮大绿" y="370" var="btn_gamble1"/>
			  <Button label="按钮" x="530" style="按钮大绿" y="370" var="btn_gamble2"/>
			  <Image skin="png.uiChampionship.黑色透明底02" x="288" y="75"/>
			  <Image skin="png.a5.commonImgs.分割透明底" x="163" y="441" width="474" height="98"/>
			  <List x="157" y="453" spaceY="3" repeatY="3" var="list_reports">
			    <FightReportListRender name="render" runtime="game.ui.championship.comp.FightReportListRenderUI"/>
			  </List>
			  <LotteryRenderS3 x="185" y="408" var="costRender1" runtime="game.ui.commons.icons.LotteryRenderS3UI"/>
			  <LotteryRenderS3 x="558" y="408" var="costRender2" runtime="game.ui.commons.icons.LotteryRenderS3UI"/>
			  <GRect fillAlpha="0" radius="0,0,0,0" lineAlpha="0" x="156" y="370" width="126" height="37" var="tipArea1"/>
			  <GRect fillAlpha="0" radius="0,0,0,0" lineAlpha="0" x="531" y="369" width="126" height="37" var="tipArea2"/>
			  <Box x="309" y="73" var="box_score">
			    <Label text="7" autoSize="none" y="3" style="渐变2" width="104" height="38" align="center" size="30" var="leftScore" x="0"/>
			    <Label text="4" autoSize="none" x="71" y="3" style="渐变2" width="104" height="35" align="center" size="30" var="rightScore"/>
			    <Label text=":" autoSize="none" x="33" style="渐变2" width="104" height="42" align="center" size="30" y="0"/>
			  </Box>
			  <Label text="提示文字" autoSize="none" y="378" style="不足禁止红" width="322" align="center" var="txt_errorTip" centerX="0" x="241"/>
			</PopModuleView>;
       
      
      public var img_funBg:Image = null;
      
      public var img_vs:Image = null;
      
      public var fightValue1:FightValueBoxUI = null;
      
      public var fightValue2:FightValueBoxUI = null;
      
      public var txt_nameLeft:Label = null;
      
      public var txt_nameRight:Label = null;
      
      public var btn_gamble1:Button = null;
      
      public var btn_gamble2:Button = null;
      
      public var list_reports:List = null;
      
      public var costRender1:LotteryRenderS3UI = null;
      
      public var costRender2:LotteryRenderS3UI = null;
      
      public var tipArea1:GRect = null;
      
      public var tipArea2:GRect = null;
      
      public var box_score:Box = null;
      
      public var leftScore:Label = null;
      
      public var rightScore:Label = null;
      
      public var txt_errorTip:Label = null;
      
      public function ChampionGambleViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.championship.comp.FightReportListRenderUI"] = FightReportListRenderUI;
         viewClassMap["game.ui.commons.icons.LotteryRenderS3UI"] = LotteryRenderS3UI;
         viewClassMap["game.ui.commons.props.FightValueBoxUI"] = FightValueBoxUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
