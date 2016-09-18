package nslm2.modules.funnies.teamGuajiScenes.pvp.rank
{
   import game.ui.teamGuajiScenes.rank.ScoreRewardViewUI;
   import com.mz.core.interFace.IViewStackPage;
   import nslm2.modules.funnies.teamGuajiScenes.model.TeamGuajiModel;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   
   public class GuajiRewardView extends ScoreRewardViewUI implements IViewStackPage
   {
       
      
      public function GuajiRewardView()
      {
         super();
         (pageBarUI as IPageBar).bindList(list_rank);
      }
      
      public function viewStackIn() : void
      {
         this.visible = true;
         txt_pieceCnt.num = TeamGuajiModel.ins.robPieceCountToday;
         list_rank.dataSource = TeamGuajiModel.ins.pvpScoreReward;
         this.fadeIn();
      }
      
      public function viewStackOut() : void
      {
         this.visible = false;
      }
   }
}
