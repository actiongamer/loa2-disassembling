package nslm2.modules.foundations.guildModule.view.panel.appoint
{
   import game.ui.guildModules.appoint.GuildAppointPanelUI;
   import nslm2.modules.foundations.guildModule.model.GuildModel;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcGonghuiVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.foundations.guildModule.service.GuildServiceHandler;
   
   public class GuildAppointPanel extends GuildAppointPanelUI
   {
       
      
      private var guildModel:GuildModel;
      
      public function GuildAppointPanel()
      {
         guildModel = GuildModel.ins;
         super();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.titleImgId = this.moduleId;
         btn_confirm.clickHandler = doConfirm;
         guildModel.updateOfficerList();
         list_officer.repeatY = guildModel.officerist.length;
         list_officer.dataSource = guildModel.officerist;
         var _loc2_:StcGonghuiVo = StcMgr.ins.getGonghuiVo(guildModel.guildInfo.lv);
         var _loc3_:int = _loc2_.vice_num;
         var _loc4_:int = _loc2_.zl_num;
         this.txt_rules.text = LocaleMgr.ins.getStr(11000212,[guildModel.guildInfo.lv,_loc3_,_loc4_]);
         super.preShow(param1);
      }
      
      private function doConfirm() : void
      {
         GuildServiceHandler.ins.familyAppoint();
      }
   }
}
