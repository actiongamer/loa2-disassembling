package nslm2.modules.foundations.mail
{
   import flash.events.EventDispatcher;
   import com.mz.core.utils.DictHash;
   import proto.MailData;
   import com.netease.protobuf.UInt64;
   import nslm2.utils.Uint64Util;
   import nslm2.common.model.PlayerModel;
   import nslm2.utils.ServerTimer;
   import morn.core.components.Label;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.GetMailListRes;
   import com.mz.core.event.MzEvent;
   import proto.MailNotify;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.notices.BottomMsgVo;
   import nslm2.modules.footstones.localeModules.LocaleParseVo;
   import proto.DelMailNotify;
   import proto.GetMailRewardReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.GetMailRewardRes;
   import morn.core.managers.timerMgrs.TimerManager;
   
   public class MailModel extends EventDispatcher
   {
      
      private static var _ins:nslm2.modules.foundations.mail.MailModel;
       
      
      public var mailReadList:DictHash;
      
      public var mailUnreadList:DictHash;
      
      public var newMailList:DictHash;
      
      public var tmpReward:Array;
      
      public var groupMailFlag:Boolean = false;
      
      public var sendedMailList:DictHash;
      
      public var lastMail:nslm2.modules.foundations.mail.MailInitVo;
      
      public var mailAllList:DictHash;
      
      public function MailModel()
      {
         mailReadList = new DictHash();
         mailUnreadList = new DictHash();
         newMailList = new DictHash();
         tmpReward = [];
         sendedMailList = new DictHash();
         lastMail = new nslm2.modules.foundations.mail.MailInitVo();
         mailAllList = new DictHash();
         super();
         ServerEngine.ins.addAlwayHandler(8154,onDataChange);
         ServerEngine.ins.addAlwayHandler(8155,onDelMail);
         ServerEngine.ins.addAlwayHandler(8157,onNewGroupMail);
         ServerEngine.ins.send(8150,null,onServerCpl_getMailList);
      }
      
      public static function get ins() : nslm2.modules.foundations.mail.MailModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.foundations.mail.MailModel();
         }
         return _ins;
      }
      
      public function GetNowPageRewardMailNum(param1:Array, param2:int) : int
      {
         var _loc4_:int = 0;
         var _loc3_:Array = param1.slice(param2 * 6,(param2 + 1) * 6);
         var _loc7_:int = 0;
         var _loc6_:* = _loc3_;
         for each(var _loc5_ in _loc3_)
         {
            if(_loc5_.status == 2 && _loc5_.reward.length != 0)
            {
               _loc4_++;
            }
         }
         return _loc4_;
      }
      
      public function GetRewardMailNum() : int
      {
         var _loc1_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:* = this.mailUnreadList.array;
         for each(var _loc2_ in this.mailUnreadList.array)
         {
            if(_loc2_.reward.length > 0)
            {
               _loc1_++;
            }
         }
         return _loc1_;
      }
      
      public function getMailStatusById(param1:UInt64) : int
      {
         if(this.mailReadList.containsKey(Uint64Util.toString(param1)))
         {
            return 1;
         }
         return 2;
      }
      
      public function delMail(param1:UInt64) : MailData
      {
         var _loc2_:* = null;
         _loc2_ = this.sendedMailList.remove(Uint64Util.toString(param1));
         if(_loc2_ != null)
         {
            return _loc2_;
         }
         this.mailAllList.remove(Uint64Util.toString(param1));
         _loc2_ = this.mailReadList.remove(Uint64Util.toString(param1));
         if(_loc2_ != null)
         {
            return _loc2_;
         }
         _loc2_ = this.mailUnreadList.remove(Uint64Util.toString(param1));
         if(_loc2_ != null)
         {
            return _loc2_;
         }
         return _loc2_;
      }
      
      public function addMail(param1:MailData) : void
      {
         if(checkSender(param1))
         {
            sendedMailList.put(Uint64Util.toString(param1.id),param1);
         }
         else
         {
            if(param1.status == 1)
            {
               this.mailReadList.put(Uint64Util.toString(param1.id),param1);
            }
            else
            {
               this.mailUnreadList.put(Uint64Util.toString(param1.id),param1);
            }
            this.mailAllList.put(Uint64Util.toString(param1.id),param1);
         }
      }
      
      public function checkSender(param1:MailData) : Boolean
      {
         if(param1.senderName == PlayerModel.ins.playerInfo.name)
         {
            return true;
         }
         return false;
      }
      
      public function getMail(param1:UInt64) : MailData
      {
         if(this.sendedMailList.containsKey(Uint64Util.toString(param1)))
         {
            return this.sendedMailList.getValue(Uint64Util.toString(param1));
         }
         if(this.mailReadList.containsKey(Uint64Util.toString(param1)))
         {
            return this.mailReadList.getValue(Uint64Util.toString(param1));
         }
         return this.mailUnreadList.getValue(Uint64Util.toString(param1));
      }
      
      public function changeMailToRead(param1:UInt64) : void
      {
         var _loc2_:* = null;
         _loc2_ = delMail(param1);
         _loc2_.status = 1;
         _loc2_.readTm = ServerTimer.ins.second;
         _loc2_.reward = [];
         this.addMail(_loc2_);
      }
      
      public function getMailTime(param1:uint) : String
      {
         var _loc2_:int = ServerTimer.ins.second - param1;
         if(_loc2_ < 1800)
         {
            return "刚才";
         }
         if(_loc2_ < 3600)
         {
            return "半小时前";
         }
         if(_loc2_ < 86400)
         {
            return Math.floor(_loc2_ / 3600) + "小时前";
         }
         return Math.floor(_loc2_ / 3600 / 24) + "天前";
      }
      
      public function getLeftTime(param1:int, param2:Label, param3:uint) : void
      {
         var _loc6_:int = 0;
         param2.style = "普通说明";
         var _loc5_:int = DefindConsts.MAIL_SAVE_UNREAD;
         if(param3 == 1)
         {
            _loc5_ = DefindConsts.MAIL_SAVE_READ;
         }
         var _loc4_:int = param1 + _loc5_ * 3600 * 24 - ServerTimer.ins.second;
         if(Math.floor(_loc4_ / 3600 / 24) > 0)
         {
            _loc6_ = Math.floor(_loc4_ / 3600 / 24);
            if(_loc6_ < 3)
            {
               param2.style = "不足禁止红";
            }
            param2.text = LocaleMgr.ins.getStr(10700004,[_loc6_]);
            return;
         }
         param2.style = "不足禁止红";
         if(Math.floor(_loc4_ / 3600) > 0)
         {
            param2.text = LocaleMgr.ins.getStr(10700014,[Math.floor(_loc4_ / 3600)]);
         }
         param2.text = LocaleMgr.ins.getStr(10700015);
      }
      
      private function onServerCpl_getMailList(param1:GetMailListRes) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         if(param1 != null)
         {
            _loc2_ = param1.mails;
            while(_loc3_ < _loc2_.length)
            {
               addMail(_loc2_[_loc3_]);
               _loc3_++;
            }
         }
         doSortArray();
         if(this.mailUnreadList.array.length > 0)
         {
            this.dispatchEvent(new MzEvent("mailHasNew",true,true));
         }
         else
         {
            this.dispatchEvent(new MzEvent("mailHasNew",false,true));
         }
      }
      
      public function doSortArray() : void
      {
         var _loc1_:* = null;
         this.mailReadList.array.sort(readSortFunc);
         this.mailUnreadList.array.sort(sortFunc);
         this.sendedMailList.array.sort(sortFunc);
         this.mailAllList.array.sort(sortFunc);
         var _loc3_:int = 0;
         var _loc2_:* = this.mailReadList.array;
         for each(_loc1_ in this.mailReadList.array)
         {
         }
         var _loc5_:int = 0;
         var _loc4_:* = this.mailUnreadList.array;
         for each(_loc1_ in this.mailUnreadList.array)
         {
         }
      }
      
      private function onDataChange(param1:MailNotify) : void
      {
         var _loc2_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:* = param1.mail;
         for each(var _loc3_ in param1.mail)
         {
            delMail(_loc3_.id);
            addMail(_loc3_);
            if(!checkSender(_loc3_))
            {
               this.newMailList.put(_loc3_.id,_loc3_.id);
            }
         }
         doSortArray();
         ObserverMgr.ins.sendNotice("msg_new_bottom_msg",new BottomMsgVo(2,null));
         this.dispatchEvent(new MzEvent("mailInfoChange",param1.mail,true));
         _loc2_ = 0;
         while(_loc2_ < param1.mail.length)
         {
            if((param1.mail[_loc2_] as MailData).senderName != PlayerModel.ins.playerInfo.name)
            {
               this.dispatchEvent(new MzEvent("mailHasNew",true,true));
               break;
            }
            _loc2_++;
         }
      }
      
      public function getMailTitle(param1:MailData) : String
      {
         var _loc6_:int = 0;
         var _loc3_:* = null;
         var _loc4_:String = param1.title;
         var _loc2_:Vector.<LocaleParseVo> = LocaleMgr.ins.parseVoArr(_loc4_);
         var _loc5_:int = _loc2_.length;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc3_ = _loc2_[_loc6_];
            var _loc7_:* = _loc3_.key;
            if("sendName" === _loc7_)
            {
               _loc4_ = _loc4_.replace(_loc3_.oriStr1,"");
            }
            _loc6_++;
         }
         return _loc4_;
      }
      
      public function getMailSendName(param1:MailData) : String
      {
         var _loc4_:* = null;
         var _loc2_:* = undefined;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc3_:* = null;
         switch(int(param1.kind) - 1)
         {
            case 0:
               _loc4_ = LocaleMgr.ins.getStr(10700101);
               break;
            case 1:
               _loc4_ = param1.senderName;
               break;
            case 2:
               _loc4_ = LocaleMgr.ins.getStr(10700102,[param1.familyName]);
               break;
            default:
               _loc4_ = LocaleMgr.ins.getStr(10700102,[param1.familyName]);
               break;
            default:
               _loc4_ = LocaleMgr.ins.getStr(10700102,[param1.familyName]);
               break;
            case 5:
               _loc2_ = LocaleMgr.ins.parseVoArr(param1.title);
               _loc5_ = _loc2_.length;
               _loc6_ = 0;
               while(_loc6_ < _loc5_)
               {
                  _loc3_ = _loc2_[_loc6_];
                  var _loc7_:* = _loc3_.key;
                  if("sendName" === _loc7_)
                  {
                     _loc4_ = _loc3_.paramArr[0];
                  }
                  _loc6_++;
               }
               if(!_loc4_)
               {
                  _loc4_ = LocaleMgr.ins.getStr(10700100);
               }
               break;
            case 6:
            case 7:
            case 8:
            case 9:
               _loc4_ = "志玲姐姐";
         }
         return _loc4_;
      }
      
      public function isNewMail(param1:UInt64) : Boolean
      {
         return this.newMailList.containsKey(param1);
      }
      
      public function delNewMail(param1:UInt64) : void
      {
         this.newMailList.remove(param1);
      }
      
      private function readSortFunc(param1:MailData, param2:MailData) : int
      {
         if(param1.readTm > param2.readTm)
         {
            return -1;
         }
         if(param2.readTm > param1.readTm)
         {
            return 1;
         }
         if(param1.id > param2.id)
         {
            return -1;
         }
         if(param2.id > param1.id)
         {
            return 1;
         }
         return 0;
      }
      
      private function sortFunc(param1:MailData, param2:MailData) : int
      {
         if(param1.reward && param1.reward.length > 0)
         {
            if(param2.reward && param2.reward.length > 0)
            {
               if(param1.status == 1 && param2.status == 2)
               {
                  return 1;
               }
               if(param1.status == 1 && param2.status == 1)
               {
                  return -1;
               }
               return -1;
            }
            return -1;
         }
         if(param2.reward && param2.reward.length > 0)
         {
            return 1;
         }
         if(param1.time > param2.time)
         {
            return -1;
         }
         if(param2.time > param1.time)
         {
            return 1;
         }
         if(param1.id > param2.id)
         {
            return -1;
         }
         if(param2.id > param1.id)
         {
            return 1;
         }
         return 0;
      }
      
      private function onDelMail(param1:DelMailNotify) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = param1.mailId;
         for each(var _loc2_ in param1.mailId)
         {
            this.delMail(_loc2_);
         }
         this.dispatchEvent(new MzEvent("mailInfoChange",null,true));
         if(this.mailUnreadList.array.length == 0)
         {
            this.dispatchEvent(new MzEvent("mailHasNew",false,true));
         }
      }
      
      private function onNewGroupMail(param1:*) : void
      {
         this.groupMailFlag = true;
         this.dispatchEvent(new MzEvent("mailHasNew",true,true));
      }
      
      public function isSelfSend(param1:UInt64) : Boolean
      {
         return true;
      }
      
      public function RewardGet(param1:UInt64) : void
      {
         var _loc2_:GetMailRewardReq = new GetMailRewardReq();
         _loc2_.id.push(param1);
         ServerEngine.ins.send(8156,_loc2_,onServerCpl_RewardGet);
      }
      
      private function onServerCpl_RewardGet(param1:GetMailRewardRes) : void
      {
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         var _loc5_:int = 0;
         var _loc4_:* = param1.id;
         for each(var _loc2_ in param1.id)
         {
            _loc3_ = this.delMail(_loc2_);
            if(_loc3_ != null)
            {
               _loc3_.status = 1;
               _loc3_.readTm = ServerTimer.ins.second;
               this.addMail(_loc3_);
               tmpReward = tmpReward.concat(_loc3_.reward);
            }
         }
         this.doSortArray();
         TimerManager.ins.doOnce(800,getRewardDelay);
         this.dispatchEvent(new MzEvent("mailInfoChange",null,true));
      }
      
      private function getRewardDelay() : void
      {
         this.dispatchEvent(new MzEvent("mailAllGetReward",null,true));
      }
   }
}
