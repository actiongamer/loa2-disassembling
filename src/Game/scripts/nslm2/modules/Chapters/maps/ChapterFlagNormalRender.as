package nslm2.modules.Chapters.maps
{
   import nslm2.common.ui.components.comps2d.others.dungeonFlags.DungeonFlagNormalRender;
   import nslm2.common.ui.components.comps2d.others.dungeonFlags.DungeonFlagBaseRender;
   
   public class ChapterFlagNormalRender extends ChapterFlagOnceRender
   {
       
      
      private var dungeonFlagRender:DungeonFlagNormalRender;
      
      public function ChapterFlagNormalRender(param1:int)
      {
         super(param1);
         this.box_summary.visible = false;
      }
      
      override public function get ui() : DungeonFlagBaseRender
      {
         if(dungeonFlagRender == null)
         {
            dungeonFlagRender = new DungeonFlagNormalRender(state,flagIconUrl);
         }
         return dungeonFlagRender;
      }
      
      override protected function showNowDungeon() : void
      {
         setSummaryView();
      }
      
      override protected function showCanNotFight() : void
      {
         this.box_star.visible = false;
      }
      
      override protected function validateSpe() : void
      {
         this.txt_dungeonName.visible = true;
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
