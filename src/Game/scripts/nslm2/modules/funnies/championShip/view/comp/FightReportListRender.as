package nslm2.modules.funnies.championShip.view.comp
{
   import game.ui.championship.comp.FightReportListRenderUI;
   import nslm2.modules.funnies.championShip.vo.CompeteReportVo;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.battles.reportPlayer.BattleReportParamVo;
   
   public class FightReportListRender extends FightReportListRenderUI
   {
       
      
      private var _data:CompeteReportVo;
      
      public function FightReportListRender()
      {
         super();
         btn_view.clickHandler = seeFightReport;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         _data = param1 as CompeteReportVo;
         if(_data)
         {
            txt_time.text = _data.timeStr;
            txt_info.text = _data.infoStr;
         }
      }
      
      private function seeFightReport() : void
      {
         ModuleMgr.ins.showModule(40201,BattleReportParamVo.createId(_data.battleReportID));
      }
   }
}
