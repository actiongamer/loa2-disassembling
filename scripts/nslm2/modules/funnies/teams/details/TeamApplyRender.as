package nslm2.modules.funnies.teams.details
{
   import game.ui.teams.details.TeamApplyRenderUI;
   import proto.TeamMember;
   import com.netease.protobuf.UInt64;
   import flash.events.MouseEvent;
   import proto.TeamReply;
   import nslm2.modules.funnies.teamGuajiScenes.TeamGuajiService;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class TeamApplyRender extends TeamApplyRenderUI
   {
       
      
      private var _info:TeamMember;
      
      private var playerId:UInt64;
      
      public function TeamApplyRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(param1 is TeamMember || param1 == null)
         {
            this.info = param1 as TeamMember;
         }
      }
      
      public function get info() : TeamMember
      {
         return _info;
      }
      
      public function set info(param1:TeamMember) : void
      {
         _info = param1;
         if(_info)
         {
            this.btn_agree.addEventListener("click",onAgreeClick);
            this.btn_refuse.addEventListener("click",onRefuseClick);
            this.txt_name.text = _info.player.name;
            this.txt_lv.text = _info.player.lv.toString();
            this.txt_family.text = _info.player.familyName;
            this.txt_fightValue.text = _info.player.ability.toString();
            this.playerId = _info.player.id;
         }
      }
      
      private function onAgreeClick(param1:MouseEvent) : void
      {
         var _loc2_:TeamReply = new TeamReply();
         _loc2_.playerId = playerId;
         _loc2_.isAgree = true;
         TeamGuajiService.ins.server_agreeOrRefuse_apply([_loc2_],applySuccess);
      }
      
      private function applySuccess() : void
      {
         ObserverMgr.ins.sendNotice("TEAM_APPLY_LIST_BTN");
      }
      
      private function onRefuseClick(param1:MouseEvent) : void
      {
         var _loc2_:TeamReply = new TeamReply();
         _loc2_.playerId = playerId;
         _loc2_.isAgree = false;
         TeamGuajiService.ins.server_agreeOrRefuse_apply([_loc2_],refuseSuccess);
      }
      
      private function refuseSuccess() : void
      {
         ObserverMgr.ins.sendNotice("TEAM_APPLY_LIST_BTN");
      }
      
      private function onRefuseCpl() : void
      {
      }
   }
}
