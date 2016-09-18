package game.ui.guildModules.log
{
   import morn.customs.components.FadeView;
   import morn.core.components.Image;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import morn.core.components.Label;
   import morn.core.components.List;
   
   public class GuildLogPanelUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="773" height="471" alpha="1">
			  <Box x="111" y="93" width="141" height="153">
			    <Image skin="png.comp.image" var="img_bg" anchorX=".5" anchorY=".5"/>
			    <Image skin="png.comp.image" var="img_pattern" anchorX=".5" anchorY=".5" x="3" y="-2"/>
			  </Box>
			  <Image skin="png.uiGuildModule.log.公会信息" x="5" y="5"/>
			  <Image skin="png.uiGuildModule.log.公告" x="4.5" y="299"/>
			  <List x="233" y="35" spaceY="30" repeatY="13">
			    <Box name="render">
			      <Image skin="png.uiGuildModule.log.分割线"/>
			    </Box>
			  </List>
			  <List x="233" y="37" repeatY="6" spaceY="34">
			    <Box name="render">
			      <Image skin="png.uiGuildModule.log.小底"/>
			    </Box>
			  </List>
			  <PageBarS2 x="603" y="433" var="pageBar" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			  <Label text="\l11000815" autoSize="left" x="23" y="186" style="普通说明"/>
			  <Label text="会长" autoSize="left" x="109" y="186" style="普通说明" var="txt_prisent"/>
			  <Label text="\l11000816" autoSize="left" x="23" y="209" style="普通说明"/>
			  <Label text="10" autoSize="left" x="109" y="209" style="普通说明" var="txt_lvl"/>
			  <Label text="\l11000817" autoSize="left" x="23" y="232" style="普通说明"/>
			  <Label text="10/20" autoSize="left" x="109" y="232" style="普通说明" var="txt_memberCnt"/>
			  <Label text="\l11000818" autoSize="left" x="23" y="255" style="普通说明"/>
			  <Label text="1000000" autoSize="left" x="109" y="255" style="普通说明" var="txt_fund"/>
			  <Label text="会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长" autoSize="left" x="17" y="344" style="普通说明" width="207" height="47" var="txt_outNotice" multiline="true" wordWrap="true"/>
			  <List x="234" y="43" repeatY="12" spaceY="12" var="list_log">
			    <GuildLogRender name="render" runtime="game.ui.guildModules.log.GuildLogRenderUI"/>
			  </List>
			  <Label text="会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长会长" autoSize="left" x="14" y="419" style="普通说明" width="211" height="45" var="txt_inNotice" multiline="true" wordWrap="true"/>
			  <Label text="\l11000819" autoSize="none" x="15" y="309" style="加底标题" width="200" height="18" align="center"/>
			  <Label text="\l11000820" autoSize="none" x="15" y="389" style="加底标题" width="200" height="18" align="center"/>
			  <Label text="\l11000814" autoSize="left" x="242" y="8" style="小标题" width="493" height="25" size="16"/>
			</FadeView>;
       
      
      public var img_bg:Image = null;
      
      public var img_pattern:Image = null;
      
      public var pageBar:PageBarS2UI = null;
      
      public var txt_prisent:Label = null;
      
      public var txt_lvl:Label = null;
      
      public var txt_memberCnt:Label = null;
      
      public var txt_fund:Label = null;
      
      public var txt_outNotice:Label = null;
      
      public var list_log:List = null;
      
      public var txt_inNotice:Label = null;
      
      public function GuildLogPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         viewClassMap["game.ui.guildModules.log.GuildLogRenderUI"] = GuildLogRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
