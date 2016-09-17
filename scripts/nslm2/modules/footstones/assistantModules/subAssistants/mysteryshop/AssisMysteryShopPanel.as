package nslm2.modules.footstones.assistantModules.subAssistants.mysteryshop
{
   import game.ui.assistantModules.panels.AssisMysteryShopPanelUI;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.footstones.assistantModules.interfaces.IAssisPanel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.assistantModules.vos.AssistantMysterySettingVo;
   import nslm2.modules.footstones.assistantModules.model.AssistantModel;
   import com.mz.core.mgrs.ObserverMgr;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.common.model.PlayerModel;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.foundations.AlertUtil;
   import flash.events.Event;
   import morn.core.components.Button;
   
   public class AssisMysteryShopPanel extends AssisMysteryShopPanelUI implements IObserver, IAssisPanel
   {
       
      
      private var _subPanel:nslm2.modules.footstones.assistantModules.subAssistants.mysteryshop.AssisMysteryShopSubPanel;
      
      public function AssisMysteryShopPanel()
      {
         super();
         initLanguage();
         init();
      }
      
      private function initLanguage() : void
      {
         this.txt_3020.text = LocaleMgr.ins.getStr(3000 + 20);
         this.txt_60200001.text = LocaleMgr.ins.getStr(60200001);
         this.txt_60200066.text = LocaleMgr.ins.getStr(60200066);
         this.txt_60200055.text = LocaleMgr.ins.getStr(60200055);
         this.txt_60200070.text = LocaleMgr.ins.getStr(60200070);
         this.check_60200068.label = LocaleMgr.ins.getStr(60200068);
         this.check_useItem.label = LocaleMgr.ins.getStr(60200069);
         this.txt_60200070.text = LocaleMgr.ins.getStr(60200070);
         this.btn_addItem.label = LocaleMgr.ins.getStr(60200071);
         btn_save.label = LocaleMgr.ins.getStr(60200009);
      }
      
      private function get funId() : int
      {
         return 60310;
      }
      
      private function getData() : AssistantMysterySettingVo
      {
         var _loc1_:AssistantMysterySettingVo = AssistantModel.ins.getSetting(funId);
         if(_loc1_ == null)
         {
            _loc1_ = new AssistantMysterySettingVo();
         }
         return _loc1_;
      }
      
      private function init() : void
      {
         ObserverMgr.ins.regObserver(this);
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
         var _loc1_:AssistantMysterySettingVo = AssistantModel.ins.getSetting(funId);
         if(_loc1_ == null)
         {
            _loc1_ = new AssistantMysterySettingVo();
         }
         this.check_useItem.selected = _loc1_.needUseItemRefresh;
         this.txt_useTimes.num = _loc1_.useItemRefreshTimes;
         this.check_lockBuy.selected = _loc1_.buyLockHero;
         this.check_lockBuy.addEventListener("change",onSelectedChangeEvent);
         this.check_lockBuy.preCondHandler = checkVip;
         AssisMysteryShopModel.ins.initData();
         AssisMysteryShopModel.ins.tempNeedBuyShopList = _loc1_.needBuyItemArr.concat();
         refreshList();
         if(this.check_lockBuy.selected)
         {
            this.check_lockBuy.toolTip = LocaleMgr.ins.getStr(999902522);
         }
         else
         {
            this.check_lockBuy.toolTip = LocaleMgr.ins.getStr(999902523);
         }
      }
      
      private function checkVip() : Boolean
      {
         if(PlayerModel.ins.vip >= int(StcMgr.ins.getDefineVo("HERO_SHOP_SHARD_LOCK_VIP_LIMIT").define_value))
         {
            return true;
         }
         AlertUtil.float(LocaleMgr.ins.getStr(999902520));
         return false;
      }
      
      private function onSelectedChangeEvent(param1:Event) : void
      {
         if(this.check_lockBuy.selected)
         {
            this.check_lockBuy.toolTip = LocaleMgr.ins.getStr(999902522);
         }
         else
         {
            this.check_lockBuy.toolTip = LocaleMgr.ins.getStr(999902523);
         }
      }
      
      public function saveSetting() : void
      {
         var _loc1_:AssistantMysterySettingVo = getData();
         _loc1_.needUseItemRefresh = this.check_useItem.selected;
         _loc1_.useItemRefreshTimes = this.txt_useTimes.num;
         _loc1_.needBuyItemArr = AssisMysteryShopModel.ins.tempNeedBuyShopList;
         _loc1_.buyLockHero = this.check_lockBuy.selected;
         AssistantModel.ins.saveSetting(funId,_loc1_);
      }
      
      private function refreshList() : void
      {
         var _loc1_:Array = AssisMysteryShopModel.ins.tempNeedBuyShopList;
         this.list_items.dataSource = _loc1_;
         this.list_items.repeatY = _loc1_.length;
         this.list_items.commitMeasure();
         this.panel_view.refresh();
      }
      
      public function getFocusNotices() : Array
      {
         return ["mysteryShopChanged"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("mysteryShopChanged" === _loc3_)
         {
            refreshList();
         }
      }
      
      private function onBtnFunc(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(this.btn_addItem !== _loc2_)
         {
            if(this.btn_save === _loc2_)
            {
               saveSetting();
               ObserverMgr.ins.sendNotice("closeSettingPanel");
            }
         }
         else
         {
            showOrHideSubPanel();
         }
      }
      
      private function showOrHideSubPanel() : void
      {
         if(_subPanel)
         {
            _subPanel.dispose();
            _subPanel = null;
         }
         else
         {
            _subPanel = new nslm2.modules.footstones.assistantModules.subAssistants.mysteryshop.AssisMysteryShopSubPanel();
            _subPanel.x = this.width;
            this.addChild(_subPanel);
            _subPanel.addEventListener("close",onSubPanelClosed);
         }
      }
      
      private function onSubPanelClosed(param1:Event) : void
      {
         _subPanel.removeEventListener("close",onSubPanelClosed);
         showOrHideSubPanel();
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         super.dispose();
      }
   }
}
