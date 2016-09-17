package nslm2.modules.funnies.dials
{
   import game.ui.dialModule.DialModuleUI;
   import morn.core.components.ViewStack;
   import nslm2.modules.funnies.dials.model.DialModel;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.funnies.dials.service.DialService;
   import nslm2.modules.funnies.dials.msgs.DialMsgs;
   import com.mz.core.event.MzEvent;
   import flash.events.Event;
   import morn.core.components.Button;
   import nslm2.modules.foundations.HelpAndRuleParam;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.ui.components.comps2d.others.RedPoint;
   import nslm2.modules.funnies.dials.consts.DialConsts;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.common.model.OpActivityStaticDataModel;
   import proto.StaticOpActivityTmModel;
   import nslm2.utils.TimeUtils;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.funnies.dials.renders.DialMyScoreRender;
   import morn.core.managers.timerMgrs.TimerManager;
   import morn.core.components.Component;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleRedPointMsg;
   import nslm2.modules.funnies.funnyCommons.IFuncIdView;
   import nslm2.modules.funnies.funnyCommons.IInitView;
   import nslm2.modules.funnies.dials.panels.DialBagPanel;
   import morn.customs.expands.MornExpandUtil;
   
   public class DialModule extends DialModuleUI
   {
       
      
      private var _subViewStack:ViewStack;
      
      private var model:DialModel;
      
      private var _normalRedPoint:RedPoint;
      
      private var _superRedPoint:RedPoint;
      
      private var _shopRedPoint:RedPoint;
      
      private var _scoreRedPoint:RedPoint;
      
      public function DialModule()
      {
         _subViewStack = new ViewStack();
         super();
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         if(this.moduleId == 60800)
         {
            DialModel.TYPE = 60800;
         }
         else
         {
            DialModel.TYPE = 60810;
         }
         this.model = DialModel.ins;
         if(model.isEventOpen() == false)
         {
            AlertUtil.floadFuncTimeIsExpire(this.moduleId);
            ModuleMgr.ins.closeModule(this.moduleId);
            return;
         }
         switchEventListeners(true);
         if(model.isModelAllGetted)
         {
            DialService.ins.requestModuleData();
         }
         else
         {
            DialService.ins.requestStaticData();
         }
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            DialMsgs.ins.addEventListener("static_data_cpl",onStaticDataCpl);
            DialMsgs.ins.addEventListener("module_data_cpl",onModuleDataCpl);
            DialMsgs.ins.addEventListener("switch_mouse_event",onChangeMouseEvent);
         }
         else
         {
            DialMsgs.ins.removeEventListener("static_data_cpl",onStaticDataCpl);
            DialMsgs.ins.removeEventListener("module_data_cpl",onModuleDataCpl);
            DialMsgs.ins.removeEventListener("switch_mouse_event",onChangeMouseEvent);
         }
      }
      
      private function onChangeMouseEvent(param1:MzEvent) : void
      {
         this.mouseEvent = param1.data;
      }
      
      private function onStaticDataCpl(param1:Event) : void
      {
         if(model.isModelAllGetted)
         {
            DialService.ins.requestModuleData();
         }
         else
         {
            AlertUtil.floadFuncTimeIsExpire(this.moduleId);
            ModuleMgr.ins.closeModule(this.moduleId);
         }
      }
      
      private function onModuleDataCpl(param1:Event) : void
      {
         if(this.moduleId == 60810)
         {
            DialService.getIns(60810).getRankData();
         }
         this.moduleServerCpl();
      }
      
      private function onBtnFunc(param1:Button) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = param1;
         if(this.btn_close !== _loc4_)
         {
            if(this.btn_rule === _loc4_)
            {
               _loc2_ = DialModel.TYPE == 60800?60800022:60810007;
               _loc3_ = new HelpAndRuleParam(LocaleMgr.ins.getStr(9050210),LocaleMgr.ins.getStr(_loc2_));
               ModuleMgr.ins.showModule(12201,_loc3_,this.moduleId);
            }
         }
         else
         {
            this.btnCloseHandler();
         }
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc2_:* = null;
         var _loc8_:* = null;
         var _loc7_:int = 0;
         var _loc5_:int = 0;
         if(this.moduleId == 60810)
         {
            this.tabBar.skin = "png.uiFunnyCommon.tab_kind2";
            this.tabBar.commitMeasure();
            _subViewStack.subViewClasses = DialConsts.VIEW_CLASSES_CROSS;
         }
         else
         {
            _subViewStack.subViewClasses = DialConsts.VIEW_CLASSES;
         }
         _subViewStack.createSubViewCallBack = vs_createSubViewCallBack;
         DisplayUtils.addChildBelow(_subViewStack,this.box_dialInfo);
         this.tabBar.selectHandler = onTabChanged;
         this.tabBar.selectedIndex = 0;
         this.panel_over.visible = !model.isDialOpen();
         this.img_title.visible = false;
         if(this.moduleId == 60800)
         {
            _loc2_ = OpActivityStaticDataModel.ins.getActivityOpenTime(7);
            _loc8_ = OpActivityStaticDataModel.ins.getActivityOpenTime(4);
            this.txtModuleTitle.text = LocaleMgr.ins.getStr(60800001);
            this.tabBar.labels = LocaleMgr.ins.getStr(60810009) + "," + LocaleMgr.ins.getStr(60810010) + "," + LocaleMgr.ins.getStr(60810013) + "," + LocaleMgr.ins.getStr(60810012);
         }
         else
         {
            _loc2_ = OpActivityStaticDataModel.ins.getActivityOpenTime(DialConsts.timeKind_all);
            _loc8_ = OpActivityStaticDataModel.ins.getActivityOpenTime(DialConsts.timeKind_funny);
            this.txtModuleTitle.text = LocaleMgr.ins.getStr(9060810);
            this.tabBar.labels = LocaleMgr.ins.getStr(60810009) + "," + LocaleMgr.ins.getStr(60810010) + "," + LocaleMgr.ins.getStr(60810011) + "," + LocaleMgr.ins.getStr(60810012) + "," + LocaleMgr.ins.getStr(13364058);
         }
         this.tabBar.commitMeasure();
         var _loc6_:int = this.tabBar.items.length;
         _loc7_ = 0;
         while(_loc7_ < _loc6_)
         {
            (this.tabBar.items[_loc7_] as Button).btnLabel.style = "渐变1";
            _loc7_++;
         }
         _loc5_ = DialModel.TYPE == 60800?60800014:60810001;
         this.panel_over.txt_over.text = LocaleMgr.ins.getStr(_loc5_,[TimeUtils.getShortTimeStrCN(_loc8_.startTm,false),TimeUtils.getShortTimeStrCN(_loc8_.endTm,false),TimeUtils.getShortTimeStrCN(_loc2_.endTm,false),TimeUtils.getShortTimeStrCN(_loc2_.endTm,false)]);
         var _loc3_:WealthVo = WealthUtil.createItemVo(model.getCurCostItemId());
         _loc3_.useStcCount = true;
         this.render_item.dataSource = _loc3_;
         var _loc4_:Array = DialModel.ins.getCostWealthVoArr();
         this.list_coin.repeatY = _loc4_.length;
         this.list_coin.dataSource = _loc4_;
         (this.render_myScore as DialMyScoreRender).init();
         TimerManager.ins.doLoop(5 * 1000,beginAutoRequestRank);
         _normalRedPoint = new RedPoint();
         _normalRedPoint.right = -2;
         _normalRedPoint.top = -2;
         _superRedPoint = new RedPoint();
         _superRedPoint.right = -2;
         _superRedPoint.top = -2;
         _shopRedPoint = new RedPoint();
         _shopRedPoint.right = -2;
         _shopRedPoint.top = -2;
         if(this.moduleId == 60810)
         {
            _scoreRedPoint = new RedPoint();
            _scoreRedPoint.right = -2;
            _scoreRedPoint.top = -2;
         }
         (this.tabBar.items[0] as Component).addChild(_normalRedPoint);
         (this.tabBar.items[1] as Component).addChild(_superRedPoint);
         (this.tabBar.items[3] as Component).addChild(_shopRedPoint);
         if(_scoreRedPoint)
         {
            (this.tabBar.items[4] as Component).addChild(_scoreRedPoint);
         }
         refreshRedPoint();
         super.preShow(param1);
      }
      
      private function refreshRedPoint() : void
      {
         _normalRedPoint.visible = DialModel.ins.canUseItemDial(1,false);
         _superRedPoint.visible = DialModel.ins.canUseItemDial(2,false);
         _shopRedPoint.visible = DialModel.ins.hasItemCanBuy();
         if(_scoreRedPoint)
         {
            _scoreRedPoint.visible = model.hasScoreCanGet();
         }
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         super.handleNotices(param1,param2);
         var _loc4_:* = param1;
         if("MSG_SWITCH_MODULE_REN_POINT" === _loc4_)
         {
            _loc3_ = param2 as SwitchModuleRedPointMsg;
            if(_loc3_.moduleId == 60800)
            {
               refreshRedPoint();
            }
         }
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["MSG_SWITCH_MODULE_REN_POINT"]);
      }
      
      private function beginAutoRequestRank() : void
      {
         DialService.ins.getRankData();
      }
      
      private function vs_createSubViewCallBack(param1:*) : void
      {
         if(param1 is IFuncIdView)
         {
            (param1 as IFuncIdView).funcId = this.moduleId;
         }
         if(param1 is IInitView)
         {
            (param1 as IInitView).init();
         }
      }
      
      private function onTabChanged(param1:int) : void
      {
         _subViewStack.selectedIndex = param1;
         if(param1 < 2)
         {
            this.box_dialInfo.visible = true;
         }
         else
         {
            this.box_dialInfo.visible = false;
         }
         (this.panel_bag as DialBagPanel).isVipDial = param1 == 1;
         this.panel_over.visible = !DialModel.ins.isDialOpen() && param1 < 2;
      }
      
      override public function preClose(param1:Object = null) : void
      {
         super.preClose(param1);
         TimerManager.ins.clearTimer(beginAutoRequestRank);
      }
      
      override public function dispose() : void
      {
         switchEventListeners(false);
         super.dispose();
      }
   }
}
