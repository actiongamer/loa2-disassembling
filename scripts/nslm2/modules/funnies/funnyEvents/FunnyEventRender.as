package nslm2.modules.funnies.funnyEvents
{
   import game.ui.funnyEvents.FunnyEventRenderUI;
   import proto.ArenaReport;
   import proto.EventLog;
   import nslm2.utils.TimeUtils;
   import nslm2.modules.funnies.arenas.ArenaUtil;
   import nslm2.utils.ProtoUtils;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.battles.reportPlayer.BattleReportParamVo;
   import nslm2.modules.funnies.teamGuajiScenes.TeamGuajiService;
   import proto.GuajiPvpFightStartRes;
   import nslm2.modules.funnies.teamGuajiScenes.model.TeamGuajiModel;
   
   public class FunnyEventRender extends FunnyEventRenderUI
   {
       
      
      private var _arenaReport:ArenaReport;
      
      private var _eventLog:EventLog;
      
      public function FunnyEventRender()
      {
         super();
         this.txt_playback.text = LocaleMgr.ins.getStr(50200024);
         this.txt_getBack.text = LocaleMgr.ins.getStr(41300061);
         this.txt_playback.buttonMode = true;
         this.txt_playback.mouseChildren = false;
         this.txt_getBack.buttonMode = true;
         this.txt_getBack.mouseChildren = false;
         this.txt_playback.addEventListener("click",playBack_onClick);
         this.txt_getBack.addEventListener("click",getBack_onClick);
         this.txt_playback.visible = false;
         this.txt_getBack.visible = false;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(param1 is ArenaReport)
         {
            this.arenaReport = param1 as ArenaReport;
         }
         if(param1 is EventLog)
         {
            this.guajiLog = param1 as EventLog;
         }
      }
      
      public function get arenaReport() : ArenaReport
      {
         return _arenaReport;
      }
      
      public function set arenaReport(param1:ArenaReport) : void
      {
         _arenaReport = param1;
         this.txt_time.text = "[ " + TimeUtils.getFullTimeStr(this.arenaReport.createTime) + " ]";
         this.txt_new.visible = this.arenaReport.isNew;
         this.txt_playback.visible = true;
         this.txt_getBack.visible = false;
         this.txt_content.text = ArenaUtil.eventContent(arenaReport);
         this.txt_content.commitMeasure();
         this.txt_new.x = this.txt_content.x + this.txt_content.width + 6;
      }
      
      public function get guajiLog() : EventLog
      {
         return _eventLog;
      }
      
      public function set guajiLog(param1:EventLog) : void
      {
         this.txt_playback.visible = false;
         _eventLog = param1;
         this.txt_new.visible = false;
         var _loc2_:Array = ProtoUtils.parseParaArr(_eventLog.para);
         this.txt_time.text = "[ " + TimeUtils.getFullTimeStr(this.guajiLog.stamp) + " ]";
         this.txt_content.text = LocaleMgr.ins.getStr(_eventLog.kind,_loc2_);
         this.txt_new.x = this.txt_content.x + this.txt_content.width + 6;
         if(_eventLog.kind == 41300060)
         {
            txt_playback.visible = true;
            txt_getBack.visible = true;
            txt_getBack.x = txt_content.textWidth + 230;
         }
         else if(_eventLog.kind > 41300060)
         {
            this.txt_playback.visible = true;
            txt_getBack.visible = false;
         }
      }
      
      private function playBack_onClick(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         if(_eventLog)
         {
            ModuleMgr.ins.showModule(40201,BattleReportParamVo.createIds([_eventLog.reportId]));
         }
         else if(arenaReport)
         {
            _loc2_ = BattleReportParamVo.createIds([this.arenaReport.reportId]);
            _loc2_.type = 1;
            ModuleMgr.ins.showModule(40201,_loc2_);
         }
      }
      
      private function getBack_onClick(param1:MouseEvent) : void
      {
         if(_eventLog)
         {
            if(!(int(_eventLog.kind) - 41300060))
            {
               TeamGuajiService.ins.requestPvP(_eventLog.para[0].player,guajiPvPHandler);
            }
         }
      }
      
      private function guajiPvPHandler(param1:GuajiPvpFightStartRes) : void
      {
         TeamGuajiModel.ins.showLogPanel = true;
         ModuleMgr.ins.showModule(41223,param1);
      }
   }
}
