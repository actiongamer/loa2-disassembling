package nslm2.modules.funnies.championShip.view.comp
{
   import game.ui.championship.comp.RewardListRenderUI;
   import nslm2.modules.funnies.championShip.vo.ChampionShipRewardVo;
   import nslm2.modules.funnies.championShip.model.ChampionShipModel;
   import morn.core.components.Button;
   
   public class ChampionRewardListRender extends RewardListRenderUI
   {
       
      
      private var _data:ChampionShipRewardVo;
      
      private var model:ChampionShipModel;
      
      public function ChampionRewardListRender()
      {
         model = ChampionShipModel.ins;
         super();
      }
      
      private function getReward(param1:Button) : void
      {
      }
      
      override public function set dataSource(param1:Object) : void
      {
         _data = param1 as ChampionShipRewardVo;
         if(_data)
         {
            txt_rank.text = _data.titleName;
            list_reward.dataSource = _data.rewards;
            if(model.myRank >= _data.rank[0] && model.myRank <= _data.rank[1])
            {
               img_selectBox.visible = true;
            }
            else
            {
               img_selectBox.visible = false;
            }
         }
      }
   }
}
