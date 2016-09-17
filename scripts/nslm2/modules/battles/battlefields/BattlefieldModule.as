package nslm2.modules.battles.battlefields
{
   import game.ui.battlefield.BattlefieldModuleUI;
   import morn.core.components.ViewStack;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import nslm2.modules.battles.battlefields.model.BattlefieldModel;
   import nslm2.modules.battles.battlefields.service.BattlefieldService;
   import nslm2.modules.battles.battlefields.renders.BattlefieldApplyRender;
   import nslm2.modules.battles.battlefields.msgs.BattlefieldMsgs;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.foundations.mainToolBar.RedPointVo;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleRedPointMsg;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.modules.battles.battlefields.renders.BattlefieldFunBtnRender;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.modules.battles.battlefields.panels.BattlefieldCrystalPanel;
   import nslm2.modules.battles.battlefields.panels.BattleFieldFlagInfoPanel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcBgtitleIntvlVo;
   import nslm2.modules.battles.battlefields.consts.BattlefieldConsts;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.utils.ServerTimer;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.utils.TimeUtils;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class BattlefieldModule extends BattlefieldModuleUI
   {
      
      private static const BATTLE_ID:Array = [1000,1001];
      
      private static const ALERT_LANG_BASE:int = 50500180;
       
      
      public var subViewStack:ViewStack;
      
      private var _textCdCtrl:TextCDCtrlS2;
      
      public var redPointArr:Vector.<RedPointVo>;
      
      public function BattlefieldModule()
      {
         subViewStack = new ViewStack();
         redPointArr = new Vector.<RedPointVo>();
         super();
         switchEventListeners(true);
         ObserverMgr.ins.regObserver(this);
      }
      
      public function get model() : BattlefieldModel
      {
         return BattlefieldModel.ins;
      }
      
      public function get service() : BattlefieldService
      {
         return BattlefieldService.ins;
      }
      
      public function get applyRender() : BattlefieldApplyRender
      {
         return this.render_apply as BattlefieldApplyRender;
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         BattlefieldService.ins.getBattlefieldInfo();
         BattlefieldService.ins.getBattlefieldTodayRewardInfo();
         BattlefieldService.ins.getDegreeRankRewardInfo();
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            BattlefieldMsgs.ins.addEventListener("msgBattlefieldInfoCpl",onGetBgInfoCpl);
         }
         else
         {
            BattlefieldMsgs.ins.removeEventListener("msgBattlefieldInfoCpl",onGetBgInfoCpl);
         }
      }
      
      private function onGetBgInfoCpl(param1:MzEvent) : void
      {
         this.moduleServerCpl();
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["MSG_SWITCH_MODULE_REN_POINT"]);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         super.handleNotices(param1,param2);
         var _loc5_:* = param1;
         if("MSG_SWITCH_MODULE_REN_POINT" === _loc5_)
         {
            _loc3_ = param2 as SwitchModuleRedPointMsg;
            if(_loc3_.vis)
            {
               _loc4_ = ArrayUtil.findByAttr(redPointArr,"moduleID",_loc3_.moduleId);
               if(!_loc4_)
               {
                  _loc4_ = new RedPointVo(_loc3_.moduleId,_loc3_.count);
                  redPointArr.push(_loc4_);
               }
               _loc4_.count = _loc3_.count;
            }
            else
            {
               ArrayUtil.removeItemByAttr(redPointArr,"moduleID",_loc3_.moduleId);
            }
            validateRedPoint();
         }
      }
      
      private function validateRedPoint() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = this.list_btnsBottom.cells;
         for each(var _loc1_ in this.list_btnsBottom.cells)
         {
            _loc1_.redPointArr = this.redPointArr;
            _loc1_.validateRedPoint();
         }
      }
      
      override public function preShow(param1:Object = null) : void
      {
         if(FuncOpenAutoCtrl.checkOpen(50244))
         {
            subViewStack.subViewClasses = [BattlefieldCrystalPanel,BattleFieldFlagInfoPanel];
         }
         else
         {
            subViewStack.subViewClasses = [BattlefieldCrystalPanel];
         }
         this.panelBg.titleImgId = this.moduleId;
         this.tab_battlefield.preCondHandler = checkOpenDate;
         if(FuncOpenAutoCtrl.checkOpen(50244))
         {
            tab_battlefield.labels = [LocaleMgr.ins.getStr(50500002),LocaleMgr.ins.getStr(50500003)].join(",");
         }
         else
         {
            tab_battlefield.labels = [LocaleMgr.ins.getStr(50500002)].join(",");
         }
         this.txt_myScore.text = LocaleMgr.ins.getStr(50500006,[model.bgInfoRes.score]);
         var _loc2_:StcBgtitleIntvlVo = StcMgr.ins.getBgtitleIntvlVo(model.bgInfoRes.degree);
         this.txt_myGrade.text = LocaleMgr.ins.getStr(50500007,[!!_loc2_?LocaleMgr.ins.getStr(int(_loc2_.tite_name)):LocaleMgr.ins.getStr(999000020)]);
         if(model.bgInfoRes.residualDay == 0)
         {
            this.txt_leftDays.text = LocaleMgr.ins.getStr(50500119);
         }
         else if(model.bgInfoRes.openDay == 1)
         {
            this.txt_leftDays.text = LocaleMgr.ins.getStr(50500118);
         }
         else
         {
            this.txt_leftDays.text = LocaleMgr.ins.getStr(50500008,[model.bgInfoRes.residualDay]);
         }
         this.tab_battlefield.selectedIndex = BATTLE_ID.indexOf(BattlefieldModel.ins.curBattlefieldId);
         this.list_btnsBottom.dataSource = BattlefieldConsts.MODULE_BOTTOM_ARR;
         if(BattlefieldModel.ins.invitedNotifies.length > 0)
         {
            this.list_rightTop.dataSource = BattlefieldConsts.MODULE_TOP_RIGHT_ARR;
         }
         else
         {
            this.list_rightTop.dataSource = [50506];
         }
         subViewStack.x = 3;
         subViewStack.y = 68;
         DisplayUtils.addChildBelow(subViewStack,this.panelBg.img_tabLine);
         if(model.bgInfoRes.penaltyStamp > ServerTimer.ins.second)
         {
            if(_textCdCtrl == null)
            {
               _textCdCtrl = new TextCDCtrlS2(this.txt_punishAlert,textCDFormat,textCDCpl);
               this.parts.push(new TextCDCtrlS2(this.txt_punishAlert,textCDFormat,textCDCpl));
            }
            _textCdCtrl.start(model.bgInfoRes.penaltyStamp);
            this.box_punishTime.visible = true;
            this.applyRender.visible = false;
         }
         else
         {
            if(_textCdCtrl)
            {
               _textCdCtrl.dispose();
               _textCdCtrl = null;
            }
            this.box_punishTime.visible = false;
            this.applyRender.visible = true;
         }
         this.applyRender.show();
         this.txt_todayWinned.text = LocaleMgr.ins.getStr(50500149,[model.bgInfoRes.todayWinTimes]);
         subViewStack.selectedIndex = BATTLE_ID.indexOf(BattlefieldModel.ins.curBattlefieldId);
         this.preShowCpl();
      }
      
      private function checkOpenDate(param1:int) : Boolean
      {
         if(BattlefieldModel.ins.curBattlefieldId % 1000 == param1)
         {
            return true;
         }
         AlertUtil.float(LocaleMgr.ins.getStr(50500180 + param1));
         return false;
      }
      
      private function textCDFormat(param1:int) : String
      {
         param1 = param1 < 0?0:param1;
         return TimeUtils.hisColonAddZero2(param1);
      }
      
      private function textCDCpl() : void
      {
         this.box_punishTime.visible = false;
         this.applyRender.visible = true;
         if(_textCdCtrl)
         {
            _textCdCtrl.dispose();
            _textCdCtrl = null;
         }
      }
      
      override protected function moduleFadeInTypeCpl() : void
      {
         if(this.canRun == false)
         {
            return;
         }
         super.moduleFadeInTypeCpl();
      }
   }
}
