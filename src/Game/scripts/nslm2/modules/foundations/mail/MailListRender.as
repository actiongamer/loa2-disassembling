package nslm2.modules.foundations.mail
{
   import game.ui.MailModules.MailListRenderUI;
   import proto.MailData;
   import com.mz.core.configs.ClientConfig;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import flash.events.MouseEvent;
   import proto.ReadMailReq;
   import nslm2.nets.sockets.ServerEngine;
   import com.mz.core.configs.EnvConfig;
   import nslm2.modules.otherPt.duowans.DuoWanGameMsgCollector;
   import com.mz.core.event.MzEvent;
   import proto.ReadMailRes;
   import com.netease.protobuf.UInt64;
   import nslm2.utils.Uint64Util;
   
   public class MailListRender extends MailListRenderUI
   {
       
      
      private var _data:MailData;
      
      public function MailListRender()
      {
         super();
         this.addEventListener("click",onRenderClick);
         MailModel.ins.addEventListener("mailReadGetReward",onReadGetReward);
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(param1 == null)
         {
            return;
         }
         this.iconReward.dataSource = null;
         _data = param1 as MailData;
         this.txtTitle.text = MailModel.ins.getMailTitle(_data);
         if(ClientConfig.isRuLang())
         {
            this.txtTitle.size = 12;
         }
         if(_data.kind == 2)
         {
            this.iconReward.dataSource = WealthUtil.createNpcVo(_data.iconId);
         }
         else if(_data.kind != 3)
         {
            if(_data.kind == 1)
            {
            }
         }
         if(_data.reward.length > 0)
         {
            if(_data.status == 2)
            {
               this.imgFujian.visible = true;
            }
            else
            {
               this.imgFujian.visible = false;
            }
            this.iconReward.dataSource = WealthUtil.rewardToVo(_data.reward[0]);
         }
         else
         {
            this.imgFujian.visible = false;
         }
         MailModel.ins.getLeftTime(_data.time,this.txtRestDay,_data.status);
         switch(int(_data.kind) - 1)
         {
            case 0:
               this.txtMailKind.text = LocaleMgr.ins.getStr(10700012);
               this.txtMailKind.style = "下划线黄色";
               break;
            case 1:
               this.txtMailKind.text = _data.senderName;
               this.txtMailKind.style = "普通说明";
               break;
            case 2:
               this.txtMailKind.text = _data.familyName;
               this.txtMailKind.style = "下划线黄色";
               break;
            default:
               this.txtMailKind.text = _data.familyName;
               this.txtMailKind.style = "下划线黄色";
               break;
            default:
               this.txtMailKind.text = _data.familyName;
               this.txtMailKind.style = "下划线黄色";
               break;
            case 5:
               this.txtMailKind.text = LocaleMgr.ins.getStr(10700012);
               this.txtMailKind.style = "下划线黄色";
               break;
            case 6:
            case 7:
            case 8:
            case 9:
               this.txtMailKind.text = MailModel.ins.getMailSendName(_data);
               this.txtMailKind.style = "下划线黄色";
         }
         this.imgNew.visible = false;
         this.imgRead.visible = false;
         this.imgMailframe.visible = false;
         if(MailModel.ins.checkSender(this._data))
         {
            this.imgNew.visible = false;
            this.imgRead.visible = true;
            this.iconReward.dataSource = null;
            this.imgMailframe.visible = false;
            this.imgRead.url = "png.uiMail.邮件发送图标";
         }
         else if(_data.status == 1)
         {
            this.imgNew.visible = false;
            this.imgRead.visible = true;
            this.iconReward.dataSource = null;
            this.imgMailframe.visible = false;
         }
         else if(this.iconReward.dataSource == null)
         {
            this.iconReward.img_quality.visible = false;
            this.iconReward.img_icon.url = UrlLib.mailDefaultIcon();
         }
         if(MailModel.ins.isNewMail(_data.id) && _data.status == 2)
         {
            this.imgNew.visible = true;
         }
         else
         {
            this.imgNew.visible = false;
         }
      }
      
      public function onRenderClick(param1:MouseEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:MailData = MailModel.ins.getMail(_data.id);
         if(_loc2_.content == null)
         {
            _loc3_ = new ReadMailReq();
            _loc3_.id = _data.id;
            ServerEngine.ins.send(8151,_loc3_,onServerCpl_readMail);
         }
         else
         {
            if(EnvConfig.ins.ptId == 33 && MailModel.ins.isNewMail(_data.id))
            {
               DuoWanGameMsgCollector.ins.collectReadNewMailMessage(_loc2_.content,_loc2_.senderName);
            }
            this.dispatchEvent(new MzEvent("mailRead",_loc2_,true));
         }
         MailModel.ins.delNewMail(_data.id);
         setReadState();
      }
      
      public function setReadState() : void
      {
         if(_data.status == 1)
         {
            return;
         }
         if(_data.reward.length == 0)
         {
            _data.status = 1;
         }
         this.imgNew.visible = false;
         this.imgRead.visible = true;
         this.iconReward.dataSource = null;
         this.imgMailframe.visible = false;
      }
      
      private function onServerCpl_readMail(param1:ReadMailRes) : void
      {
         var _loc3_:* = null;
         var _loc4_:MailData = param1.mail;
         var _loc2_:MailData = MailModel.ins.delMail(_loc4_.id);
         if(_loc2_.reward.length == 0)
         {
            _loc2_.status = 1;
         }
         _loc2_.readTm = param1.mail.readTm;
         _loc2_.content = _loc4_.content;
         MailModel.ins.addMail(_loc2_);
         _loc3_ = _loc4_.id;
         MailModel.ins.doSortArray();
         this.dispatchEvent(new MzEvent("mailRead",_loc2_,true));
      }
      
      public function onRenderOnekeyGetReward() : void
      {
         var _loc1_:MailData = this.dataSource as MailData;
         if(_loc1_ != null)
         {
            MailModel.ins.RewardGet(_loc1_.id);
         }
         this.imgFujian.visible = false;
         setReadState();
      }
      
      private function onReadGetReward(param1:MzEvent) : void
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < param1.data.length)
         {
            if(Uint64Util.toString(_data.id) == Uint64Util.toString(param1.data[_loc2_]))
            {
               this.imgFujian.visible = false;
            }
            _loc2_++;
         }
      }
      
      override public function dispose() : void
      {
         this.removeEventListener("click",onRenderClick);
         MailModel.ins.removeEventListener("mailReadGetReward",onReadGetReward);
         super.dispose();
      }
   }
}
