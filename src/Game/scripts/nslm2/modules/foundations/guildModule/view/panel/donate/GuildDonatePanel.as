package nslm2.modules.foundations.guildModule.view.panel.donate
{
   import game.ui.guildModules.donate.GuildDonatePanelUI;
   import com.mz.core.interFace.IViewStackPage;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.foundations.guildModule.model.GuildModel;
   import nslm2.modules.foundations.guildModule.vo.GuildDonateScoreRewardVo;
   import nslm2.modules.Chapters.treasureBox.TreasureBoxVo;
   import nslm2.modules.Chapters.TreasureBoxModuleVo;
   import morn.core.handlers.Handler;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.guildModule.service.GuildServiceHandler;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcGonghuiVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.model.PlayerModel;
   import morn.core.components.Label;
   import nslm2.utils.WealthUtil;
   import nslm2.common.ui.components.comps2d.others.TreasureBoxBaseRender;
   import morn.core.managers.timerMgrs.TimerManager;
   import proto.FamilyDonateRecord;
   import com.greensock.TweenLite;
   import proto.PlayerBaseInfo;
   import nslm2.modules.foundations.AlertUtil;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.common.compsEffects.FloatZoomInEffCtrl;
   import nslm2.common.ctrls.ProgressBarCtrl;
   
   public class GuildDonatePanel extends GuildDonatePanelUI implements IViewStackPage, IObserver
   {
      
      private static const DONATE_MSG_LAN_BASE:int = 11000503;
      
      private static const DONATE_TIP_LAN_BASE:int = 11000510;
      
      private static const BOX_TYPE_LAN_BASE:int = 11000611;
       
      
      private var model:GuildModel;
      
      private var crtRewardArr:Array;
      
      private var crtTaskScoreVo:GuildDonateScoreRewardVo;
      
      private var crtTreuasreBoxIndex:int;
      
      private var crtNoticeIndex:int = 0;
      
      private var noticeArr:Array;
      
      public function GuildDonatePanel()
      {
         model = GuildModel.ins;
         noticeArr = [];
         super();
         updateTreasureBoxStyle();
         list_chest.changeHandler = listChestClickHandler;
         this.parts.push(new ProgressBarCtrl(this.progressBar).splitCnt(4));
      }
      
      private function listChestClickHandler(param1:int, param2:int) : void
      {
         var _loc4_:TreasureBoxVo = list_chest.getItem(param1) as TreasureBoxVo;
         crtTaskScoreVo = crtRewardArr[param1];
         crtTreuasreBoxIndex = param1;
         var _loc3_:TreasureBoxModuleVo = new TreasureBoxModuleVo(_loc4_,null,new Handler(rewardHandler,[crtTaskScoreVo]),40700);
         ModuleMgr.ins.showModule(40401,_loc3_,40700);
      }
      
      private function rewardHandler(param1:GuildDonateScoreRewardVo) : void
      {
         GuildServiceHandler.ins.server_familyDonateReward(param1.id,getTaskScoreRewardSuccess);
      }
      
      private function getTaskScoreRewardSuccess(param1:Object = null) : void
      {
         model.updateGottedRewardArr(crtTaskScoreVo.id);
         updateDonateScore();
         var _loc2_:TreasureBoxVo = list_chest.getItem(crtTreuasreBoxIndex) as TreasureBoxVo;
         ObserverMgr.ins.sendNotice("evtModuleRefresh",_loc2_);
         ObserverMgr.ins.sendNotice("guild_notice_update_donate_data");
      }
      
      public function viewStackIn() : void
      {
         this.fadeIn();
         this.visible = true;
         update();
         GuildServiceHandler.ins.getDonateInfo();
         showDialog();
         startShowNpcDialog();
         ObserverMgr.ins.regObserver(this);
      }
      
      private function update(param1:Boolean = true) : void
      {
         var _loc2_:* = null;
         if(model.guildInfo)
         {
            _loc2_ = StcMgr.ins.getGonghuiVo(model.guildInfo.lv);
            txt_level.text = "Lv." + model.guildInfo.lv + "（" + model.guildInfo.exp + "/" + _loc2_.exp + "）";
            txt_expLimit.text = LocaleMgr.ins.getStr(40700031,[model.guildInfo.lv,model.guildInfo.max]);
         }
         txt_conValue.text = model.donateScore + "";
         txt_coin.text = PlayerModel.ins.getWealthValue(6) + "";
         if(param1)
         {
            txt_myContr.text = model.con + "";
         }
         list_donate.dataSource = [1,2,3];
         updateDonateScore();
         updateNoticeArr();
      }
      
      private function updateDonateScore() : void
      {
         var _loc5_:* = null;
         var _loc7_:int = 0;
         var _loc4_:* = null;
         var _loc3_:int = model.donateScore;
         txt_conValue.text = _loc3_ + "";
         crtRewardArr = model.crtScoreRewardArr;
         var _loc6_:int = crtRewardArr.length;
         var _loc2_:int = 120;
         var _loc1_:Array = [];
         _loc7_ = 0;
         while(_loc7_ < _loc6_)
         {
            _loc4_ = crtRewardArr[_loc7_];
            (this["txt_score_" + _loc7_] as Label).text = LocaleMgr.ins.getStr(11000866) + _loc4_.needScore;
            _loc5_ = new TreasureBoxVo(null,1);
            if(_loc4_.status == -1)
            {
               _loc5_.state = 1;
            }
            if(_loc4_.status == 0)
            {
               _loc5_.state = 2;
            }
            if(_loc4_.status > 0)
            {
               _loc5_.state = 3;
            }
            _loc5_.itemArr = WealthUtil.dropGroupIDToWealthVoArr(_loc4_.dropID);
            _loc5_.toolTip = LocaleMgr.ins.getStr(11000611 + _loc7_) + "\n" + LocaleMgr.ins.getStr(11000615,[_loc4_.needScore]);
            _loc5_.optionData = LocaleMgr.ins.getStr(11000615,[_loc4_.needScore]);
            _loc1_.push(_loc5_);
            _loc7_++;
         }
         list_chest.dataSource = _loc1_;
         progressBar.value = _loc3_ / _loc2_;
      }
      
      private function updateTreasureBoxStyle() : void
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         var _loc2_:int = list_chest.cells.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = list_chest.getCell(_loc3_) as TreasureBoxBaseRender;
            _loc1_.treasureType = _loc3_ > 2?2:_loc3_;
            _loc3_++;
         }
      }
      
      private function startShowNpcDialog() : void
      {
         if(noticeArr.length)
         {
            TimerManager.ins.doLoop(4000,showDialog);
         }
      }
      
      private function stopShowNpcDiaLog() : void
      {
         TimerManager.ins.clearTimer(showDialog);
      }
      
      private function updateNoticeArr() : void
      {
         var _loc3_:* = null;
         noticeArr = [];
         var _loc2_:int = model.donateRecord.length;
         var _loc6_:int = 0;
         var _loc5_:* = model.donateRecord;
         for each(var _loc1_ in model.donateRecord)
         {
            _loc3_ = LocaleMgr.ins.getStr(11000503 + _loc1_.kind,[_loc1_.player]);
            noticeArr.push(_loc3_);
         }
         var _loc4_:int = 1;
         while(noticeArr.length < 4)
         {
            noticeArr.push(LocaleMgr.ins.getStr(11000510 + _loc4_));
            _loc4_++;
         }
      }
      
      private function showDialog() : void
      {
         crtNoticeIndex = Number(crtNoticeIndex) + 1;
         if(crtNoticeIndex > noticeArr.length - 1)
         {
            crtNoticeIndex = 0;
         }
         var _loc1_:String = noticeArr[crtNoticeIndex];
         donateDialog.txt_notice.width = 400;
         donateDialog.txt_notice.multiline = true;
         donateDialog.txt_notice.wordWrap = true;
         donateDialog.txt_notice.text = _loc1_;
         donateDialog.img_bg.width = donateDialog.txt_notice.width + 40;
         donateDialog.img_bg.height = donateDialog.txt_notice.height + 50;
         TweenLite.killTweensOf(donateDialog);
         var _loc2_:int = 1;
         donateDialog.scaleY = _loc2_;
         donateDialog.scaleX = _loc2_;
         TweenLite.from(donateDialog,0.3,{
            "alpha":0,
            "scaleX":0.1,
            "scaleY":0.2
         });
      }
      
      public function viewStackOut() : void
      {
         this.visible = false;
         stopShowNpcDiaLog();
         ObserverMgr.ins.unregObserver(this);
      }
      
      public function getFocusNotices() : Array
      {
         return ["guild_notice_update_donate_data","guild_notice_donate_success"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc8_:int = 0;
         var _loc3_:* = null;
         var _loc7_:* = null;
         var _loc6_:* = null;
         var _loc5_:* = null;
         var _loc4_:int = 0;
         var _loc9_:* = param1;
         if("guild_notice_update_donate_data" !== _loc9_)
         {
            if("guild_notice_donate_success" === _loc9_)
            {
               _loc8_ = param2;
               _loc3_ = new PlayerBaseInfo();
               _loc3_.id = PlayerModel.ins.playerInfo.id;
               _loc3_.name = PlayerModel.ins.playerInfo.name;
               _loc7_ = LocaleMgr.ins.getStr(11000503 + _loc8_,[_loc3_]);
               noticeArr.unshift(_loc7_);
               update(false);
               _loc6_ = model.donateHornorArr[_loc8_ - 1] as String;
               _loc5_ = model.donateGuildCoinArr[_loc8_ - 1];
               _loc4_ = _loc6_;
               AlertUtil.float(LocaleMgr.ins.getStr(11000205) + LocaleMgr.ins.getStr(40700010) + " + " + _loc4_,null,-1,floatTxtComplete,DisplayUtils.globarCenter(this.txt_myContr));
               AlertUtil.float(LocaleMgr.ins.getStr(3006) + " + " + _loc5_,null,-1,floatCoinTxtComplete,DisplayUtils.globarCenter(this.txt_coin));
            }
         }
         else
         {
            update();
         }
      }
      
      private function floatTxtComplete() : void
      {
         new FloatZoomInEffCtrl(txt_myContr);
         txt_myContr.text = model.con + "";
      }
      
      private function floatCoinTxtComplete() : void
      {
         new FloatZoomInEffCtrl(txt_coin);
         txt_coin.text = PlayerModel.ins.getWealthValue(6) + "";
      }
      
      override public function dispose() : void
      {
         this.stopShowNpcDiaLog();
         super.dispose();
      }
   }
}
