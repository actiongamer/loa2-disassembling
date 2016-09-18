package game.ui.guildModules.memberView
{
   import morn.customs.components.FadeView;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import morn.core.components.List;
   import morn.core.components.HBox;
   import morn.core.components.Button;
   import morn.core.components.Label;
   
   public class MemberListViewUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="4" height="4" name="render">
			  <Image skin="png.uiGuildModule.排行标题头" x="5" y="32"/>
			  <Label text="\l11000854" autoSize="none" x="42" y="38" style="下划线黄色" width="114" height="18" align="center" bold="true"/>
			  <Label text="\l11000855" autoSize="none" x="129" y="38" style="下划线黄色" width="127" height="18" align="center" bold="true"/>
			  <Label text="\l40700022" autoSize="none" x="212" y="38" style="下划线黄色" width="130" height="18" align="center" bold="true"/>
			  <Label text="\l40700042 " autoSize="none" x="328" y="38" style="下划线黄色" width="131" height="18" align="center" bold="true"/>
			  <Label text="\l41210104" autoSize="none" x="452" y="38" style="下划线黄色" width="133" height="18" align="center" bold="true"/>
			  <Label text="\l40700044 " autoSize="none" x="561" y="38" style="下划线黄色" width="126" height="18" align="center" bold="true"/>
			  <Label text="\l40700043 " autoSize="none" x="587" y="38" style="下划线黄色" width="170" height="18" align="right" bold="true"/>
			  <PageBarS2 x="620" y="428" var="pagebar" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			  <List x="4" y="94" spaceY="30" repeatY="11" var="list_line">
			    <Box name="render">
			      <Image skin="png.uiGuildModule.线"/>
			    </Box>
			  </List>
			  <List x="4" y="96" spaceY="34" repeatY="5" var="list_bg">
			    <Box name="render">
			      <Image skin="png.uiGuildModule.公会排行底" height="30"/>
			    </Box>
			  </List>
			  <List x="5" y="64" repeatY="11" spaceY="2" var="list_member">
			    <GuildMemberListRender name="render" runtime="game.ui.guildModules.memberView.GuildMemberListRenderUI"/>
			  </List>
			  <HBox x="24" y="428" space="8" var="box_btn">
			    <Button label="\l40700018" style="按钮中绿" var="btn_setValue"/>
			    <Button label="\l11000" x="104" style="按钮中绿" var="btn_appoint" visible="true"/>
			    <Button label="\l40700016" style="按钮中绿" var="btn_upgrade" visible="true" x="176"/>
			    <Button label="\l9140713" x="208" style="按钮中黄" var="btn_invite"/>
			  </HBox>
			  <HBox x="11" y="9">
			    <Label text="\l40700021" autoSize="left" style="普通说明" mouseChildren="true" selectable="false"/>
			    <Label text="59/62" autoSize="left" x="105" style="重要提示橘黄" width="64" height="16" var="txt_memberCnt"/>
			  </HBox>
			</FadeView>;
       
      
      public var pagebar:PageBarS2UI = null;
      
      public var list_line:List = null;
      
      public var list_bg:List = null;
      
      public var list_member:List = null;
      
      public var box_btn:HBox = null;
      
      public var btn_setValue:Button = null;
      
      public var btn_appoint:Button = null;
      
      public var btn_upgrade:Button = null;
      
      public var btn_invite:Button = null;
      
      public var txt_memberCnt:Label = null;
      
      public function MemberListViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         viewClassMap["game.ui.guildModules.memberView.GuildMemberListRenderUI"] = GuildMemberListRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
