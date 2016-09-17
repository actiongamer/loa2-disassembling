package nslm2.modules.foundations.guildModule.view.panel.log
{
   import game.ui.guildModules.log.GuildLogPanelUI;
   import com.mz.core.interFace.IViewStackPage;
   import nslm2.modules.foundations.guildModule.model.GuildModel;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   import nslm2.modules.foundations.guildModule.service.GuildServiceHandler;
   import proto.FamilyLogRes;
   import nslm2.modules.foundations.guildModule.util.GuildUtil;
   
   public class GuildLogPanel extends GuildLogPanelUI implements IViewStackPage
   {
       
      
      private var model:GuildModel;
      
      public function GuildLogPanel()
      {
         model = GuildModel.ins;
         super();
      }
      
      override protected function initialize() : void
      {
         (pageBar as IPageBar).bindList(list_log);
         list_log.dataSource = [];
         GuildServiceHandler.ins.reqGuildLog(gotLog);
      }
      
      private function gotLog(param1:FamilyLogRes) : void
      {
         if(param1)
         {
            list_log.dataSource = param1.list.reverse();
         }
      }
      
      private function updateInfo() : void
      {
         txt_prisent.text = model.guildInfo.leader;
         txt_fund.text = model.guildInfo.fund + "";
         txt_lvl.text = model.guildInfo.lv + "";
         txt_memberCnt.text = model.guildInfo.count + "/" + model.guildInfo.max;
         txt_inNotice.text = model.guildInfo.inNotice;
         txt_outNotice.text = model.guildInfo.outNotice;
         img_bg.url = GuildUtil.getFlagBgUrl(model.guildInfo.flagBase);
         img_pattern.url = GuildUtil.getFlagIconUrl(model.guildInfo.flagIcon);
      }
      
      public function viewStackIn() : void
      {
         this.fadeIn();
         updateInfo();
         this.visible = true;
      }
      
      public function viewStackOut() : void
      {
         this.visible = false;
      }
   }
}
