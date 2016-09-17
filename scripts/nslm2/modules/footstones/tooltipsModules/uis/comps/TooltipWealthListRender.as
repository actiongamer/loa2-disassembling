package nslm2.modules.footstones.tooltipsModules.uis.comps
{
   import game.ui.tooltipModules.comps.TooltipWealthListRenderUI;
   import nslm2.common.vo.WealthVo;
   
   public class TooltipWealthListRender extends TooltipWealthListRenderUI
   {
       
      
      public var ori_img_quality_skin:String;
      
      public function TooltipWealthListRender()
      {
         super();
         ori_img_quality_skin = this.img_quality.skin.substr(0,this.img_quality.skin.length - 1);
      }
      
      public function get wealthVo() : WealthVo
      {
         return this.dataSource as WealthVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(wealthVo && wealthVo.kind != 0 && wealthVo.kind != 999999)
         {
            img_icon.smoothing = true;
            this.img_icon.url = wealthVo.iconUrl(this.img_icon.width);
         }
         else
         {
            this.img_icon.url = null;
         }
         if(wealthVo && wealthVo.kind != 0)
         {
            this.img_quality.skin = ori_img_quality_skin + wealthVo.quality;
            img_quality.visible = true;
         }
         else
         {
            img_quality.visible = false;
         }
      }
   }
}
