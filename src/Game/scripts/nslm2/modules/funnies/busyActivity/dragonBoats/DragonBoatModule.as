package nslm2.modules.funnies.busyActivity.dragonBoats
{
   import game.ui.busyActivity.dragonBoats.DragonBoatModuleUI;
   import nslm2.modules.funnies.busyActivity.dragonBoats.services.DragonBoatService;
   import nslm2.common.ui.components.comps2d.others.RedPoint;
   import morn.core.components.ViewStack;
   import morn.core.managers.timerMgrs.TimerManager;
   import nslm2.modules.foundations.AlertUtil;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import flash.events.Event;
   import nslm2.modules.funnies.busyActivity.dragonBoats.funnys.DragonBoatFunnyPanel;
   import nslm2.modules.funnies.newYears.day51s.panels.Day51ScorePanel;
   import nslm2.modules.funnies.newYears.day51s.panels.Day51ShopPanel;
   import nslm2.modules.funnies.newYears.day51s.panels.Day51RankPanel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.components.Button;
   import morn.customs.expands.MornExpandUtil;
   import flash.events.MouseEvent;
   import nslm2.modules.foundations.HelpAndRuleParam;
   import nslm2.utils.MM2Util;
   import nslm2.common.model.OpActivityStaticDataModel;
   import nslm2.modules.funnies.funnyCommons.IFuncIdView;
   import nslm2.modules.funnies.funnyCommons.IInitView;
   import proto.StaticOpActivityTmModel;
   import nslm2.utils.TimeUtils;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   
   public class DragonBoatModule extends DragonBoatModuleUI
   {
      
      public static const VISIBLE_KEY_VS:String = "DRAGON_BOAT.VISIBLE_KEY_VS";
       
      
      private var redPoiArr:Vector.<RedPoint>;
      
      public var vs:ViewStack;
      
      public function DragonBoatModule()
      {
         redPoiArr = new Vector.<RedPoint>();
         super();
         this.btn_rule.visible = false;
      }
      
      public function get service() : DragonBoatService
      {
         return DragonBoatService.ins;
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
            this.service.protos.server_DRAGON_BOAT_ALL_INFO(server_allInfo_cpl);
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
            service.addEventListener("DragonBoatService.STATIC_DATA_CPL",onStaticDataCpl);
         }
         else
         {
            TimerManager.ins.clearTimer(this.checkOpen);
            service.removeEventListener("DragonBoatService.STATIC_DATA_CPL",onStaticDataCpl);
         }
      }
      
      private function checkOpen() : Boolean
      {
         if(this.service.isOpenTime() == false)
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
         this.service.protos.server_DRAGON_BOAT_ALL_INFO(server_allInfo_cpl);
      }
      
      private function server_allInfo_cpl() : void
      {
         super.moduleServerStart(null);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc3_:int = 0;
         this.timeOverPanel.visible = false;
         vs = new ViewStack();
         vs.subViewClasses = [DragonBoatFunnyPanel,Day51ScorePanel,Day51ShopPanel,Day51RankPanel];
         this.placeVs.replaceWith(vs);
         vs.createSubViewCallBack = vs_createSubViewCallBack;
         this.tab.labels = LocaleMgr.ins.getStr(13376001) + "," + LocaleMgr.ins.getStr(9750241) + "," + LocaleMgr.ins.getStr(13376030) + "," + LocaleMgr.ins.getStr(60800003);
         this.tab.commitMeasure();
         var _loc2_:int = this.tab.items.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            (this.tab.items[_loc3_] as Button).btnLabel.style = "渐变1";
            redPoiArr.push(this["redPoi" + _loc3_]);
            redPoiArr[_loc3_].visible = false;
            _loc3_++;
         }
         this.redPoi4.visible = false;
         this.tab.userChangeHandler = tab_changeHandler;
         this.tab.selectedIndex = 0;
         this.tab_changeHandler();
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
               if(param2.altKey)
               {
                  MM2Util.gm_getItem(this.service.stcModel.materialIdArr,80);
               }
               else
               {
                  this.btnCloseHandler(null);
               }
            }
         }
         else
         {
            _loc3_ = new HelpAndRuleParam(LocaleMgr.ins.getStr(9050210),LocaleMgr.ins.getStr(13350011));
            ModuleMgr.ins.showModule(13382,_loc3_,this.moduleId);
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
            this.vs.setVisibleList("DRAGON_BOAT.VISIBLE_KEY_VS",true);
         }
         else
         {
            switchTimeOver(this.service.staticKindArr[vs.selectedIndex]);
         }
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
      
      private function switchTimeOver(param1:int) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(param1 == this.service.staticKindArr[vs.selectedIndex])
         {
            _loc2_ = OpActivityStaticDataModel.ins.getActivityOpenTime(27);
            _loc3_ = OpActivityStaticDataModel.ins.getActivityOpenTime(26);
            this.vs.mouseEvent = false;
            this.timeOverPanel.visible = true;
            this.vs.setVisibleList("DRAGON_BOAT.VISIBLE_KEY_VS",false);
            if(_loc2_ && _loc3_)
            {
               this.timeOverPanel.txt_over.text = LocaleMgr.ins.getStr(13376028,[TimeUtils.ymdhisCN(_loc2_.startTm),TimeUtils.ymdhisCN(_loc2_.endTm),TimeUtils.ymdhisCN(_loc3_.endTm),TimeUtils.ymdhisCN(_loc3_.endTm)]);
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
         return super.getFocusNotices().concat(["DragonBoatService.MSG_SWITCH_TIME_OVER","MSG_NPC_FUNC_VO_CHANGE"]);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc4_:int = 0;
         var _loc3_:int = 0;
         var _loc5_:int = 0;
         super.handleNotices(param1,param2);
         var _loc6_:* = param1;
         if("DragonBoatService.MSG_SWITCH_TIME_OVER" !== _loc6_)
         {
            if("MSG_NPC_FUNC_VO_CHANGE" === _loc6_)
            {
               _loc3_ = param2 as int;
               _loc5_ = DragonBoatService.funcIdArr.indexOf(_loc3_);
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
