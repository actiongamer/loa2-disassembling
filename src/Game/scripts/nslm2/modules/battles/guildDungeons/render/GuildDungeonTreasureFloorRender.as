package nslm2.modules.battles.guildDungeons.render
{
   import game.ui.guildDungeon.render.GuildDungeonTreasureFloorRenderUI;
   
   public class GuildDungeonTreasureFloorRender extends GuildDungeonTreasureFloorRenderUI
   {
       
      
      public function GuildDungeonTreasureFloorRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(param1)
         {
            this.list_treasures.dataSource = this.dataSource;
         }
      }
   }
}
