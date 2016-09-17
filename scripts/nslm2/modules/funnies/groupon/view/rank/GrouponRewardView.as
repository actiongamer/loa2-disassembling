package nslm2.modules.funnies.groupon.view.rank
{
   import game.ui.groupon.rank.ScoreRewardViewUI;
   import com.mz.core.interFace.IViewStackPage;
   import nslm2.modules.funnies.groupon.model.GrouponModel;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   
   public class GrouponRewardView extends ScoreRewardViewUI implements IViewStackPage
   {
       
      
      public function GrouponRewardView()
      {
         super();
         (pageBarUI as IPageBar).bindList(list_rank);
      }
      
      public function viewStackIn() : void
      {
         this.visible = true;
         txt_pieceCnt.num = GrouponModel.ins.myGrouponScore;
         list_rank.dataSource = GrouponModel.ins.scoreRewardArr;
         this.fadeIn();
      }
      
      public function viewStackOut() : void
      {
         this.visible = false;
      }
   }
}
