package nslm2.modules.cultivates.horse.comps
{
   import game.ui.horseModules.comps.HorseTitleNameUI;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcSaddlehorseVo;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class HorseTitleName extends HorseTitleNameUI
   {
       
      
      public function HorseTitleName()
      {
         super();
      }
      
      public function set stcHorseId(param1:int) : void
      {
         var _loc2_:StcSaddlehorseVo = StcMgr.ins.getSaddlehorseVo(param1);
         this.txt_name.color = ColorLib.qualityColor(_loc2_.quality);
         this.txt_name.text = LocaleMgr.ins.getStr(_loc2_.name);
      }
   }
}
