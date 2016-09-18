package nslm2.modules.battles.guildDungeons.render
{
   import game.ui.guildDungeon.render.GuildDungeonBuffRenderUI;
   import nslm2.modules.battles.guildDungeons.GuildDungeonModel;
   import com.mz.core.utils.FilterUtil;
   
   public class GuildDungeonBuffRender extends GuildDungeonBuffRenderUI
   {
       
      
      public function GuildDungeonBuffRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         var _loc2_:Array = GuildDungeonModel.ins.nowBuffArr();
         if(_loc2_.indexOf(this.stcBuffId) != -1)
         {
            this.filters = null;
         }
         else
         {
            this.filters = [FilterUtil.grayFilter()];
         }
      }
   }
}
