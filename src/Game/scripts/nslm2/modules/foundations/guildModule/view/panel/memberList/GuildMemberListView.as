package nslm2.modules.foundations.guildModule.view.panel.memberList
{
   import game.ui.guildModules.memberView.MemberListViewUI;
   import com.mz.core.interFace.IViewStackPage;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.foundations.guildModule.model.GuildModel;
   import morn.core.components.Button;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.mgrs.ObserverMgr;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   
   public class GuildMemberListView extends MemberListViewUI implements IViewStackPage, IObserver
   {
       
      
      private var guildModel:GuildModel;
      
      public function GuildMemberListView()
      {
         guildModel = GuildModel.ins;
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btnHandler);
         (pagebar as IPageBar).bindList(list_member);
         this.txt_memberCnt.toolTip = LocaleMgr.ins.getStr(11000100);
      }
      
      private function btnHandler(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(btn_appoint !== _loc2_)
         {
            if(btn_setValue !== _loc2_)
            {
               if(btn_upgrade !== _loc2_)
               {
                  if(btn_invite === _loc2_)
                  {
                     if(!GuildModel.ins.getCanInviteFriendsArr().length)
                     {
                        AlertUtil.float(LocaleMgr.ins.getStr(999000292));
                        return;
                     }
                     ModuleMgr.ins.showModule(40713,null,40700);
                  }
               }
               else
               {
                  ModuleMgr.ins.showModule(40704,null,40700);
               }
            }
            else
            {
               ModuleMgr.ins.showModule(40710,null,40700);
            }
         }
         else
         {
            ModuleMgr.ins.showModule(40702,null,40700);
         }
      }
      
      public function getFocusNotices() : Array
      {
         return ["guild_notice_update_member_list"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("guild_notice_update_member_list" === _loc3_)
         {
            txt_memberCnt.text = guildModel.memberList.length + "/" + guildModel.guildInfo.max;
            list_member.dataSource = guildModel.memberList;
         }
      }
      
      public function viewStackIn() : void
      {
         this.visible = true;
         update();
         this.fadeIn();
         ObserverMgr.ins.regObserver(this);
      }
      
      private function update() : void
      {
         list_member.dataSource = guildModel.memberList;
         txt_memberCnt.text = guildModel.memberList.length + "/" + guildModel.guildInfo.max;
         if(guildModel.isPresident())
         {
            btn_setValue.label = LocaleMgr.ins.getStr(999000293);
         }
         else
         {
            btn_setValue.label = LocaleMgr.ins.getStr(999000294);
         }
         if(!GuildModel.ins.checkHasAuthority(100))
         {
            if(box_btn.contains(btn_appoint))
            {
               box_btn.removeChild(btn_appoint);
            }
         }
         else if(!btn_appoint.parent)
         {
            box_btn.addChildAt(btn_appoint,1);
         }
         if(guildModel.highPos)
         {
            if(box_btn.contains(btn_upgrade))
            {
               box_btn.removeChild(btn_upgrade);
            }
         }
         else if(!btn_upgrade.parent)
         {
            box_btn.addChildAt(btn_upgrade,1);
         }
         btn_invite.visible = GuildModel.ins.checkHasAuthority(200);
         box_btn.refresh();
      }
      
      public function viewStackOut() : void
      {
         this.visible = false;
         ObserverMgr.ins.unregObserver(this);
      }
   }
}
