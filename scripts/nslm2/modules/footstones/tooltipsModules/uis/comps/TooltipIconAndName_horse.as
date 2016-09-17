package nslm2.modules.footstones.tooltipsModules.uis.comps
{
   import game.ui.tooltipModules.comps.TooltipIconAndName_horseUI;
   import nslm2.mgrs.stcMgrs.vos.StcSaddlehorseVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.cultivates.horse.HorseService;
   import nslm2.modules.cultivates.horse.HorseConsts;
   
   public class TooltipIconAndName_horse extends TooltipIconAndName_horseUI
   {
       
      
      public function TooltipIconAndName_horse(param1:StcSaddlehorseVo)
      {
         super();
         var _loc3_:int = param1.id;
         param1 = StcMgr.ins.getSaddlehorseVo(_loc3_);
         this.img_icon.skin = UrlLib.horseUrl(_loc3_);
         this.txt_name.text = LocaleMgr.ins.getStr(param1.name);
         var _loc2_:int = HorseService.ins.getState(_loc3_);
         this.txt_state.text = HorseConsts.getStateName(_loc2_);
         this.txt_state.color = HorseConsts.getStateColor(_loc2_);
      }
   }
}
