package nslm2.modules.foundations.chatModules.historyPanels.historyS2
{
   import game.ui.chatModules.ChatHistoryRenderLeftUI;
   import proto.PublicTalkNotify;
   import nslm2.modules.foundations.friendModules.FriendService;
   import proto.GameFriendData;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.common.model.PlayerModel;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.foundations.chatModules.ChatUtils;
   import nslm2.modules.foundations.vip.consts.VipUtils;
   import nslm2.utils.TimeUtils;
   import flash.events.MouseEvent;
   import nslm2.common.vo.PlayerVo;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.tipMenus.TipMenuMsg;
   
   public class ChatHistoryRenderLeft extends ChatHistoryRenderLeftUI implements IChatHistoryRender
   {
      
      public static const BORDER_GAP:int = 6;
       
      
      public var txtRich:nslm2.modules.foundations.chatModules.historyPanels.historyS2.ChatHistoryRenderTxt;
      
      private var _showChannelName:Boolean = true;
      
      public var showSendTime:Boolean;
      
      private var _vo:PublicTalkNotify;
      
      public function ChatHistoryRenderLeft()
      {
         super();
         this.txt_playerName.isHtml = true;
         txtRich = new nslm2.modules.foundations.chatModules.historyPanels.historyS2.ChatHistoryRenderTxt(this.placeContent.width);
         placeContent.replaceWithDisplay(this.txtRich);
         this.headerIcon.img_playerIcon.buttonMode = true;
         this.headerIcon.img_playerIcon.addEventListener("click",icon_onClick);
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
               vo.name = _loc3_.name;
            }
            else if(PlayerModel.ins.isCurPlayer(param1.playerId))
            {
               this.headerIcon.img_playerIcon.url = UrlLib.headIcon(StcMgr.ins.getNpcVo(PlayerModel.ins.playerInfo.playerHero.baseInfo.baseId).head_id);
               vo.name = PlayerModel.ins.playerInfo.name;
            }
            else if(param1.npcId && param1.npcId != 0)
            {
               this.headerIcon.img_playerIcon.url = UrlLib.headIcon(StcMgr.ins.getNpcVo(param1.npcId).head_id);
            }
            else
            {
               this.headerIcon.img_playerIcon.url = UrlLib.headIcon(StcMgr.ins.getNpcVo(PlayerModel.ins.playerInfo.playerHero.baseInfo.baseId).head_id);
            }
            if(!param1.playerId || Uint64Util.isZero(param1.playerId))
            {
               if(param1.pindao == 3)
               {
                  this.headerIcon.img_playerIcon.url = UrlLib.chatHeadIcon("3");
               }
            }
            _loc2_ = ChatUtils.parseHeaderHTML(vo,true,false,_showChannelName,!!param1.content?VipUtils.vipInfoVo(param1.content.sendPlayer):null);
            if(this.showSendTime && param1.content.sendTimerSecond)
            {
               _loc2_ = _loc2_ + "  " + TimeUtils.getSimpleTimeStr2(param1.content.sendTimerSecond);
            }
            this.txt_playerName.text = _loc2_;
            this.txtRich.show(vo,false,changeSize);
            this.img_chatBg.width = txtRich.x - this.img_chatBg.x + txtRich.viewWidth + 6;
            this.img_chatBg.height = txtRich.y - this.img_chatBg.y + txtRich.viewHeight + 6;
            this.height = this.img_chatBg.y + this.img_chatBg.height;
         }
      }
      
      private function icon_onClick(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         if(Uint64Util.equal(vo.playerId,PlayerModel.ins.playerInfo.id) == false)
         {
            if(!vo.playerId || Uint64Util.isZero(vo.playerId))
            {
               if(vo.pindao == 3)
               {
                  return;
               }
            }
            _loc2_ = new PlayerVo();
            _loc2_.playerId = vo.playerId;
            _loc2_.name = vo.name;
            if(vo.npcId && vo.npcId != 0)
            {
               _loc2_.baseId = vo.npcId;
            }
            if(vo.gmType && vo.gmType != 0)
            {
               _loc2_.gmtype = vo.gmType;
            }
            ObserverMgr.ins.sendNotice("MSG_TIP_MENU_SHOW",new TipMenuMsg(102,_loc2_));
         }
      }
      
      private function changeSize() : void
      {
         this.img_chatBg.width = txtRich.x - this.img_chatBg.x + txtRich.viewWidth + 6;
         this.img_chatBg.height = txtRich.y - this.img_chatBg.y + txtRich.viewHeight + 6;
         this.height = this.img_chatBg.y + this.img_chatBg.height;
      }
   }
}
