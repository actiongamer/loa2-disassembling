package nslm2.modules.cultivates.horse.horseMaster
{
   import game.ui.horseModules.horseMaster.HorsePropNextRenderUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.consts.NPCPropConsts;
   import nslm2.common.compsEffects.FloatUpDownEffCtrl;
   
   public class HorsePropNextRender extends HorsePropNextRenderUI
   {
       
      
      public function HorsePropNextRender()
      {
         super();
         this.parts.push(new FloatUpDownEffCtrl().config(0.4).init(this.arrowUp,this.arrowUp.y,2,2));
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
