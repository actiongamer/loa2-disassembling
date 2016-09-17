package nslm2.modules.footstones.tooltipsModules.uis
{
   import game.ui.tooltipModules.comps.SpToolTipHeroInfoDetailUI;
   import nslm2.modules.footstones.tooltipsModules.ToolTipHeroInfoDetailVo;
   import com.mz.core.configs.ClientConfig;
   import nslm2.modules.footstones.tooltipsModules.uis.ctrls.ToolTipHeroInfoDetailCtrl;
   import flash.events.MouseEvent;
   import com.mz.core.mgrs.UIMgr;
   import flash.geom.Point;
   import morn.core.components.Component;
   import morn.core.components.Image;
   
   public class ToolTipHeroInfoDetail extends SpToolTipHeroInfoDetailUI implements ITooltipUI
   {
       
      
      private var mouseEventType:String;
      
      private var isCompare:Boolean = false;
      
      private var detailVo:ToolTipHeroInfoDetailVo;
      
      private var ctrl:ToolTipHeroInfoDetailCtrl;
      
      public function ToolTipHeroInfoDetail(param1:Boolean = false)
      {
         super();
         this.mouseEventType = mouseEventType;
         this.isCompare = param1;
      }
      
      public function get showWidth() : int
      {
         return this.width;
      }
      
      public function get showHeight() : int
      {
         return this.height;
      }
      
      public function show(param1:*, param2:* = null) : void
      {
         if(param1 == null || (param1 as ToolTipHeroInfoDetailVo).hasHero == false)
         {
            return;
         }
         if(ClientConfig.isRuLang())
         {
            this.btn_close.x = this.btn_close.x + 4;
            this.btn_close.y = this.btn_close.y - 4;
         }
         detailVo = param1 as ToolTipHeroInfoDetailVo;
         ctrl = new ToolTipHeroInfoDetailCtrl(this,param1,isCompare);
         if(this.isCompare)
         {
            this.btnLeft.addEventListener("click",onLeft);
            this.btnRight.addEventListener("click",onRight);
         }
         else
         {
            this.btnLeft.visible = false;
            this.btnRight.visible = false;
         }
      }
      
      protected function onRight(param1:MouseEvent) : void
      {
         detailVo = detailVo.getNextVo(1);
         ctrl.update(detailVo);
      }
      
      protected function onLeft(param1:MouseEvent) : void
      {
         detailVo = detailVo.getNextVo(-1);
         ctrl.update(detailVo);
      }
      
      override public function dispose() : void
      {
         if(ctrl)
         {
            ctrl.dispose();
            ctrl = null;
         }
         this.btnLeft.removeEventListener("click",onLeft);
         this.btnRight.removeEventListener("click",onRight);
         super.dispose();
      }
      
      public function validateSize() : void
      {
         this.panel.height = Math.max(Math.min(UIMgr.gameHeight - 100,this.box.height + this.boxTitle.height + 10,700),300) - this.boxTitle.height;
         this.boxTitle.y = 25;
         this.panel.y = 25 + this.boxTitle.height;
         this.height = 25 + this.panel.height + 25 + this.boxTitle.height;
         var _loc1_:int = localToGlobal(new Point()).y;
         if(this.y + _loc1_ + this.height > UIMgr.gameHeight - 10)
         {
            this.y = UIMgr.gameHeight - 10 - _loc1_ - this.height;
         }
      }
      
      public function addVGap(param1:int = 12) : Component
      {
         var _loc2_:Component = new Component();
         _loc2_.height = param1;
         this.box.addChild(_loc2_);
         return _loc2_;
      }
      
      public function addLine() : Image
      {
         var _loc1_:Image = new Image("png.a5.prefabs.img_tipsLine");
         _loc1_.name = "line";
         _loc1_.x = 20;
         _loc1_.width = 336 - _loc1_.x * 2;
         _loc1_.sizeGrid = "4,0,4,0";
         this.box.addChild(_loc1_);
         return _loc1_;
      }
   }
}
