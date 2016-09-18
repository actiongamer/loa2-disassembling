package nslm2.modules.footstones.tooltipsModules.uis
{
   import nslm2.mgrs.stcMgrs.vos.StcEquipLiansuoVo;
   import nslm2.modules.footstones.tooltipsModules.uis.ctrls.ToolTipNpcGroupCtrl;
   
   public class ToolTipNpcGroup extends TooltipUICommon
   {
       
      
      public function ToolTipNpcGroup()
      {
         super();
         img_bg.url = "png.a5.bgs.tooltipBgs.img_commonTipBg";
         img_bg.sizeGrid = "15,15,15,15";
      }
      
      override public function show(param1:*, param2:* = null) : void
      {
         var _loc3_:StcEquipLiansuoVo = param1 as StcEquipLiansuoVo;
         this.parts.push(new ToolTipNpcGroupCtrl(this,param1));
         this.validateSize();
      }
      
      override protected function validateSize() : void
      {
         super.validateSize();
         var _loc1_:* = 216;
         this.box.width = _loc1_;
         _loc1_ = _loc1_;
         this.img_bg.width = _loc1_;
         this.width = _loc1_;
      }
   }
}
