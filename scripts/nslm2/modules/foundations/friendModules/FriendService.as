package nslm2.modules.foundations.friendModules
{
   import flash.events.EventDispatcher;
   import com.mz.core.utils.DictHash;
   import nslm2.modules.foundations.friendModules.vos.FriendGroupVo;
   import nslm2.nets.sockets.ServerEngine;
   import proto.PlayerFriendsInfoRes;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.notices.BottomMsgVo;
   import com.mz.core.event.MzEvent;
   import proto.GameFriendData;
   import proto.PlayerFriendApplyNotify;
   import com.mz.core.logging.Log;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.Uint64Util;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import proto.PlayerApplyAgreeNotify;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.utils.ProtoUtils;
   import proto.PlayerApplyRefuseNotify;
   import proto.PlayerDeleteFriendNotify;
   import proto.PlayerOnlineNotify;
   import proto.PublicTalkNotify;
   import proto.TalkContent;
   import nslm2.modules.foundations.chatModules.ChatModel;
   import proto.PlayerOfflineNotify;
   import nslm2.utils.ServerTimer;
   import proto.FriendSignatureNotify;
   import proto.FriendDonateStaminaNotify;
   import flash.events.Event;
   import proto.FriendTrendNotify;
   import proto.FriendDailyInfoClearNotify;
   import com.netease.protobuf.UInt64;
   import proto.PlayerAddToHeiMingDanReq;
   import proto.PlayerAddToHeiMingDanRes;
   import proto.Para;
   import proto.PlayerBaseInfo;
   import proto.PlayerRemoveHeiMingDanReq;
   import proto.PlayerRemoveHeiMingDanRes;
   import nslm2.modules.foundations.chatModules.privChats.PrivChatHistoryVo;
   import proto.TrendInfo;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   
   public class FriendService extends EventDispatcher
   {
      
      public static const EVT_FRIEND_LIST:String = "evtFriendList";
      
      public static const EVT_ADD_FRIEND:String = "evtAddFriend";
      
      public static const EVT_REMOVE_FRIEND:String = "evtRemoveFriend";
      
      public static const EVT_ADD_BLOCK:String = "evtAddBlock";
      
      public static const EVT_REMOVE_BLOCK:String = "evtRemoveBlock";
      
      public static const EVT_ADD_RECENTLY:String = "evtAddRecently";
      
      public static const EVT_REMOVE_RECENTLY:String = "evtRemoveRecently";
      
      public static const EVT_CAN_CONG_CHANGE:String = "evtCanCongChange";
      
      public static const EVT_CAN_GET_CHANGE:String = "evtGetGiftChange";
      
      public static const EVT_CHANGE_SIGNTUE:String = "evtChangeSigntue";
      
      public static const EVT_CHANGE_OFFTIME:String = "evtChangeOfftime";
      
      private static var _ins:nslm2.modules.foundations.friendModules.FriendService;
       
      
      public var signatue:String = "";
      
      public var applyFriendDataArr:Array;
      
      public var friendArr:Array;
      
      public var gangfriendArr:Array;
      
      public var recentlyArr:Array;
      
      public var blockArr:Array;
      
      public var hasCongCount:int = 0;
      
      public var beenCongCount:int = 0;
      
      public var canCongIds:Array;
      
      public var getGiftCount:int = 0;
      
      public var giveGiftIds:Array;
      
      public var canGetIds:Array;
      
      public var logArr:Array;
      
      public var groupDict:DictHash;
      
      public var gangfriendOnlineCount:int = 0;
      
      public var friendOnlineCount:int = 0;
      
      public function FriendService()
      {
         applyFriendDataArr = [];
         friendArr = [];
         gangfriendArr = [];
         recentlyArr = [];
         blockArr = [];
         canCongIds = [];
         giveGiftIds = [];
         canGetIds = [];
         groupDict = new DictHash();
         super();
         groupDict.putByKeyName(new FriendGroupVo(1,LocaleMgr.ins.getStr(999000256),DefindConsts.FRIENDS_MAX),"id");
         groupDict.putByKeyName(new FriendGroupVo(2,LocaleMgr.ins.getStr(999000257),60),"id");
         groupDict.putByKeyName(new FriendGroupVo(3,LocaleMgr.ins.getStr(999000258),50),"id");
         groupDict.putByKeyName(new FriendGroupVo(4,LocaleMgr.ins.getStr(999000259),DefindConsts.FRIENDS_BLACKLIST_MAX),"id");
         ServerEngine.ins.addAlwayHandler(7020,server_friendApplyNotify);
         ServerEngine.ins.addAlwayHandler(7062,server_friendAgreeNotify);
         ServerEngine.ins.addAlwayHandler(7065,server_friendRefuseNotify);
         ServerEngine.ins.addAlwayHandler(7037,server_friendDeleteNotify);
         ServerEngine.ins.addAlwayHandler(7051,server_friendOnlineNotify);
         ServerEngine.ins.addAlwayHandler(7052,server_friendOfflineNotify);
         ServerEngine.ins.addAlwayHandler(7305,server_friendSignatueNotify);
         ServerEngine.ins.addAlwayHandler(7303,server_getGiftNotify);
         ServerEngine.ins.addAlwayHandler(7310,server_canCongNotify);
         ServerEngine.ins.addAlwayHandler(7300,server_beCongNotify);
         ServerEngine.ins.addAlwayHandler(7311,server_dailyInfoClearNotify);
      }
      
      public static function get ins() : nslm2.modules.foundations.friendModules.FriendService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.foundations.friendModules.FriendService();
         }
         return _ins;
      }
      
      public function getGroupVoById(param1:*) : FriendGroupVo
      {
         return this.groupDict.getValue(param1);
      }
      
      public function getFriendList() : void
      {
         ServerEngine.ins.send(7048,null,server_friendListCpl);
      }
      
      private function server_friendListCpl(param1:PlayerFriendsInfoRes) : void
      {
         this.signatue = !!param1.signatue?param1.signatue:"";
         this.friendArr = param1.friendsinfo;
         this.friendArr.sort(sortFriendPieceFun);
         this.gangfriendArr = param1.gangfriendsinfo;
         this.gangfriendArr.sort(sortFriendPieceFun);
         this.applyFriendDataArr = param1.applyfriends;
         if(this.applyFriendDataArr.length > 0)
         {
            ObserverMgr.ins.sendNotice("msg_new_bottom_msg",new BottomMsgVo(10,null,this.applyFriendDataArr.length));
         }
         this.blockArr = param1.heimingdaninfo;
         this.blockArr.sort(sortFriendPieceFun);
         this.getGiftCount = param1.hasGetstaminas;
         this.hasCongCount = param1.hascongcount;
         this.beenCongCount = param1.hasbeencongedcount;
         this.canGetIds = param1.canGetstaminaIds;
         this.canCongIds = param1.canconginfos;
         this.giveGiftIds = param1.donateToIds;
         validateFriendOnlineCount();
         validateGangfriendOnlineCount();
         this.dispatchEvent(new MzEvent("evtFriendList"));
      }
      
      private function checkIsOnline(param1:uint) : Boolean
      {
         if(param1 == 0)
         {
            return true;
         }
         return false;
      }
      
      public function validateFriendOnlineCount() : void
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         this.friendOnlineCount = 0;
         var _loc2_:int = this.friendArr.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = this.friendArr[_loc3_];
            if(checkIsOnline(_loc1_.offtime))
            {
               this.friendOnlineCount++;
            }
            _loc3_++;
         }
      }
      
      public function validateGangfriendOnlineCount() : void
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         this.gangfriendOnlineCount = 0;
         var _loc2_:int = this.gangfriendArr.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = this.gangfriendArr[_loc3_];
            if(checkIsOnline(_loc1_.offtime))
            {
               this.gangfriendOnlineCount++;
            }
            _loc3_++;
         }
      }
      
      public function sendInitBottomMsg() : void
      {
         if(this.applyFriendDataArr.length > 0)
         {
            ObserverMgr.ins.sendNotice("msg_new_bottom_msg",new BottomMsgVo(10,null,this.applyFriendDataArr.length));
         }
         if(this.canGetIds.length > 0)
         {
            ObserverMgr.ins.sendNotice("msg_new_bottom_msg",new BottomMsgVo(11,null,this.canGetIds.length));
         }
      }
      
      private function server_friendApplyNotify(param1:PlayerFriendApplyNotify) : void
      {
         if(this.isFriend(param1.data.id))
         {
            Log.warn(param1.data.id,param1.data.name,LocaleMgr.ins.getStr(999000260));
            return;
         }
         var _loc2_:int = Uint64Util.indexByAttr(this.applyFriendDataArr,GameFriendData.ID.name,param1.data.id);
         if(_loc2_ > -1)
         {
            ArrayUtil.removeItemAt(this.applyFriendDataArr,_loc2_);
         }
         applyFriendDataArr.push(param1.data);
         if(!ModuleMgr.ins.isShow(10603))
         {
            ObserverMgr.ins.sendNotice("msg_new_bottom_msg",new BottomMsgVo(10,null,this.applyFriendDataArr.length));
         }
      }
      
      private function server_friendAgreeNotify(param1:PlayerApplyAgreeNotify) : void
      {
         AlertUtil.float(LocaleMgr.ins.getStr(10603007,ProtoUtils.parseParaArr([param1.content])));
         if(checkIsOnline(param1.data.offtime))
         {
            this.friendOnlineCount++;
         }
         this.addFriend(param1.data);
      }
      
      private function server_friendRefuseNotify(param1:PlayerApplyRefuseNotify) : void
      {
         AlertUtil.float(LocaleMgr.ins.getStr(10600039,ProtoUtils.parseParaArr([param1.content])));
      }
      
      private function server_friendDeleteNotify(param1:PlayerDeleteFriendNotify) : void
      {
         AlertUtil.float(LocaleMgr.ins.getStr(10600038,ProtoUtils.parseParaArr([param1.content])));
         this.friendOnlineCount--;
         this.removeFriend(param1.data.id);
         this.dispatchEvent(new MzEvent("evtRemoveFriend"));
      }
      
      private function server_friendOnlineNotify(param1:PlayerOnlineNotify) : void
      {
         var _loc3_:* = null;
         var _loc2_:GameFriendData = this.findFriend(param1.data.id);
         if(_loc2_)
         {
            ProtoUtils.copyParams(param1.data,_loc2_);
            _loc2_.offtime = 0;
            friendOnlineCount = Number(friendOnlineCount) + 1;
            ObserverMgr.ins.sendNotice("MSG_FRIEND_CHANGE_OFFTIME",_loc2_);
            this.dispatchEvent(new MzEvent("evtChangeOfftime",_loc2_));
            _loc3_ = new PublicTalkNotify();
            _loc3_.content = new TalkContent();
            _loc3_.content.isNormal = false;
            _loc3_.content.content = LocaleMgr.ins.getStr(10600034,ProtoUtils.parseParaArr([param1.content]));
            _loc3_.playerId = param1.data.id;
            _loc3_.pindao = 0;
            ChatModel.ins.server_publicTalk(_loc3_);
         }
      }
      
      private function server_friendOfflineNotify(param1:PlayerOfflineNotify) : void
      {
         var _loc3_:* = null;
         var _loc2_:GameFriendData = this.findFriend(param1.data.id);
         if(_loc2_)
         {
            _loc2_.offtime = ServerTimer.ins.second - 1;
            friendOnlineCount = Number(friendOnlineCount) - 1;
            ObserverMgr.ins.sendNotice("MSG_FRIEND_CHANGE_OFFTIME",_loc2_);
            this.dispatchEvent(new MzEvent("evtChangeOfftime",_loc2_));
            _loc3_ = new PublicTalkNotify();
            _loc3_.content = new TalkContent();
            _loc3_.content.isNormal = false;
            _loc3_.content.content = LocaleMgr.ins.getStr(10600035,ProtoUtils.parseParaArr([param1.content]));
            _loc3_.playerId = param1.data.id;
            _loc3_.pindao = 0;
            ChatModel.ins.server_publicTalk(_loc3_);
         }
      }
      
      private function server_friendSignatueNotify(param1:FriendSignatureNotify) : void
      {
         var _loc2_:GameFriendData = findFriend(param1.id);
         _loc2_.signatue = param1.signatue;
         ObserverMgr.ins.sendNotice("MSG_FRIEND_CHANGE_SIGNTUE",_loc2_);
         this.dispatchEvent(new MzEvent("evtChangeSigntue",_loc2_));
      }
      
      private function server_getGiftNotify(param1:FriendDonateStaminaNotify) : void
      {
         var _loc2_:int = Uint64Util.indexOfArray(this.canGetIds,param1.id);
         if(_loc2_ == -1)
         {
            this.canGetIds.push(param1.id);
            if(!ModuleMgr.ins.isShow(10621))
            {
               ObserverMgr.ins.sendNotice("msg_new_bottom_msg",new BottomMsgVo(11,null,this.canGetIds.length));
            }
            this.dispatchEvent(new Event("evtGetGiftChange"));
         }
      }
      
      private function server_canCongNotify(param1:FriendTrendNotify) : void
      {
         if(param1.info.congratulateable)
         {
            this.canCongIds.push(param1.info.id);
            this.dispatchEvent(new Event("evtCanCongChange"));
         }
      }
      
      private function server_beCongNotify() : void
      {
         this.beenCongCount++;
      }
      
      private function server_dailyInfoClearNotify(param1:FriendDailyInfoClearNotify) : void
      {
         this.getGiftCount = 0;
         this.hasCongCount = 0;
         this.beenCongCount = 0;
         this.giveGiftIds = [];
         this.canGetIds = [];
         this.canCongIds = [];
      }
      
      public function server_addBlock(param1:UInt64) : void
      {
         var _loc2_:PlayerAddToHeiMingDanReq = new PlayerAddToHeiMingDanReq();
         _loc2_.id = param1;
         ServerEngine.ins.send(7038,_loc2_,server_addBlockCpl);
      }
      
      private function server_addBlockCpl(param1:PlayerAddToHeiMingDanRes) : void
      {
         var _loc4_:GameFriendData = param1.data;
         var _loc3_:int = Uint64Util.indexByAttr(this.blockArr,GameFriendData.ID.name,_loc4_.id);
         if(_loc3_ > -1)
         {
            ArrayUtil.removeItemAt(this.blockArr,_loc3_);
         }
         var _loc2_:Para = new Para();
         _loc2_.player = new PlayerBaseInfo();
         _loc2_.player.name = param1.data.name;
         AlertUtil.floatBottom(LocaleMgr.ins.getStr(10600033,ProtoUtils.parseParaArr([_loc2_])));
         blockArr.push(_loc4_);
         this.dispatchEvent(new MzEvent("evtAddBlock",_loc4_));
      }
      
      public function server_removeBlock(param1:UInt64) : void
      {
         var _loc2_:PlayerRemoveHeiMingDanReq = new PlayerRemoveHeiMingDanReq();
         _loc2_.id = param1;
         ServerEngine.ins.send(7039,_loc2_,server_removeBlockCpl);
      }
      
      private function server_removeBlockCpl(param1:PlayerRemoveHeiMingDanRes) : void
      {
         var _loc2_:int = Uint64Util.indexByAttr(this.blockArr,GameFriendData.ID.name,param1.data.id);
         if(_loc2_ > -1)
         {
            ArrayUtil.removeItemAt(this.blockArr,_loc2_);
         }
         this.dispatchEvent(new MzEvent("evtRemoveBlock",param1.data.id));
      }
      
      public function addRecently(param1:PrivChatHistoryVo) : void
      {
         var _loc2_:int = Uint64Util.indexByAttr(this.recentlyArr,"playerId",param1.playerId);
         if(_loc2_ > -1)
         {
            ArrayUtil.removeItemAt(this.recentlyArr,_loc2_);
         }
         recentlyArr.unshift(param1);
         this.dispatchEvent(new MzEvent("evtAddRecently"));
      }
      
      public function removeRecently(param1:UInt64) : void
      {
         var _loc2_:int = Uint64Util.indexByAttr(this.recentlyArr,"playerId",param1);
         if(_loc2_ > -1)
         {
            ArrayUtil.removeItemAt(this.recentlyArr,_loc2_);
         }
         this.dispatchEvent(new MzEvent("evtRemoveRecently"));
      }
      
      public function removeStamina(param1:UInt64) : void
      {
         var _loc2_:int = Uint64Util.indexOfArray(this.canGetIds,param1);
         if(_loc2_ > -1)
         {
            ArrayUtil.removeItemAt(this.canGetIds,_loc2_);
            this.dispatchEvent(new Event("evtGetGiftChange"));
         }
      }
      
      public function removeStaminaAll() : void
      {
         this.dispatchEvent(new Event("evtGetGiftChange"));
      }
      
      public function addFriend(param1:GameFriendData) : void
      {
         var _loc2_:int = Uint64Util.indexByAttr(this.friendArr,GameFriendData.ID.name,param1.id);
         if(_loc2_ > -1)
         {
            ArrayUtil.removeItemAt(this.friendArr,_loc2_);
         }
         friendArr.push(param1);
         this.dispatchEvent(new MzEvent("evtAddFriend",param1));
      }
      
      public function removeFriend(param1:UInt64) : void
      {
         Uint64Util.removeItemByAttr(friendArr,GameFriendData.ID.name,param1);
         this.removeRecently(param1);
         this.removeStamina(param1);
         this.dispatchEvent(new MzEvent("evtRemoveFriend",param1));
      }
      
      public function sortFriendByFightPieceFun(param1:GameFriendData, param2:GameFriendData) : int
      {
         if(param2.level > param1.level)
         {
            return 1;
         }
         if(param2.level < param1.level)
         {
            return -1;
         }
         return Uint64Util.compareValue(param2.ability,param1.ability);
      }
      
      public function sortFriendPieceFun(param1:GameFriendData, param2:GameFriendData) : int
      {
         if(param2.offtime == param1.offtime && param2.offtime == 0 || param2.offtime != 0 && param1.offtime != 0)
         {
            if(param2.level > param1.level)
            {
               return 1;
            }
            if(param2.level < param1.level)
            {
               return -1;
            }
            return Uint64Util.compareValue(param2.ability,param1.ability);
         }
         if(param2.offtime == 0 && param1.offtime != 0)
         {
            return 1;
         }
         if(param2.offtime != 0 && param1.offtime == 0)
         {
            return -1;
         }
         return 0;
      }
      
      public function rankfriendbyofftime() : void
      {
         this.friendArr.sort(sortFriendPieceFun);
      }
      
      public function searchFriendByKey(param1:String) : Array
      {
         var _loc5_:int = 0;
         var _loc2_:* = null;
         var _loc3_:Array = [];
         var _loc4_:int = this.friendArr.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = this.friendArr[_loc5_];
            if(_loc2_.name.indexOf(param1) > -1)
            {
               _loc3_.push(_loc2_);
            }
            _loc5_++;
         }
         return _loc3_;
      }
      
      public function findFriend(param1:UInt64) : GameFriendData
      {
         return Uint64Util.findItemByAttr(this.friendArr,GameFriendData.ID.name,param1);
      }
      
      public function isFriend(param1:UInt64) : Boolean
      {
         return Uint64Util.indexByAttr(this.friendArr,GameFriendData.ID.name,param1) > -1;
      }
      
      public function isBlock(param1:UInt64) : Boolean
      {
         return Uint64Util.indexByAttr(this.blockArr,GameFriendData.ID.name,param1) > -1;
      }
      
      public function isRecently(param1:UInt64) : Boolean
      {
         return Uint64Util.indexByAttr(this.recentlyArr,"playerId",param1) > -1;
      }
      
      public function setHadGiveGift(param1:UInt64) : void
      {
         var _loc2_:int = Uint64Util.indexOfArray(this.giveGiftIds,param1);
         if(_loc2_ == -1)
         {
            this.giveGiftIds.push(param1);
         }
      }
      
      public function setHadGetGift(param1:UInt64, param2:Boolean) : void
      {
         var _loc3_:int = Uint64Util.indexOfArray(this.canGetIds,param1);
         if(_loc3_ > -1)
         {
            getGiftCount = Number(getGiftCount) + 1;
            Uint64Util.removeItemFromArray(this.canGetIds,param1);
         }
         if(param2)
         {
            this.dispatchEvent(new Event("evtGetGiftChange"));
         }
      }
      
      public function hadDonate(param1:UInt64) : Boolean
      {
         return Uint64Util.indexOfArray(this.giveGiftIds,param1) > -1;
      }
      
      public function hadGotStamina(param1:UInt64) : Boolean
      {
         return Uint64Util.indexOfArray(this.canGetIds,param1) == -1;
      }
      
      public function setHadCong(param1:UInt64, param2:Boolean = false) : void
      {
         var _loc6_:int = 0;
         var _loc4_:* = null;
         var _loc3_:int = Uint64Util.indexOfArray(this.canCongIds,param1);
         if(_loc3_ > -1)
         {
            hasCongCount = Number(hasCongCount) + 1;
            Uint64Util.removeItemFromArray(this.canCongIds,param1);
         }
         var _loc5_:int = this.logArr.length;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc4_ = this.logArr[_loc6_];
            if(Uint64Util.equal(_loc4_.id,param1))
            {
               _loc4_.iscongratulate = true;
               break;
            }
            _loc6_++;
         }
         if(param2)
         {
            this.dispatchEvent(new Event("evtCanCongChange"));
         }
      }
      
      public function get gettingGiftDataArr() : Array
      {
         var _loc4_:int = 0;
         var _loc1_:* = null;
         var _loc2_:Array = [];
         var _loc3_:int = this.friendArr.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc1_ = this.friendArr[_loc4_];
            if(Uint64Util.indexOfArray(canGetIds,_loc1_.id) > -1)
            {
               _loc2_.push(_loc1_);
            }
            _loc4_++;
         }
         return _loc2_;
      }
      
      public function recentlyContactFriends(param1:int) : Array
      {
         var _loc6_:int = 0;
         var _loc4_:* = null;
         var _loc2_:* = null;
         var _loc3_:Array = [];
         var _loc5_:int = Math.min(param1,this.recentlyArr.length);
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc4_ = this.recentlyArr[_loc6_];
            if(!this.isBlock(_loc4_.friendData.id))
            {
               _loc3_.push(_loc4_.friendData);
            }
            _loc6_++;
         }
         param1 = param1 - _loc5_;
         _loc5_ = Math.min(param1,this.friendArr.length);
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc2_ = this.friendArr[_loc6_];
            if(!this.isRecently(_loc2_.id))
            {
               _loc3_.push(_loc2_);
            }
            _loc6_++;
         }
         return _loc3_;
      }
   }
}
