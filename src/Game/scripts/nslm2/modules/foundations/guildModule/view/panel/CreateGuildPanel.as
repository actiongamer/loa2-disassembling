package nslm2.modules.foundations.guildModule.view.panel
{
   import game.ui.guildModules.GuildCreatePanelUI;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.utils.RTools;
   import nslm2.common.ui.components.comps2d.TextPromptBind;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.common.vo.WealthVo;
   import morn.core.components.Button;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.foundations.guildModule.service.GuildServiceHandler;
   
   public class CreateGuildPanel extends GuildCreatePanelUI
   {
       
      
      public function CreateGuildPanel()
      {
         super();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         super.preShow();
         this.panelBg.titleImgId = this.moduleId;
      }
      
      override protected function initialize() : void
      {
         super.initialize();
         MornExpandUtil.addHandlerForBtnAll(this,btnClickHandler);
         txt_gangName.textField.maxChars = RTools.cl(12,6);
         txt_gangName.textField.restrict = "Α-￥A-Za-z0-9";
         var _loc1_:TextPromptBind = new TextPromptBind(txt_gangName.textField,txt_prompt);
         var _loc2_:WealthVo = WealthUtil.costStrToArr(DefindConsts.GUILD_CREATE_COST)[0];
         costRender.dataSource = _loc2_;
      }
      
      private function btnClickHandler(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(okBtn.btn_ok !== _loc2_)
         {
            if(cancelBtn.btn_cancel === _loc2_)
            {
               btnCloseHandler(null);
            }
         }
         else
         {
            creatGuild();
         }
      }
      
      private function creatGuild() : void
      {
         if(txt_gangName.text.length < 2)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(11000004));
            return;
         }
         GuildServiceHandler.ins.familyCreate(txt_gangName.text);
      }
   }
}
