package nslm2.modules.foundations.guildModule.view.panel.manage
{
   import game.ui.guildModules.manageView.GuildManageViewUI;
   import com.mz.core.interFace.IViewStackPage;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.foundations.guildModule.model.GuildModel;
   import morn.core.components.Button;
   import proto.FamilyInfo;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.foundations.guildModule.vo.GuildManageVo;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.guildModule.service.GuildServiceHandler;
   import com.mz.core.mgrs.ObserverMgr;
   import morn.customs.expands.MornExpandUtil;
   
   public class GuildManageView extends GuildManageViewUI implements IViewStackPage, IObserver
   {
      
      private static const DISMISS_MAX_MEMBER_CNT:int = 5;
       
      
      private var guildModel:GuildModel;
      
      public function GuildManageView()
      {
         guildModel = GuildModel.ins;
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btnHandler);
         list_btns.changeHandler = listBtnClickHandler;
         btnTipArea.toolTip = LocaleMgr.ins.getStr(40700005);
      }
      
      private function btnHandler(param1:Button) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = param1;
         if(btn_exit === _loc3_)
         {
            _loc2_ = guildModel.guildInfo;
            if(_loc2_.leader == PlayerModel.ins.playerInfo.name)
            {
               AlertUtil.comfirm(LocaleMgr.ins.getStr(40700006),doDissmiss);
            }
            else
            {
               AlertUtil.comfirm(LocaleMgr.ins.getStr(11000015),doExit);
            }
         }
      }
      
      private function listBtnClickHandler(... rest) : void
      {
         var _loc2_:int = 0;
         var _loc3_:GuildManageVo = list_btns.selectedItem as GuildManageVo;
         switch(int(_loc3_.id) - 1)
         {
            case 0:
               _loc2_ = 40708;
               break;
            case 1:
               _loc2_ = 40705;
               break;
            case 2:
               _loc2_ = 40701;
               break;
            case 3:
               if(!GuildModel.ins.getCanInviteFriendsArr().length)
               {
                  AlertUtil.float(LocaleMgr.ins.getStr(40700007));
                  return;
               }
               _loc2_ = 40713;
               break;
            case 4:
               _loc2_ = 40702;
               break;
            case 5:
               _loc2_ = 40704;
               break;
            case 6:
               ModuleMgr.ins.showModule(10700,[3,["@" + LocaleMgr.ins.getStr(11000213)]],40700);
               break;
            case 7:
               _loc2_ = 40710;
               break;
            case 8:
               _loc2_ = 40702;
         }
         ModuleMgr.ins.showModule(_loc2_,null,40700);
      }
      
      private function doDissmiss() : void
      {
         GuildServiceHandler.ins.dismissGuild();
      }
      
      private function doExit() : void
      {
         GuildServiceHandler.ins.quickGuild();
      }
      
      public function viewStackIn() : void
      {
         var _loc2_:* = null;
         this.visible = true;
         btn_exit.label = !!guildModel.isPresident()?LocaleMgr.ins.getStr(11000234):LocaleMgr.ins.getStr(999000289);
         var _loc1_:Array = [];
         btnTipArea.mouseEnabled = false;
         if(guildModel.isPresident())
         {
            btn_exit.disabled = guildModel.memberList.length >= 5;
            btnTipArea.mouseEnabled = guildModel.memberList.length >= 5;
         }
         list_btns.dataSource = guildModel.getCrtManageFunctionList();
         this.fadeIn();
         ObserverMgr.ins.regObserver(this);
      }
      
      public function viewStackOut() : void
      {
         this.visible = false;
         ObserverMgr.ins.unregObserver(this);
      }
      
      public function getFocusNotices() : Array
      {
         return ["guild_notice_update_applicant_list"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("guild_notice_update_applicant_list" === _loc3_)
         {
            list_btns.dataSource = guildModel.getCrtManageFunctionList();
         }
      }
   }
}
