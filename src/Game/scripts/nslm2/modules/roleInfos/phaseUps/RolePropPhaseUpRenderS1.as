package nslm2.modules.roleInfos.phaseUps
{
   import game.ui.roleInfos.phaseUps.RolePropPhaseUpRenderS1UI;
   import nslm2.common.consts.NPCPropConsts;
   
   public class RolePropPhaseUpRenderS1 extends RolePropPhaseUpRenderS1UI
   {
       
      
      public function RolePropPhaseUpRenderS1()
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
