package nslm2.modules.foundations.recycle.view.panel.treasureReborn
{
   import game.ui.recycleModules.treasureReborn.RecSelectRebornTreasurePanelUI;
   import nslm2.modules.foundations.recycle.model.RecycleModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class RecSelectRebornTreasurePanel extends RecSelectRebornTreasurePanelUI
   {
       
      
      private var recModel:RecycleModel;
      
      public function RecSelectRebornTreasurePanel()
      {
         recModel = RecycleModel.ins;
         super();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         if(param1 as Boolean)
         {
            this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(9030101);
            list_equip.dataSource = recModel.idleCanRebornEquipList;
            list_equip.visible = true;
            list_hero.visible = false;
         }
         else
         {
            this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(9030102);
            list_hero.dataSource = recModel.rebornTreasureList;
            list_equip.visible = false;
            list_hero.visible = true;
         }
         super.preShow(param1);
      }
   }
}
