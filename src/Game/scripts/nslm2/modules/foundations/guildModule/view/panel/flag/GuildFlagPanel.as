package nslm2.modules.foundations.guildModule.view.panel.flag
{
   import game.ui.guildModules.flag.GuildFlagPanelUI;
   import nslm2.modules.foundations.guildModule.model.GuildModel;
   import nslm2.modules.foundations.guildModule.util.GuildUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.mgrs.stcMgrs.vos.StcGonghuiFlagVo;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import morn.core.components.Button;
   import nslm2.modules.foundations.guildModule.service.GuildServiceHandler;
   import nslm2.modules.foundations.AlertUtil;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class GuildFlagPanel extends GuildFlagPanelUI
   {
       
      
      private var model:GuildModel;
      
      private var selectedBgID:int;
      
      private var selectedPaID:int;
      
      public function GuildFlagPanel()
      {
         super();
         tabBar.labels = [LocaleMgr.ins.getStr(11000843),LocaleMgr.ins.getStr(11000844)].join(",");
      }
      
      override public function preShow(param1:Object = null) : void
      {
         $param = param1;
         this.panelBg.titleImgId = this.moduleId;
         model = GuildModel.ins;
         okBtm.btn_ok.clickHandler = doConfirm;
         cancleBtn.btn_cancel.clickHandler = function():void
         {
            btnCloseHandler();
         };
         tabBar.selectHandler = changeList;
         list_flag.changeHandler = listChangeHandler;
         list_flag.dataSource = model.flagBgArr;
         if(model.guildInfo.flagIcon == 0)
         {
            model.guildInfo.flagIcon = 4;
         }
         if(model.guildInfo.flagBase == 0)
         {
            model.guildInfo.flagBase = 1;
         }
         img_bg.url = GuildUtil.getFlagBgUrl(model.guildInfo.flagBase);
         img_pattern.url = GuildUtil.getFlagIconUrl(model.guildInfo.flagIcon);
         selectedBgID = model.guildInfo.flagBase;
         selectedPaID = model.guildInfo.flagIcon;
         list_flag.selectedIndex = getSelectedIndex(selectedBgID,model.flagBgArr);
         txt_title.text = LocaleMgr.ins.getStr(11000845);
         txt_name.text = TextFieldUtil.htmlText2("Lv." + model.guildInfo.lv,14210735) + "  " + model.guildInfo.name;
         super.preShow($param);
      }
      
      private function listChangeHandler(param1:int) : void
      {
         var _loc2_:StcGonghuiFlagVo = list_flag.selectedItem as StcGonghuiFlagVo;
         if(tabBar.selectedIndex == 0)
         {
            selectedBgID = _loc2_.id;
            img_bg.url = UrlLib.guildFlagBg(_loc2_.icon);
         }
         else
         {
            selectedPaID = _loc2_.id;
            img_pattern.url = UrlLib.guildFlagPattern(_loc2_.icon);
         }
      }
      
      private function changeList(param1:int) : void
      {
         switch(int(param1))
         {
            case 0:
               list_flag.dataSource = model.flagBgArr;
               list_flag.selectedIndex = getSelectedIndex(selectedBgID,model.flagBgArr);
               txt_title.text = LocaleMgr.ins.getStr(11000845);
               break;
            case 1:
               list_flag.dataSource = model.flagPatternArr;
               list_flag.selectedIndex = getSelectedIndex(selectedPaID,model.flagPatternArr);
               txt_title.text = LocaleMgr.ins.getStr(11000846);
         }
      }
      
      private function getSelectedIndex(param1:int, param2:Array) : int
      {
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc4_:int = param2.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = param2[_loc5_];
            if(_loc3_.id == param1)
            {
               return _loc5_;
            }
            _loc5_++;
         }
         return 0;
      }
      
      private function doConfirm(param1:Button) : void
      {
         GuildServiceHandler.ins.changeFlag(selectedBgID,selectedPaID,changeFlagSuccessHandler);
      }
      
      private function changeFlagSuccessHandler(param1:Object = null) : void
      {
         AlertUtil.float(LocaleMgr.ins.getStr(999000276));
         model.guildInfo.flagBase = selectedBgID;
         model.guildInfo.flagIcon = selectedPaID;
         ObserverMgr.ins.sendNotice("guild_notice_update_guild_info");
         changeList(tabBar.selectedIndex);
         btnCloseHandler();
      }
   }
}
