package nslm2.modules.funnies.families.familyBosses.view.render
{
   import game.ui.familyBosses.render.PropBaseRenderUI;
   import morn.core.utils.StringUtils;
   import nslm2.common.consts.NPCPropConsts;
   
   public class FamilyBossPorpRender extends PropBaseRenderUI
   {
       
      
      public function FamilyBossPorpRender()
      {
         super();
      }
      
      override public function validateName() : void
      {
         if(this.ref_txt_name)
         {
            if(vo != null)
            {
               if(!StringUtils.isNull(vo.propName))
               {
                  this.ref_txt_name.text = vo.propName;
               }
               else
               {
                  this.ref_txt_name.text = NPCPropConsts.ins.getLocaleNameNormal(vo.propId);
               }
            }
            else
            {
               this.ref_txt_name.text = "";
            }
         }
      }
   }
}
