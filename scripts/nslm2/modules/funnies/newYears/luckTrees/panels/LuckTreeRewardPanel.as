package nslm2.modules.funnies.newYears.luckTrees.panels
{
   import game.ui.newYears.luckTrees.panels.LuckTreeRewardPanelUI;
   import com.mz.core.interFace.IViewStackPage;
   import nslm2.modules.funnies.newYears.luckTrees.services.LuckTreeService;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.common.model.OpActivityStaticDataModel;
   import proto.StaticOpActivityTmModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.TimeUtils;
   import nslm2.utils.RTools;
   
   public class LuckTreeRewardPanel extends LuckTreeRewardPanelUI implements IViewStackPage
   {
       
      
      public function LuckTreeRewardPanel()
      {
         super();
         this.list_gift.vScrollBarSkin = "png.a5.comps.scrollBar.vscroll_S3";
         this.txt_list_title_lv.text = LocaleMgr.ins.getStr(60800017);
         this.txt_list_title_reward.text = LocaleMgr.ins.getStr(13350015);
         this.txt_list_title_option.text = LocaleMgr.ins.getStr(13350016);
      }
      
      public function get service() : LuckTreeService
      {
         return LuckTreeService.ins;
      }
      
      public function viewStackIn() : void
      {
         this.visible = true;
         this.list_gift.array = ArrayUtil.vectorToArr(this.service.personRewardArr);
         this.refreshUI();
      }
      
      public function viewStackOut() : void
      {
         this.visible = false;
      }
      
      private function refreshUI() : void
      {
         var _loc1_:StaticOpActivityTmModel = OpActivityStaticDataModel.ins.getActivityOpenTime(13);
         this.txt_cd.text = LocaleMgr.ins.getStr(50600046) + TimeUtils.getFullTimeStrCN(_loc1_.startTm,false,false,RTools.cl(false,true),false) + " - " + TimeUtils.getFullTimeStrCN(_loc1_.endTm,false,false,RTools.cl(false,true),false);
         this.txt_score.text = LocaleMgr.ins.getStr(13350007) + ":" + this.service.infoRes.member.score;
      }
   }
}
