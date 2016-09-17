package nslm2.modules.Chapters.maps
{
   import nslm2.common.ui.components.comps2d.others.dungeonFlags.DungeonFlagBossRender;
   import nslm2.common.ui.components.comps2d.others.dungeonFlags.DungeonFlagBaseRender;
   import nslm2.modules.Chapters.StarRender;
   
   public class ChapterFlagBossRender extends ChapterFlagNormalRender
   {
      
      private static const BOSS_BOX_SUMMARY_Y:Number = -125;
      
      private static const BOSS_TREASURE_X:Number = 30;
      
      private static const BOSS_TITLE_Y:Number = -100;
       
      
      private var _dungeonFlagRender:DungeonFlagBossRender;
      
      public function ChapterFlagBossRender(param1:int)
      {
         super(param1);
      }
      
      override public function get ui() : DungeonFlagBaseRender
      {
         if(_dungeonFlagRender == null)
         {
            _dungeonFlagRender = new DungeonFlagBossRender(state,flagIconUrl);
         }
         return _dungeonFlagRender;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:int = 0;
         .super.dataSource = param1;
         _loc2_ = 0;
         while(_loc2_ < starVec.length)
         {
            (starVec[_loc2_] as StarRender).img_star.url = "png.uiChapter.dungeonMap.img_starS2";
            _loc2_++;
         }
         this.box_summary.y = -125;
         this.box_treasureBox.x = 30;
         this.txt_dungeonName.y = -100;
      }
      
      override protected function changeState() : void
      {
         super.changeState();
         this.box_star.visible = true;
      }
   }
}
