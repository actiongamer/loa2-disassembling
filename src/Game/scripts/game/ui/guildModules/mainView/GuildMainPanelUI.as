package game.ui.guildModules.mainView
{
   import morn.customs.components.FadeView;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.List;
   import morn.core.components.LinkButton;
   
   public class GuildMainPanelUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="773" height="471">
			  <Box x="111" y="93" width="141" height="153">
			    <Image skin="png.comp.image" var="img_bg" anchorX=".5" anchorY=".5"/>
			    <Image skin="png.comp.image" var="img_pattern" anchorX=".5" anchorY=".5" x="3" y="-2"/>
			  </Box>
			  <Image skin="jpg.uiGuildModule.公会右边底部" x="227" y="2"/>
			  <Label text="Lv.1 女生两名" autoSize="none" x="7" y="180" style="技能名标题" width="215" height="27" align="center" bold="false" size="14" var="txt_guildName"/>
			  <Image skin="png.uiGuildModule.首页-旗帜无图" x="5" y="5"/>
			  <Image skin="png.uiGuildModule.首页-对内公告" x="4" y="214"/>
			  <Label text="\l9010130" autoSize="none" x="20" y="224" style="加底标题" width="188" height="18" align="center"/>
			  <Label text="我是公告我是公告我是公告我是公告我是公告我是公告我是公告我是公告" autoSize="left" x="17" y="261" style="普通说明" width="193" multiline="true" wordWrap="true" leading="6" var="txt_notice"/>
			  <List x="264" y="21" repeatX="2" repeatY="4" spaceX="16" spaceY="8" var="list_activity">
			    <GuildActivityListRender name="render" runtime="game.ui.guildModules.mainView.GuildActivityListRenderUI"/>
			  </List>
			  <LinkButton label="\l40700045 " y="347" buttonMode="true" var="btn_modify" labelColors="0xfff300,0xfff300,0xfff300" right="560"/>
			</FadeView>;
       
      
      public var img_bg:Image = null;
      
      public var img_pattern:Image = null;
      
      public var txt_guildName:Label = null;
      
      public var txt_notice:Label = null;
      
      public var list_activity:List = null;
      
      public var btn_modify:LinkButton = null;
      
      public function GuildMainPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.guildModules.mainView.GuildActivityListRenderUI"] = GuildActivityListRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
