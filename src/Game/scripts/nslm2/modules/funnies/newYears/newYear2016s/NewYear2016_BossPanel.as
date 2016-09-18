package nslm2.modules.funnies.newYears.newYear2016s
{
   import game.ui.newYears.newYear2016s.NewYear2016_BossPanelUI;
   import com.mz.core.interFace.IViewStackPage;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.funnies.newYears.newYear2016s.models.NewYear2016Service;
   import com.mz.core.mgrs.ObserverMgr;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.funnies.newYears.newYear2016s.bossPanels.NewYear2016_BossFightAlert;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.SpringBeatBossLastRankRes;
   import nslm2.modules.funnies.arenas.rewards.ActRewardVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import morn.customs.expands.MornExpandUtil;
   import com.mz.core.mediators.RollHighLightMediator;
   
   public class NewYear2016_BossPanel extends NewYear2016_BossPanelUI implements IViewStackPage, IObserver
   {
       
      
      public function NewYear2016_BossPanel()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         this.switchEventListeners(true);
         this.txt_tip1.text = LocaleMgr.ins.getStr(13310002);
         this.txt_tip2.text = LocaleMgr.ins.getStr(13310005);
         this.txt_icon1.text = LocaleMgr.ins.getStr(999000434);
         this.txt_icon2.text = LocaleMgr.ins.getStr(999000435);
         this.txt_icon1.mouseEvent = false;
         this.txt_icon2.mouseEvent = false;
         this.img_icon1.buttonMode = true;
         this.img_icon2.buttonMode = true;
         this.img_icon1.addEventListener("click",img_icon1_handler);
         this.img_icon2.addEventListener("click",img_icon2_handler);
         this.img_icon1.parts.push(new RollHighLightMediator(this.img_icon1));
         this.img_icon2.parts.push(new RollHighLightMediator(this.img_icon2));
         this.redPoi.visible = NpcFuncService.ins.getVo(13312).count > 0;
      }
      
      public function get service() : NewYear2016Service
      {
         return NewYear2016Service.ins;
      }
      
      public function viewStackIn() : void
      {
         this.visible = true;
      }
      
      public function viewStackOut() : void
      {
         this.visible = false;
      }
      
      private function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            ObserverMgr.ins.regObserver(this);
         }
         else
         {
            ObserverMgr.ins.unregObserver(this);
         }
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.btn_get === _loc3_)
         {
            if(param2.ctrlKey)
            {
               AlertUtil.comfirm(new NewYear2016_BossFightAlert(),btn_get_alert_yes);
            }
            else
            {
               ModuleMgr.ins.closeModule(13310);
               ObserverMgr.ins.sendNotice("task_notice_auto_track_by_func_id",13312);
            }
         }
      }
      
      private function btn_get_alert_yes() : void
      {
         this.service.server_bossStart();
      }
      
      private function img_icon1_handler(... rest) : void
      {
         ModuleMgr.ins.showModule(50231,[3,LocaleMgr.ins.getStr(999000436)],ModuleMgr.ins.popLayer.curModuleId);
      }
      
      private function img_icon2_handler(... rest) : void
      {
         this.service.server_rewardRank(getRewardInfo);
      }
      
      private function getRewardInfo(param1:SpringBeatBossLastRankRes) : void
      {
         var _loc2_:ActRewardVo = new ActRewardVo();
         _loc2_.list_items = StcMgr.ins.getVoArrByColumnValue("static_rank","kind",11);
         _loc2_.canGetReward = param1.myLastRank > 0 && param1.haveGetReward == false;
         _loc2_.hasGotReward = param1.haveGetReward;
         if(param1.myLastRank == 0)
         {
            _loc2_.notReward = true;
         }
         _loc2_.canGetTip = LocaleMgr.ins.getStr(50200009);
         _loc2_.haveGotTipTop = LocaleMgr.ins.getStr(50200009);
         _loc2_.haveGotTip = LocaleMgr.ins.getStr(50200029);
         _loc2_.rankStr = param1.myLastRank > 100?LocaleMgr.ins.getStr(999000436):param1.myLastRank + "";
         _loc2_.yesterdayRank = param1.myLastRank;
         _loc2_.rank = param1.myLastRank;
         _loc2_.getHandler = getBeatBossRankReward;
         _loc2_.canNotGetTip = "";
         ModuleMgr.ins.showModule(50242,_loc2_,ModuleMgr.ins.popLayer.curModuleId);
      }
      
      private function getBeatBossRankReward() : void
      {
         ModuleMgr.ins.closeModule(50242);
         this.service.server_getBeatBossRankReward();
      }
      
      public function getFocusNotices() : Array
      {
         return ["MSG_NPC_FUNC_VO_CHANGE"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("MSG_NPC_FUNC_VO_CHANGE" === _loc3_)
         {
            if(param2 == 13312)
            {
               this.redPoi.visible = NpcFuncService.ins.getVo(13312).count > 0;
            }
         }
      }
      
      override public function dispose() : void
      {
         switchEventListeners(false);
         super.dispose();
      }
   }
}
