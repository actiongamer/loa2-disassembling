package nslm2.common.ui.components.comps2d.others.dungeonFlags
{
   import game.ui.commons.comps.others.DungeonFlagBaseRenderUI;
   import morn.customs.FilterLib;
   import nslm2.common.compsEffects.FloatUpDownEffCtrl;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import com.mz.core.mediators.RollMediator;
   
   public class DungeonFlagBaseRender extends DungeonFlagBaseRenderUI
   {
       
      
      public var state:int;
      
      public var iconUrl:String;
      
      protected var _isRoll:Boolean;
      
      public function DungeonFlagBaseRender(param1:int, param2:String)
      {
         super();
         img_icon.loadPriority = 2;
         iconUrl = param2;
         this.parts.push(new RollMediator(this.box_flag,onMouseOver));
         validateAll();
         changeState(param1);
      }
      
      protected function get effectId() : int
      {
         return 4040004;
      }
      
      protected function get bottomUrl() : String
      {
         return "png.a5.commonImgs.dungeonFlags.img_onceBottom";
      }
      
      protected function get flagUrl() : String
      {
         return "png.a5.commonImgs.dungeonFlags.img_normalFlag";
      }
      
      protected function onMouseOver(param1:Boolean) : void
      {
         _isRoll = param1;
         if(param1)
         {
            this.filters = FilterLib.ins.getFilterArr(301);
         }
         else
         {
            this.filters = null;
         }
      }
      
      protected function validateAll() : void
      {
         validateIcon();
         validateBottom();
         validateFlag();
         validateOthers();
      }
      
      public function changeState(param1:int) : void
      {
         state = param1;
         switch(int(state) - 1)
         {
            case 0:
               showCanFight();
               break;
            case 1:
               showNowDungeon();
               break;
            case 2:
               showCanNotFight();
               break;
            case 3:
               showClear();
         }
      }
      
      protected function showCanNotFight() : void
      {
      }
      
      protected function showCanFight() : void
      {
      }
      
      protected function showClear() : void
      {
      }
      
      protected function showNowDungeon() : void
      {
         showNowStageEffect();
      }
      
      protected function validateIcon() : void
      {
         this.img_icon.url = iconUrl;
      }
      
      protected function validateBottom() : void
      {
      }
      
      protected function validateFlag() : void
      {
      }
      
      protected function validateOthers() : void
      {
      }
      
      protected function showNowStageEffect() : void
      {
         this.parts.push(new FloatUpDownEffCtrl().init(this.box_flagAndIcon));
         var _loc1_:BmcSpriteSheet = new BmcSpriteSheet();
         _loc1_.init(effectId,1,"all",true);
         _loc1_.x = -22;
         _loc1_.y = -8;
         _loc1_.scaleX = 0.48;
         _loc1_.scaleY = 0.48;
         this.addChildAt(_loc1_,0);
      }
   }
}
