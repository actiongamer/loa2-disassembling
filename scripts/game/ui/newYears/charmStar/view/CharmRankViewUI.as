package game.ui.newYears.charmStar.view
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.List;
   import morn.core.components.Button;
   import morn.core.components.Box;
   import game.ui.commons.icons.WealthRenderS8UI;
   import game.ui.newYears.charmStar.render.CharmRankRenderUI;
   
   public class CharmRankViewUI extends View
   {
      
      protected static var uiView:XML = <View width="774" height="499">
			  <Image skin="png.uiCharmStar.img_bg" y="99" x="0" sizeGrid="0,38,0,0"/>
			  <Image skin="png.uiCharmStar.img_titleBg" x="3" y="0"/>
			  <Label text="\l999003101" autoSize="none" x="200" style="渐变黄" height="41" size="25" bold="true" leading="-1" multiline="true" wordWrap="true" y="55" width="567" mouseChildren="false" mouseEnabled="false"/>
			  <Label text="\l11800201" autoSize="none" x="23" y="110" style="普通说明" width="111" align="center" size="16" height="23" var="label_title1"/>
			  <Label text="\l13323010" autoSize="none" x="261" y="110" style="普通说明" width="118" align="center" size="16" height="23" var="label_title3"/>
			  <Label text="\l999003121" autoSize="none" x="412" y="110" style="普通说明" width="129" align="center" size="16" height="23" var="label_title4"/>
			  <Label text="\l13323007" autoSize="none" x="579" y="111" style="普通说明" width="158" align="center" size="16" height="23" var="label_title5"/>
			  <List y="137" repeatY="5" var="rankList" x="0" spaceY="1">
			    <CharmRankRender x="0" y="0" name="render" runtime="game.ui.newYears.charmStar.render.CharmRankRenderUI"/>
			  </List>
			  <Button x="610" y="10.5" var="sendFriendsBtn" skin="png.a5.btns.btn_charge" stateNum="1" label="\l13323011"/>
			  <Label text="活动时间" autoSize="none" x="3" y="80" style="普通说明" width="347" var="openTimesTxt" align="left" multiline="true" wordWrap="true"/>
			  <Label text="\l30100002" autoSize="none" x="139" y="110" style="普通说明" width="102" align="center" size="16" height="23" var="label_title2"/>
			  <Label text="\l999003100" autoSize="none" x="4" style="渐变黄" height="41" size="25" bold="true" leading="-1" multiline="true" wordWrap="true" y="14" width="441" align="right" mouseChildren="false" mouseEnabled="false"/>
			  <Box x="199" y="454" var="boxBuyAll">
			    <Label text="\l13323008" autoSize="none" y="4" style="普通说明" width="102" height="20" var="txt_tip1" align="right" x="344"/>
			    <WealthRenderS8 x="445" var="render_need" runtime="game.ui.commons.icons.WealthRenderS8UI"/>
			    <Button skin="png.a5.comps.numBars.btn_plus" x="517" y="1" stateNum="1" var="addBtn"/>
			    <Box x="424" y="5" var="box_hint" mouseChildren="false" mouseEnabled="false">
			      <Image skin="png.a5.commonImgs.img_alertBgS2" scaleX="0.7" scaleY="0.5"/>
			      <Label text="\l13323021" autoSize="none" x="29" y="42" style="普通说明" width="152" height="20" align="center" var="txt_tip3"/>
			    </Box>
			    <Box lgx="-2,25" lgy="4,4" language="en" x="0" y="4">
			      <Label text="\l999003117" autoSize="none" style="普通说明" width="188" height="20" align="right"/>
			      <Label text="9999" autoSize="none" style="普通绿色" height="20" var="myRank" align="left" x="188"/>
			    </Box>
			    <Box x="145" y="4">
			      <Label text="\l999003118" autoSize="none" style="普通说明" width="188" height="20" align="right"/>
			      <Label text="9999" autoSize="none" style="普通绿色" height="20" var="myScore" align="left" x="189"/>
			    </Box>
			  </Box>
			</View>;
       
      
      public var label_title1:Label = null;
      
      public var label_title3:Label = null;
      
      public var label_title4:Label = null;
      
      public var label_title5:Label = null;
      
      public var rankList:List = null;
      
      public var sendFriendsBtn:Button = null;
      
      public var openTimesTxt:Label = null;
      
      public var label_title2:Label = null;
      
      public var boxBuyAll:Box = null;
      
      public var txt_tip1:Label = null;
      
      public var render_need:WealthRenderS8UI = null;
      
      public var addBtn:Button = null;
      
      public var box_hint:Box = null;
      
      public var txt_tip3:Label = null;
      
      public var myRank:Label = null;
      
      public var myScore:Label = null;
      
      public function CharmRankViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS8UI"] = WealthRenderS8UI;
         viewClassMap["game.ui.newYears.charmStar.render.CharmRankRenderUI"] = CharmRankRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
