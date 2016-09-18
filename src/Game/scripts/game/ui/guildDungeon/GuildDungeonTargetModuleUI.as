package game.ui.guildDungeon
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.List;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import game.ui.guildDungeon.render.GuildDungeonTargetRenderUI;
   
   public class GuildDungeonTargetModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="360" height="451">
			  <PanelBgS3 y="0" width="360" height="449"/>
			  <List x="41" y="46" repeatY="4" var="list_chapters" spaceY="-11">
			    <GuildDungeonTargetRender name="render" runtime="game.ui.guildDungeon.render.GuildDungeonTargetRenderUI"/>
			  </List>
			  <PageBarS2 x="109.5" y="408" var="pageBarRef" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			  <Image skin="png.a5.commonImgs.列表分割线" x="29" y="128" width="291"/>
			  <Image skin="png.a5.commonImgs.列表分割线" x="29" y="218" width="291"/>
			  <Image skin="png.a5.commonImgs.列表分割线" x="29" y="305" width="291"/>
			</PopModuleView>;
       
      
      public var list_chapters:List = null;
      
      public var pageBarRef:PageBarS2UI = null;
      
      public function GuildDungeonTargetModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         viewClassMap["game.ui.guildDungeon.render.GuildDungeonTargetRenderUI"] = GuildDungeonTargetRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
