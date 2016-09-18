package nslm2.modules.Chapters.elite
{
   import nslm2.modules.Chapters.maps.ChapterFlagBossRender;
   import nslm2.common.ui.components.comps2d.others.dungeonFlags.DungeonFlagBossRender;
   import nslm2.common.ui.components.comps2d.others.dungeonFlags.DungeonFlagBaseRender;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   
   public class EliteFlagBossRender extends ChapterFlagBossRender
   {
       
      
      private var _dungeonFlagRender:DungeonFlagBossRender;
      
      public function EliteFlagBossRender(param1:int)
      {
         super(param1);
         this.parts.push(new EliteFlagCtrl(this));
      }
      
      override public function get ui() : DungeonFlagBaseRender
      {
         if(_dungeonFlagRender == null)
         {
            _dungeonFlagRender = new DungeonFlagBossRender(state,flagIconUrl);
         }
         return _dungeonFlagRender;
      }
      
      override protected function showCanFight() : void
      {
         super.showCanFight();
         var _loc1_:BmcSpriteSheet = new BmcSpriteSheet();
         _loc1_.init(1015005,1,"all",true);
         _loc1_.x = -68;
         _loc1_.y = -126;
         this.addChild(_loc1_);
      }
      
      override protected function showNowDungeon() : void
      {
         super.showNowDungeon();
         var _loc1_:BmcSpriteSheet = new BmcSpriteSheet();
         _loc1_.init(1015005,1,"all",true);
         _loc1_.x = -68;
         _loc1_.y = -126;
         this.addChild(_loc1_);
      }
   }
}
