package nslm2.modules.cultivates.horse.comps
{
   import game.ui.horseModules.comps.HorsePropRenderMasterUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.consts.NPCPropConsts;
   
   public class HorsePropRenderMaster extends HorsePropRenderMasterUI
   {
       
      
      public function HorsePropRenderMaster()
      {
         super();
      }
      
      override public function validateName() : void
      {
         if(vo != null)
         {
            this.ref_txt_name.text = LocaleMgr.ins.getStr(999000049) + NPCPropConsts.ins.getLocaleNameShort2(vo.propId) + ":";
         }
         else
         {
            this.ref_txt_name.text = "";
         }
      }
   }
}
