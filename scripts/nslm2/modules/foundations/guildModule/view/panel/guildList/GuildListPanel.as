package nslm2.modules.foundations.guildModule.view.panel.guildList
{
   import game.ui.guildModules.guildList.GuildListPanelUI;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.footstones.newerGuideModules.INewerGuideGetComp;
   import nslm2.modules.foundations.guildModule.model.GuildModel;
   import nslm2.modules.foundations.guildModule.view.panel.CreateGuildPanel;
   import proto.FamilyListRes;
   import nslm2.modules.foundations.guildModule.service.GuildServiceHandler;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import com.netease.protobuf.UInt64;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import morn.core.components.Component;
   import nslm2.mgrs.stcMgrs.vos.StcGuideVo;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   
   public class GuildListPanel extends GuildListPanelUI implements IObserver, INewerGuideGetComp
   {
      
      private static const NG_COMP_ID:String = "btn_join_1";
       
      
      private var guildModel:GuildModel;
      
      private var createGuildPanel:CreateGuildPanel;
      
      public function GuildListPanel()
      {
         super();
         (pageBar as IPageBar).bindList(list_gang);
         guildModel = GuildModel.ins;
      }
      
      private function onGetGuildList(param1:FamilyListRes) : void
      {
         if(param1)
         {
            guildModel.applyedGuildList = param1.apply;
            guildModel.guildList = param1.all;
            changeTablHandler();
         }
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.titleImgId = 40700;
         App.observer.regObserver(this);
         list_gang.dataSource = [];
         GuildServiceHandler.ins.reqGuildList();
         super.preShow(param1);
      }
      
      override public function show(param1:Object = null) : void
      {
         NGUtil.checkModuleShow(this.moduleId,this);
         super.show(param1);
      }
      
      private function doFastJoin() : void
      {
         var _loc1_:UInt64 = guildModel.getFastApplyGuildID();
         if(_loc1_)
         {
            GuildServiceHandler.ins.familyApply(_loc1_);
         }
      }
      
      private function showCreateGuildPanel() : void
      {
         ModuleMgr.ins.showModule(40706,null,40700);
      }
      
      private function changeTablHandler() : void
      {
         if(guildModel.guildList)
         {
            txt_empty.visible = false;
         }
         list_gang.dataSource = guildModel.guildList;
      }
      
      private function searchGuild() : void
      {
      }
      
      override public function getFocusNotices() : Array
      {
         return ["guild_notice_update_guild_list"];
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("guild_notice_update_guild_list" === _loc3_)
         {
            changeTablHandler();
         }
      }
      
      public function getCompById(param1:String, param2:StcGuideVo) : Component
      {
         if(param1 == "btn_join_1")
         {
            return (list_gang.getCell(0) as GuildListRender).btn_option;
         }
         return null;
      }
   }
}
