package nslm2.modules.footstones.assistantModules.subAssistants.mysteryshop
{
   import game.ui.assistantModules.panels.AssisMysteryShopSubPanelUI;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class AssisMysteryShopSubPanel extends AssisMysteryShopSubPanelUI implements IObserver
   {
       
      
      public function AssisMysteryShopSubPanel()
      {
         super();
         ObserverMgr.ins.regObserver(this);
         initLanguage();
         this.tab_group.labels = [LocaleMgr.ins.getStr(999000754),LocaleMgr.ins.getStr(5100 + 1),LocaleMgr.ins.getStr(5100 + 2),LocaleMgr.ins.getStr(5100 + 3)].join(",");
         this.tab_group.selectHandler = onTabChanged;
         this.tab_group.selectedIndex = 0;
         this.checkBox_diamond.selected = AssisMysteryShopModel.ins.showDiamond;
         this.checkBox_diamond.clickHandler = showDiamond;
         this.checkBox_heroSoul.selected = AssisMysteryShopModel.ins.showHeroSoul;
         this.checkBox_heroSoul.clickHandler = showHeroSoul;
      }
      
      private function initLanguage() : void
      {
         this.txt_3020.text = LocaleMgr.ins.getStr(3000 + 20);
         this.txt_60200067.text = LocaleMgr.ins.getStr(60200067);
         this.checkBox_heroSoul.label = LocaleMgr.ins.getStr(3000 + 15);
         this.checkBox_diamond.label = LocaleMgr.ins.getStr(3000 + 3);
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(60200071);
      }
      
      private function showDiamond() : void
      {
         AssisMysteryShopModel.ins.showDiamond = this.checkBox_diamond.selected;
         ObserverMgr.ins.sendNotice("mysteryShopChanged");
      }
      
      private function showHeroSoul() : void
      {
         AssisMysteryShopModel.ins.showHeroSoul = this.checkBox_heroSoul.selected;
         ObserverMgr.ins.sendNotice("mysteryShopChanged");
      }
      
      private function onTabChanged(param1:int) : void
      {
         refreshList();
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
      
      private function refreshList() : void
      {
         this.list_items.dataSource = AssisMysteryShopModel.ins.notSelectedShopListByIndex(this.tab_group.selectedIndex);
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         super.dispose();
      }
   }
}
