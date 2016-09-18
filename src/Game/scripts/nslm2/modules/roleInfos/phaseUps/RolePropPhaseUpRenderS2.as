package nslm2.modules.roleInfos.phaseUps
{
   import game.ui.roleInfos.phaseUps.RolePropPhaseUpRenderS2UI;
   import nslm2.common.consts.NPCPropConsts;
   
   public class RolePropPhaseUpRenderS2 extends RolePropPhaseUpRenderS2UI
   {
       
      
      public function RolePropPhaseUpRenderS2()
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
