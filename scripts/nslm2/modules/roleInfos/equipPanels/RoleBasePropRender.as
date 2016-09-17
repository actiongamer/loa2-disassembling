package nslm2.modules.roleInfos.equipPanels
{
   import game.ui.roleInfos.equipPanels.BasePropRenderUI;
   import nslm2.common.consts.NPCPropConsts;
   
   public class RoleBasePropRender extends BasePropRenderUI
   {
       
      
      public function RoleBasePropRender()
      {
         super();
      }
      
      override public function validateName() : void
      {
         if(this.ref_txt_name)
         {
            if(vo != null)
            {
               this.ref_txt_name.text = NPCPropConsts.ins.getLocaleName(vo.propId) + "： ";
            }
            else
            {
               this.ref_txt_name.text = "";
            }
         }
      }
   }
}
