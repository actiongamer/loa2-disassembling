package nslm2.modules.funnies.teams.listModules
{
   import game.ui.teams.listModules.TeamListModuleUI;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   import nslm2.modules.funnies.teamGuajiScenes.TeamGuajiService;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.customs.expands.MornExpandUtil;
   import flash.events.Event;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import proto.TeamBasicInfo;
   import nslm2.utils.Uint64Util;
   import nslm2.common.model.PlayerModel;
   import com.netease.protobuf.UInt64;
   import com.mz.core.utils.ArrayUtil;
   import com.mz.core.event.MzEvent;
   import nslm2.nets.sockets.ServerEvent;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.alerts.AlertMsgVo;
   
   public class TeamListModule extends TeamListModuleUI
   {
       
      
      public function TeamListModule()
      {
         super();
      }
      
      public function get pageBar() : IPageBar
      {
         return this.pageBarUI as IPageBar;
      }
      
      public function get service() : TeamGuajiService
      {
         return TeamGuajiService.ins;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         service.getTeamList(server_teamListCpl);
         if(service.teamType == 17)
         {
            this.btn_quickenter.label = LocaleMgr.ins.getStr(50800020);
            this.btn_quickenter.style = "按钮中黄";
         }
         else
         {
            this.btn_quickenter.label = LocaleMgr.ins.getStr(41210051);
            this.btn_quickenter.style = "按钮中绿";
         }
      }
      
      override public function preClose(param1:Object = null) : void
      {
         service.server_TeamPanelClose();
         super.preClose(param1);
      }
      
      private function server_teamListCpl() : void
      {
         this.panelBg.titleImgId = this.moduleId;
         showList();
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         super.preShowCpl();
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            this.list_teams.addEventListener("EVT_CLICK",render_onClick);
            TeamGuajiService.ins.addEventListener("EVT_TEAM_CREATE_NOTIFY",teamCreateNotifyHandler);
            TeamGuajiService.ins.addEventListener("EVT_TEAM_DELETE_NOTIFY",teamRemoveNotifyHandler);
            TeamGuajiService.ins.addEventListener("EVT_TEAM_ENTER_NOTIFY",teamEnterNotifyHandler);
            TeamGuajiService.ins.addEventListener("EVT_TEAM_REPLY_NOTIFY",teamReplyNotifyHandler);
            TeamGuajiService.ins.addEventListener("EVT_TEAM_COUNT_NOTIFY",teamCountNotifyHandler);
            TeamGuajiService.ins.addEventListener("evt_team_dissmiss",teamDissMissHandler);
         }
         else
         {
            this.list_teams.removeEventListener("EVT_CLICK",render_onClick);
            TeamGuajiService.ins.removeEventListener("EVT_TEAM_CREATE_NOTIFY",teamCreateNotifyHandler);
            TeamGuajiService.ins.removeEventListener("EVT_TEAM_DELETE_NOTIFY",teamRemoveNotifyHandler);
            TeamGuajiService.ins.removeEventListener("EVT_TEAM_ENTER_NOTIFY",teamEnterNotifyHandler);
            TeamGuajiService.ins.removeEventListener("EVT_TEAM_REPLY_NOTIFY",teamReplyNotifyHandler);
            TeamGuajiService.ins.removeEventListener("EVT_TEAM_COUNT_NOTIFY",teamCountNotifyHandler);
            TeamGuajiService.ins.removeEventListener("evt_team_dissmiss",teamDissMissHandler);
         }
      }
      
      protected function teamDissMissHandler(param1:Event) : void
      {
         service.getTeamList(this.showList);
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.btn_newteam !== _loc3_)
         {
            if(this.btn_quickenter !== _loc3_)
            {
               if(this.btn_enterteam === _loc3_)
               {
                  AlertUtil.comfirm(new EnterTeamByNo());
               }
            }
            else if(service.teamType == 17)
            {
               if(service.invitedNotifies.length == 0)
               {
                  AlertUtil.float(LocaleMgr.ins.getStr(50500105));
               }
               else
               {
                  ModuleMgr.ins.showModule(42004);
               }
            }
            else
            {
               onQuickEnterClick(null);
            }
         }
         else
         {
            onNewCreateClick(null);
         }
      }
      
      protected function onNewCreateClick(param1:MouseEvent) : void
      {
         service.server_TeamCreate(createTeamCpl);
      }
      
      private function createTeamCpl() : void
      {
         if(service.teamType == 15)
         {
            TeamGuajiService.ins.getTeamInfo(guajiTeamPanelHandler);
         }
         else
         {
            TeamGuajiService.ins.getTeamInfo(enterTeamCplHandler);
         }
      }
      
      protected function onQuickEnterClick(param1:MouseEvent) : void
      {
         quickEnterCallBack();
      }
      
      private function quickEnterCallBack() : void
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < service.teams.length)
         {
            if((service.teams[_loc2_] as TeamBasicInfo).setting.autoagreeall || Uint64Util.compareValue((service.teams[_loc2_] as TeamBasicInfo).setting.autoagreeability,Uint64Util.fromNumber(PlayerModel.ins.totalFightValue)) < 0 || (service.teams[_loc2_] as TeamBasicInfo).setting.autoagreelevel < PlayerModel.ins.level)
            {
               var _loc4_:* = service.teams[_loc2_].count;
               if(1 !== _loc4_)
               {
                  if(2 !== _loc4_)
                  {
                     if(3 !== _loc4_)
                     {
                     }
                  }
                  else if(_loc3_ < service.teams[_loc2_].count)
                  {
                     _loc3_ = service.teams[_loc2_].count;
                     _loc1_ = service.teams[_loc2_].id;
                  }
               }
               else if(_loc3_ < service.teams[_loc2_].count)
               {
                  _loc3_ = service.teams[_loc2_].count;
                  _loc1_ = service.teams[_loc2_].id;
               }
            }
            _loc2_++;
         }
         if(_loc3_ != 0)
         {
            service.server_TeamEnter(_loc1_,onTeamEnterHandler);
         }
         else
         {
            service.server_TeamCreate(createTeamCpl);
         }
      }
      
      private function onTeamEnterHandler() : void
      {
         guajiTeamPanelHandler();
      }
      
      private function showList() : void
      {
         var _loc1_:* = null;
         _loc1_ = service.teams;
         _loc1_.sort(sortTeam);
         _loc1_ = ArrayUtil.fillBySameItem(_loc1_.concat(),this.list_teams.repeatX * this.list_teams.repeatY - _loc1_.length,null);
         this.list_teams.array = [];
         this.list_teams.array = _loc1_;
         this.pageBar.bindList(this.list_teams);
      }
      
      private function sortTeam(param1:TeamBasicInfo, param2:TeamBasicInfo) : int
      {
         if(param1.count < param2.count)
         {
            return -1;
         }
         if(param1.count > param2.count)
         {
            return 1;
         }
         return Uint64Util.compareValue(param1.id,param2.id);
      }
      
      private function teamCreateNotifyHandler(param1:MzEvent) : void
      {
         var _loc2_:TeamBasicInfo = param1.data;
         this.showList();
      }
      
      private function teamRemoveNotifyHandler(param1:MzEvent) : void
      {
         service.getTeamList(this.showList);
      }
      
      private function teamCountNotifyHandler(param1:MzEvent) : void
      {
         service.getTeamList(this.showList);
      }
      
      private function onBtnApllyClick(param1:MzEvent) : void
      {
      }
      
      private function render_onClick(param1:MzEvent) : void
      {
         var _loc2_:TeamBasicInfo = param1.data as TeamBasicInfo;
         if(_loc2_.count >= service.teamMaxMemberNum)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(41210139));
         }
         else
         {
            TeamGuajiService.ins.server_TeamEnter((param1.data as TeamBasicInfo).id,server_teamEnter_cpl);
         }
      }
      
      private function server_teamEnter_cpl(param1:*, param2:ServerEvent) : void
      {
         ObserverMgr.ins.sendNotice("floatMsgCenter",new AlertMsgVo(LocaleMgr.ins.getStr(41210607)));
         if(service.teamType == 15)
         {
            guajiTeamPanelHandler();
         }
         else
         {
            enterTeamCplHandler();
         }
      }
      
      private function guajiTeamPanelHandler() : void
      {
         ModuleMgr.ins.showModule(10624);
      }
      
      private function enterTeamCplHandler() : void
      {
         service.dispatchEvent(new MzEvent("EVT_SELF_TEAM_CREATE_COMPLETE"));
      }
      
      private function teamEnterNotifyHandler(param1:MzEvent) : void
      {
         this.showList();
      }
      
      private function teamReplyNotifyHandler(param1:MzEvent) : void
      {
         this.showList();
         if(param1.data.isAgree)
         {
            TeamGuajiService.ins.getTeamInfo(teamReplyNotifyHandlerCpl);
         }
         else
         {
            AlertUtil.float(LocaleMgr.ins.getStr(41210138));
         }
      }
      
      private function teamReplyNotifyHandlerCpl() : void
      {
         if(service.teamType == 15)
         {
            guajiTeamPanelHandler();
         }
         else
         {
            enterTeamCplHandler();
         }
      }
   }
}
