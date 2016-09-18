package nslm2.modules.funnies.teamGuajiScenes.mains.renders
{
   import game.ui.teamGuajiScenes.mains.MemberListRenderUI;
   import proto.TeamMemberState;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.utils.Uint64Util;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.WealthUtil;
   import flash.events.MouseEvent;
   import nslm2.modules.funnies.teamGuajiScenes.TeamGuajiService;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.mz.core.event.MzEvent;
   import proto.GuajiExtraRewardNotify;
   
   public class MemberListRender extends MemberListRenderUI
   {
       
      
      private var _data:TeamMemberState;
      
      public function MemberListRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         _data = param1 as TeamMemberState;
         if(_data)
         {
            box_member.visible = true;
            box_memberBg.visible = true;
            box_emptyContent.visible = false;
            _loc3_ = PlayerModel.ins.getFullNameWithDistName(_data.mem.player,false,false);
            txt_name.text = LinkUtils.playerNameSmart(_data.mem.player.id,_loc3_,_data.mem.player.dist,ColorLib.getMilitaryColor(_data.mem.player.militaryRank));
            txt_fightPower.value = Uint64Util.toInt(_data.mem.player.ability);
            txt_lvl.text = _data.mem.player.lv + "";
            _loc2_ = StcMgr.ins.getNpcVo(_data.mem.player.npcId).sex;
            img_headIcon.url = UrlLib.playerHeaderIcon(_loc2_);
            txt_status.text = "";
            if(_data.mem.guajiInfo)
            {
               if(_data.mem.guajiInfo.isStartFight)
               {
                  txt_status.text = LocaleMgr.ins.getStr(999000462) + WealthUtil.rewardToVo(_data.mem.guajiInfo.targetExtra.reward).count;
               }
               else
               {
                  txt_status.text = LocaleMgr.ins.getStr(41210118);
               }
            }
            addEvent();
         }
         else
         {
            removeEvent();
            box_member.visible = false;
            box_memberBg.visible = false;
            box_emptyContent.visible = true;
            img_plus.addEventListener("click",showTeamPanel);
         }
      }
      
      protected function showTeamPanel(param1:MouseEvent) : void
      {
         if(TeamGuajiService.ins.curPlayerTeamInfo)
         {
            ModuleMgr.ins.showOrCloseModule(10624);
         }
         else
         {
            ModuleMgr.ins.showOrCloseModule(10623);
         }
      }
      
      private function addEvent() : void
      {
         TeamGuajiService.ins.addEventListener("EVT_GUAJI_EXTRAREWARD_NOTIFY",updateReward);
      }
      
      private function removeEvent() : void
      {
         TeamGuajiService.ins.removeEventListener("EVT_GUAJI_EXTRAREWARD_NOTIFY",updateReward);
      }
      
      protected function updateReward(param1:MzEvent) : void
      {
         var _loc2_:GuajiExtraRewardNotify = param1.data as GuajiExtraRewardNotify;
         if(Uint64Util.equal(_data.mem.player.id,_loc2_.playerId))
         {
            txt_status.text = LocaleMgr.ins.getStr(41210119) + "@{wealth:7}" + " " + WealthUtil.rewardToVo(_loc2_.rwd).count;
         }
      }
      
      override public function dispose() : void
      {
         removeEvent();
         super.dispose();
      }
   }
}
