package nslm2.modules.footstones.assistantModules.subAssistants.shop
{
   import game.ui.assistantModules.panels.AssisShopPanelUI;
   import nslm2.modules.footstones.assistantModules.interfaces.IAssisPanel;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcStageNpcRelationVo;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   import nslm2.modules.foundations.shop.service.ShopService;
   import flash.events.Event;
   import nslm2.modules.foundations.shop.model.ShopModel;
   import com.mz.core.event.MzEvent;
   import nslm2.mgrs.stcMgrs.vos.StcShopVo;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.assistantModules.model.AssistantModel;
   
   public class AssisShopPanel extends AssisShopPanelUI implements IAssisPanel
   {
       
      
      private var _funcIdArr:Array;
      
      public function AssisShopPanel()
      {
         super();
         init();
         this.addEventListener("addedToStage",addToStage);
      }
      
      private function init() : void
      {
         var _loc2_:* = null;
         var _loc6_:int = 0;
         var _loc3_:StcStageNpcRelationVo = StcMgr.ins.getStageNpcRelationVo(108);
         var _loc5_:Array = _loc3_.subFuncIdArr;
         _funcIdArr = [];
         var _loc1_:Array = [];
         var _loc4_:int = _loc5_.length;
         _loc6_ = 0;
         while(_loc6_ < _loc4_)
         {
            _loc2_ = NpcFuncService.ins.getVo(_loc5_[_loc6_]);
            if(_loc2_ && StcMgr.ins.getFunctionVo(_loc5_[_loc6_]).canOpen)
            {
               _loc1_.push(LocaleMgr.ins.getStr(9100000 + _loc2_.funcId));
               _funcIdArr.push(_loc2_.funcId);
            }
            _loc6_++;
         }
         shopTab.labels = _loc1_.join(",");
         shopTab.selectHandler = tabHandler;
         itemList.itemRender = AssisShopItemRender;
         (pageView as IPageBar).bindList(itemList);
         this.visible = false;
      }
      
      private function tabHandler(param1:int) : void
      {
         ShopService.ins.requestList(_funcIdArr[param1]);
      }
      
      protected function addToStage(param1:Event) : void
      {
         this.removeEventListener("addedToStage",addToStage);
         addListeners();
         show();
         this.addEventListener("removedFromStage",removeFromStage);
      }
      
      protected function removeFromStage(param1:Event) : void
      {
         this.removeEventListener("removedFromStage",removeFromStage);
         removeListeners();
         hide();
         this.addEventListener("addedToStage",addToStage);
      }
      
      private function addListeners() : void
      {
         ShopModel.ins.addEventListener("evtShopGetListOver",onInitList);
         saveBtn.addEventListener("click",saveBtnClick);
      }
      
      private function removeListeners() : void
      {
         ShopModel.ins.removeEventListener("evtShopGetListOver",onInitList);
         saveBtn.removeEventListener("click",saveBtnClick);
      }
      
      private function onInitList(param1:MzEvent) : void
      {
         var _loc5_:* = null;
         var _loc2_:* = null;
         var _loc6_:int = 0;
         var _loc4_:Array = ShopModel.ins.getItemListByType(_funcIdArr[shopTab.selectedIndex]);
         var _loc3_:Array = [];
         _loc6_ = 0;
         while(_loc6_ < _loc4_.length)
         {
            _loc2_ = _loc4_[_loc6_] as StcShopVo;
            if(_loc2_ && _loc2_.limit_type == 1)
            {
               _loc5_ = {};
               _loc5_.shopType = _funcIdArr[shopTab.selectedIndex];
               _loc5_.stcShopVo = _loc2_;
               _loc5_.position = _loc2_.position;
               _loc5_.id = _loc2_.id;
               _loc5_.page = _loc2_.page.split("|")[0];
               _loc3_.push(_loc5_);
            }
            _loc6_++;
         }
         _loc3_.sortOn(["page","position","id"],16);
         itemList.array = _loc3_;
         (pageView as IPageBar).pageTo(0,false);
         this.visible = true;
      }
      
      protected function saveBtnClick(param1:MouseEvent) : void
      {
         saveSetting();
      }
      
      private function show() : void
      {
         tabHandler(0);
      }
      
      private function hide() : void
      {
         AssistantModel.ins.assistantShopSetVo = null;
      }
      
      public function saveSetting() : void
      {
         AssistantModel.ins.saveSetting(41600,AssistantModel.ins.assistantShopSetVo);
      }
      
      override public function dispose() : void
      {
         if(this.hasEventListener("addedToStage"))
         {
            this.removeEventListener("addedToStage",addToStage);
         }
         super.dispose();
      }
   }
}
