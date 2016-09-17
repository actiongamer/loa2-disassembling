package game.ui.guildDungeon.render
{
   import morn.core.components.View;
   import morn.core.components.List;
   
   public class GuildDungeonTreasureFloorRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="411" height="90">
			  <Image skin="png.uiGuildDungeon.img_treasureFloor" x="0" y="71"/>
			  <List x="28" y="14" var="list_treasures" repeatX="4" spaceX="25">
			    <GuildDungeonTreasureRender name="render" runtime="game.ui.guildDungeon.render.GuildDungeonTreasureRenderUI"/>
			  </List>
			</View>;
       
      
      public var list_treasures:List = null;
      
      public function GuildDungeonTreasureFloorRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.guildDungeon.render.GuildDungeonTreasureRenderUI"] = GuildDungeonTreasureRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
