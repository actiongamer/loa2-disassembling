package nslm2.modules.foundations.guildModule.view.panel.verify
{
   import game.ui.guildModules.verify.GuildVerifyPanelUI;
   import nslm2.modules.foundations.guildModule.model.GuildModel;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.guildModule.service.GuildServiceHandler;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.components.Button;
   import nslm2.modules.foundations.AlertUtil;
   
   public class GuildVerifyPanel extends GuildVerifyPanelUI
   {
       
      
      private var preSelected:Boolean;
      
      public function GuildVerifyPanel()
      {
         super();
      }
      
      override public function getFocusNotices() : Array
      {
         return ["guild_notice_update_applicant_list","guild_notice_update_auto_invite","guild_notice_update_member_list"];
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("guild_notice_update_applicant_list" !== _loc3_)
         {
            if("guild_notice_update_member_list" !== _loc3_)
            {
               if("guild_notice_update_auto_invite" === _loc3_)
               {
                  cbx_auto.selected = GuildModel.ins.guildInfo.invite;
               }
            }
            else
            {
               updateMemberCnt();
            }
         }
         else
         {
            list_apply.dataSource = GuildModel.ins.applicantList;
            updateBatchBtn();
         }
      }
      
      private function updateBatchBtn() : void
      {
         var _loc1_:* = GuildModel.ins.applicantList.length == 0;
         btn_denyAll.disabled = _loc1_;
         btn_acceptAll.disabled = _loc1_;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.titleImgId = 40701;
         MornExpandUtil.addHandlerForBtnAll(this,btnClickHandler);
         list_apply.dataSource = [];
         (pageBar as IPageBar).bindList(list_apply);
         parts.push(list_apply);
         ObserverMgr.ins.regObserver(this);
         cbx_auto.selected = GuildModel.ins.guildInfo.invite;
         GuildServiceHandler.ins.reqApplicantList();
         preSelected = cbx_auto.selected;
         updateMemberCnt();
         super.preShow(param1);
      }
      
      private function updateMemberCnt() : void
      {
         txt_cnt.text = LocaleMgr.ins.getStr(40700021) + GuildModel.ins.memberList.length + "/" + GuildModel.ins.guildInfo.max;
      }
      
      private function btnClickHandler(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(btn_acceptAll !== _loc2_)
         {
            if(btn_denyAll !== _loc2_)
            {
               if(cbx_auto === _loc2_)
               {
                  if(!GuildModel.ins.checkHasAuthority(105))
                  {
                     AlertUtil.float(LocaleMgr.ins.getStr(999000295));
                     cbx_auto.selected = preSelected;
                     return;
                  }
                  GuildServiceHandler.ins.switchAutoInvite();
               }
            }
            else
            {
               GuildServiceHandler.ins.familyApplyOp(4,null);
            }
         }
         else
         {
            GuildServiceHandler.ins.familyApplyOp(3,null);
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
