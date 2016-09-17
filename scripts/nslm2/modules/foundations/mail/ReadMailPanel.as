package nslm2.modules.foundations.mail
{
   import game.ui.MailModules.ReadMailPanelUI;
   import proto.MailData;
   import com.mz.core.configs.ClientConfig;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.WealthUtil;
   import com.mz.core.utils.FilterUtil;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.foundations.friendModules.FriendService;
   import nslm2.utils.TimeUtils;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import proto.GetMailRewardReq;
   import nslm2.nets.sockets.ServerEngine;
   import com.mz.core.event.MzEvent;
   import proto.DelMailReq;
   import proto.DelMailRes;
   import proto.GetMailRewardRes;
   import com.netease.protobuf.UInt64;
   import nslm2.utils.ServerTimer;
   import nslm2.common.uiEffects.ListIconFlyEff;
   import morn.core.managers.timerMgrs.TimerManager;
   import morn.customs.expands.MornExpandUtil;
   
   public class ReadMailPanel extends ReadMailPanelUI
   {
       
      
      private var _mailData:MailData;
      
      private var _btnGetInitX:int;
      
      private var pageIndex:int = 0;
      
      private var serverData:Array;
      
      public function ReadMailPanel()
      {
         super();
         _btnGetInitX = this.btnGet.x;
         MornExpandUtil.addHandlerForBtnAll(this,btn_onClick);
      }
      
      private function getNowIndexAry() : Array
      {
         if(pageIndex == 0)
         {
            btn_left.disabled = true;
         }
         else
         {
            btn_left.disabled = false;
         }
         if(pageIndex == Math.ceil(serverData.length / 5) - 1)
         {
            btn_right.disabled = true;
         }
         else
         {
            btn_right.disabled = false;
         }
         if((pageIndex + 1) * 5 < serverData.length)
         {
            return serverData.slice(pageIndex * 5,(pageIndex + 1) * 5);
         }
         return serverData.slice(pageIndex * 5,serverData.length);
      }
      
      public function show(param1:MailData) : void
      {
         pageIndex = 0;
         _mailData = param1;
         if(_mailData)
         {
            if(ClientConfig.isRuLang())
            {
               this.txtTitle.size = 12;
            }
            this.txtAttachment.text = LocaleMgr.ins.getStr(10700006);
            this.btnGet.label = LocaleMgr.ins.getStr(10700007);
            this.btnReturn.label = LocaleMgr.ins.getStr(10700008);
            this.txtContent.text = _mailData.content;
            this.txtContent.selectable = true;
            this.txtContent.mouseChildren = true;
            this.txtContent.commitMeasure();
            this.panel_content.refresh();
            this.txtName.text = _mailData.receiveName;
            this.txtTitle.text = MailModel.ins.getMailTitle(_mailData);
            serverData = WealthUtil.rewardArrToWealthVoArr(_mailData.reward);
            if(serverData.length < 6)
            {
               var _loc2_:Boolean = false;
               this.btn_right.visible = _loc2_;
               this.btn_left.visible = _loc2_;
            }
            else
            {
               _loc2_ = true;
               this.btn_right.visible = _loc2_;
               this.btn_left.visible = _loc2_;
            }
            this.listReward.dataSource = getNowIndexAry();
            this.btnGet.visible = true;
            this.listReward.filters = [];
            this.imgCaution.visible = false;
            this.btnReturn.visible = false;
            this.btnDelete.visible = false;
            if(_mailData.status == 1)
            {
               this.btnGet.visible = false;
               this.listReward.filters = [FilterUtil.grayFilter()];
               if(_mailData.reward.length > 0)
               {
                  this.txtAttachment.text = LocaleMgr.ins.getStr(10700013);
               }
            }
            if(_mailData.status == 2 && _mailData.reward.length == 0)
            {
               this.btnGet.visible = false;
            }
            this.btnDelete.x = 154;
            if(_mailData.senderName == PlayerModel.ins.playerInfo.name)
            {
               this.imgCaution.visible = false;
               this.btnReturn.visible = false;
               this.btnDelete.visible = true;
            }
            else if(_mailData.status == 1)
            {
               this.btnDelete.visible = true;
               if(_mailData.kind == 2)
               {
                  this.imgCaution.visible = true;
                  this.btnReturn.visible = true;
                  this.btnReturn.x = 100;
                  this.btnDelete.x = 220;
                  this.imgCaution.skin = "png.uiMail.非系统邮件";
                  if(FriendService.ins.isFriend(_mailData.senderId))
                  {
                     this.imgCaution.visible = false;
                  }
               }
               else if(_mailData.kind == 3)
               {
                  this.imgCaution.visible = true;
                  this.imgCaution.skin = "png.uiMail.公会邮件";
               }
               else if(_mailData.kind == 1)
               {
                  this.imgCaution.visible = true;
                  this.imgCaution.skin = "png.uiMail.官方邮件";
               }
            }
            this.txtSenderName.text = MailModel.ins.getMailSendName(_mailData);
            this.txtSenderTm.text = TimeUtils.getFullTimeStr(_mailData.time);
         }
         else
         {
            clear();
         }
         this.visible = true;
         this.panelBg.titleImgId = 10701;
      }
      
      private function clear() : void
      {
         this.txtContent.text = "";
         this.txtName.text = "";
         this.txtTitle.text = "";
         _mailData = null;
      }
      
      private function btn_onClick(param1:Button, param2:MouseEvent) : void
      {
         var _loc6_:* = null;
         var _loc5_:* = null;
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc7_:* = param1;
         if(this.btnGet !== _loc7_)
         {
            if(this.btnReturn !== _loc7_)
            {
               if(this.btnDelete !== _loc7_)
               {
                  if(this.btn_left !== _loc7_)
                  {
                     if(this.btn_right === _loc7_)
                     {
                        pageIndex = pageIndex + 1;
                        this.listReward.dataSource = getNowIndexAry();
                     }
                  }
                  else
                  {
                     pageIndex = pageIndex - 1;
                     this.listReward.dataSource = getNowIndexAry();
                  }
               }
               else
               {
                  _loc3_ = new DelMailReq();
                  _loc3_.ids.push(this._mailData.id);
                  ServerEngine.ins.send(8153,_loc3_,onServerCpl_delMail);
               }
            }
            else
            {
               _loc5_ = new MailInitVo();
               _loc4_ = [_mailData.senderName];
               _loc5_.receiverNameArr = _loc4_;
               MailModel.ins.dispatchEvent(new MzEvent("mailWrite",_loc5_));
            }
         }
         else
         {
            if(_mailData.reward == null || _mailData.reward.length == 0)
            {
               return;
            }
            _loc6_ = new GetMailRewardReq();
            _loc6_.id.push(_mailData.id);
            ServerEngine.ins.send(8156,_loc6_,onServerCpl_getMailReward);
         }
      }
      
      private function onServerCpl_delMail(param1:DelMailRes) : void
      {
         MailModel.ins.delMail(this._mailData.id);
         MailModel.ins.dispatchEvent(new MzEvent("mailDelete",param1.ids));
      }
      
      private function onServerCpl_getMailReward(param1:GetMailRewardRes) : void
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         var _loc6_:int = 0;
         var _loc5_:* = param1.id;
         for each(var _loc2_ in param1.id)
         {
            _loc3_ = MailModel.ins.delMail(_loc2_);
            _loc3_.status = 1;
            _loc3_.readTm = ServerTimer.ins.second;
            MailModel.ins.addMail(_loc3_);
            _loc4_ = _loc2_;
            MailModel.ins.doSortArray();
         }
         this.btnGet.visible = false;
         this.btnDelete.visible = true;
         new ListIconFlyEff(this.listReward).exec();
         TimerManager.ins.doOnce(300,this.onRewarded,false);
         this.txtAttachment.text = LocaleMgr.ins.getStr(10700013);
         MailModel.ins.dispatchEvent(new MzEvent("mailReadGetReward",param1.id,true));
      }
      
      private function onRewarded() : void
      {
         var _loc1_:int = 0;
         this.listReward.dataSource = WealthUtil.rewardArrToWealthVoArr(_mailData.reward);
         _loc1_ = 0;
         while(_loc1_ < this.listReward.array.length)
         {
            if(this.listReward.cells[_loc1_] != null)
            {
               this.listReward.cells[_loc1_].visible = true;
            }
            _loc1_++;
         }
         this.listReward.filters = [FilterUtil.grayFilter()];
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
