package nslm2.modules.cultivates.lotteryHeroModules.heroPreviews
{
   import game.ui.lotteryHeroModules.heroPreviews.HeroPreviewModuleUI;
   import nslm2.common.ui.components.comps2d.pageBar.PageBarS2;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   
   public class HeroPreviewModule extends HeroPreviewModuleUI
   {
       
      
      public function HeroPreviewModule()
      {
         super();
      }
      
      public function get pageBarS2() : PageBarS2
      {
         return this.pageBar as PageBarS2;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(999000063);
         this.tabBar.labels = [LocaleMgr.ins.getStr(5100 + 1),LocaleMgr.ins.getStr(5100 + 2),LocaleMgr.ins.getStr(5100 + 3)].join(",");
         this.tabBar.selectHandler = onTabBarChanged;
         this.pageBarS2.bindList(this.list_items);
         onTabBarChanged(0);
         super.preShow(param1);
      }
      
      private function onTabBarChanged(param1:int) : void
      {
         this.list_items.dataSource = getDatasource(param1);
         this.list_items.page = 0;
         this.list_items.commitMeasure();
         this.pageBarS2.ctrl.validate();
         this.fadeIn(0,11010);
      }
      
      private function getDatasource(param1:int) : Array
      {
         var _loc2_:Array = StcMgr.ins.getVoArrByMultiColumnValue("static_npc",["kind","group","tupo"],[1,param1 + 1,0]);
         _loc2_.sort(sortFunc);
         return _loc2_;
      }
      
      private function sortFunc(param1:StcNpcVo, param2:StcNpcVo) : int
      {
         if(param1.quality > param2.quality)
         {
            return -1;
         }
         if(param1.quality < param2.quality)
         {
            return 1;
         }
         if(param1.id > param2.id)
         {
            return -1;
         }
         return 1;
      }
   }
}
