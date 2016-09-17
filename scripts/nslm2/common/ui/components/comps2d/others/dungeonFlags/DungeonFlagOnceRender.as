package nslm2.common.ui.components.comps2d.others.dungeonFlags
{
   import com.mz.core.utils.DisplayUtils;
   import nslm2.common.compsEffects.FloatUpDownEffCtrl;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   
   public class DungeonFlagOnceRender extends DungeonFlagBaseRender
   {
       
      
      public function DungeonFlagOnceRender(param1:int, param2:String)
      {
         super(param1,param2);
      }
      
      override protected function get effectId() : int
      {
         return 4040004;
      }
      
      override protected function validateFlag() : void
      {
         super.validateFlag();
         this.img_flag.visible = false;
         this.img_icon.visible = false;
         this.img_bottom.skin = "png.a5.commonImgs.dungeonFlags.img_onceBottom";
         box_flagAndIcon.x = -21;
         box_flagAndIcon.y = -57;
      }
      
      override protected function showNowDungeon() : void
      {
         super.showNowDungeon();
         this.img_bottom.visible = true;
         this.img_bottom.skin = "png.a5.commonImgs.dungeonFlags.img_onceBottomNow";
      }
      
      override protected function showClear() : void
      {
         super.showClear();
         this.img_bottom.skin = "png.a5.commonImgs.dungeonFlags.img_onceBottomClear";
         DisplayUtils.mouseEnabled(this,false);
      }
      
      override protected function showCanNotFight() : void
      {
         super.showCanNotFight();
         this.img_bottom.skin = "png.a5.commonImgs.dungeonFlags.img_onceBottom";
         DisplayUtils.mouseEnabled(this,false);
      }
      
      override protected function showNowStageEffect() : void
      {
         this.parts.push(new FloatUpDownEffCtrl().init(this.box_flagAndIcon));
         var _loc1_:BmcSpriteSheet = new BmcSpriteSheet();
         _loc1_.init(effectId,1,"all",true);
         _loc1_.x = -43;
         _loc1_.y = -45;
         this.addChildAt(_loc1_,0);
         _loc1_ = new BmcSpriteSheet();
         _loc1_.init(4040008,1,"all",true);
         _loc1_.x = -32;
         _loc1_.y = -69;
         this.addChildAt(_loc1_,0);
      }
   }
}
