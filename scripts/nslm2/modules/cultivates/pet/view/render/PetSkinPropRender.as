package nslm2.modules.cultivates.pet.view.render
{
   import game.ui.tooltipModules.comps.TooltipPropRenderS2UI;
   import nslm2.common.consts.NPCPropConsts;
   
   public class PetSkinPropRender extends TooltipPropRenderS2UI
   {
       
      
      public function PetSkinPropRender()
      {
         super();
      }
      
      override public function validateName() : void
      {
         if(this.ref_txt_name)
         {
            if(vo != null)
            {
               this.showTxtName(NPCPropConsts.ins.getLocaleName(vo.propId));
               if(vo.propId == 20)
               {
                  this.ref_txt_value.x = 80;
               }
            }
            else
            {
               this.ref_txt_name.text = "";
            }
         }
         if(!this.ref_txt_value)
         {
         }
      }
   }
}
