package nslm2.common.ui.components.comps2d.others.dungeonFlags
{
   import com.mz.core.utils.FilterUtil;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import com.mz.core.utils.DisplayUtils;
   
   public class DungeonFlagNormalRender extends DungeonFlagBaseRender
   {
       
      
      public function DungeonFlagNormalRender(param1:int, param2:String)
      {
         super(param1,param2);
      }
      
      protected function get imgIconNormalScale() : Number
      {
         return 0.8;
      }
      
      override protected function get effectId() : int
      {
         return 4040005;
      }
      
      override protected function get bottomUrl() : String
      {
         return "png.a5.commonImgs.dungeonFlags.img_normalBottom";
      }
      
      override protected function validateBottom() : void
      {
         super.validateBottom();
         this.img_bottom.skin = bottomUrl;
      }
      
      override protected function validateIcon() : void
      {
         super.validateIcon();
         this.img_icon.scale = imgIconNormalScale;
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
         _loc2_.y = -81;
         this.addChild(_loc2_);
         var _loc1_:BmcSpriteSheet = new BmcSpriteSheet();
         _loc1_.init(4040008,1,"all",true);
         _loc1_.x = -32;
         _loc1_.y = -93;
         DisplayUtils.addChildAbove(_loc1_,this.img_flag);
      }
   }
}
