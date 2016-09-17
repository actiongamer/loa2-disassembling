package nslm2.modules.footstones.tooltipsModules.uis
{
   import game.ui.tooltipModules.TooltipUICommonUI;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipTxt;
   import morn.core.components.Image;
   import morn.core.components.Component;
   
   public class TooltipUICommon extends TooltipUICommonUI implements ITooltipUI
   {
       
      
      public function TooltipUICommon()
      {
         super();
      }
      
      public function addTxt(param1:String, param2:uint = 13341521, param3:int = 12) : TooltipTxt
      {
         var _loc4_:TooltipTxt = new TooltipTxt(param2);
         _loc4_.name = "txt";
         _loc4_.content = param1;
         _loc4_.x = 25;
         this.box.addChild(_loc4_);
         return _loc4_;
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
      
      public function addVGap(param1:int = 12) : Component
      {
         var _loc2_:Component = new Component();
         _loc2_.height = param1;
         this.box.addChild(_loc2_);
         return _loc2_;
      }
      
      public function show(param1:*, param2:* = null) : void
      {
      }
      
      protected function validateSize() : void
      {
         this.box.y = 25;
         this.height = 25 + this.box.height + 25;
      }
      
      public function get showWidth() : int
      {
         return this.width;
      }
      
      public function get showHeight() : int
      {
         return this.height;
      }
   }
}
