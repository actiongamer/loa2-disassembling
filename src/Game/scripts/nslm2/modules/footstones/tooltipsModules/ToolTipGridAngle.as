package nslm2.modules.footstones.tooltipsModules
{
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipUICommon;
   import nslm2.modules.footstones.tooltipsModules.uis.ctrls.TooltipGridAngleCtrl;
   
   public class ToolTipGridAngle extends TooltipUICommon
   {
       
      
      public function ToolTipGridAngle()
      {
         super();
         img_bg.url = "png.a5.bgs.tooltipBgs.img_commonTipBg";
         img_bg.sizeGrid = "15,15,15,15";
      }
      
      override public function show(param1:*, param2:* = null) : void
      {
         var _loc3_:ToolTipGridActiveVo = param1 as ToolTipGridActiveVo;
         this.parts.push(new TooltipGridAngleCtrl(this,_loc3_));
         this.validateSize();
      }
      
      override protected function validateSize() : void
      {
         super.validateSize();
         var _loc1_:* = 338;
         this.box.width = _loc1_;
         _loc1_ = _loc1_;
         this.img_bg.width = _loc1_;
         this.width = _loc1_;
      }
   }
}
