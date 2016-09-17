package nslm2.modules.foundations.mail
{
   import game.ui.MailModules.WriteMailPanelUI;
   import nslm2.modules.foundations.miniMaps.MiniMapBtn;
   import nslm2.common.model.PlayerModel;
   import nslm2.utils.TimeUtils;
   import nslm2.utils.ServerTimer;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import flash.events.Event;
   import com.mz.core.event.MzEvent;
   import proto.GameFriendData;
   import com.greensock.TweenLite;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.modules.foundations.friendModules.FriendService;
   import nslm2.modules.foundations.AlertUtil;
   import flash.events.MouseEvent;
   import morn.core.components.Button;
   import proto.SendMailReq;
   import nslm2.nets.sockets.ServerEngine;
   import com.mz.core.configs.EnvConfig;
   import nslm2.modules.otherPt.duowans.DuoWanGameMsgCollector;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.alerts.AlertMsgVo;
   import com.mz.core.mgrs.UIMgr;
   import proto.ProtocolStatusRes;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.common.vo.WealthVo;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.utils.RTools;
   
   public class WriteMailPanel extends WriteMailPanelUI
   {
       
      
      private var _mailInitVo:nslm2.modules.foundations.mail.MailInitVo;
      
      private var btnFriends:MiniMapBtn;
      
      private var friendPanel:nslm2.modules.foundations.mail.MailFriendPanel;
      
      public function WriteMailPanel()
      {
         super();
         this.btnFriends = new MiniMapBtn();
         btnFriends.x = 325;
         btnFriends.y = 73;
         btnFriends.funcId = 10600;
         btnFriends.addEventListener("click",this.btnFriendsClicked);
         this.addChild(btnFriends);
         MornExpandUtil.addHandlerForBtnAll(this,btn_onClick);
         var _loc1_:WealthVo = WealthVo.parseCostStr(DefindConsts.MAIL_NORMAL_COST);
         this.renderGold.wealthVo = _loc1_;
         this.friendPanel = new nslm2.modules.foundations.mail.MailFriendPanel();
         this.friendPanel.x = this.btnFriends.x + 20;
         this.friendPanel.y = this.btnFriends.y + 20;
         this.friendPanel.visible = false;
         this.friendPanel.alpha = 0;
         this.friendPanel.dataSource = FriendService.ins.recentlyContactFriends(50);
         this.lableRecv.text = LocaleMgr.ins.getStr(10700009);
         this.lableTitle.text = LocaleMgr.ins.getStr(10700010);
         this.btnSend.label = LocaleMgr.ins.getStr(10700011);
         this.txtContent.textField.addEventListener("change",onContentInput);
         this.friendPanel.addEventListener("mailToFriend",onMailToFriend);
         this.txtContent.maxChars = RTools.cl(300,100);
      }
      
      public function show(param1:nslm2.modules.foundations.mail.MailInitVo) : void
      {
         if(param1 != null)
         {
            _mailInitVo = param1;
         }
         else
         {
            _mailInitVo = new nslm2.modules.foundations.mail.MailInitVo();
            _mailInitVo.kind = 2;
         }
         this.txtRecvName.text = "";
         if(_mailInitVo != null && _mailInitVo.receiverNameArr != null && _mailInitVo.receiverNameArr.length > 0)
         {
            this.txtRecvName.text = _mailInitVo.receiverNameArr[0];
         }
         this.txtContent.text = "";
         this.txtTitle.text = "";
         this.visible = true;
         this.txtSenderName.text = PlayerModel.ins.playerInfo.name;
         this.txtSenderTm.text = TimeUtils.getShortTimeStr(ServerTimer.ins.second);
         this.txtWriteNum.text = LocaleMgr.ins.getStr(10700018,[this.txtContent.text.length]);
         this.panelBg.titleImgId = 10702;
      }
      
      protected function onContentInput(param1:Event) : void
      {
         this.txtWriteNum.text = LocaleMgr.ins.getStr(10700018,[this.txtContent.text.length]);
         this.txtWriteNum.commitMeasure();
      }
      
      private function onMailToFriend(param1:MzEvent) : void
      {
         var _loc2_:GameFriendData = param1.data as GameFriendData;
         this.txtRecvName.text = _loc2_.name;
         TweenLite.to(this.friendPanel,0.3,{
            "alpha":0,
            "onComplete":friendFadeIn
         });
      }
      
      private function friendFadeIn() : void
      {
         DisplayUtils.removeSelf(friendPanel);
         this.friendPanel.visible = false;
      }
      
      private function friendFadeOut() : void
      {
         var _loc1_:Array = FriendService.ins.recentlyContactFriends(50);
         if(_loc1_.length == 0)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(10700019));
         }
         this.friendPanel.dataSource = _loc1_;
         this.friendPanel.visible = true;
         this.addChild(this.friendPanel);
      }
      
      private function btnFriendsClicked(param1:MouseEvent) : void
      {
         if(this.friendPanel.visible)
         {
            TweenLite.to(this.friendPanel,0.3,{
               "alpha":0,
               "onComplete":friendFadeIn
            });
         }
         else
         {
            friendFadeOut();
            TweenLite.to(this.friendPanel,0.3,{"alpha":1});
         }
      }
      
      private function btn_onClick(param1:Button, param2:MouseEvent) : void
      {
         var _loc4_:* = null;
         var _loc3_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = param1;
         if(this.btnSend === _loc6_)
         {
            if(PlayerModel.ins.gold < this.renderGold.wealthVo.count)
            {
               AlertUtil.float(LocaleMgr.ins.getStr(300004040));
            }
            if(this.txtRecvName.text == "")
            {
               AlertUtil.float(LocaleMgr.ins.getStr(10700016));
            }
            else if(this.txtRecvName.text == PlayerModel.ins.playerInfo.name)
            {
               AlertUtil.float(LocaleMgr.ins.getStr(10700020));
            }
            else if(this.txtTitle.text == "")
            {
               AlertUtil.float(LocaleMgr.ins.getStr(10700022));
            }
            else if(this.txtContent.text == "")
            {
               AlertUtil.float(LocaleMgr.ins.getStr(10700021));
            }
            else
            {
               _loc4_ = new SendMailReq();
               _loc4_.content = this.txtContent.text;
               _loc4_.title = this.txtTitle.text;
               _loc4_.kind = _mailInitVo.kind;
               if(_mailInitVo != null && _mailInitVo.receiverNameArr && _mailInitVo.receiverNameArr.length > 1)
               {
                  _loc4_.receiveName = _mailInitVo.receiverNameArr;
               }
               else
               {
                  _loc4_.receiveName = [this.txtRecvName.text];
               }
               ServerEngine.ins.send(8152,_loc4_,onServerCpl_handler,onErrorCpl_handler);
               if(EnvConfig.ins.ptId == 33)
               {
                  _loc3_ = _loc4_.receiveName.length;
                  _loc5_ = 0;
                  while(_loc5_ < _loc3_)
                  {
                     DuoWanGameMsgCollector.ins.collectSendMailMessage(_loc4_.content,_loc4_.receiveName[_loc5_]);
                     _loc5_++;
                  }
               }
            }
         }
      }
      
      private function onServerCpl_handler() : void
      {
         ObserverMgr.ins.sendNotice("simpleAlert",new AlertMsgVo(LocaleMgr.ins.getStr(10700017,[this.renderGold.wealthVo.count])));
         UIMgr.stage.focus = txtRecvName.textField;
         clear();
      }
      
      private function onErrorCpl_handler(param1:ProtocolStatusRes) : void
      {
         ServerEngine.ins.doDefaultErr(param1);
         UIMgr.stage.focus = txtRecvName.textField;
         this.txtRecvName.text = "";
      }
      
      private function clear() : void
      {
         this.txtContent.text = "";
         this.txtRecvName.text = "";
         this.txtTitle.text = "";
         this.txtSenderName.text = PlayerModel.ins.playerInfo.name;
         this.txtSenderTm.text = TimeUtils.getShortTimeStr(ServerTimer.ins.second);
         this.txtWriteNum.text = LocaleMgr.ins.getStr(10700018,[this.txtContent.text.length]);
      }
   }
}
