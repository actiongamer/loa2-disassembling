package nslm2.modules.funnies.teams.listModules
{
   import game.ui.teams.listModules.EnterTeamByNoUI;
   import nslm2.modules.foundations.alerts.views.SimpleAlert;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.funnies.teamGuajiScenes.TeamGuajiService;
   import com.netease.protobuf.UInt64;
   import nslm2.utils.Uint64Util;
   import proto.TeamBasicInfo;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.alerts.AlertMsgVo;
   import com.mz.core.event.MzEvent;
   
   public class EnterTeamByNo extends EnterTeamByNoUI
   {
       
      
      public function EnterTeamByNo()
      {
         super();
         this.txt_search.restrict = "0-9";
         this.txt_search.maxChars = 6;
      }
      
      override public function setAlert(param1:SimpleAlert) : void
      {
         super.setAlert(param1);
         this.alert.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(41210060);
         this.alert.contentYesHandler = yesHandler;
      }
      
      public function get service() : TeamGuajiService
      {
         return TeamGuajiService.ins;
      }
      
      private function yesHandler() : void
      {
         service.server_TeamEnter(UInt64.parseUInt64(this.txt_search.text),onTeamEnterHandler);
      }
      
      private function onTeamEnterHandler() : void
      {
         guajiTeamPanelHandler();
      }
      
      private function guajiTeamPanelHandler() : void
      {
         var _loc4_:int = 0;
         var _loc2_:Boolean = true;
         var _loc1_:UInt64 = Uint64Util.fromNumber(0);
         var _loc3_:uint = 0;
         _loc4_ = 0;
         while(_loc4_ < service.teams.length)
         {
            if(Uint64Util.equal(UInt64.parseUInt64(this.txt_search.text),(service.teams[_loc4_] as TeamBasicInfo).id))
            {
               _loc2_ = (service.teams[_loc4_] as TeamBasicInfo).setting.autoagreeall;
               _loc1_ = (service.teams[_loc4_] as TeamBasicInfo).setting.autoagreeability;
               _loc3_ = (service.teams[_loc4_] as TeamBasicInfo).setting.autoagreelevel;
            }
            _loc4_++;
         }
         if(_loc2_ || Uint64Util.compareValue((service.teams[_loc4_] as TeamBasicInfo).setting.autoagreeability,Uint64Util.fromNumber(PlayerModel.ins.totalFightValue)) < 0 || (service.teams[_loc4_] as TeamBasicInfo).setting.autoagreelevel < PlayerModel.ins.level)
         {
            if(service.teamType == 15)
            {
               ModuleMgr.ins.showModule(10624);
            }
            else
            {
               enterTeamByNoCplHandler();
            }
         }
         else
         {
            ObserverMgr.ins.sendNotice("floatMsgCenter",new AlertMsgVo(LocaleMgr.ins.getStr(999000474)));
         }
      }
      
      private function enterTeamByNoCplHandler() : void
      {
         service.dispatchEvent(new MzEvent("EVT_TEAM_ENTER_BY_NO"));
      }
   }
}
