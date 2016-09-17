package game.ui.teamPKCS.finalMatch
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import game.ui.commons.props.FightValueBoxUI;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import morn.core.components.List;
   import game.ui.commons.icons.LotteryRenderS7UI;
   import morn.core.components.Box;
   
   public class TPKCGambleModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="800" height="550">
			  <PanelBg x="-3" y="-2" width="804" height="551"/>
			  <Image skin="png.comp.image" x="3" y="30" var="img_gambleBg" width="793" height="514"/>
			  <Image skin="png.uiTeamPKCS.img_order_vs" x="3" y="24" var="img_upbg"/>
			  <FightValueBox x="27" y="40" var="fightValue_left" runtime="game.ui.commons.props.FightValueBoxUI"/>
			  <FightValueBox x="621" y="40" var="fightValue_right" runtime="game.ui.commons.props.FightValueBoxUI"/>
			  <Label text="游族.s1.女神联盟回归" autoSize="none" x="24" y="73" style="普通说明" width="152" height="20" size="14" var="txt_nameLeft"/>
			  <Label text="游族.s1.女神联盟回归" autoSize="none" x="626" y="73" style="普通说明" width="152" height="20" size="14" var="txt_nameRight"/>
			  <Label text="(32进16)" autoSize="none" x="323" y="116" style="普通绿色" width="152" height="20" align="center" var="txt_fightInfo"/>
			  <Button label="下注" x="213" y="404" style="按钮中黄" var="btn_gambleLeft"/>
			  <Button label="下注" x="507" y="405" style="按钮中黄" var="btn_gambleRight"/>
			  <List x="32" y="141" var="list_leftMems">
			    <TPKCGambleLeftRender name="item2" runtime="game.ui.teamPKCS.finalMatch.TPKCGambleLeftRenderUI"/>
			    <TPKCGambleLeftRender y="101" name="item3" runtime="game.ui.teamPKCS.finalMatch.TPKCGambleLeftRenderUI"/>
			    <TPKCGambleLeftRender y="202" name="item4" x="0" runtime="game.ui.teamPKCS.finalMatch.TPKCGambleLeftRenderUI"/>
			    <TPKCGambleLeftRender x="177" y="51" name="item0" runtime="game.ui.teamPKCS.finalMatch.TPKCGambleLeftRenderUI"/>
			    <TPKCGambleLeftRender x="177" y="153" name="item1" runtime="game.ui.teamPKCS.finalMatch.TPKCGambleLeftRenderUI"/>
			  </List>
			  <List x="399" y="141" var="list_rightMems">
			    <TPKCGambleRightRender y="51" name="item0" runtime="game.ui.teamPKCS.finalMatch.TPKCGambleRightRenderUI"/>
			    <TPKCGambleRightRender y="153" name="item1" runtime="game.ui.teamPKCS.finalMatch.TPKCGambleRightRenderUI"/>
			    <TPKCGambleRightRender x="181" name="item2" runtime="game.ui.teamPKCS.finalMatch.TPKCGambleRightRenderUI"/>
			    <TPKCGambleRightRender x="181" y="102" name="item3" runtime="game.ui.teamPKCS.finalMatch.TPKCGambleRightRenderUI"/>
			    <TPKCGambleRightRender x="181" y="204" name="item4" runtime="game.ui.teamPKCS.finalMatch.TPKCGambleRightRenderUI"/>
			  </List>
			  <Image skin="png.uiTeamPKCS.final.img_gambleFightBg" x="52.5" y="455"/>
			  <List x="97" y="470" repeatY="3" var="list_fightResult">
			    <TPKCFightResultRender name="render" runtime="game.ui.teamPKCS.finalMatch.TPKCFightResultRenderUI"/>
			  </List>
			  <LotteryRenderS7 x="224" y="431" var="left_need" runtime="game.ui.commons.icons.LotteryRenderS7UI"/>
			  <LotteryRenderS7 x="519" y="431" var="right_need" runtime="game.ui.commons.icons.LotteryRenderS7UI"/>
			  <Label text="普通说明" autoSize="none" x="214" y="372" style="普通绿色" width="389" var="txt_bet_win" multiline="true" wordWrap="true"/>
			  <Label text="\l50800112" autoSize="none" x="288" y="138" style="渐变1" width="222" height="31" align="center" var="txt_betTime"/>
			  <Box x="251" y="45" var="box_score" width="133" height="42">
			    <Label text="7" autoSize="none" y="6" style="渐变2" width="104" height="38" align="center" size="30" var="leftScore" x="0"/>
			    <Label text="4" autoSize="none" x="173" y="6" style="渐变2" width="104" height="38" align="center" size="30" var="rightScore"/>
			  </Box>
			</PopModuleView>;
       
      
      public var img_gambleBg:Image = null;
      
      public var img_upbg:Image = null;
      
      public var fightValue_left:FightValueBoxUI = null;
      
      public var fightValue_right:FightValueBoxUI = null;
      
      public var txt_nameLeft:Label = null;
      
      public var txt_nameRight:Label = null;
      
      public var txt_fightInfo:Label = null;
      
      public var btn_gambleLeft:Button = null;
      
      public var btn_gambleRight:Button = null;
      
      public var list_leftMems:List = null;
      
      public var list_rightMems:List = null;
      
      public var list_fightResult:List = null;
      
      public var left_need:LotteryRenderS7UI = null;
      
      public var right_need:LotteryRenderS7UI = null;
      
      public var txt_bet_win:Label = null;
      
      public var txt_betTime:Label = null;
      
      public var box_score:Box = null;
      
      public var leftScore:Label = null;
      
      public var rightScore:Label = null;
      
      public function TPKCGambleModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.LotteryRenderS7UI"] = LotteryRenderS7UI;
         viewClassMap["game.ui.commons.props.FightValueBoxUI"] = FightValueBoxUI;
         viewClassMap["game.ui.teamPKCS.finalMatch.TPKCFightResultRenderUI"] = TPKCFightResultRenderUI;
         viewClassMap["game.ui.teamPKCS.finalMatch.TPKCGambleLeftRenderUI"] = TPKCGambleLeftRenderUI;
         viewClassMap["game.ui.teamPKCS.finalMatch.TPKCGambleRightRenderUI"] = TPKCGambleRightRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
