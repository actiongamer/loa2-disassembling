package nslm2.modules.foundations.chatModules.privChats
{
   import game.ui.chatModules.privChats.PrivChatModuleUI;
   import nslm2.common.vo.PlayerVo;
   import com.netease.protobuf.UInt64;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.foundations.friendModules.FriendService;
   import nslm2.modules.foundations.chatModules.ChatUtils;
   import nslm2.modules.foundations.friendModules.FriendUtils;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.foundations.chatModules.ChatModel;
   import com.mz.core.event.MzEvent;
   import proto.PrivateTalkNotify;
   import proto.PublicTalkNotify;
   import nslm2.common.model.PlayerModel;
   import proto.PlayerFriendChatReq;
   import nslm2.nets.sockets.ServerEngine;
   import com.mz.core.utils.ArrayUtil;
   import flash.events.Event;
   import nslm2.utils.CheckFilterWords;
   import proto.PrivateTalkReq;
   import proto.TalkContent;
   import com.mz.core.utils.MathUtil;
   
   public class PrivChatModule extends PrivChatModuleUI
   {
       
      
      private var curChatVo:nslm2.modules.foundations.chatModules.privChats.PrivChatHistoryVo;
      
      public function PrivChatModule()
      {
         super();
      }
      
      public function get listPanel() : PrivChatRoleList
      {
         return this.listPanelUI as PrivChatRoleList;
      }
      
      public function get render_target() : PrivChatPlayerRender
      {
         return this.render_targetUI as PrivChatPlayerRender;
      }
      
      public function get hisotryView() : PrivChatHistory
      {
         return this.historyUI as PrivChatHistory;
      }
      
      public function get sendBox() : PrivChatSend
      {
         return this.sendBoxUI as PrivChatSend;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc2_:* = null;
         var _loc6_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         if(param1 is PlayerVo)
         {
            _loc2_ = param1 as PlayerVo;
            _loc6_ = _loc2_.playerId;
         }
         else
         {
            _loc6_ = param1 as UInt64;
         }
         if(_loc6_)
         {
            _loc3_ = Uint64Util.indexByAttr(FriendService.ins.recentlyArr,"playerId",_loc6_);
            if(_loc3_ <= -1)
            {
               _loc4_ = new nslm2.modules.foundations.chatModules.privChats.PrivChatHistoryVo();
               _loc4_.friendData = FriendService.ins.findFriend(_loc6_);
               if(_loc4_.friendData == null)
               {
                  if(_loc2_ && ChatUtils.isGMTypeCanPriChat(_loc2_.gmtype))
                  {
                     _loc4_.friendData = FriendUtils.createTempFriendData(_loc2_.playerId,_loc2_.name,_loc2_.gmtype,_loc2_.baseId,Uint64Util.fromNumber(_loc2_.fightValue),_loc2_.level);
                  }
               }
               if(_loc4_.friendData == null)
               {
                  ModuleMgr.ins.closeModule(this.moduleId);
                  return;
               }
               FriendService.ins.addRecently(_loc4_);
            }
         }
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(999000198);
         this.govementtip.text = LocaleMgr.ins.getStr(10600004);
         this.sendBox.addEventListener("evtSendText",sendTextHandler);
         ChatModel.ins.addEventListener("evtAddPrivateChat",onPrivateChatRet);
         this.listPanel.list_player.addEventListener("remove",render_onRemove);
         this.listPanel.list_player.changeHandler = list_player_onChange;
         this.listPanel.refresh();
         var _loc5_:int = Uint64Util.indexByAttr(FriendService.ins.recentlyArr,"playerId",_loc6_);
         if(_loc5_ > -1)
         {
            list_player_toChange(_loc5_);
         }
         else
         {
            list_player_toChange(0);
         }
         super.preShow(param1);
      }
      
      private function onPrivateChatRet(param1:MzEvent) : void
      {
         var _loc6_:* = null;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:PrivateTalkNotify = param1.data as PrivateTalkNotify;
         var _loc5_:PublicTalkNotify = new PublicTalkNotify();
         _loc5_.content = _loc4_.content;
         _loc5_.playerId = _loc4_.playerId;
         _loc5_.name = _loc4_.name;
         _loc5_.pindao = 6;
         this.listPanel.refresh();
         if(Uint64Util.equal(PlayerModel.ins.playerInfo.id,_loc5_.playerId))
         {
            _loc6_ = new PlayerFriendChatReq();
            _loc6_.id = curChatVo.playerId;
            _loc6_.publictalk = _loc5_;
            ServerEngine.ins.send(7066,_loc6_);
         }
         if(Uint64Util.equal(_loc5_.playerId,curChatVo.playerId))
         {
            this.hisotryView.append(_loc5_);
         }
         else if(Uint64Util.equal(PlayerModel.ins.playerInfo.id,_loc5_.playerId))
         {
            this.hisotryView.append(_loc5_);
            ArrayUtil.append(curChatVo.historyArr,[_loc5_]);
         }
         else
         {
            _loc2_ = Uint64Util.indexByAttr(this.listPanel.list_player.array,"playerId",_loc5_.playerId);
            if(_loc2_ > -1)
            {
               (this.listPanel.list_player.getCell(_loc2_) as PrivChatRoleListRender).redPoiChatCoun.count++;
            }
            else
            {
               _loc2_ = Uint64Util.indexByAttr(FriendService.ins.recentlyArr,"playerId",_loc5_.playerId);
               if(_loc2_ > -1)
               {
                  _loc3_ = FriendService.ins.recentlyArr[_loc2_];
                  this.listPanel.list_player.array.push(_loc3_);
                  _loc2_ = Uint64Util.indexByAttr(this.listPanel.list_player.array,"playerId",_loc5_.playerId);
                  (this.listPanel.list_player.getCell(_loc2_) as PrivChatRoleListRender).redPoiChatCoun.count++;
               }
            }
         }
      }
      
      private function sendTextHandler(param1:Event) : void
      {
         onSendText();
      }
      
      private function onSendText() : void
      {
         var _loc2_:String = CheckFilterWords.ins.filterWord_bak(this.sendBox.getContent());
         var _loc4_:String = Uint64Util.toString(curChatVo.playerId);
         var _loc3_:String = !!curChatVo.friendData?curChatVo.friendData.account:"";
         var _loc6_:String = !!curChatVo.friendData?curChatVo.friendData.name:"";
         var _loc5_:PublicTalkNotify = ChatUtils.createRes(6,PlayerModel.ins.playerInfo.id,PlayerModel.ins.playerInfo.name,_loc2_);
         curChatVo.historyArr.push(_loc5_);
         this.hisotryView.append(_loc5_);
         this.sendBox.clear();
         var _loc7_:PrivateTalkReq = new PrivateTalkReq();
         var _loc1_:TalkContent = new TalkContent();
         _loc1_.content = _loc2_;
         _loc7_.content = _loc1_;
         _loc7_.otherId = curChatVo.playerId;
         ServerEngine.ins.send(6002,_loc7_);
      }
      
      private function list_player_toChange(param1:int) : void
      {
         param1 = MathUtil.maxMin(param1,this.listPanel.list_player.array.length - 1,0);
         this.listPanel.list_player.selectedIndex = param1;
         list_player_onChange(param1);
      }
      
      private function list_player_onChange(param1:int) : void
      {
         var _loc6_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         curChatVo = this.listPanel.list_player.selectedItem as nslm2.modules.foundations.chatModules.privChats.PrivChatHistoryVo;
         var _loc5_:PrivChatRoleListRender = this.listPanel.list_player.getCell(param1) as PrivChatRoleListRender;
         if(_loc5_)
         {
            _loc5_.redPoiChatCoun.count = 0;
         }
         this.hisotryView.clear();
         this.render_target.dataSource = curChatVo;
         var _loc2_:int = curChatVo.historyArr.length;
         _loc6_ = 0;
         while(_loc6_ < _loc2_)
         {
            if(curChatVo.historyArr[_loc6_] is PrivateTalkNotify)
            {
               _loc4_ = curChatVo.historyArr[_loc6_] as PrivateTalkNotify;
               _loc3_ = new PublicTalkNotify();
               _loc3_.content = _loc4_.content;
               _loc3_.name = _loc4_.name;
               _loc3_.pindao = 6;
               _loc3_.playerId = _loc4_.playerId;
            }
            else
            {
               _loc3_ = curChatVo.historyArr[_loc6_];
            }
            this.hisotryView.append(_loc3_);
            _loc6_++;
         }
      }
      
      private function render_onRemove(param1:MzEvent) : void
      {
         var _loc2_:nslm2.modules.foundations.chatModules.privChats.PrivChatHistoryVo = param1.data as nslm2.modules.foundations.chatModules.privChats.PrivChatHistoryVo;
         FriendService.ins.removeRecently(_loc2_.playerId);
         if(FriendService.ins.recentlyArr.length == 0)
         {
            ModuleMgr.ins.closeModule(this.moduleId);
         }
         else
         {
            this.listPanel.refresh();
            if(Uint64Util.equal(_loc2_.playerId,curChatVo.playerId))
            {
               list_player_toChange(0);
            }
         }
      }
      
      override public function preClose(param1:Object = null) : void
      {
         super.preClose(param1);
         ChatModel.ins.removeEventListener("evtAddPrivateChat",onPrivateChatRet);
      }
   }
}
