package nslm2.modules.funnies.teams.details
{
   import game.ui.teams.details.TeamApplyListUI;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   import nslm2.modules.funnies.teamGuajiScenes.TeamGuajiService;
   import com.mz.core.event.MzEvent;
   import com.mz.core.mgrs.ObserverMgr;
   import morn.customs.expands.MornExpandUtil;
   import com.mz.core.utils.ArrayUtil;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import proto.TeamReply;
   import proto.TeamMember;
   import nslm2.modules.footstones.alerts.AlertMsgVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.Uint64Util;
   
   public class TeamApplyList extends TeamApplyListUI
   {
       
      
      public function TeamApplyList()
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
         service.getTeamInfo(server_applyListCpl);
         this.pageBar.bindList(this.list);
         super.preShow(param1);
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            TeamGuajiService.ins.addEventListener("EVT_TEAM_ENTER_NOTIFY",teamEnterNotifyHandler);
         }
         else
         {
            TeamGuajiService.ins.removeEventListener("EVT_TEAM_ENTER_NOTIFY",teamEnterNotifyHandler);
         }
      }
      
      private function teamEnterNotifyHandler(param1:MzEvent) : void
      {
         service.getTeamInfo(server_apply_enter_Cpl);
      }
      
      private function server_apply_enter_Cpl() : void
      {
         showApplyList();
      }
      
      private function server_applyListCpl() : void
      {
         this.panelBg.titleImgId = this.moduleId;
         this.txt_count.text = TeamGuajiService.ins.curPlayerTeamInfo.all.length + "/" + service.teamMaxMemberNum;
         if(TeamGuajiService.ins.curPlayerTeamInfo.applys.length == 0)
         {
            ObserverMgr.ins.sendNotice("TEAM_DETAIL_REMVOE_REDPOINT");
         }
         showApplyList();
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         super.preShowCpl();
      }
      
      private function showApplyList() : void
      {
         service.curPlayerTeamInfo.applys.sort(sortApplyer);
         var _loc1_:Array = ArrayUtil.fillBySameItem(service.curPlayerTeamInfo.applys.concat(),this.list.repeatX * this.list.repeatY - service.curPlayerTeamInfo.applys.length,null);
         this.list.array = service.curPlayerTeamInfo.applys;
         var _loc2_:* = !service.curPlayerTeamInfo.applys.length;
         btn_agreeAll.disabled = _loc2_;
         btn_refuseAll.disabled = _loc2_;
         this.pageBar.bindList(this.list);
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc8_:* = null;
         var _loc7_:int = 0;
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc6_:int = 0;
         var _loc5_:* = null;
         var _loc9_:* = param1;
         if(this.btn_agreeAll !== _loc9_)
         {
            if(this.btn_refuseAll === _loc9_)
            {
               _loc3_ = [];
               _loc6_ = 0;
               while(_loc6_ < service.curPlayerTeamInfo.applys.length)
               {
                  _loc5_ = new TeamReply();
                  _loc5_.isAgree = false;
                  _loc5_.playerId = (service.curPlayerTeamInfo.applys[_loc6_] as TeamMember).player.id;
                  _loc3_.push(_loc5_);
                  _loc6_++;
               }
               if(_loc3_.length > 0)
               {
                  TeamGuajiService.ins.server_agreeOrRefuse_apply(_loc3_,refuseAllSuccess);
               }
            }
         }
         else
         {
            _loc8_ = [];
            _loc7_ = 0;
            while(_loc7_ < service.curPlayerTeamInfo.applys.length)
            {
               _loc4_ = new TeamReply();
               _loc4_.isAgree = true;
               _loc4_.playerId = (service.curPlayerTeamInfo.applys[_loc7_] as TeamMember).player.id;
               _loc8_.push(_loc4_);
               _loc7_++;
            }
            if(_loc8_.length > 0)
            {
               TeamGuajiService.ins.server_agreeOrRefuse_apply(_loc8_,agreeAllSuccess);
            }
         }
      }
      
      private function refuseAllSuccess() : void
      {
         ObserverMgr.ins.sendNotice("floatMsgCenter",new AlertMsgVo(LocaleMgr.ins.getStr(41210113)));
         service.curPlayerTeamInfo.applys = [];
         this.list.array = [];
         ObserverMgr.ins.sendNotice("TEAM_DETAIL_REMVOE_REDPOINT");
      }
      
      private function agreeAllSuccess(param1:Object) : void
      {
         ObserverMgr.ins.sendNotice("floatMsgCenter",new AlertMsgVo(LocaleMgr.ins.getStr(41210112)));
         service.getTeamInfo(server_applyListCpl);
      }
      
      private function onAgreeAllCpl() : void
      {
      }
      
      private function sortApplyer(param1:TeamMember, param2:TeamMember) : int
      {
         if(Uint64Util.compareValue(param1.player.ability,param2.player.ability) > 0)
         {
            return -1;
         }
         return 1;
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["TEAM_APPLY_LIST_BTN"]);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         super.handleNotices(param1,param2);
         var _loc3_:* = param1;
         if("TEAM_APPLY_LIST_BTN" === _loc3_)
         {
            service.getTeamInfo(server_applyListCpl);
         }
      }
   }
}
