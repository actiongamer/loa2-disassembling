package game.ui.guildModules.guildList
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.List;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import morn.core.components.Label;
   
   public class GuildListPanelUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="803" height="553">
			  <PanelBg width="804" height="551" x="0" y="0"/>
			  <Image skin="png.uiGuildModule.join.img_bg" x="15" y="36"/>
			  <List x="17" y="75" repeatY="8" var="list_gang">
			    <GuildListRender name="render" runtime="game.ui.guildModules.guildList.GuildListRenderUI"/>
			  </List>
			  <PageBarS2 x="327" y="504" var="pageBar" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			  <Label text="\l11000827" autoSize="none" x="26" y="49" style="下划线黄色" width="81" height="18" align="center" bold="true"/>
			  <Label text="\l11000828" autoSize="none" x="211" y="49" style="下划线黄色" width="65" height="18" align="center" bold="true"/>
			  <Label text="\l11000833" autoSize="none" x="566" y="49" style="下划线黄色" width="95" height="18" align="center" bold="true"/>
			  <Label text="\l11000829" autoSize="none" x="308" y="49" style="下划线黄色" width="65" height="18" align="center" bold="true"/>
			  <Label text="\l11000830" autoSize="none" x="108" y="49" style="下划线黄色" width="89" height="18" align="center" bold="true"/>
			  <Label text="\l11000832" autoSize="none" x="491" y="49" style="下划线黄色" width="65" align="center" bold="true"/>
			  <Label text="\l11000831" autoSize="none" x="403" y="49" style="下划线黄色" width="65" height="18" align="center" bold="true"/>
			  <Label text="\l11000834" autoSize="none" x="665" y="49" style="下划线黄色" width="110" height="18" align="center" bold="true"/>
			  <Label text="\l40700025" autoSize="none" x="25" y="94" style="二级框标题" width="747" height="20" centerX="0" align="center" var="txt_empty"/>
			</PopModuleView>;
       
      
      public var list_gang:List = null;
      
      public var pageBar:PageBarS2UI = null;
      
      public var txt_empty:Label = null;
      
      public function GuildListPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         viewClassMap["game.ui.guildModules.guildList.GuildListRenderUI"] = GuildListRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
