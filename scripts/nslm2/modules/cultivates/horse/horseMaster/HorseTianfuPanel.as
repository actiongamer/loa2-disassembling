package nslm2.modules.cultivates.horse.horseMaster
{
   import game.ui.horseModules.horseMaster.HorseTianfuPanelUI;
   import nslm2.mgrs.stcMgrs.StcMgr;
   
   public class HorseTianfuPanel extends HorseTianfuPanelUI
   {
       
      
      public function HorseTianfuPanel()
      {
         super();
         this.panelBg.titleImgId = 30321;
      }
      
      public function show() : void
      {
         this.list_tianfu.dataSource = StcMgr.ins.getHorseupgradeTable().array.sortOn("level",16).slice(1);
      }
   }
}
