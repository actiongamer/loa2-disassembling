package nslm2.modules.footstones.tooltipsModules.uis.comps
{
   import game.ui.tooltipModules.comps.TooltipPropRenderS3UI;
   import nslm2.common.consts.NPCPropConsts;
   
   public class TooltipPropRenderS3 extends TooltipPropRenderS3UI
   {
       
      
      public function TooltipPropRenderS3()
      {
         super();
      }
      
      override public function validateName() : void
      {
         if(this.ref_txt_name)
         {
            if(vo != null)
            {
               this.showTxtName(NPCPropConsts.ins.getLocaleNameNormal(vo.propId));
            }
            else
            {
               this.ref_txt_name.text = "";
            }
         }
      }
   }
}
