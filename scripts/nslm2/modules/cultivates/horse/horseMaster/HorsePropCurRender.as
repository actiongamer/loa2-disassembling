package nslm2.modules.cultivates.horse.horseMaster
{
   import game.ui.horseModules.horseMaster.HorsePropCurRenderUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.consts.NPCPropConsts;
   
   public class HorsePropCurRender extends HorsePropCurRenderUI
   {
       
      
      public function HorsePropCurRender()
      {
         super();
      }
      
      override public function validateName() : void
      {
         if(vo != null)
         {
            this.ref_txt_name.text = LocaleMgr.ins.getStr(999000059) + NPCPropConsts.ins.getLocaleNameShort2(vo.propId) + ":";
         }
         else
         {
            this.ref_txt_name.text = "";
         }
      }
   }
}
