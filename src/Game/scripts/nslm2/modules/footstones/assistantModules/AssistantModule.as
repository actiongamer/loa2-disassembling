package nslm2.modules.footstones.assistantModules
{
   import game.ui.assistantModules.AssistantModuleUI;
   import nslm2.modules.footstones.assistantModules.interfaces.IAssisPanel;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcStageNpcRelationVo;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncVo;
   import nslm2.modules.foundations.shop.service.ShopService;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.modules.footstones.assistantModules.model.AssistantModel;
   import morn.core.components.Button;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.assistantModules.subAssistants.battlefield.AssisBattlefieldPanel;
   import nslm2.modules.footstones.assistantModules.subAssistants.shenyuan.AssisShenyuanPanel;
   import nslm2.modules.footstones.assistantModules.subAssistants.mysteryshop.AssisMysteryShopPanel;
   import nslm2.modules.footstones.assistantModules.subAssistants.shop.AssisShopPanel;
   import morn.core.components.Component;
   import morn.customs.components.PanelViewBase;
   import flash.events.Event;
   
   public class AssistantModule extends AssistantModuleUI
   {
       
      
      private var _assisPanel:IAssisPanel;
      
      private var _lastShowingFunId:int;
      
      public function AssistantModule()
      {
         super();
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         var _loc2_:* = null;
         var _loc6_:int = 0;
         var _loc3_:StcStageNpcRelationVo = StcMgr.ins.getStageNpcRelationVo(108);
         var _loc5_:Array = _loc3_.subFuncIdArr;
         var _loc4_:int = _loc5_.length;
         _loc6_ = 0;
         while(_loc6_ < _loc4_)
         {
            _loc2_ = NpcFuncService.ins.getVo(_loc5_[_loc6_]);
            if(_loc2_ && StcMgr.ins.getFunctionVo(_loc5_[_loc6_]).canOpen)
            {
               ShopService.ins.requestList(_loc2_.funcId);
            }
            _loc6_++;
         }
         super.moduleServerStart(null);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
         refresh();
         logTxt.text = AssistantModel.ins.getLog();
         logPanel.refresh();
         this.panelBg.titleImgId = this.moduleId;
         super.preShow(param1);
      }
      
      private function onBtnFunc(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(btn_start !== _loc2_)
         {
            if(btn_clear === _loc2_)
            {
               AssistantModel.ins.clearLog();
               logTxt.text = "";
               logPanel.refresh();
            }
         }
         else
         {
            onStartClicked();
         }
      }
      
      private function onStartClicked() : void
      {
         if(AssistantModel.ins.isActing == false)
         {
            if(AssistantModel.ins.needDoIdArr.length > 0)
            {
               AssistantModel.ins.clearTask();
               AssistantModel.ins.addTask(AssistantModel.ins.needDoIdArr);
               AssistantModel.ins.allStart();
               AlertUtil.float(LocaleMgr.ins.getStr(60200035));
               refresh();
            }
            else
            {
               AlertUtil.float(LocaleMgr.ins.getStr(60200034));
            }
         }
         else
         {
            AssistantModel.ins.clearTask();
            AlertUtil.float(LocaleMgr.ins.getStr(60200030));
            refresh();
         }
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
         refresh();
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:int = 0;
         super.handleNotices(param1,param2);
         var _loc4_:* = param1;
         if("showSettingPanel" !== _loc4_)
         {
            if("closeSettingPanel" !== _loc4_)
            {
               if("logChanged" !== _loc4_)
               {
                  if("refreshModule" === _loc4_)
                  {
                     refresh();
                  }
               }
               else
               {
                  logTxt.text = AssistantModel.ins.getLog();
                  logPanel.refresh();
               }
            }
            else
            {
               closeSettingPanel();
            }
         }
         else
         {
            _loc3_ = param2 as int;
            if(_lastShowingFunId != _loc3_)
            {
               _lastShowingFunId = _loc3_;
               showSettingPanel(param2 as int);
            }
         }
      }
      
      private function showSettingPanel(param1:int) : void
      {
         closeSettingPanel();
         var _loc2_:* = param1;
         if(50500 !== _loc2_)
         {
            if(41500 !== _loc2_)
            {
               if(60310 !== _loc2_)
               {
                  if(41600 === _loc2_)
                  {
                     _assisPanel = new AssisShopPanel();
                  }
               }
               else
               {
                  _assisPanel = new AssisMysteryShopPanel();
               }
            }
            else
            {
               _assisPanel = new AssisShenyuanPanel();
            }
         }
         else
         {
            _assisPanel = new AssisBattlefieldPanel();
         }
         (_assisPanel as Component).addEventListener("close",closeSettingPanel);
         (_assisPanel as Component).x = this.width - (_assisPanel as Component).width >> 1;
         (_assisPanel as Component).y = this.height - (_assisPanel as Component).height >> 1;
         this.addChild(_assisPanel as Component);
         (_assisPanel as PanelViewBase).panelBg.titleImgId = param1;
      }
      
      private function closeSettingPanel(param1:Event = null) : void
      {
         _lastShowingFunId = 0;
         if(_assisPanel && _assisPanel is Component)
         {
            (_assisPanel as Component).removeEventListener("close",closeSettingPanel);
            !!(_assisPanel as Component).parent?(_assisPanel as Component).parent.removeChild(_assisPanel as Component):0;
            (_assisPanel as Component).dispose();
            _assisPanel = null;
         }
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["showSettingPanel","closeSettingPanel","logChanged","refreshModule"]);
      }
      
      private function refresh() : void
      {
         if(AssistantModel.ins.isActing == false)
         {
            btn_start.label = LocaleMgr.ins.getStr(60200006);
         }
         else
         {
            btn_start.label = LocaleMgr.ins.getStr(60200007);
         }
         funcList.array = [60310,41600,41500,50500];
      }
   }
}
