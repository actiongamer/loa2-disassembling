package nslm2.modules.funnies.pkCrossSer.PKCrossComp
{
   import game.ui.funnyEvents.FunnyEventModuleUI;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.funnies.pkCrossSer.PKCrossModel;
   import proto.CrossArenaGetReportReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.CrossArenaGetReportRes;
   
   public class PKCrossReportModule extends FunnyEventModuleUI
   {
      
      public static var type:int = 0;
       
      
      private var isFirst:Boolean = true;
      
      public function PKCrossReportModule()
      {
         super();
         this.list.itemRender = PKCReportListRender;
      }
      
      public function get pageBar() : IPageBar
      {
         return this.pageBarUI as IPageBar;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(9050230);
         super.preShow(param1);
         if(PKCrossModel.ins.info.status == 2)
         {
            this.tab.labels = LocaleMgr.ins.getStr(50600031);
         }
         else
         {
            this.tab.labels = LocaleMgr.ins.getStr(50600032);
         }
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
         var _loc2_:* = null;
         if(PKCrossModel.ins.info.status == 2)
         {
            if(param1 == 0)
            {
               type = 3;
            }
            else
            {
               type = 2;
            }
         }
         else
         {
            type = 1;
         }
         _loc2_ = new CrossArenaGetReportReq();
         _loc2_.choice = type;
         ServerEngine.ins.send(4321,_loc2_,server_myhx_cpl);
      }
      
      private function server_myhx_cpl(param1:CrossArenaGetReportRes) : void
      {
         if(param1 == null)
         {
            param1 = new CrossArenaGetReportRes();
         }
         if(param1.infos == null)
         {
            param1.infos = [];
         }
         this.list.page = 0;
         this.list.array = param1.infos;
         this.list.commitMeasure();
         if(isFirst)
         {
            this.isFirst = false;
            super.preShowCpl();
         }
      }
   }
}
