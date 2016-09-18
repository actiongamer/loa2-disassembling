package nslm2.modules.funnies.dials.panels
{
   import game.ui.dialModule.panels.DialRankPanelUI;
   import com.mz.core.interFace.IViewStackPage;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.funnies.dials.model.DialModel;
   import nslm2.common.model.OpActivityStaticDataModel;
   import proto.StaticOpActivityTmModel;
   import nslm2.modules.funnies.dials.consts.DialConsts;
   import nslm2.utils.TimeUtils;
   import nslm2.utils.RTools;
   import nslm2.modules.funnies.dials.msgs.DialMsgs;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.funnies.dials.renders.DialMyScoreRender;
   
   public class DialRankPanel extends DialRankPanelUI implements IViewStackPage
   {
       
      
      public function DialRankPanel()
      {
         super();
         initLanguage();
      }
      
      private function initLanguage() : void
      {
         var _loc1_:* = null;
         this.txt_60800015.text = LocaleMgr.ins.getStr(60800015,[DialModel.ins.shangbangMin]);
         this.txt_60800016.text = LocaleMgr.ins.getStr(60800016);
         this.txt_60800017.text = LocaleMgr.ins.getStr(60800017);
         this.txt_60800018.text = LocaleMgr.ins.getStr(60800018);
         this.txt_60800019.text = LocaleMgr.ins.getStr(60800019,[DialModel.ins.chaojiMin]);
         this.txt_60800026.text = LocaleMgr.ins.getStr(60800026);
         if(DialModel.TYPE == 60800)
         {
            _loc1_ = OpActivityStaticDataModel.ins.getActivityOpenTime(4);
         }
         else
         {
            _loc1_ = OpActivityStaticDataModel.ins.getActivityOpenTime(DialConsts.timeKind_funny);
         }
         this.txt_60800029.text = LocaleMgr.ins.getStr(60800029,[TimeUtils.getFullTimeStrCN(_loc1_.endTm,false,false,RTools.cl(false,true))]);
      }
      
      public function viewStackIn() : void
      {
         this.visible = true;
         switchEventListeners(true);
         this.txt_time.text = DialModel.ins.getDialTimeStr();
         refresh();
      }
      
      public function viewStackOut() : void
      {
         this.visible = false;
         switchEventListeners(false);
      }
      
      public function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            DialMsgs.ins.addEventListener("rank_data_cpl",onRankChanged);
         }
         else
         {
            DialMsgs.ins.removeEventListener("rank_data_cpl",onRankChanged);
         }
      }
      
      private function onRankChanged(param1:MzEvent) : void
      {
         refresh();
      }
      
      private function refresh() : void
      {
         this.list_rank.dataSource = DialModel.ins.rewardArr;
         if(DialModel.ins.zhuanPanInfoRes.rank != 0)
         {
            this.txt_rank.text = LocaleMgr.ins.getStr(50400106) + DialModel.ins.zhuanPanInfoRes.rank;
         }
         else
         {
            this.txt_rank.text = LocaleMgr.ins.getStr(50400106) + LocaleMgr.ins.getStr(41300096);
         }
         (this.render_myScore as DialMyScoreRender).init();
      }
   }
}
