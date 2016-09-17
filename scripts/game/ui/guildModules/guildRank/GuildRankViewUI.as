package game.ui.guildModules.guildRank
{
   import morn.customs.components.FadeView;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import morn.core.components.List;
   
   public class GuildRankViewUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="4" height="4" name="render">
			  <Image skin="png.uiGuildModule.排行标题头" x="6" y="0"/>
			  <Label text="\l11000807" autoSize="none" x="18" y="7" style="下划线黄色" width="65" height="18" align="center" bold="true"/>
			  <Label text="\l11000808" autoSize="none" x="92" y="7" style="下划线黄色" width="104" height="18" align="center" bold="true"/>
			  <Label text="\l11000810" autoSize="none" x="302" y="7" style="下划线黄色" width="98" height="18" align="center" bold="true"/>
			  <Label text="\l11000809" autoSize="none" x="201" y="7" style="下划线黄色" width="94" height="18" align="center" bold="true"/>
			  <Label text="\l11000811" autoSize="none" x="414" y="7" style="下划线黄色" width="111" height="18" align="center" bold="true"/>
			  <Label text="\l11000813" autoSize="none" x="669" y="7" style="下划线黄色" width="101" height="18" align="center" bold="true"/>
			  <PageBarS2 x="606" y="430" var="pagebar" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			  <Label text="\l11000812" autoSize="none" x="546" y="7" style="下划线黄色" width="124" height="18" align="center" bold="true"/>
			  <List x="7" y="61" repeatY="12" spaceY="30" mouseChildren="false" mouseEnabled="false">
			    <Box name="render">
			      <Image skin="png.uiGuildModule.线" name="render"/>
			    </Box>
			  </List>
			  <List x="6" y="63" spaceY="34" repeatY="6" var="list_bg" mouseEnabled="false" mouseChildren="false">
			    <Box name="render">
			      <Image skin="png.uiGuildModule.公会排行底" height="30"/>
			    </Box>
			  </List>
			  <List x="7" y="32" repeatY="12" spaceY="2" var="list_member">
			    <GuildRankListRender name="render" runtime="game.ui.guildModules.guildRank.GuildRankListRenderUI"/>
			  </List>
			</FadeView>;
       
      
      public var pagebar:PageBarS2UI = null;
      
      public var list_bg:List = null;
      
      public var list_member:List = null;
      
      public function GuildRankViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         viewClassMap["game.ui.guildModules.guildRank.GuildRankListRenderUI"] = GuildRankListRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
