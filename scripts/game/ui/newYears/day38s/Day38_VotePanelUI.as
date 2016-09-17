package game.ui.newYears.day38s
{
   import morn.core.components.View;
   import morn.core.components.List;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import game.ui.commons.comps.others.RedPointUI;
   import morn.core.components.Box;
   import game.ui.commons.icons.WealthRenderS8UI;
   import morn.core.components.Image;
   import game.ui.commons.icons.WealthRenderSize34UI;
   
   public class Day38_VotePanelUI extends View
   {
      
      protected static var uiView:XML = <View width="800" height="500">
			  <Image skin="png.uiDay38.img_bg" x="-112" y="-195"/>
			  <List x="22" y="25" repeatX="5" repeatY="2" spaceX="2" spaceY="0" var="list_vote">
			    <Day38_VoteRender name="render" runtime="game.ui.newYears.day38s.Day38_VoteRenderUI"/>
			  </List>
			  <Label text="普通说明" autoSize="none" x="454" y="480" style="普通说明" width="254" height="20" var="txt_tip3"/>
			  <Label text="普通说明" autoSize="none" x="474" y="502" style="普通说明" width="375" height="20" var="txt_tip4"/>
			  <Button label="按钮" y="476" style="按钮中红" x="659" var="btn_gift" width="101" height="26"/>
			  <RedPoint x="750" y="472" var="redPoi_gift" runtime="game.ui.commons.comps.others.RedPointUI"/>
			  <Image skin="png.uiDay38.img_flag" x="454" y="501"/>
			  <Label text="普通说明" autoSize="none" x="445" y="0" style="普通说明" width="338" height="20" var="txt_tipTime" align="right"/>
			  <Label text="\l13333018" autoSize="none" x="133" y="-31" style="渐变1" width="513" height="50" size="32" bold="true" font="Em_YaHeiB" align="center"/>
			  <Box x="60" y="478" var="txtBox">
			    <Label text="普通说明" autoSize="none" x="22" y="24" style="普通说明" width="254" height="20" var="txt_tip2"/>
			    <Label text="普通说明明明" autoSize="none" y="2" style="普通说明" width="108" height="20" var="txt_tip1"/>
			    <WealthRenderS8 x="91" var="render_need" runtime="game.ui.commons.icons.WealthRenderS8UI"/>
			    <Button skin="png.a5.comps.numBars.btn_plus" x="156" y="1" stateNum="1" var="btn_add"/>
			    <Image skin="png.uiDay38.img_flag" x="1" y="23"/>
			  </Box>
			  <List x="-55" y="408" visible="false">
			    <WealthRenderSize34 name="render" runtime="game.ui.commons.icons.WealthRenderSize34UI"/>
			  </List>
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS4_5" var="img_quality" sizeGrid="6,6,6,6" width="40" height="40" x="5" y="477"/>
			  <Image skin="png.a5.comps.img_block" x="8" y="479" width="35" height="35" var="img_icon"/>
			</View>;
       
      
      public var list_vote:List = null;
      
      public var txt_tip3:Label = null;
      
      public var txt_tip4:Label = null;
      
      public var btn_gift:Button = null;
      
      public var redPoi_gift:RedPointUI = null;
      
      public var txt_tipTime:Label = null;
      
      public var txtBox:Box = null;
      
      public var txt_tip2:Label = null;
      
      public var txt_tip1:Label = null;
      
      public var render_need:WealthRenderS8UI = null;
      
      public var btn_add:Button = null;
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public function Day38_VotePanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.RedPointUI"] = RedPointUI;
         viewClassMap["game.ui.commons.icons.WealthRenderS8UI"] = WealthRenderS8UI;
         viewClassMap["game.ui.commons.icons.WealthRenderSize34UI"] = WealthRenderSize34UI;
         viewClassMap["game.ui.newYears.day38s.Day38_VoteRenderUI"] = Day38_VoteRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
