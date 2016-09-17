package nslm2.modules.footstones.seePlayerModule
{
   import game.ui.SeePlayerHeadModule.SeePlayerModuleUI;
   import nslm2.common.vo.PlayerVo;
   import nslm2.utils.LabelMed;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.foundations.friendModules.FriendService;
   import nslm2.modules.scenes.commons.SceneModel;
   import com.mz.core.mgrs.UIMgr;
   import flash.events.MouseEvent;
   import flash.display.DisplayObject;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import morn.core.components.Button;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.tipMenus.TipMenuMsg;
   import nslm2.modules.cultivates.otherRoleInfos.OtherRoleInfoService;
   import nslm2.modules.foundations.friendModules.FriendUtils;
   import morn.customs.expands.MornExpandUtil;
   
   public class SeePlayerModule extends SeePlayerModuleUI
   {
       
      
      private var _data:PlayerVo;
      
      public function SeePlayerModule()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btnHandler);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.centerX = 0;
         this.top = 160;
         _data = param1 as PlayerVo;
         this.txt_name.text = LabelMed.vipParam(_data.vipInfoVo) + _data.name;
         this.txt_level.text = _data.level + "";
         this.img_headerIcon.url = UrlLib.playerHeaderIcon(sex);
         if(FriendService.ins.isFriend(_data.playerId))
         {
            btn_msg.visible = true;
            btn_add.visible = false;
         }
         else
         {
            btn_msg.visible = false;
            if(SceneModel.ins.isCrossScene)
            {
               btn_add.visible = false;
            }
            else
            {
               btn_add.visible = true;
            }
         }
         super.preShow();
      }
      
      override public function show(param1:Object = null) : void
      {
         UIMgr.stage.addEventListener("click",stageClickHdr);
         super.show(param1);
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      override public function close(param1:Object = null) : void
      {
         UIMgr.stage.removeEventListener("click",stageClickHdr);
         super.close(param1);
      }
      
      public function stageClickHdr(param1:MouseEvent = null) : void
      {
         if(this.contains(param1.target as DisplayObject) || param1.target == this)
         {
            return;
         }
         UIMgr.stage.removeEventListener("click",stageClickHdr);
         ModuleMgr.ins.closeModule(this.moduleId);
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["notice_refresh_module_see_player_data"]);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         super.handleNotices(param1,param2);
         if(param1 == "notice_refresh_module_see_player_data")
         {
            this.preShow(param2);
         }
      }
      
      public function get sex() : int
      {
         return _data.stcNpcVo.sex;
      }
      
      private function btnHandler(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(btn_detail !== _loc2_)
         {
            if(btn_see !== _loc2_)
            {
               if(btn_add !== _loc2_)
               {
                  if(btn_msg === _loc2_)
                  {
                     ModuleMgr.ins.showModule(10540,_data,ModuleMgr.ins.popLayer.curModuleId);
                  }
               }
               else
               {
                  FriendUtils.friendApply(_data.playerId,_data.name);
               }
            }
            else
            {
               OtherRoleInfoService.ins.viewOtherPlayer(_data.playerId,_data.disID);
            }
         }
         else
         {
            ObserverMgr.ins.sendNotice("MSG_TIP_MENU_SHOW",new TipMenuMsg(102,_data));
         }
      }
   }
}
