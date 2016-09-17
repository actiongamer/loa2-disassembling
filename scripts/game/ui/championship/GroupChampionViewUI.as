package game.ui.championship
{
   import morn.customs.components.FadeView;
   import morn.core.components.List;
   import game.ui.championship.comp.ProgressLine1UI;
   import game.ui.championship.comp.ProgressLine2UI;
   import game.ui.championship.comp.ProgressLine3UI;
   import game.ui.championship.comp.ProgressLine4UI;
   import morn.core.components.Button;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import game.ui.championship.comp.PlayerListRenderUI;
   
   public class GroupChampionViewUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="1500" height="900">
			  <List x="249" y="174" var="list_players">
			    <PlayerListRender name="item0" runtime="game.ui.championship.comp.PlayerListRenderUI"/>
			    <PlayerListRender y="56" name="item1" runtime="game.ui.championship.comp.PlayerListRenderUI"/>
			    <PlayerListRender y="152" name="item2" runtime="game.ui.championship.comp.PlayerListRenderUI"/>
			    <PlayerListRender y="208" name="item3" runtime="game.ui.championship.comp.PlayerListRenderUI"/>
			    <PlayerListRender y="304" name="item4" runtime="game.ui.championship.comp.PlayerListRenderUI"/>
			    <PlayerListRender y="360" name="item5" runtime="game.ui.championship.comp.PlayerListRenderUI"/>
			    <PlayerListRender y="456" name="item6" runtime="game.ui.championship.comp.PlayerListRenderUI"/>
			    <PlayerListRender y="512" name="item7" runtime="game.ui.championship.comp.PlayerListRenderUI"/>
			    <PlayerListRender x="866" name="item8" runtime="game.ui.championship.comp.PlayerListRenderUI"/>
			    <PlayerListRender x="866" y="56" name="item9" runtime="game.ui.championship.comp.PlayerListRenderUI"/>
			    <PlayerListRender x="866" y="152" name="item10" runtime="game.ui.championship.comp.PlayerListRenderUI"/>
			    <PlayerListRender x="866" y="208" name="item11" runtime="game.ui.championship.comp.PlayerListRenderUI"/>
			    <PlayerListRender x="866" y="304" name="item12" runtime="game.ui.championship.comp.PlayerListRenderUI"/>
			    <PlayerListRender x="866" y="360" name="item13" runtime="game.ui.championship.comp.PlayerListRenderUI"/>
			    <PlayerListRender x="866" y="456" name="item14" runtime="game.ui.championship.comp.PlayerListRenderUI"/>
			    <PlayerListRender x="866" y="512" name="item15" runtime="game.ui.championship.comp.PlayerListRenderUI"/>
			  </List>
			  <Box x="378" y="197">
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
			  <Box x="1120" y="197" scaleX="-1">
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
			  <ProgressLine4 x="575" y="453" var="line_1" runtime="game.ui.championship.comp.ProgressLine4UI"/>
			  <ProgressLine4 x="786" y="453" var="line_2" runtime="game.ui.championship.comp.ProgressLine4UI"/>
			  <Button skin="png.uiChampionship.btn_gamble" x="422" y="209" stateNum="1" var="btn_7" name="btn_7"/>
			  <Button skin="png.uiChampionship.btn_gamble" x="422" y="361" stateNum="1" var="btn_8" name="btn_8"/>
			  <Button skin="png.uiChampionship.btn_gamble" x="422" y="513" stateNum="1" var="btn_9" name="btn_9"/>
			  <Button skin="png.uiChampionship.btn_gamble" x="422" y="665" stateNum="1" var="btn_10" name="btn_10"/>
			  <Button skin="png.uiChampionship.btn_gamble" x="1043" y="209" stateNum="1" var="btn_11" name="btn_11"/>
			  <Button skin="png.uiChampionship.btn_gamble" x="1043" y="361" stateNum="1" var="btn_12" name="btn_12"/>
			  <Button skin="png.uiChampionship.btn_gamble" x="1043" y="513" stateNum="1" var="btn_13" name="btn_13"/>
			  <Button skin="png.uiChampionship.btn_gamble" x="1043" y="665" stateNum="1" var="btn_14" name="btn_14"/>
			  <Button skin="png.uiChampionship.btn_gamble" x="483" y="285" stateNum="1" var="btn_3" name="btn_3"/>
			  <Button skin="png.uiChampionship.btn_gamble" x="483" y="589" stateNum="1" var="btn_4" name="btn_4"/>
			  <Button skin="png.uiChampionship.btn_gamble" x="982" y="285" stateNum="1" var="btn_5" name="btn_5"/>
			  <Button skin="png.uiChampionship.btn_gamble" x="982" y="589" stateNum="1" var="btn_6" name="btn_6"/>
			  <Button skin="png.uiChampionship.btn_gamble" x="545" y="437" stateNum="1" var="btn_1" name="btn_1"/>
			  <Button skin="png.uiChampionship.btn_gamble" x="920" y="437" stateNum="1" var="btn_2" name="btn_2"/>
			  <Image skin="png.uiChampionship.总冠军头像框" x="637" y="326"/>
			  <Image skin="png.comp.image" x="749" y="444" anchorX=".5" anchorY=".5" width="62" height="62" var="img_championIcon"/>
			  <Label text="随品质变化的" autoSize="none" x="691" y="477" style="普通说明" width="119" height="18" align="center" var="txt_championName"/>
			  <Button skin="png.uiChampionship.btn_gambleBig" x="696" y="392" stateNum="1" var="btn_ganbleBig" name="btnBig_0"/>
			  <Button skin="png.uiChampionship.btn_gamble" x="695" y="448" stateNum="1" var="btn_0" name="btn_0"/>
			</FadeView>;
       
      
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
      
      public var img_championIcon:Image = null;
      
      public var txt_championName:Label = null;
      
      public var btn_ganbleBig:Button = null;
      
      public var btn_0:Button = null;
      
      public function GroupChampionViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.championship.comp.PlayerListRenderUI"] = PlayerListRenderUI;
         viewClassMap["game.ui.championship.comp.ProgressLine1UI"] = ProgressLine1UI;
         viewClassMap["game.ui.championship.comp.ProgressLine2UI"] = ProgressLine2UI;
         viewClassMap["game.ui.championship.comp.ProgressLine3UI"] = ProgressLine3UI;
         viewClassMap["game.ui.championship.comp.ProgressLine4UI"] = ProgressLine4UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
