package nslm2.modules.foundations.guildModule.view.panel.rank
{
   import game.ui.guildModules.guildRank.GuildDetialInfoPanelUI;
   import com.netease.protobuf.UInt64;
   import nslm2.modules.foundations.guildModule.service.GuildServiceHandler;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   import proto.FamilyOtherRes;
   import nslm2.modules.foundations.guildModule.util.GuildUtil;
   
   public class GuildDetialInfoPanel extends GuildDetialInfoPanelUI
   {
       
      
      public function GuildDetialInfoPanel()
      {
         super();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.titleImgId = this.moduleId;
         var _loc2_:UInt64 = param1 as UInt64;
         GuildServiceHandler.ins.getOtherGuildInfo(_loc2_,updateGuildInfo);
         (this.pageBar as IPageBar).bindList(list_member);
         super.preShow(param1);
      }
      
      private function updateGuildInfo(param1:FamilyOtherRes) : void
      {
         txt_level.text = param1.info.lv + "";
         txt_name.text = param1.info.name;
         txt_memberNum.text = param1.info.count + "/" + param1.info.max;
         txt_owner.text = param1.info.leader;
         txt_rank.text = param1.info.rank + "";
         var _loc2_:Array = param1.list;
         _loc2_.sort(GuildUtil.sortMemberList);
         list_member.dataSource = param1.list;
      }
   }
}
