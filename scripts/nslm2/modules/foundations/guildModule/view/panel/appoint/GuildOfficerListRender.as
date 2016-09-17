package nslm2.modules.foundations.guildModule.view.panel.appoint
{
   import game.ui.guildModules.appoint.GuildOfficerListRenderUI;
   import proto.FamilyPostList;
   import nslm2.modules.foundations.guildModule.model.GuildModel;
   import com.netease.protobuf.UInt64;
   import morn.core.components.List;
   import morn.core.components.Button;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.foundations.guildModule.service.GuildServiceHandler;
   import com.mz.core.configs.ClientConfig;
   import nslm2.mgrs.stcMgrs.StcMgr;
   
   public class GuildOfficerListRender extends GuildOfficerListRenderUI
   {
       
      
      private var _data:FamilyPostList;
      
      private var cnt:int;
      
      public function GuildOfficerListRender()
      {
         super();
         cbx_name.selectHandler = selectHandler;
         btn_zr.clickHandler = btnClickHandler;
      }
      
      private function selectHandler(param1:int) : void
      {
         if(param1 < 0)
         {
            return;
         }
         var _loc2_:UInt64 = GuildModel.ins.getMemberIDByIndex(param1);
         if(_loc2_ && GuildModel.ins.clearMultipleOfficer(_loc2_))
         {
            (parent.parent as List).dataSource = GuildModel.ins.officerist;
         }
         _data.id = _loc2_;
      }
      
      private function btnClickHandler(param1:Button) : void
      {
         if(_data.id)
         {
            AlertUtil.comfirm(LocaleMgr.ins.getStr(999000274),confirmTransfer);
         }
         else
         {
            AlertUtil.float(LocaleMgr.ins.getStr(999000275));
         }
      }
      
      private function confirmTransfer() : void
      {
         GuildServiceHandler.ins.familyChangeLeader(_data.id);
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(ClientConfig.isRuLang())
         {
            this.btn_zr.width = 58;
         }
         _data = param1 as FamilyPostList;
         if(_data)
         {
            txt_posName.text = LocaleMgr.ins.getStr(StcMgr.ins.getGonghuiZhiweiVo(_data.post).name);
            cbx_name.dataSource = GuildModel.ins.memberNameList;
            cbx_name.button.label = GuildModel.ins.getMemberNameByID(_data.id);
            if(_data.post == 13 && GuildModel.ins.highPos != 14)
            {
               cbx_name.disabled = true;
            }
            btn_zr.visible = _data.post == 13 && _data.post < GuildModel.ins.highPos;
         }
      }
   }
}
