package morn.customs.components
{
   import game.ui.commons.props.RolePropBaseRenderS2UI;
   import morn.core.utils.StringUtils;
   import nslm2.common.consts.NPCPropConsts;
   
   public class RolePropBaseRenderS2 extends RolePropBaseRenderS2UI
   {
       
      
      public function RolePropBaseRenderS2()
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
                  this.ref_txt_name.text = vo.propName + "：";
               }
               else
               {
                  this.ref_txt_name.text = NPCPropConsts.ins.getLocaleNameShort(vo.propId) + "：";
               }
            }
            else
            {
               this.ref_txt_name.text = "";
            }
         }
      }
      
      override public function validateTooltip() : void
      {
         if(vo && !StringUtils.isNull(vo.propName))
         {
            this.toolTip = null;
            return;
         }
         super.validateTooltip();
      }
   }
}
