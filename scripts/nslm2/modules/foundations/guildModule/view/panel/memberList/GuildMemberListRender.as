package nslm2.modules.foundations.guildModule.view.panel.memberList
{
   import game.ui.guildModules.memberView.GuildMemberListRenderUI;
   import proto.FamilyMember;
   import nslm2.common.model.PlayerModel;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.foundations.guildModule.util.GuildUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.TimeUtils;
   import flash.events.MouseEvent;
   import nslm2.common.vo.PlayerVo;
   import nslm2.modules.foundations.guildModule.model.GuildModel;
   import nslm2.modules.foundations.friendModules.FriendService;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.tipMenus.TipMenuMsg;
   import flash.display.DisplayObject;
   import morn.core.components.Label;
   import com.mz.core.mediators.RollMediator;
   
   public class GuildMemberListRender extends GuildMemberListRenderUI
   {
       
      
      private var _data:FamilyMember;
      
      public function GuildMemberListRender()
      {
         super();
         img_selectedBg.mouseEnabled = false;
         this.parts.push(new RollMediator(this,rollHandler));
         img_selectedBg.visible = false;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         _data = param1 as FamilyMember;
         if(_data)
         {
            if(PlayerModel.ins.isCurPlayer(_data.id))
            {
               changeTextColor(12798193);
            }
            else
            {
               changeTextColor(14210735);
            }
            txt_name.text = _data.name;
            txt_name.textField.mouseEnabled = false;
            txt_name.mouseEnabled = true;
            txt_name.buttonMode = true;
            txt_name.addEventListener("click",onClicekName);
            txt_power.text = Uint64Util.toString(_data.ability);
            txt_con.text = _data.con + "";
            txt_pos.text = GuildUtil.getPostName(_data.post);
            txt_lvl.text = _data.level + "";
            txt_active.text = _data.activity.toString();
            if(_data.highPost)
            {
               txt_pos.text = GuildUtil.getPostName(_data.highPost);
            }
            if(_data.online)
            {
               txt_status.text = LocaleMgr.ins.getStr(999000290) + TimeUtils.getOffLineTime(_data.online);
               changeTextColor(7566195);
            }
            else
            {
               txt_status.text = LocaleMgr.ins.getStr(999000291);
            }
            if(Uint64Util.equal(PlayerModel.ins.playerInfo.id,_data.id))
            {
               txt_name.underline = false;
               txt_name.mouseEnabled = false;
            }
            else
            {
               txt_name.underline = true;
               txt_name.mouseEnabled = true;
            }
         }
      }
      
      protected function onClicekName(param1:MouseEvent) : void
      {
         if(Uint64Util.equal(PlayerModel.ins.playerInfo.id,_data.id))
         {
            return;
         }
         var _loc2_:PlayerVo = new PlayerVo();
         _loc2_.playerId = _data.id;
         _loc2_.name = _data.name;
         _loc2_.joinTime = _data.addTime;
         if(GuildModel.ins.highPos > _data.highPost && GuildModel.ins.checkHasAuthority(102))
         {
            if(FriendService.ins.isFriend(_loc2_.playerId))
            {
               ObserverMgr.ins.sendNotice("MSG_TIP_MENU_SHOW",new TipMenuMsg(1112,_loc2_));
            }
            else
            {
               ObserverMgr.ins.sendNotice("MSG_TIP_MENU_SHOW",new TipMenuMsg(111,_loc2_));
            }
         }
         else if(FriendService.ins.isFriend(_loc2_.playerId))
         {
            ObserverMgr.ins.sendNotice("MSG_TIP_MENU_SHOW",new TipMenuMsg(1111,_loc2_));
         }
         else
         {
            ObserverMgr.ins.sendNotice("MSG_TIP_MENU_SHOW",new TipMenuMsg(110,_loc2_));
         }
      }
      
      private function changeTextColor(param1:uint) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc5_:int = 0;
         var _loc4_:int = this.numChildren;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = this.getChildAt(_loc5_);
            if(_loc3_ is Label)
            {
               (_loc3_ as Label).color = param1;
            }
            _loc5_++;
         }
      }
      
      private function rollHandler(param1:Boolean) : void
      {
         img_selectedBg.visible = param1;
      }
   }
}
