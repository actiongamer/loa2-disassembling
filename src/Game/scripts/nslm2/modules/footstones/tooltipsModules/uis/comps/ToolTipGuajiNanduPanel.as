package nslm2.modules.footstones.tooltipsModules.uis.comps
{
   import game.ui.tooltipModules.comps.TooltipGuajiNanduUI;
   import nslm2.mgrs.stcMgrs.vos.StcGuajiVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.utils.WealthUtil;
   
   public class ToolTipGuajiNanduPanel extends TooltipGuajiNanduUI
   {
      
      private static const LANG_BASE:int = 41210900;
       
      
      private var guajiVo:StcGuajiVo;
      
      public function ToolTipGuajiNanduPanel(param1:StcGuajiVo)
      {
         super();
         this.x = 15;
         this.height = 70;
         guajiVo = StcMgr.ins.getGuajiVo(param1.id + 1);
         this.render_list.array = WealthUtil.costStrToArr(guajiVo.client_drop_desc);
         initNandu();
      }
      
      private function initNandu() : void
      {
         this.txt_nandu.text = LocaleMgr.ins.getStr(41210900 + (guajiVo.id - 100));
      }
   }
}
