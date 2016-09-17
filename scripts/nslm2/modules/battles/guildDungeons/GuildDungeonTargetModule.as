package nslm2.modules.battles.guildDungeons
{
   import game.ui.guildDungeon.GuildDungeonTargetModuleUI;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   
   public class GuildDungeonTargetModule extends GuildDungeonTargetModuleUI
   {
       
      
      public function GuildDungeonTargetModule()
      {
         super();
      }
      
      public function get pageBar() : IPageBar
      {
         return pageBarRef as IPageBar;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.titleImgId = this.moduleId;
         this.list_chapters.dataSource = GuildDungeonModel.ins.stcChapterVoArr;
         this.pageBar.bindList(this.list_chapters);
         this.preShowCpl();
      }
   }
}
