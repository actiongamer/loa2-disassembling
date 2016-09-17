package game.ui.teamPKCS.finalMatch
{
   import morn.core.components.View;
   import morn.core.components.Box;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.Button;
   
   public class TPKCFinalViewUI extends View
   {
      
      protected static var uiView:XML = <View width="1500" height="900" left="0" right="0" top="0" bottom="0">
			  <Box x="170" y="418" var="box_line">
			    <Image skin="png.uiTeamPKCS.final.img_line_on" x="641" y="8"/>
			    <Image skin="png.uiTeamPKCS.final.img_line_off" x="641" y="8"/>
			    <Image skin="png.uiTeamPKCS.final.img_line_on" x="553" y="9" scaleX="-1"/>
			    <Image skin="png.uiTeamPKCS.final.img_line_off" x="553" y="9" scaleX="-1"/>
			    <Image skin="png.uiTeamPKCS.final.img_bottom" x="162" y="1" var="left1"/>
			    <Image skin="png.uiTeamPKCS.final.img_bottom" x="109" y="76" var="left2"/>
			    <Image skin="png.uiTeamPKCS.final.img_bottom" x="59" y="153" var="left3"/>
			    <Image skin="png.uiTeamPKCS.final.img_bottom" y="230" var="left4"/>
			    <Image skin="png.uiTeamPKCS.final.img_bottom" x="912" var="right1"/>
			    <Image skin="png.uiTeamPKCS.final.img_bottom" x="967" y="75" var="right2"/>
			    <Image skin="png.uiTeamPKCS.final.img_bottom" x="1016" y="151" var="right3"/>
			    <Image skin="png.uiTeamPKCS.final.img_bottom" x="1086" y="227" var="right4"/>
			    <Image skin="png.uiTeamPKCS.final.img_bottom_big" x="515" y="100" var="d_center"/>
			    <Image skin="png.uiTeamPKCS.final.img_bottom" x="313" y="112" var="left0"/>
			    <Image skin="png.uiTeamPKCS.final.img_bottom" x="765" y="109" var="right0"/>
			  </Box>
			  <Box x="438" y="188" centerX="0" var="box_up">
			    <Image skin="png.uiTeamPKCS.final.vs" y="25"/>
			    <Image skin="png.uiTeamPKCS.final.img_crown" x="161" var="left_win"/>
			    <Image skin="png.uiTeamPKCS.final.img_crown" x="495" y="8" var="right_win"/>
			    <Label autoSize="none" x="163.5" y="124" style="普通说明" width="293" height="36" align="center" var="txt_up0"/>
			    <Label text="普通说明" autoSize="none" x="63" y="57" style="普通说明" width="180" height="20" align="left" var="txt_l0"/>
			    <Label text="普通说明" autoSize="none" x="376" y="56" style="普通说明" width="180" height="20" align="left" var="txt_r0"/>
			    <Label autoSize="none" style="渐变1" width="278" height="22" align="center" var="txt_up1" x="171" y="154"/>
			    <HBox x="63" y="76">
			      <Label text="\l999900286" autoSize="none" y="4" style="普通说明" height="20" align="left" var="txt_l1"/>
			      <Label text="渐变1" autoSize="none" x="53" style="渐变1" width="104" height="22" align="left" size="16" var="left_pow"/>
			    </HBox>
			    <HBox x="376" y="76">
			      <Label text="\l999900286" autoSize="none" y="4" style="普通说明" height="20" align="left" var="txt_r1"/>
			      <Label text="渐变1" autoSize="none" x="53" style="渐变1" width="104" height="22" align="left" size="16" var="right_pow"/>
			    </HBox>
			  </Box>
			  <Box x="581" y="766" centerX="0" bottom="100" var="box_down">
			    <Button label="按钮" x="132" style="按钮大绿" var="btn_myBet"/>
			    <Label text="渐变1" autoSize="none" style="渐变1" width="385" height="22" align="center" var="txt_down1" y="71"/>
			    <Label autoSize="none" x="46" y="42" style="普通说明" width="293" height="35" align="center" var="txt_down0"/>
			  </Box>
			  <TPKCHalfRender x="295" y="240" var="tl1" runtime="game.ui.teamPKCS.finalMatch.TPKCHalfRenderUI"/>
			  <TPKCHalfRender x="246" y="265" var="tl2" runtime="game.ui.teamPKCS.finalMatch.TPKCHalfRenderUI"/>
			  <TPKCHalfRender x="201" y="288" var="tl3" runtime="game.ui.teamPKCS.finalMatch.TPKCHalfRenderUI"/>
			  <TPKCHalfRender x="153" y="323" var="tl4" runtime="game.ui.teamPKCS.finalMatch.TPKCHalfRenderUI"/>
			  <TPKCHalfRender x="489" y="315" var="tl0" runtime="game.ui.teamPKCS.finalMatch.TPKCHalfRenderUI"/>
			  <TPKCHalfRender x="1087" y="269" var="tr1" runtime="game.ui.teamPKCS.finalMatch.TPKCHalfRenderUI"/>
			  <TPKCHalfRender x="1118" y="285" var="tr2" runtime="game.ui.teamPKCS.finalMatch.TPKCHalfRenderUI"/>
			  <TPKCHalfRender x="1168" y="302" var="tr3" runtime="game.ui.teamPKCS.finalMatch.TPKCHalfRenderUI"/>
			  <TPKCHalfRender x="1185" y="329" var="tr4" runtime="game.ui.teamPKCS.finalMatch.TPKCHalfRenderUI"/>
			  <TPKCHalfRender x="886" y="308" var="tr0" runtime="game.ui.teamPKCS.finalMatch.TPKCHalfRenderUI"/>
			  <Button skin="png.uiTeamPKCS.final.btn_gamble" x="747" y="573" stateNum="1" var="btn_0" name="btn_0"/>
			</View>;
       
      
      public var box_line:Box = null;
      
      public var left1:Image = null;
      
      public var left2:Image = null;
      
      public var left3:Image = null;
      
      public var left4:Image = null;
      
      public var right1:Image = null;
      
      public var right2:Image = null;
      
      public var right3:Image = null;
      
      public var right4:Image = null;
      
      public var d_center:Image = null;
      
      public var left0:Image = null;
      
      public var right0:Image = null;
      
      public var box_up:Box = null;
      
      public var left_win:Image = null;
      
      public var right_win:Image = null;
      
      public var txt_up0:Label = null;
      
      public var txt_l0:Label = null;
      
      public var txt_r0:Label = null;
      
      public var txt_up1:Label = null;
      
      public var txt_l1:Label = null;
      
      public var left_pow:Label = null;
      
      public var txt_r1:Label = null;
      
      public var right_pow:Label = null;
      
      public var box_down:Box = null;
      
      public var btn_myBet:Button = null;
      
      public var txt_down1:Label = null;
      
      public var txt_down0:Label = null;
      
      public var tl1:game.ui.teamPKCS.finalMatch.TPKCHalfRenderUI = null;
      
      public var tl2:game.ui.teamPKCS.finalMatch.TPKCHalfRenderUI = null;
      
      public var tl3:game.ui.teamPKCS.finalMatch.TPKCHalfRenderUI = null;
      
      public var tl4:game.ui.teamPKCS.finalMatch.TPKCHalfRenderUI = null;
      
      public var tl0:game.ui.teamPKCS.finalMatch.TPKCHalfRenderUI = null;
      
      public var tr1:game.ui.teamPKCS.finalMatch.TPKCHalfRenderUI = null;
      
      public var tr2:game.ui.teamPKCS.finalMatch.TPKCHalfRenderUI = null;
      
      public var tr3:game.ui.teamPKCS.finalMatch.TPKCHalfRenderUI = null;
      
      public var tr4:game.ui.teamPKCS.finalMatch.TPKCHalfRenderUI = null;
      
      public var tr0:game.ui.teamPKCS.finalMatch.TPKCHalfRenderUI = null;
      
      public var btn_0:Button = null;
      
      public function TPKCFinalViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.teamPKCS.finalMatch.TPKCHalfRenderUI"] = game.ui.teamPKCS.finalMatch.TPKCHalfRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
