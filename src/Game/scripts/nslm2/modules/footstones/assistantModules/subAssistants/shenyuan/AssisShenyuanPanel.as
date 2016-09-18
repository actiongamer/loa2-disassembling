package nslm2.modules.footstones.assistantModules.subAssistants.shenyuan
{
   import game.ui.assistantModules.panels.AssisShenyuanPanelUI;
   import nslm2.modules.footstones.assistantModules.interfaces.IAssisPanel;
   import com.mz.core.interFace.IObserver;
   import nslm2.common.ui.components.comps2d.numBar.NumBarS1;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.assistantModules.vos.AssistantShenyuanSettingVo;
   import nslm2.modules.footstones.assistantModules.model.AssistantModel;
   import com.mz.core.mgrs.ObserverMgr;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.utils.WealthUtil;
   import flash.events.Event;
   import nslm2.modules.foundations.TimePriceUtil;
   import morn.core.components.Button;
   
   public class AssisShenyuanPanel extends AssisShenyuanPanelUI implements IAssisPanel, IObserver
   {
       
      
      private var _subPanel:nslm2.modules.footstones.assistantModules.subAssistants.shenyuan.AssisShenyuanSubPanel;
      
      public function AssisShenyuanPanel()
      {
         super();
         initLanguage();
         init();
      }
      
      private function get numBar() : NumBarS1
      {
         return this.numberRef as NumBarS1;
      }
      
      private function initLanguage() : void
      {
         this.txt_60200001.text = LocaleMgr.ins.getStr(60200001);
         this.txt_60200052.text = LocaleMgr.ins.getStr(60200052);
         this.txt_60200053.text = LocaleMgr.ins.getStr(60200053);
         this.txt_60200054.text = LocaleMgr.ins.getStr(60200054);
         this.txt_60200055.text = LocaleMgr.ins.getStr(60200055);
         this.txt_30600218.text = LocaleMgr.ins.getStr(999000828);
         this.check_60200049.label = LocaleMgr.ins.getStr(60200049);
         this.check_openTimes.label = LocaleMgr.ins.getStr(60200050);
         this.check_autoRewardRank.label = LocaleMgr.ins.getStr(60200051);
         this.btn_buff.label = LocaleMgr.ins.getStr(60200057);
         this.txt_noBuffalert.text = LocaleMgr.ins.getStr(60200082);
         btn_save.label = LocaleMgr.ins.getStr(60200009);
      }
      
      private function get funId() : int
      {
         return 41500;
      }
      
      private function getData() : AssistantShenyuanSettingVo
      {
         var _loc1_:AssistantShenyuanSettingVo = AssistantModel.ins.getSetting(funId);
         if(_loc1_ == null)
         {
            _loc1_ = new AssistantShenyuanSettingVo();
         }
         return _loc1_;
      }
      
      private function init() : void
      {
         this.numBar.setBgWidth(30);
         this.numBar.btn_max.visible = false;
         this.numBar.addEventListener("evt_numbar_value_change",onNumbarChanged);
         ObserverMgr.ins.regObserver(this);
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
         var _loc1_:AssistantShenyuanSettingVo = AssistantModel.ins.getSetting(funId);
         if(_loc1_ == null)
         {
            _loc1_ = new AssistantShenyuanSettingVo();
         }
         this.check_openTimes.selected = _loc1_.needOpenBox;
         this.numBar.init(0,20,_loc1_.openMysteryBoxCnt);
         this.check_autoRewardRank.selected = _loc1_.needGetRankReward;
         var _loc2_:int = getCostDiamondCnt(_loc1_.openMysteryBoxCnt);
         this.wealth_cost.dataSource = WealthUtil.needVo(3,0,_loc2_);
         this.box_cost.visible = _loc2_ > 0;
         AssisShenyuanUtils.tempNeedBuyBuffArr = _loc1_.buyBuffArr.concat();
         refreshBuffList();
      }
      
      private function onNumbarChanged(param1:Event) : void
      {
         var _loc2_:int = getCostDiamondCnt(this.numBar.nowNum);
         this.wealth_cost.dataSource = WealthUtil.needVo(3,0,_loc2_);
         this.box_cost.visible = _loc2_ > 0;
      }
      
      private function getCostDiamondCnt(param1:int) : int
      {
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:* = param1;
         _loc4_ = 1;
         while(_loc4_ <= _loc3_)
         {
            _loc2_ = _loc2_ + TimePriceUtil.getCost(6,_loc4_).count;
            _loc4_++;
         }
         return _loc2_;
      }
      
      public function saveSetting() : void
      {
         var _loc1_:AssistantShenyuanSettingVo = getData();
         _loc1_.needOpenBox = this.check_openTimes.selected;
         _loc1_.openMysteryBoxCnt = this.numBar.nowNum;
         _loc1_.needGetRankReward = this.check_autoRewardRank.selected;
         _loc1_.buyBuffArr = this.list_buff.dataSource as Array;
         AssistantModel.ins.saveSetting(funId,_loc1_);
      }
      
      private function refreshBuffList() : void
      {
         var _loc1_:Array = AssisShenyuanUtils.tempNeedBuyBuffArr;
         this.list_buff.dataSource = _loc1_;
         this.list_buff.repeatY = _loc1_.length;
         this.list_buff.commitMeasure();
         this.txt_noBuffalert.visible = _loc1_.length <= 0;
         this.panel_view.refresh();
      }
      
      public function getFocusNotices() : Array
      {
         return ["shenyuanBuffChanged"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("shenyuanBuffChanged" === _loc3_)
         {
            refreshBuffList();
         }
      }
      
      private function onBtnFunc(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(this.btn_buff !== _loc2_)
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
            _subPanel = new nslm2.modules.footstones.assistantModules.subAssistants.shenyuan.AssisShenyuanSubPanel();
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
         this.numBar.removeEventListener("evt_numbar_value_change",onNumbarChanged);
         super.dispose();
      }
   }
}
