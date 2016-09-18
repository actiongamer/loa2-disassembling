package game.ui.teamPKCS.finalMatch
{
   import morn.core.components.View;
   import morn.core.components.List;
   import game.ui.championship.comp.ProgressLine1UI;
   import game.ui.championship.comp.ProgressLine2UI;
   import game.ui.championship.comp.ProgressLine3UI;
   import game.ui.championship.comp.ProgressLine4UI;
   import morn.core.components.Button;
   import morn.core.components.Label;
   
   public class TPKCHalfViewUI extends View
   {
      
      protected static var uiView:XML = <View width="1500" height="900" centerX="0" centerY="0">
			  <List x="231" y="177" var="list_players">
			    <TPKCHalfRender name="item0" runtime="game.ui.teamPKCS.finalMatch.TPKCHalfRenderUI"/>
			    <TPKCHalfRender y="60" name="item1" runtime="game.ui.teamPKCS.finalMatch.TPKCHalfRenderUI"/>
			    <TPKCHalfRender y="150" name="item2" runtime="game.ui.teamPKCS.finalMatch.TPKCHalfRenderUI"/>
			    <TPKCHalfRender y="210" name="item3" runtime="game.ui.teamPKCS.finalMatch.TPKCHalfRenderUI"/>
			    <TPKCHalfRender y="305" name="item4" runtime="game.ui.teamPKCS.finalMatch.TPKCHalfRenderUI"/>
			    <TPKCHalfRender y="365" name="item5" runtime="game.ui.teamPKCS.finalMatch.TPKCHalfRenderUI"/>
			    <TPKCHalfRender y="456" name="item6" runtime="game.ui.teamPKCS.finalMatch.TPKCHalfRenderUI"/>
			    <TPKCHalfRender y="516" name="item7" runtime="game.ui.teamPKCS.finalMatch.TPKCHalfRenderUI"/>
			    <TPKCHalfRender x="895" name="item8" runtime="game.ui.teamPKCS.finalMatch.TPKCHalfRenderUI"/>
			    <TPKCHalfRender x="895" y="60" name="item9" runtime="game.ui.teamPKCS.finalMatch.TPKCHalfRenderUI"/>
			    <TPKCHalfRender x="895" y="150" name="item10" runtime="game.ui.teamPKCS.finalMatch.TPKCHalfRenderUI"/>
			    <TPKCHalfRender x="895" y="210" name="item11" runtime="game.ui.teamPKCS.finalMatch.TPKCHalfRenderUI"/>
			    <TPKCHalfRender x="895" y="305" name="item12" runtime="game.ui.teamPKCS.finalMatch.TPKCHalfRenderUI"/>
			    <TPKCHalfRender x="895" y="365" name="item13" runtime="game.ui.teamPKCS.finalMatch.TPKCHalfRenderUI"/>
			    <TPKCHalfRender x="895" y="456" name="item14" runtime="game.ui.teamPKCS.finalMatch.TPKCHalfRenderUI"/>
			    <TPKCHalfRender x="895" y="516" name="item15" runtime="game.ui.teamPKCS.finalMatch.TPKCHalfRenderUI"/>
			  </List>
			  <Box x="388" y="207">
			    <ProgressLine1 x="1" y="150" width="400" height="20" var="line_17" runtime="game.ui.championship.comp.ProgressLine1UI"/>
			    <ProgressLine1 x="1" y="208" width="400" height="20" scaleY="-1" var="line_18" runtime="game.ui.championship.comp.ProgressLine1UI"/>
			    <ProgressLine1 x="1" width="400" height="20" var="line_15" runtime="game.ui.championship.comp.ProgressLine1UI"/>
			    <ProgressLine1 x="1" y="58" width="400" height="20" scaleY="-1" var="line_16" runtime="game.ui.championship.comp.ProgressLine1UI"/>
			    <ProgressLine1 y="304" width="400" height="20" var="line_19" runtime="game.ui.championship.comp.ProgressLine1UI"/>
			    <ProgressLine1 x="1" y="362" width="400" height="20" scaleY="-1" var="line_20" runtime="game.ui.championship.comp.ProgressLine1UI"/>
			    <ProgressLine1 y="455" width="400" height="20" var="line_21" runtime="game.ui.championship.comp.ProgressLine1UI"/>
			    <ProgressLine1 x="1" y="513" width="400" height="20" scaleY="-1" var="line_22" runtime="game.ui.championship.comp.ProgressLine1UI"/>
			    <ProgressLine2 x="75" y="27" var="line_7" runtime="game.ui.championship.comp.ProgressLine2UI"/>
			    <ProgressLine2 x="75" y="180" scaleY="-1" var="line_8" runtime="game.ui.championship.comp.ProgressLine2UI"/>
			    <ProgressLine2 x="75" y="330" var="line_9" runtime="game.ui.championship.comp.ProgressLine2UI"/>
			    <ProgressLine2 x="75" y="485" scaleY="-1" var="line_10" runtime="game.ui.championship.comp.ProgressLine2UI"/>
			    <ProgressLine3 x="136" y="101" var="line_3" runtime="game.ui.championship.comp.ProgressLine3UI"/>
			    <ProgressLine3 x="136" y="410" scaleY="-1" var="line_4" runtime="game.ui.championship.comp.ProgressLine3UI"/>
			  </Box>
			  <Box x="1130" y="207" scaleX="-1">
			    <ProgressLine1 y="150" width="400" height="20" var="line_25" runtime="game.ui.championship.comp.ProgressLine1UI"/>
			    <ProgressLine1 y="208" width="400" height="20" scaleY="-1" var="line_26" runtime="game.ui.championship.comp.ProgressLine1UI"/>
			    <ProgressLine1 width="400" height="20" var="line_23" runtime="game.ui.championship.comp.ProgressLine1UI"/>
			    <ProgressLine1 y="58" width="400" height="20" scaleY="-1" var="line_24" runtime="game.ui.championship.comp.ProgressLine1UI"/>
			    <ProgressLine1 y="304" width="400" height="20" var="line_27" runtime="game.ui.championship.comp.ProgressLine1UI"/>
			    <ProgressLine1 y="362" width="400" height="20" scaleY="-1" var="line_28" runtime="game.ui.championship.comp.ProgressLine1UI"/>
			    <ProgressLine1 y="455" width="400" height="20" var="line_29" runtime="game.ui.championship.comp.ProgressLine1UI"/>
			    <ProgressLine1 y="513" width="400" height="20" scaleY="-1" var="line_30" runtime="game.ui.championship.comp.ProgressLine1UI"/>
			    <ProgressLine2 x="74" y="27" var="line_11" runtime="game.ui.championship.comp.ProgressLine2UI"/>
			    <ProgressLine2 x="74" y="180" scaleY="-1" var="line_12" runtime="game.ui.championship.comp.ProgressLine2UI"/>
			    <ProgressLine2 x="74" y="330" var="line_13" runtime="game.ui.championship.comp.ProgressLine2UI"/>
			    <ProgressLine2 x="74" y="485" scaleY="-1" var="line_14" runtime="game.ui.championship.comp.ProgressLine2UI"/>
			    <ProgressLine3 x="135" y="101" var="line_5" runtime="game.ui.championship.comp.ProgressLine3UI"/>
			    <ProgressLine3 x="135" y="410" scaleY="-1" var="line_6" runtime="game.ui.championship.comp.ProgressLine3UI"/>
			  </Box>
			  <ProgressLine4 x="585" y="463" var="line_1" runtime="game.ui.championship.comp.ProgressLine4UI"/>
			  <ProgressLine4 x="796" y="463" var="line_2" runtime="game.ui.championship.comp.ProgressLine4UI"/>
			  <Button skin="png.uiTeamPKCS.final.btn_gamble" x="432" y="219" stateNum="1" var="btn_7" name="btn_7"/>
			  <Button skin="png.uiTeamPKCS.final.btn_gamble" x="432" y="371" stateNum="1" var="btn_8" name="btn_8" width="29" height="29"/>
			  <Button skin="png.uiTeamPKCS.final.btn_gamble" x="432" y="523" stateNum="1" var="btn_9" name="btn_9"/>
			  <Button skin="png.uiTeamPKCS.final.btn_gamble" x="432" y="675" stateNum="1" var="btn_10" name="btn_10"/>
			  <Button skin="png.uiTeamPKCS.final.btn_gamble" x="1053" y="219" stateNum="1" var="btn_11" name="btn_11"/>
			  <Button skin="png.uiTeamPKCS.final.btn_gamble" x="1053" y="371" stateNum="1" var="btn_12" name="btn_12"/>
			  <Button skin="png.uiTeamPKCS.final.btn_gamble" x="1053" y="523" stateNum="1" var="btn_13" name="btn_13"/>
			  <Button skin="png.uiTeamPKCS.final.btn_gamble" x="1053" y="675" stateNum="1" var="btn_14" name="btn_14"/>
			  <Button skin="png.uiTeamPKCS.final.btn_gamble" x="493" y="295" stateNum="1" var="btn_3" name="btn_3"/>
			  <Button skin="png.uiTeamPKCS.final.btn_gamble" x="493" y="599" stateNum="1" var="btn_4" name="btn_4"/>
			  <Button skin="png.uiTeamPKCS.final.btn_gamble" x="992" y="295" stateNum="1" var="btn_5" name="btn_5"/>
			  <Image skin="png.uiTeamPKCS.final.img_half_bg0" x="618" y="316"/>
			  <Button skin="png.uiTeamPKCS.final.btn_gamble" x="992" y="599" stateNum="1" var="btn_6" name="btn_6"/>
			  <Button skin="png.uiTeamPKCS.final.btn_gamble" x="555" y="447" stateNum="1" var="btn_1" name="btn_1"/>
			  <Button skin="png.uiTeamPKCS.final.btn_gamble" x="930" y="447" stateNum="1" var="btn_2" name="btn_2"/>
			  <Label text="普通说明\n说明" autoSize="none" x="696" y="456" style="普通说明" width="142" height="40" align="center" var="txt_info"/>
			  <Button skin="png.uiTeamPKCS.final.btn_gamble" x="750" y="504" stateNum="1" var="btn_0" name="btn_0"/>
			  <Label text="普通说明\n说明" autoSize="none" x="607.5" y="227" style="普通说明" width="309" height="101" align="center" var="txt_time_info"/>
			  <Label text="渐变1" autoSize="none" x="394" y="614" style="渐变1" width="722" height="22" align="center" var="txt_tips" mouseChildren="false" mouseEnabled="false"/>
			  <Button label="按钮" x="699" style="按钮大绿" y="673" var="btn_mybet"/>
			  <Label text="渐变1" autoSize="none" x="630" y="336" style="渐变1" width="264" height="22" align="center" var="txt_remind"/>
			</View>;
       
      
      public var list_players:List = null;
      
      public var line_17:ProgressLine1UI = null;
      
      public var line_18:ProgressLine1UI = null;
      
      public var line_15:ProgressLine1UI = null;
      
      public var line_16:ProgressLine1UI = null;
      
      public var line_19:ProgressLine1UI = null;
      
      public var line_20:ProgressLine1UI = null;
      
      public var line_21:ProgressLine1UI = null;
      
      public var line_22:ProgressLine1UI = null;
      
      public var line_7:ProgressLine2UI = null;
      
      public var line_8:ProgressLine2UI = null;
      
      public var line_9:ProgressLine2UI = null;
      
      public var line_10:ProgressLine2UI = null;
      
      public var line_3:ProgressLine3UI = null;
      
      public var line_4:ProgressLine3UI = null;
      
      public var line_25:ProgressLine1UI = null;
      
      public var line_26:ProgressLine1UI = null;
      
      public var line_23:ProgressLine1UI = null;
      
      public var line_24:ProgressLine1UI = null;
      
      public var line_27:ProgressLine1UI = null;
      
      public var line_28:ProgressLine1UI = null;
      
      public var line_29:ProgressLine1UI = null;
      
      public var line_30:ProgressLine1UI = null;
      
      public var line_11:ProgressLine2UI = null;
      
      public var line_12:ProgressLine2UI = null;
      
      public var line_13:ProgressLine2UI = null;
      
      public var line_14:ProgressLine2UI = null;
      
      public var line_5:ProgressLine3UI = null;
      
      public var line_6:ProgressLine3UI = null;
      
      public var line_1:ProgressLine4UI = null;
      
      public var line_2:ProgressLine4UI = null;
      
      public var btn_7:Button = null;
      
      public var btn_8:Button = null;
      
      public var btn_9:Button = null;
      
      public var btn_10:Button = null;
      
      public var btn_11:Button = null;
      
      public var btn_12:Button = null;
      
      public var btn_13:Button = null;
      
      public var btn_14:Button = null;
      
      public var btn_3:Button = null;
      
      public var btn_4:Button = null;
      
      public var btn_5:Button = null;
      
      public var btn_6:Button = null;
      
      public var btn_1:Button = null;
      
      public var btn_2:Button = null;
      
      public var txt_info:Label = null;
      
      public var btn_0:Button = null;
      
      public var txt_time_info:Label = null;
      
      public var txt_tips:Label = null;
      
      public var btn_mybet:Button = null;
      
      public var txt_remind:Label = null;
      
      public function TPKCHalfViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.championship.comp.ProgressLine1UI"] = ProgressLine1UI;
         viewClassMap["game.ui.championship.comp.ProgressLine2UI"] = ProgressLine2UI;
         viewClassMap["game.ui.championship.comp.ProgressLine3UI"] = ProgressLine3UI;
         viewClassMap["game.ui.championship.comp.ProgressLine4UI"] = ProgressLine4UI;
         viewClassMap["game.ui.teamPKCS.finalMatch.TPKCHalfRenderUI"] = TPKCHalfRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
