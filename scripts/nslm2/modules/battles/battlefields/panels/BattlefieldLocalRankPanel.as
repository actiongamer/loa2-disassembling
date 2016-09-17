package nslm2.modules.battles.battlefields.panels
{
   import game.ui.battlefield.BattlefieldRank.panel.BattlefieldLocalRankPanelUI;
   import com.mz.core.interFace.IViewStackPage;
   import nslm2.common.ui.components.comps2d.pageBar.PageBarS2;
   import nslm2.modules.battles.battlefields.msgs.BattlefieldMsgs;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.battles.battlefields.model.BattlefieldModel;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   import proto.BgGetRankInfoReq;
   import nslm2.modules.battles.battlefields.service.BattlefieldService;
   import proto.BgGetRankInfoRes;
   import com.mz.core.event.MzEvent;
   import flash.events.MouseEvent;
   import nslm2.modules.funnies.arenas.rewards.ActRewardVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class BattlefieldLocalRankPanel extends BattlefieldLocalRankPanelUI implements IViewStackPage
   {
       
      
      private var _rankDataArr:Array;
      
      private var _reqPage:int;
      
      private var _bgGetRankInfoRes:BgGetRankInfoRes;
      
      public function BattlefieldLocalRankPanel()
      {
         super();
         this.visible = false;
      }
      
      private function get pageBar() : PageBarS2
      {
         return this.pageBarUI as PageBarS2;
      }
      
      public function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            BattlefieldMsgs.ins.addEventListener("msgBattlefieldGetRankPageCpl",onGetRankCpl);
         }
         else
         {
            BattlefieldMsgs.ins.removeEventListener("msgBattlefieldGetRankPageCpl",onGetRankCpl);
         }
      }
      
      public function viewStackIn() : void
      {
         switchEventListeners(true);
         if(_rankDataArr == null)
         {
            getDataHandler(0);
         }
         else
         {
            this.visible = true;
            this.show();
            this.fadeIn(0,13000);
         }
      }
      
      private function init() : void
      {
         this.list_task.dataSource = this._rankDataArr;
         this.list_task.commitMeasure();
         this.pageBar.bindList(this.list_task);
         this.pageBar.ctrl.getDataHandler = getDataHandler;
         this.visible = true;
         this.show();
         this.fadeIn(0,13000);
      }
      
      public function viewStackOut() : void
      {
         switchEventListeners(false);
         this.visible = false;
      }
      
      public function show() : void
      {
         var _loc1_:* = NaN;
         if(_bgGetRankInfoRes.myLocalRank == 0)
         {
            this.topUI.txt_myGrade.text = LocaleMgr.ins.getStr(50400106) + LocaleMgr.ins.getStr(40400009);
         }
         else
         {
            this.topUI.txt_myGrade.text = LocaleMgr.ins.getStr(50400106) + this._bgGetRankInfoRes.myLocalRank;
         }
         this.topUI.txt_myScore.text = LocaleMgr.ins.getStr(50500006,[BattlefieldModel.ins.bgInfoRes.score]);
         if(BattlefieldModel.ins.bgInfoRes.residualDay == 0)
         {
            this.topUI.txt_leftDays.text = LocaleMgr.ins.getStr(50500119);
         }
         else
         {
            this.topUI.txt_leftDays.text = LocaleMgr.ins.getStr(50500008,[BattlefieldModel.ins.bgInfoRes.residualDay]);
         }
         this.topUI.txt_victoryCnt.text = LocaleMgr.ins.getStr(50500126) + ":" + BattlefieldModel.ins.bgInfoRes.winTimes;
         if(BattlefieldModel.ins.bgInfoRes.winTimes + BattlefieldModel.ins.bgInfoRes.failTimes == 0)
         {
            _loc1_ = 0;
         }
         else
         {
            _loc1_ = Number(BattlefieldModel.ins.bgInfoRes.winTimes / (BattlefieldModel.ins.bgInfoRes.winTimes + BattlefieldModel.ins.bgInfoRes.failTimes));
         }
         this.topUI.txt_victoryPer.text = LocaleMgr.ins.getStr(50500127) + ":" + LocaleConsts.percentStr(_loc1_);
      }
      
      public function getDataHandler(param1:int) : void
      {
         _reqPage = param1;
         var _loc2_:BgGetRankInfoReq = new BgGetRankInfoReq();
         _loc2_.page = param1 + 1;
         _loc2_.kind = 1;
         BattlefieldService.ins.getRankList(_loc2_);
      }
      
      private function onGetRankCpl(param1:MzEvent) : void
      {
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         _bgGetRankInfoRes = param1.data as BgGetRankInfoRes;
         if(this._rankDataArr == null)
         {
            this._rankDataArr = new Array(_bgGetRankInfoRes.rankLen);
         }
         if(_bgGetRankInfoRes.kind == 1)
         {
            _loc3_ = _bgGetRankInfoRes.infos.length;
            while(_loc2_ < _loc3_)
            {
               this._rankDataArr[_reqPage * this.list_task.repeatX * this.list_task.repeatY + _loc2_] = _bgGetRankInfoRes.infos[_loc2_];
               _loc2_++;
            }
         }
         if(this.pageBar.ctrl)
         {
            this.pageBar.ctrl.doChange();
         }
         else
         {
            init();
         }
      }
      
      private function treasureBox_onClick(param1:MouseEvent) : void
      {
         var _loc2_:ActRewardVo = new ActRewardVo();
         _loc2_.list_items = StcMgr.ins.getVoArrByColumnValue("static_rank","kind",6);
         _loc2_.yesterdayRank = BattlefieldModel.ins.bgInfoRes.lastMonthLocalRank;
         _loc2_.hasGotReward = true;
         _loc2_.tipString = LocaleMgr.ins.getStr(50500128) + ":";
         ModuleMgr.ins.showModule(50242,_loc2_,ModuleMgr.ins.popLayer.curModuleId);
      }
   }
}
