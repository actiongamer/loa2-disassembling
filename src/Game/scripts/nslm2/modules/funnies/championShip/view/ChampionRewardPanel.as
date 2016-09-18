package nslm2.modules.funnies.championShip.view
{
   import game.ui.championship.ChampionShipRewardPanelUI;
   import nslm2.modules.funnies.championShip.model.ChampionShipModel;
   
   public class ChampionRewardPanel extends ChampionShipRewardPanelUI
   {
       
      
      public function ChampionRewardPanel()
      {
         super();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.titleImgId = this.moduleId;
         list.dataSource = ChampionShipModel.ins.rewardList;
         super.preShow();
      }
   }
}
