package nslm2.modules.funnies.teamGuajiScenes.pvp.rank
{
   import game.ui.teamGuajiScenes.rank.CommonRankViewUI;
   import com.mz.core.interFace.IViewStackPage;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.funnies.teamGuajiScenes.model.TeamGuajiModel;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.modules.funnies.teamGuajiScenes.TeamGuajiService;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   
   public class GuajiRankView extends CommonRankViewUI implements IViewStackPage, IObserver
   {
       
      
      protected var model:TeamGuajiModel;
      
      private var eff:BmcSpriteSheet;
      
      public function GuajiRankView()
      {
         model = TeamGuajiModel.ins;
         super();
         btn_getReward.clickHandler = getReward;
         (pageBarUI as IPageBar).bindList(list_rank);
         helpComp.toolTip = LocaleMgr.ins.getStr(41300244);
      }
      
      public function viewStackIn() : void
      {
         this.visible = true;
         ObserverMgr.ins.regObserver(this);
         this.fadeIn();
         updateData();
      }
      
      public function viewStackOut() : void
      {
         this.visible = false;
         ObserverMgr.ins.unregObserver(this);
      }
      
      protected function updateData() : void
      {
         list_rank.dataSource = model.yesterdayRank;
         btn_getReward.disabled = model.rankYesterDay == 0 || model.rankYesterDay > 50 || model.hasGotYestoDayReward;
         showBtnEff(!btn_getReward.disabled);
         if(model.hasGotYestoDayReward)
         {
            btn_getReward.disabled = true;
            btn_getReward.label = LocaleMgr.ins.getStr(41300087);
         }
         if(model.rankYesterDay > 0)
         {
            txt_myRank.text = LocaleMgr.ins.getStr(41300098) + " " + TextFieldUtil.htmlText2(model.rankYesterDay,16773888);
         }
         else
         {
            txt_myRank.text = LocaleMgr.ins.getStr(41300098) + " " + LocaleMgr.ins.getStr(41300232);
         }
      }
      
      public function getFocusNotices() : Array
      {
         return ["guaji_rank_update"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         if(param1 == "guaji_rank_update")
         {
            updateData();
         }
      }
      
      private function getReward() : void
      {
         TeamGuajiService.ins.getPvPScoreReward(getRewardSuccess);
      }
      
      private function getRewardSuccess() : void
      {
         FloatUtil.showGetItemsDisplayPanel(model.getRewardByRank(model.rankYesterDay));
         btn_getReward.disabled = true;
         btn_getReward.label = LocaleMgr.ins.getStr(41300087);
         model.hasGotYestoDayReward = true;
         model.updateYesterDayRewardStatus();
         showBtnEff(false);
      }
      
      private function showBtnEff(param1:Boolean) : void
      {
         if(param1)
         {
            if(!eff)
            {
               eff = new BmcSpriteSheet();
               eff.init(115002,1,"all",true);
               eff.x = btn_getReward.x - 8;
               eff.y = btn_getReward.y - 10;
               addChild(eff);
            }
         }
         else if(eff)
         {
            eff.dispose();
            eff = null;
         }
      }
   }
}
