package morn.customs.components
{
   import game.ui.commons.props.RolePropBaseRenderS1UI;
   import nslm2.common.consts.NPCPropConsts;
   
   public class RolePropBaseRenderS1 extends RolePropBaseRenderS1UI
   {
       
      
      public function RolePropBaseRenderS1()
      {
         super();
      }
      
      override public function validateName() : void
      {
         if(this.ref_txt_name)
         {
            if(vo != null)
            {
               this.ref_txt_name.text = NPCPropConsts.ins.getLocaleNameShort(vo.propId) + "：";
            }
            else
            {
               this.ref_txt_name.text = "";
            }
         }
      }
   }
}
