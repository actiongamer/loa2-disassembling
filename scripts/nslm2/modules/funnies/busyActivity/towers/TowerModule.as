package nslm2.modules.funnies.busyActivity.towers
{
   import game.ui.busyActivity.towers.TowerModuleUI;
   import nslm2.modules.funnies.busyActivity.towers.services.TowerService;
   import nslm2.common.ui.components.comps2d.others.RedPoint;
   import morn.core.components.ViewStack;
   import morn.core.managers.timerMgrs.TimerManager;
   import nslm2.modules.foundations.AlertUtil;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import flash.events.Event;
   import nslm2.modules.funnies.busyActivity.towers.funnys.TowerFunnyPanel;
   import nslm2.modules.funnies.newYears.day51s.panels.Day51ScorePanel;
   import nslm2.modules.funnies.newYears.day51s.panels.Day51ShopPanel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.components.Button;
   import morn.customs.expands.MornExpandUtil;
   import flash.events.MouseEvent;
   import nslm2.modules.foundations.HelpAndRuleParam;
   import nslm2.common.model.OpActivityStaticDataModel;
   import nslm2.modules.funnies.funnyCommons.IFuncIdView;
   import nslm2.modules.funnies.funnyCommons.IInitView;
   import proto.StaticOpActivityTmModel;
   import nslm2.utils.TimeUtils;
   import nslm2.utils.RTools;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   
   public class TowerModule extends TowerModuleUI
   {
      
      public static const VISIBLE_KEY_VS:String = "Tower.VISIBLE_KEY_VS";
       
      
      private var redPoiArr:Vector.<RedPoint>;
      
      public var vs:ViewStack;
      
      public function TowerModule()
      {
         redPoiArr = new Vector.<RedPoint>();
         super();
         this.cover_forbit.visible = false;
         this.cover_forbit.fillAlpha = 0;
      }
      
      public function get service() : TowerService
      {
         return TowerService.ins;
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         if(checkOpen() == false)
         {
            return;
         }
         switchEventListeners(true);
         if(this.service.stcModel.isModelAllGetted)
         {
            this.service.protos.server_TOWER_INFO(server_allInfo_cpl);
         }
         else
         {
            this.service.stcModel.requestStaticData();
         }
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            TimerManager.ins.doFrameLoop(1,checkOpen);
            service.addEventListener("TowerService.STATIC_DATA_CPL",onStaticDataCpl);
         }
         else
         {
            TimerManager.ins.clearTimer(this.checkOpen);
            service.removeEventListener("TowerService.STATIC_DATA_CPL",onStaticDataCpl);
         }
      }
      
      private function checkOpen() : Boolean
      {
         if(this.service.isOpenTime_all() == false)
         {
            AlertUtil.floadFuncTimeIsExpire(this.moduleId);
            ObserverMgr.ins.sendNotice("updateIconBar");
            ModuleMgr.ins.closeModule(this.moduleId);
            return false;
         }
         return true;
      }
      
      private function onStaticDataCpl(param1:Event) : void
      {
         if(checkOpen() == false || service.stcModel.isModelAllGetted == false)
         {
            return;
         }
         this.service.protos.server_TOWER_INFO(server_allInfo_cpl);
      }
      
      private function server_allInfo_cpl() : void
      {
         super.moduleServerStart(null);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc5_:int = 0;
         this.timeOverPanel.visible = false;
         vs = new ViewStack();
         vs.subViewClasses = [TowerFunnyPanel,TowerFunnyPanel,Day51ScorePanel,Day51ShopPanel];
         this.placeVs.replaceWith(vs);
         vs.createSubViewCallBack = vs_createSubViewCallBack;
         this.tab.labels = LocaleMgr.ins.getStr(13386002) + "," + LocaleMgr.ins.getStr(13386001) + "," + LocaleMgr.ins.getStr(9050241) + "," + LocaleMgr.ins.getStr(13386003);
         this.tab.commitMeasure();
         var _loc4_:int = this.tab.items.length;
         var _loc2_:int = 193;
         var _loc3_:int = 184;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            (this.tab.items[_loc5_] as Button).btnLabel.style = "渐变1";
            (this.tab.items[_loc5_] as Button).width = _loc2_;
            _loc5_++;
         }
         this.tab.space = 1;
         this.tab.commitMeasure();
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            redPoiArr.push(this["redPoi" + _loc5_]);
            redPoiArr[_loc5_].x = (this.tab.items[_loc5_] as Button).x + _loc3_;
            redPoiArr[_loc5_].visible = false;
            _loc5_++;
         }
         this.redPoi3.visible = false;
         this.redPoi4.visible = false;
         this.tab.userChangeHandler = tab_changeHandler;
         this.tab.selectedIndex = 0;
         this.tab_changeHandler();
         this.btn_rule.toolTip = LocaleMgr.ins.getStr(13386004);
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         super.preShow(param1);
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = param1;
         if(this.btn_rule !== _loc4_)
         {
            if(this.btn_close === _loc4_)
            {
               if(!param2.altKey)
               {
                  this.btnCloseHandler(null);
               }
            }
         }
         else
         {
            _loc3_ = new HelpAndRuleParam(LocaleMgr.ins.getStr(30600904),LocaleMgr.ins.getStr(13386004));
            ModuleMgr.ins.showModule(12201,_loc3_,this.moduleId);
         }
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
         this.service.checkRedPoint();
      }
      
      private function tab_changeHandler() : void
      {
         var _loc1_:Boolean = false;
         vs.selectedIndex = this.tab.selectedIndex;
         if(service.isTest)
         {
            _loc1_ = true;
         }
         else
         {
            _loc1_ = OpActivityStaticDataModel.ins.isActivityOpenTime(this.service.staticKindArr[vs.selectedIndex]);
         }
         if(_loc1_)
         {
            this.vs.mouseEvent = true;
            this.timeOverPanel.visible = false;
            this.vs.setVisibleList("Tower.VISIBLE_KEY_VS",true);
         }
         else
         {
            switchTimeOver(this.service.staticKindArr[vs.selectedIndex]);
         }
      }
      
      private function vs_createSubViewCallBack(param1:*) : void
      {
         if(param1 is TowerFunnyPanel)
         {
            (param1 as TowerFunnyPanel).funnyKind = this.tab.selectedIndex == 0?1:0;
         }
         if(param1 is IFuncIdView)
         {
            (param1 as IFuncIdView).funcId = this.moduleId;
         }
         if(param1 is IInitView)
         {
            (param1 as IInitView).init();
         }
      }
      
      private function switchTimeOver(param1:int) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(param1 == this.service.staticKindArr[vs.selectedIndex])
         {
            _loc2_ = OpActivityStaticDataModel.ins.getActivityOpenTime(this.service.timeKind_funny);
            _loc3_ = OpActivityStaticDataModel.ins.getActivityOpenTime(service.timeKind_all);
            this.vs.mouseEvent = false;
            this.timeOverPanel.visible = true;
            this.vs.setVisibleList("Tower.VISIBLE_KEY_VS",false);
            if(_loc2_ && _loc3_)
            {
               this.timeOverPanel.txt_over.text = LocaleMgr.ins.getStr(13386018,[TimeUtils.getFullTimeStrCN(_loc2_.startTm,false,false,RTools.cl(false,true),false),TimeUtils.getFullTimeStrCN(_loc2_.endTm,false,false,RTools.cl(false,true),false),TimeUtils.getFullTimeStrCN(_loc3_.endTm,false,false,RTools.cl(false,true),false),TimeUtils.getFullTimeStrCN(_loc3_.endTm,false,false,RTools.cl(false,true),false)]);
               this.timeOverPanel.txt_over.visible = true;
            }
            else
            {
               this.timeOverPanel.txt_over.visible = false;
            }
         }
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["TowerService.MSG_SWITCH_TIME_OVER","MSG_NPC_FUNC_VO_CHANGE","TowerService.MSG_SWITCH_MOUSE_FORBIT"]);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc4_:int = 0;
         var _loc3_:int = 0;
         var _loc5_:int = 0;
         super.handleNotices(param1,param2);
         var _loc6_:* = param1;
         if("TowerService.MSG_SWITCH_TIME_OVER" !== _loc6_)
         {
            if("MSG_NPC_FUNC_VO_CHANGE" !== _loc6_)
            {
               if("TowerService.MSG_SWITCH_MOUSE_FORBIT" === _loc6_)
               {
                  this.cover_forbit.visible = param2 as Boolean;
               }
            }
            else
            {
               _loc3_ = param2 as int;
               _loc5_ = TowerService.funcIdArr.indexOf(_loc3_);
               if(_loc5_ > -1)
               {
                  this.redPoiArr[_loc5_].visible = NpcFuncService.ins.getVo(_loc3_).count > 0;
               }
            }
         }
         else
         {
            _loc4_ = param2 as int;
            switchTimeOver(_loc4_);
         }
      }
      
      override public function preClose(param1:Object = null) : void
      {
         super.preClose(param1);
      }
   }
}
