package nslm2.modules.funnies.funnyEvents
{
   import game.ui.funnyEvents.FunnyEventModuleUI;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.logging.Log;
   import nslm2.nets.sockets.ServerEngine;
   import proto.ArenaReportInfoRes;
   import proto.GuajiLogRes;
   
   public class FunnyEventModule extends FunnyEventModuleUI
   {
       
      
      private var isFirst:Boolean = true;
      
      public function FunnyEventModule()
      {
         super();
      }
      
      public function get pageBar() : IPageBar
      {
         return this.pageBarUI as IPageBar;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.titleImgId = this.moduleId;
         this.pageBar.bindList(this.list);
         this.tab.labels = [LocaleMgr.ins.getStr(9000000 + 50200),LocaleMgr.ins.getStr(9000000 + 41300),LocaleMgr.ins.getStr(9000000 + 41219)].join(",");
         this.tab.userChangeHandler = tab_changeHandler;
         var _loc2_:int = param1 as int;
         tab.selectedIndex = FunnyEventConsts.ins.tabIdArr.indexOf(_loc2_);
         if(tab.selectedIndex == -1)
         {
            Log.fatal(this,"错误的标签ID:" + _loc2_);
            super.preShowCpl();
         }
         else
         {
            showEvent();
         }
      }
      
      public function get curId() : int
      {
         return FunnyEventConsts.ins.tabIdArr[this.tab.selectedIndex];
      }
      
      private function tab_changeHandler(param1:int) : void
      {
         this.list.array = [];
         this.list.commitMeasure();
         this.showEvent();
      }
      
      private function showEvent() : void
      {
         var _loc1_:* = this.curId;
         if(50280 !== _loc1_)
         {
            if(41213 !== _loc1_)
            {
               if(41222 === _loc1_)
               {
                  this.list.itemRender = FunnyEventRender;
                  ServerEngine.ins.send(3027,null,server_guajiPvPLog_cpl);
               }
            }
            else
            {
               this.list.itemRender = FunnyEventRender;
               ServerEngine.ins.send(3027,null,server_guajiLog_cpl);
            }
         }
         else
         {
            this.list.itemRender = FunnyEventRender;
            ServerEngine.ins.send(4039,null,server_arenaReportInfo_cpl);
         }
      }
      
      private function server_arenaReportInfo_cpl(param1:ArenaReportInfoRes) : void
      {
         if(param1 == null)
         {
            param1 = new ArenaReportInfoRes();
         }
         if(param1.reports == null)
         {
            param1.reports = [];
         }
         this.list.page = 0;
         this.list.array = param1.reports;
         this.list.commitMeasure();
         if(isFirst)
         {
            this.isFirst = false;
            super.preShowCpl();
         }
      }
      
      private function server_guajiLog_cpl(param1:GuajiLogRes) : void
      {
         if(param1 == null)
         {
            param1 = new GuajiLogRes();
         }
         if(param1.log == null)
         {
            param1.log = [];
            this.list.array = [];
            return;
         }
         this.list.page = 0;
         this.list.array = param1.log.reverse();
         this.list.commitMeasure();
         if(isFirst)
         {
            this.isFirst = false;
            super.preShowCpl();
         }
      }
      
      private function server_guajiPvPLog_cpl(param1:GuajiLogRes) : void
      {
         if(param1 == null)
         {
            param1 = new GuajiLogRes();
         }
         if(param1.pvpLog == null)
         {
            param1.pvpLog = [];
            this.list.array = [];
            return;
         }
         this.list.page = 0;
         this.list.array = param1.pvpLog.reverse();
         this.list.commitMeasure();
         if(isFirst)
         {
            this.isFirst = false;
            super.preShowCpl();
         }
      }
   }
}
