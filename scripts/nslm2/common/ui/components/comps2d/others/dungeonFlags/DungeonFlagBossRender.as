package nslm2.common.ui.components.comps2d.others.dungeonFlags
{
   import com.mz.core.utils.FilterUtil;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import com.mz.core.utils.DisplayUtils;
   
   public class DungeonFlagBossRender extends DungeonFlagBaseRender
   {
      
      private static const BOSS_BOX_FLAG_ICON_X:Number = -1;
       
      
      public function DungeonFlagBossRender(param1:int, param2:String)
      {
         super(param1,param2);
      }
      
      override protected function get effectId() : int
      {
         return 4040006;
      }
      
      override protected function get bottomUrl() : String
      {
         return "png.a5.commonImgs.dungeonFlags.img_bossBottom";
      }
      
      override protected function get flagUrl() : String
      {
         return "png.a5.commonImgs.dungeonFlags.img_bossFlag";
      }
      
      override protected function validateBottom() : void
      {
         super.validateFlag();
         this.img_bottom.skin = bottomUrl;
         this.box_flagAndIcon.x = -1;
      }
      
      override protected function validateFlag() : void
      {
         super.validateFlag();
         this.img_flag.url = flagUrl;
      }
      
      override protected function showCanNotFight() : void
      {
         super.showCanNotFight();
         this.box_flag.filters = [FilterUtil.grayFilter()];
      }
      
      override protected function showNowDungeon() : void
      {
         super.showNowDungeon();
         this.img_bottom.visible = false;
      }
      
      override protected function showNowStageEffect() : void
      {
         super.showNowStageEffect();
         var _loc2_:BmcSpriteSheet = new BmcSpriteSheet();
         _loc2_.init(4040004,1,"all",true);
         _loc2_.x = -43;
         _loc2_.y = -75;
         this.addChild(_loc2_);
         var _loc1_:BmcSpriteSheet = new BmcSpriteSheet();
         _loc1_.init(4040008,1,"all",true);
         _loc1_.x = -32;
         _loc1_.y = -87;
         DisplayUtils.addChildAbove(_loc1_,this.img_flag);
      }
   }
}
