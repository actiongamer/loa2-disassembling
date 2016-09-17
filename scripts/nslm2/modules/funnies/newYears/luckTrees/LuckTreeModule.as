package nslm2.modules.funnies.newYears.luckTrees
{
   import game.ui.newYears.luckTrees.LuckTreeModuleUI;
   import nslm2.modules.funnies.newYears.luckTrees.services.LuckTreeService;
   import nslm2.common.ui.components.comps2d.others.RedPoint;
   import morn.core.components.ViewStack;
   import morn.core.managers.timerMgrs.TimerManager;
   import nslm2.modules.foundations.AlertUtil;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import flash.events.Event;
   import nslm2.modules.funnies.newYears.luckTrees.panels.PersonTreePanel;
   import nslm2.modules.funnies.newYears.luckTrees.panels.WorldTreePanel;
   import nslm2.modules.funnies.newYears.luckTrees.panels.LuckTreeShopPanel;
   import nslm2.modules.funnies.newYears.luckTrees.panels.LuckTreeRewardPanel;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.components.Button;
   import morn.customs.expands.MornExpandUtil;
   import flash.events.MouseEvent;
   import nslm2.modules.foundations.HelpAndRuleParam;
   import nslm2.common.model.OpActivityStaticDataModel;
   import proto.StaticOpActivityTmModel;
   import nslm2.utils.TimeUtils;
   import nslm2.utils.RTools;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   
   public class LuckTreeModule extends LuckTreeModuleUI
   {
       
      
      private var staticKindArr:Array;
      
      private var redPoiArr:Vector.<RedPoint>;
      
      public var vs:ViewStack;
      
      public function LuckTreeModule()
      {
         staticKindArr = [10,11,13,12];
         redPoiArr = new Vector.<RedPoint>();
         super();
         this.btn_rule.toolTip = LocaleMgr.ins.getStr(13350011);
      }
      
      public function get service() : LuckTreeService
      {
         return LuckTreeService.ins;
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         if(checkClose() == false)
         {
            return;
         }
         switchEventListeners(true);
         if(LuckTreeService.ins.isModelAllGetted)
         {
            this.service.server_luckTreeInfo(server_luckTreeInfo_cpl);
         }
         else
         {
            LuckTreeService.ins.requestStaticData();
         }
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            TimerManager.ins.doFrameLoop(1,checkClose);
            service.addEventListener("STATIC_DATA_CPL",onStaticDataCpl);
         }
         else
         {
            TimerManager.ins.clearTimer(this.checkClose);
            service.removeEventListener("STATIC_DATA_CPL",onStaticDataCpl);
         }
      }
      
      private function checkClose() : Boolean
      {
         if(LuckTreeService.ins.isEventOpen() == false)
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
         if(service.isModelAllGetted)
         {
            this.service.server_luckTreeInfo(server_luckTreeInfo_cpl);
         }
         else
         {
            AlertUtil.floadFuncTimeIsExpire(this.moduleId);
            ModuleMgr.ins.closeModule(this.moduleId);
         }
      }
      
      private function server_luckTreeInfo_cpl() : void
      {
         super.moduleServerStart(null);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc3_:int = 0;
         this.timeOverPanel.visible = false;
         vs = new ViewStack();
         vs.subViewClasses = [PersonTreePanel,WorldTreePanel,LuckTreeShopPanel,LuckTreeRewardPanel];
         DisplayUtils.addChildBelow(vs,timeOverPanel);
         vs.x = 35;
         vs.y = 102;
         this.tab.labels = LocaleMgr.ins.getStr(13350018) + "," + LocaleMgr.ins.getStr(13350019) + "," + LocaleMgr.ins.getStr(13350020) + "," + LocaleMgr.ins.getStr(13350021);
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
               this.btnCloseHandler(null);
            }
            return;
         }
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
         this.service.checkRedPoint();
      }
      
      private function tab_changeHandler() : void
      {
         vs.selectedIndex = this.tab.selectedIndex;
         if(OpActivityStaticDataModel.ins.isActivityOpenTime(this.staticKindArr[vs.selectedIndex]))
         {
            this.vs.mouseEvent = true;
            this.timeOverPanel.visible = false;
         }
         else
         {
            switchTimeOver(this.staticKindArr[vs.selectedIndex]);
         }
      }
      
      private function switchTimeOver(param1:int) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(param1 == this.staticKindArr[vs.selectedIndex])
         {
            _loc2_ = OpActivityStaticDataModel.ins.getActivityOpenTime(10);
            _loc3_ = OpActivityStaticDataModel.ins.getActivityOpenTime(13);
            this.vs.mouseEvent = false;
            this.timeOverPanel.visible = true;
            if(_loc2_)
            {
               this.timeOverPanel.txt_over.text = LocaleMgr.ins.getStr(13350027,[TimeUtils.getFullTimeStrCN(_loc2_.startTm,false,false,RTools.cl(false,true),false),TimeUtils.getFullTimeStrCN(_loc2_.endTm,false,false,RTools.cl(false,true),false),TimeUtils.getFullTimeStrCN(_loc3_.endTm,false,false,RTools.cl(false,true),false),TimeUtils.getFullTimeStrCN(_loc3_.endTm,false,false,RTools.cl(false,true),false)]);
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
         return super.getFocusNotices().concat(["MSG_TAB_TO_PERSON_TREE","MSG_TAB_TO_WORLD_TREE","MSG_SWITCH_TIME_OVER","MSG_NPC_FUNC_VO_CHANGE"]);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc4_:int = 0;
         var _loc3_:int = 0;
         var _loc5_:int = 0;
         super.handleNotices(param1,param2);
         var _loc6_:* = param1;
         if("MSG_TAB_TO_PERSON_TREE" !== _loc6_)
         {
            if("MSG_TAB_TO_WORLD_TREE" !== _loc6_)
            {
               if("MSG_SWITCH_TIME_OVER" !== _loc6_)
               {
                  if("MSG_NPC_FUNC_VO_CHANGE" === _loc6_)
                  {
                     _loc3_ = param2 as int;
                     _loc5_ = LuckTreeService.funcIdArr.indexOf(_loc3_);
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
            else
            {
               this.tab.selectedIndex = 1;
               this.tab_changeHandler();
            }
         }
         else
         {
            this.tab.selectedIndex = 0;
            this.tab_changeHandler();
         }
      }
      
      override public function preClose(param1:Object = null) : void
      {
         super.preClose(param1);
      }
   }
}
