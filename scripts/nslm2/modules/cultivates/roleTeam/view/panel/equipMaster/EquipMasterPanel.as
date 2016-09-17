package nslm2.modules.cultivates.roleTeam.view.panel.equipMaster
{
   import game.ui.roleTeam.panel.EquipMasterPanelUI;
   import morn.core.components.ViewStack;
   import nslm2.modules.roleInfos.RoleInfoModel;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.modules.cultivates.roleTeam.model.RoleTeamModel;
   
   public class EquipMasterPanel extends EquipMasterPanelUI
   {
       
      
      public var subViewStack:ViewStack;
      
      public function EquipMasterPanel()
      {
         super();
         subViewStack = new ViewStack();
         subViewStack.subViewClasses = [EquipStrenMasterView,EquipJLMasterPanel,TreasureStrenMasterView,TreasureInlayMasterView];
         tabBar.selectHandler = onTabBarSelected;
         tabBar.labels = [LocaleMgr.ins.getStr(999000082),LocaleMgr.ins.getStr(999000083),LocaleMgr.ins.getStr(30600007)].join(",");
         RoleTeamModel.ins.equipMasterIndex = 0;
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(30100039);
      }
      
      private function onTabBarSelected(param1:int) : void
      {
         if(param1 > 1 && RoleInfoModel.ins.heroInfo.baowu.length < 2)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(30100051));
            return;
         }
         if(param1 <= 1 && RoleInfoModel.ins.heroInfo.items.length < 4)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(30100050));
            return;
         }
         if(param1 == 1 && !FuncOpenAutoCtrl.checkOpen(30501))
         {
            FuncOpenAutoCtrl.showOpenLevelTip(30501);
            return;
         }
         subViewStack.selectedIndex = param1;
         RoleTeamModel.ins.equipMasterIndex = param1;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc2_:int = 0;
         if(param1)
         {
            _loc2_ = param1 as int;
         }
         subViewStack.x = 10;
         subViewStack.y = 66;
         tabBar.selectedIndex = _loc2_;
         subViewStack.selectedIndex = _loc2_;
         this.addChild(subViewStack);
         super.preShow(param1);
      }
   }
}
