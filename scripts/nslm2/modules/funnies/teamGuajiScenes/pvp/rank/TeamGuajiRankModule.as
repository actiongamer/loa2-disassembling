package nslm2.modules.funnies.teamGuajiScenes.pvp.rank
{
   import game.ui.teamGuajiScenes.rank.guajiRankingUI;
   import morn.core.components.ViewStack;
   import nslm2.modules.funnies.teamGuajiScenes.model.TeamGuajiModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.funnies.teamGuajiScenes.TeamGuajiService;
   import com.mz.core.utils.DisplayUtils;
   
   public class TeamGuajiRankModule extends guajiRankingUI
   {
       
      
      private var vs:ViewStack;
      
      private var model:TeamGuajiModel;
      
      public function TeamGuajiRankModule()
      {
         super();
         model = TeamGuajiModel.ins;
         vs = new ViewStack();
         vs.subViewClasses = [GuajiRankViewToday,GuajiRankView,GuajiRewardView];
         vs.x = 16;
         vs.y = 67;
         img_frame.mouseEnabled = false;
         DisplayUtils.addChildBelow(vs,img_frame);
         tabBar.labels = [LocaleMgr.ins.getStr(41300223),LocaleMgr.ins.getStr(41300222),LocaleMgr.ins.getStr(41300224)].join(",");
      }
      
      override public function preShow(param1:Object = null) : void
      {
         panelBg.txt_titleName.text = LocaleMgr.ins.getStr(41300221);
         TeamGuajiService.ins.getTodayRank();
         tabBar.selectHandler = changeTabHandler;
         vs.selectedIndex = 0;
         updateRedPoints();
         if(model.needGetYesterDayRankData)
         {
            TeamGuajiService.ins.getYesterDayRank();
         }
         this.preShowCpl();
      }
      
      private function updateRedPoints() : void
      {
         img_redPoint1.visible = model.hasYestoDayRankRwd;
         img_redPoint2.visible = model.hasScoreRwd;
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["update_rank_rwd_stagtus"]);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("update_rank_rwd_stagtus" === _loc3_)
         {
            updateRedPoints();
         }
      }
      
      private function changeTabHandler(param1:int) : void
      {
         vs.selectedIndex = param1;
      }
      
      override public function dispose() : void
      {
         model.dispose();
      }
   }
}
