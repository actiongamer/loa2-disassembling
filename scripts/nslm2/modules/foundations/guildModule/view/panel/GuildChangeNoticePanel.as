package nslm2.modules.foundations.guildModule.view.panel
{
   import game.ui.guildModules.GuildChangeNoticePanelUI;
   import flash.events.Event;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.RTools;
   import morn.core.components.Button;
   import nslm2.modules.foundations.guildModule.service.GuildServiceHandler;
   import proto.FamilyChangeNoticeRes;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.foundations.guildModule.model.GuildModel;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class GuildChangeNoticePanel extends GuildChangeNoticePanelUI
   {
      
      private static const MAX_CHARS:int = 60;
       
      
      public function GuildChangeNoticePanel()
      {
         super();
         cbx_type.labels = LocaleMgr.ins.getStr(999000579) + "," + LocaleMgr.ins.getStr(999000580);
         cbx_type.selectHandler = changeType;
         okBtn.btn_ok.clickHandler = doModify;
         cancelBtn.btn_cancel.clickHandler = closeMe;
         txt_content.addEventListener("change",changeTxtHandler);
         cbx_type.selectedIndex = 0;
         txt_content.maxChars = RTools.cl(120,60);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.titleImgId = this.moduleId;
         super.preShow(param1);
      }
      
      protected function changeTxtHandler(param1:Event = null) : void
      {
         var _loc2_:int = txt_content.text.length;
         txt_sy.text = LocaleMgr.ins.getStr(11000851,[RTools.cl(120,60) - _loc2_]);
      }
      
      private function doModify(param1:Button) : void
      {
         GuildServiceHandler.ins.changeNotice(cbx_type.selectedIndex,txt_content.text,changeSuccessHandler);
      }
      
      private function changeSuccessHandler(param1:FamilyChangeNoticeRes) : void
      {
         if(!param1)
         {
            return;
         }
         AlertUtil.float(LocaleMgr.ins.getStr(11000207));
         if(cbx_type.selectedIndex == 0)
         {
            GuildModel.ins.guildInfo.inNotice = param1.notice;
         }
         else
         {
            GuildModel.ins.guildInfo.outNotice = param1.notice;
         }
         ObserverMgr.ins.sendNotice("guild_notice_update_guild_info");
         btnCloseHandler();
      }
      
      private function changeType(param1:int) : void
      {
         changeTxtHandler();
         if(param1 == 0)
         {
            txt_content.text = GuildModel.ins.guildInfo.inNotice;
         }
         else
         {
            txt_content.text = GuildModel.ins.guildInfo.outNotice;
         }
      }
      
      private function closeMe(param1:Object) : void
      {
         btnCloseHandler();
      }
   }
}
