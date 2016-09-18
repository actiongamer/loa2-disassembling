package nslm2.modules.foundations.chatModules.historyPanels.historyS2
{
   import game.ui.chatModules.ChatHistoryRenderRightUI;
   import proto.PublicTalkNotify;
   import nslm2.modules.foundations.friendModules.FriendService;
   import proto.GameFriendData;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.foundations.chatModules.ChatUtils;
   import nslm2.modules.foundations.vip.consts.VipUtils;
   import nslm2.utils.TimeUtils;
   
   public class ChatHistoryRenderRight extends ChatHistoryRenderRightUI implements IChatHistoryRender
   {
      
      public static const BORDER_GAP:int = 6;
       
      
      public var showSendTime:Boolean;
      
      public var txtRich:nslm2.modules.foundations.chatModules.historyPanels.historyS2.ChatHistoryRenderTxt;
      
      private var _showChannelName:Boolean = true;
      
      private var _vo:PublicTalkNotify;
      
      public function ChatHistoryRenderRight()
      {
         super();
         this.txt_playerName.isHtml = true;
         txtRich = new nslm2.modules.foundations.chatModules.historyPanels.historyS2.ChatHistoryRenderTxt(this.placeContent.width);
         placeContent.replaceWithDisplay(this.txtRich);
      }
      
      public function get showChannelName() : Boolean
      {
         return _showChannelName;
      }
      
      public function set showChannelName(param1:Boolean) : void
      {
         if(_showChannelName != param1)
         {
            _showChannelName = param1;
         }
      }
      
      public function get vo() : PublicTalkNotify
      {
         return _vo;
      }
      
      public function set vo(param1:PublicTalkNotify) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         if(_vo != param1)
         {
            _vo = param1;
            _loc3_ = FriendService.ins.findFriend(param1.playerId);
            if(_loc3_)
            {
               this.headerIcon.img_playerIcon.url = UrlLib.headIcon(StcMgr.ins.getNpcVo(_loc3_.baseid).head_id);
            }
            else if(PlayerModel.ins.isCurPlayer(param1.playerId))
            {
               this.headerIcon.img_playerIcon.url = UrlLib.headIcon(StcMgr.ins.getNpcVo(PlayerModel.ins.playerInfo.playerHero.baseInfo.baseId).head_id);
            }
            else if(param1.npcId && param1.npcId != 0)
            {
               this.headerIcon.img_playerIcon.url = UrlLib.headIcon(StcMgr.ins.getNpcVo(param1.npcId).head_id);
            }
            else
            {
               this.headerIcon.img_playerIcon.url = UrlLib.headIcon(StcMgr.ins.getNpcVo(PlayerModel.ins.playerInfo.playerHero.baseInfo.baseId).head_id);
            }
            _loc2_ = ChatUtils.parseHeaderHTML(vo,false,false,_showChannelName,!!param1.content?VipUtils.vipInfoVo(param1.content.sendPlayer):null);
            if(this.showSendTime && param1.content.sendTimerSecond)
            {
               _loc2_ = TimeUtils.getSimpleTimeStr2(param1.content.sendTimerSecond) + "  " + _loc2_;
            }
            this.txt_playerName.text = _loc2_;
            this.txtRich.show(vo,false);
            this.img_chatBg.width = img_chatBg.x + img_chatBg.width - (this.placeContent.x + placeContent.width) + txtRich.viewWidth + 6;
            this.img_chatBg.height = txtRich.y - this.img_chatBg.y + txtRich.viewHeight + 6;
            this.txtRich.x = this.placeContent.x + placeContent.width - this.txtRich.viewWidth;
            this.height = this.img_chatBg.y + this.img_chatBg.height;
         }
      }
   }
}
