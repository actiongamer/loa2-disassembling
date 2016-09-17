package nslm2.modules.funnies.championShip.view
{
   import game.ui.championship.ChampionCompeteRecordPanelUI;
   import nslm2.modules.funnies.championShip.service.ChampionShipService;
   import proto.CompetePlayerRankInfoRes;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   
   public class ChampionshipCompeteRecordPanel extends ChampionCompeteRecordPanelUI
   {
       
      
      public function ChampionshipCompeteRecordPanel()
      {
         super();
         (pageBar as IPageBar).bindList(list_record);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.titleImgId = this.moduleId;
         ChampionShipService.ins.getCompeteRecord(gotRecord);
         super.preShow();
      }
      
      private function gotRecord(param1:CompetePlayerRankInfoRes) : void
      {
         if(param1)
         {
            param1.rankInfos.sortOn("createTime",16 | 2);
            list_record.dataSource = param1.rankInfos;
         }
         else
         {
            list_record.dataSource = [];
         }
      }
   }
}
