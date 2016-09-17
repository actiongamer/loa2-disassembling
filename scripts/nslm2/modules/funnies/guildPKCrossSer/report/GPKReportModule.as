package nslm2.modules.funnies.guildPKCrossSer.report
{
   import game.ui.funnyEvents.FunnyEventModuleUI;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.nets.sockets.ServerEngine;
   import proto.FamilyExpeBattleReportRes;
   
   public class GPKReportModule extends FunnyEventModuleUI
   {
      
      public static var type:int = 0;
       
      
      private var isFirst:Boolean = true;
      
      public function GPKReportModule()
      {
         super();
         this.list.itemRender = GPKReportListRender;
      }
      
      public function get pageBar() : IPageBar
      {
         return this.pageBarUI as IPageBar;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(9050230);
         super.preShow(param1);
         this.tab.labels = LocaleMgr.ins.getStr(50700001);
         this.pageBar.bindList(this.list);
         this.tab.userChangeHandler = tab_changeHandler;
         tab.selectedIndex = 0;
         this.showEvent(0);
      }
      
      private function tab_changeHandler(param1:int) : void
      {
         this.list.array = [];
         this.list.commitMeasure();
         this.showEvent(param1);
      }
      
      private function showEvent(param1:int) : void
      {
         ServerEngine.ins.send(4369,null,server_cpl);
      }
      
      private function server_cpl(param1:FamilyExpeBattleReportRes) : void
      {
         if(param1 == null)
         {
            param1 = new FamilyExpeBattleReportRes();
         }
         if(param1.info == null)
         {
            param1.info = [];
         }
         this.list.page = 0;
         this.list.array = param1.info;
         this.list.commitMeasure();
         if(isFirst)
         {
            this.isFirst = false;
            super.preShowCpl();
         }
      }
   }
}
