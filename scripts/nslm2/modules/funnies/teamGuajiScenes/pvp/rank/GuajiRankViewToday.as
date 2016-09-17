package nslm2.modules.funnies.teamGuajiScenes.pvp.rank
{
   import com.mz.core.interFace.IViewStackPage;
   import nslm2.modules.funnies.teamGuajiScenes.model.TeamGuajiModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   
   public class GuajiRankViewToday extends GuajiRankView implements IViewStackPage
   {
       
      
      public function GuajiRankViewToday()
      {
         super();
         btn_getReward.visible = false;
      }
      
      override protected function updateData() : void
      {
         list_rank.dataSource = TeamGuajiModel.ins.pvpRankToday;
         if(model.rankToday > 0)
         {
            txt_myRank.text = LocaleMgr.ins.getStr(41300231) + " " + TextFieldUtil.htmlText2(model.rankToday,16773888);
         }
         else
         {
            txt_myRank.text = LocaleMgr.ins.getStr(41300231) + " " + LocaleMgr.ins.getStr(41300232);
         }
      }
   }
}
