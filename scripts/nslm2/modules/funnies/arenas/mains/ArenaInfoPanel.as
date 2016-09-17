package nslm2.modules.funnies.arenas.mains
{
   import game.ui.arenas.mains.ArenaInfoPanelUI;
   import proto.ArenaInfoRes;
   import nslm2.modules.funnies.arenas.ArenaService;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import nslm2.modules.funnies.arenas.ArenaModel;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.AlertUtil;
   import morn.core.components.Button;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.funnies.arenas.ArenaUtil;
   import nslm2.modules.foundations.vip.model.VipModel;
   import nslm2.common.ui.components.comps2d.others.QQBuyTimesRender;
   import nslm2.modules.funnies.arenas.rewards.ActRewardVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.nets.sockets.ServerEngine;
   import proto.ArenaGetRankRewardRes;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.utils.LabelUtils;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.utils.TimeUtils;
   import nslm2.utils.ServerTimer;
   import proto.ArenaBuyTimesRes;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import com.mz.core.utils.DisplayUtils;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.modules.foundations.activities.model.ActivityModel;
   import nslm2.common.ui.components.comps2d.others.ActivityDoubleTip;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   
   public class ArenaInfoPanel extends ArenaInfoPanelUI
   {
       
      
      private var textCDCtrl:TextCDCtrlS2;
      
      private var textCDCtrl_reward:TextCDCtrlS2;
      
      private var _lingjiangbeiguo:String = "lingJiangBeiGuo";
      
      public function ArenaInfoPanel()
      {
         var _loc1_:* = null;
         super();
         DisplayUtils.addChildFromGlobal(this.btn_rank,txt_rankTip);
         DisplayUtils.addChildFromGlobal(this.btn_getSwap,txt_scoreSwapTip);
         textCDCtrl = new TextCDCtrlS2(this.txt_cd,textCDFormat,txtCDCtrl_cpl);
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         this.txt_cdTitle.setVisibleList(_lingjiangbeiguo,false);
         this.txt_cd.setVisibleList(_lingjiangbeiguo,false);
         this.btn_clearCD.setVisibleList(_lingjiangbeiguo,false);
         if(ActivityModel.ins.have(1010))
         {
            _loc1_ = new ActivityDoubleTip(LocaleMgr.ins.getStr(999000393),LocaleMgr.ins.getStr(999000394));
            this.addChild(_loc1_);
            _loc1_.x = 85;
            _loc1_.y = 128;
         }
         this.checkBox_simple.selected = ArenaModel.ins.showSimpleFight && ArenaModel.ins.canUseSimpleFight();
         this.checkBox_simple.preCondHandler = simpleFightPreHandler;
         this.checkBox_simple.clickHandler = simpleClick;
         this.txt_more.toolTip = LocaleMgr.ins.getStr(41210617);
         this.txt_more.text = TextFieldUtil.linkHtmlText2(LocaleMgr.ins.getStr(999000563),LinkUtils.evtString(0));
         this.txt_more.addEventListener("click",txt_more_onClick);
      }
      
      public function get infoRes() : ArenaInfoRes
      {
         return ArenaService.ins.infoRes;
      }
      
      private function simpleClick() : void
      {
         ArenaModel.ins.showSimpleFight = this.checkBox_simple.selected;
      }
      
      private function txt_more_onClick(param1:MouseEvent) : void
      {
         ModuleMgr.ins.showOrCloseModule(50900,50280);
      }
      
      private function simpleFightPreHandler() : Boolean
      {
         if(ArenaModel.ins.canUseSimpleFight())
         {
            return true;
         }
         AlertUtil.lackLevel(35);
         return false;
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.btn_rank !== _loc3_)
         {
            if(this.btn_getSwap !== _loc3_)
            {
               if(this.btn_buyTimes !== _loc3_)
               {
                  if(this.btn_clearCD === _loc3_)
                  {
                     ArenaUtil.ins.toClearCD();
                  }
               }
               else if(canShowBuyTimesPop())
               {
                  showBuyTimesPop();
               }
               else
               {
                  AlertUtil.float(LocaleMgr.ins.getStr(50200108));
               }
            }
            else
            {
               ModuleMgr.ins.showModule(50241,null);
            }
         }
         else
         {
            ModuleMgr.ins.showModule(50231,[0,infoRes.rank]);
         }
      }
      
      public function canShowBuyTimesPop() : Boolean
      {
         return infoRes.buyTimesCount < int(VipModel.ins.getVipValue(10210));
      }
      
      public function showBuyTimesPop() : void
      {
         var _loc1_:QQBuyTimesRender = new QQBuyTimesRender();
         _loc1_.curTimes(infoRes.buyTimesCount);
         _loc1_.alert(LocaleMgr.ins.getStr(50200012,[infoRes.buyTimesDiamond]) + "\n" + LocaleMgr.ins.getStr(50200107,[infoRes.buyTimesCount,int(VipModel.ins.getVipValue(10210))]));
         AlertUtil.comfirm(_loc1_,buyTimes_yes,null,null,null,null,null,false,10210);
      }
      
      private function treasureBox_onClick(param1:MouseEvent) : void
      {
         var _loc2_:ActRewardVo = new ActRewardVo();
         _loc2_.list_items = StcMgr.ins.getVoArrByColumnValue("static_rank","kind",3);
         _loc2_.canGetReward = infoRes.rankRewardStatus == 2;
         _loc2_.hasGotReward = infoRes.rankRewardStatus == 3;
         _loc2_.canNotGetTip = LocaleMgr.ins.getStr(50200028);
         _loc2_.canGetTip = LocaleMgr.ins.getStr(50200009);
         _loc2_.haveGotTip = LocaleMgr.ins.getStr(50200029);
         _loc2_.yesterdayRank = infoRes.yesterdayRank;
         _loc2_.rank = infoRes.rank;
         _loc2_.getHandler = getRankReward;
         _loc2_.tipString = LocaleMgr.ins.getStr(50200904);
         ModuleMgr.ins.showModule(50242,_loc2_);
      }
      
      private function getRankReward() : void
      {
         ServerEngine.ins.send(4037,null,server_arenaGetRankReward_cpl);
      }
      
      private function server_arenaGetRankReward_cpl(param1:ArenaGetRankRewardRes) : void
      {
         ObserverMgr.ins.sendNotice("ACT_RANK_REWARD_GET_SUCCES");
      }
      
      public function refresh() : void
      {
         this.txt_rank.text = String(infoRes.rank);
         this.txt_scoreValue.text = String(infoRes.scores);
         this.scoreSwapRedPoi.visible = infoRes.canGetScoreReward;
         this.txt_times.text = LabelUtils.leaveMaxStrGR(infoRes.residualTimes,int(VipModel.ins.getVipValue(10200)));
         btn_clearCD.visible = infoRes.isCdRed;
         textCDCtrl.start(infoRes.cdStamp);
         if(infoRes.rankRewardStatus != 2)
         {
         }
      }
      
      public function refreshScoreState() : void
      {
         this.scoreSwapRedPoi.visible = infoRes.canGetScoreReward;
      }
      
      public function refreshRank() : void
      {
         this.txt_rank.text = String(infoRes.rank);
      }
      
      private function textCDFormat(param1:int) : String
      {
         return TextFieldUtil.htmlText2(TimeUtils.hisColonAddZero2(param1),LabelUtils.cdColor(!infoRes.isCdRed));
      }
      
      private function txtCDCtrl_cpl() : void
      {
         infoRes.isCdRed = false;
         btn_clearCD.visible = false;
         this.txt_cd.text = TextFieldUtil.htmlText2("00:00",LabelUtils.cdColor(true));
      }
      
      private function textCDFormat_reward(param1:int) : String
      {
         if(infoRes.rankRewardStatus != 1)
         {
            return "";
         }
         return TextFieldUtil.htmlText2(TimeUtils.hisColonFullAddZero(param1),LabelUtils.cdColor(false));
      }
      
      private function txtCDCtrl_reward_cpl() : void
      {
         infoRes.rankRewardStatus = 2;
         if(ServerTimer.ins.second >= infoRes.rankRefreshTime)
         {
            infoRes.rankRefreshTime = infoRes.rankRefreshTime + 86400;
         }
      }
      
      private function buyTimes_yes() : void
      {
         ServerEngine.ins.send(4034,null,server_buyTime_cpl);
      }
      
      private function server_buyTime_cpl(param1:ArenaBuyTimesRes) : void
      {
         var _loc2_:Array = [];
         _loc2_.push(LocaleMgr.ins.getStr(50200012,[infoRes.buyTimesDiamond]) + "\n" + LocaleMgr.ins.getStr(50200107,[infoRes.buyTimesCount,int(VipModel.ins.getVipValue(10210))]));
         if(param1.nextDiamondCost != this.infoRes.buyTimesDiamond)
         {
            _loc2_.push(param1.nextDiamondCost);
         }
         _loc2_.push(param1.buyTimesCount);
         AlertUtil.float(LocaleMgr.ins.getStr(50200025));
         this.infoRes.residualTimes = param1.residualTimes;
         NpcFuncService.ins.changeCount(50200,param1.residualTimes);
         this.infoRes.buyTimesDiamond = param1.nextDiamondCost;
         this.infoRes.buyTimesCount = param1.buyTimesCount;
         this.txt_times.text = LabelUtils.leaveMaxStr(infoRes.residualTimes,int(VipModel.ins.getVipValue(10200)));
         ObserverMgr.ins.sendNotice("changeContentArena",this.infoRes);
      }
   }
}
