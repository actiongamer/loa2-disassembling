package nslm2.modules.foundations.chatModules
{
   import flash.events.EventDispatcher;
   import flash.events.Event;
   import flash.utils.Timer;
   import nslm2.nets.imsdk.ChannelInfo;
   import flash.events.TimerEvent;
   import nslm2.nets.imsdk.IMEvent;
   import nslm2.nets.imsdk.ChatMessage;
   import proto.PublicTalkNotify;
   import proto.TalkContent;
   import nslm2.utils.ServerTimer;
   import nslm2.utils.Uint64Util;
   import nslm2.nets.imsdk.Base64;
   import flash.utils.ByteArray;
   import proto.PlayerBaseInfo;
   import morn.core.utils.BaUtil;
   import com.mz.core.configs.EnvConfig;
   import nslm2.modules.otherPt.duowans.DuoWanGameMsgCollector;
   import nslm2.common.model.PlayerModel;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.foundations.friendModules.FriendService;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.modules.foundations.chatModules.privChats.PrivChatHistoryVo;
   import nslm2.modules.foundations.friendModules.FriendUtils;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.notices.BottomMsgVo;
   import proto.PTChatPlayerInfoRes;
   import com.mz.core.configs.ClientConfig;
   import com.mz.core.logging.Log;
   import proto.PublicTalkMultiNotify;
   import org.specter3d.utils.StringUtil;
   import proto.PrivateTalkNotify;
   import morn.core.managers.timerMgrs.TimerManager;
   import flash.utils.getTimer;
   import com.mz.core.utils.LocalData;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.nets.sockets.ServerEngine;
   
   public class ChatModel extends EventDispatcher
   {
      
      public static const EVT_ADD_CHAT:String = "evtAddChat";
      
      public static const EVT_ADD_PRIVATE_CHAT:String = "evtAddPrivateChat";
      
      public static const GRAY_CHAT_MODULE:String = "grayChatModule";
      
      public static var heartbeatcount:int = 0;
      
      public static var isPeakSportsBool:Boolean;
      
      private static var _ins:nslm2.modules.foundations.chatModules.ChatModel;
       
      
      private var _imclient:nslm2.modules.foundations.chatModules.IMClient2;
      
      public var secondTimer:Timer;
      
      private var cacheBeforeStart:Vector.<PublicTalkNotify>;
      
      private var localBeforeStart:Vector.<PublicTalkNotify>;
      
      public var isStart:Boolean = false;
      
      private var isInInitLocalTalkData:Boolean = false;
      
      private var isBeforeStartLock:Boolean = false;
      
      private var unsaveNotify:Array;
      
      private var _appTime:Object;
      
      public var historyLib:Vector.<PublicTalkNotify>;
      
      public var systemHistoryLib:Vector.<PublicTalkNotify>;
      
      private var lastSendTimeDict:Object;
      
      private var _localTalkDataList:Array;
      
      private var _saveCountDown:int = 0;
      
      private var _lastSaveTime:int = 0;
      
      public var chat_inputCharMax:int;
      
      public var chat_inputTimerLimite:int;
      
      public var chat_GMLimite:int;
      
      public var chat_HistoryChatMax:int;
      
      public var chat_HistorySystemMax:int;
      
      public var privChat_inputCharMax:int = 100;
      
      public var chat_lv_limit:int;
      
      public function ChatModel()
      {
         secondTimer = new Timer(60000,0);
         cacheBeforeStart = new Vector.<PublicTalkNotify>();
         localBeforeStart = new Vector.<PublicTalkNotify>();
         unsaveNotify = [];
         historyLib = new Vector.<PublicTalkNotify>();
         systemHistoryLib = new Vector.<PublicTalkNotify>();
         lastSendTimeDict = {};
         _localTalkDataList = [];
         super();
         var _loc1_:Array = DefindConsts.chat_input.split("|");
         chat_inputCharMax = _loc1_[0];
         if(ClientConfig.isChineseLang() == false)
         {
            chat_inputCharMax = 90;
         }
         chat_inputTimerLimite = _loc1_[1] * 1000;
         chat_GMLimite = _loc1_[2];
         chat_lv_limit = int(DefindConsts.chat_lv_limit);
         var _loc2_:Array = DefindConsts.chat_message.split("|");
         this.chat_HistoryChatMax = 30;
         this.chat_HistorySystemMax = _loc2_[1];
         ServerEngine.ins.addAlwayHandler(6001,server_publicTalk);
         ServerEngine.ins.addAlwayHandler(6002,server_privateTalk);
         ServerEngine.ins.addAlwayHandler(6004,server_publicTalkMulti);
         ServerEngine.ins.addAlwayHandler(2014,imclient_syn_data);
      }
      
      public static function get ins() : nslm2.modules.foundations.chatModules.ChatModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.foundations.chatModules.ChatModel();
         }
         return _ins;
      }
      
      public function onPlayerLevelChange() : void
      {
         if(imclient)
         {
            this.imclient.requestLoginWhenLvChange();
         }
      }
      
      public function initIMClient() : void
      {
         _imclient = new nslm2.modules.foundations.chatModules.IMClient2();
         _imclient.addEventListener("onChatMessage",onChatMessage);
         _imclient.addEventListener("onChatErr",onChatErr);
         _imclient.addEventListener("onLoginSuccess",onChatLogin);
         _imclient.addEventListener("onDisconnect",onChatClose);
      }
      
      protected function onChatClose(param1:Event) : void
      {
         if(secondTimer)
         {
            secondTimer.stop();
            heartbeatcount = 0;
         }
      }
      
      public function CloseConnect() : void
      {
         if(_imclient)
         {
            _imclient.CloseConnect();
         }
         if(secondTimer)
         {
            secondTimer.stop();
         }
      }
      
      public function synChannels() : void
      {
      }
      
      protected function onChatLogin(param1:Event) : void
      {
         var _loc2_:ChannelInfo = _imclient.findChannel(_imclient.myuserinfo.sid,ChatConsts.channelIdTogpID(0));
         secondTimer.addEventListener("timer",onTimerComplete);
         secondTimer.start();
      }
      
      protected function onTimerComplete(param1:TimerEvent) : void
      {
         if(heartbeatcount >= 2)
         {
            if(_imclient)
            {
               _imclient.retryConnect();
               secondTimer.stop();
               heartbeatcount = 0;
            }
            return;
         }
         _imclient.requestHeartbeat();
         heartbeatcount = Number(heartbeatcount) + 1;
      }
      
      protected function onChatErr(param1:IMEvent) : void
      {
         var _loc3_:ChatMessage = param1.chat;
         var _loc2_:PublicTalkNotify = new PublicTalkNotify();
         _loc2_.content = new TalkContent();
         _loc2_.content.isNormal = false;
         _loc2_.content.content = _loc3_.content;
         _loc2_.pindao = 44;
         server_publicTalk(_loc2_);
      }
      
      protected function onChatMessage(param1:IMEvent) : void
      {
         var _loc8_:* = null;
         var _loc11_:* = null;
         var _loc10_:* = null;
         var _loc5_:* = null;
         var _loc9_:* = null;
         var _loc2_:int = 0;
         var _loc4_:* = null;
         var _loc12_:ChatMessage = param1.chat;
         var _loc7_:PublicTalkNotify = new PublicTalkNotify();
         _loc7_.content = new TalkContent();
         _loc7_.content.sendTimerSecond = ServerTimer.ins.second;
         var _loc3_:String = _loc12_.content;
         var _loc6_:Array = _loc3_.split("$^@");
         _loc7_.content.content = _loc6_[_loc6_.length - 1];
         _loc7_.playerId = Uint64Util.fromString(_loc12_.rid);
         if(_loc12_.ext)
         {
            if(Object(_loc12_.ext).hasOwnProperty("player"))
            {
               _loc8_ = Object(_loc12_.ext)["player"];
               _loc11_ = Base64.decodeToByteArray(_loc8_);
               _loc10_ = new PlayerBaseInfo();
               BaUtil.uncompress(_loc11_);
               _loc10_.readFromSlice(_loc11_,0);
               _loc7_.content.sendPlayer = _loc10_;
               _loc7_.name = _loc10_.name;
               _loc7_.content.sendPlayer.playId = Object(_loc12_.ext)["playId"];
               _loc7_.content.sendPlayer.playerIP = Object(_loc12_.ext)["playerIP"];
            }
            if(!_loc7_.name)
            {
               _loc7_.name = _loc12_.ext["playerName"];
            }
            if(Object(_loc12_.ext).hasOwnProperty("extraKey"))
            {
               _loc5_ = _loc12_.ext["extraKey"];
               _loc9_ = Base64.decodeToByteArray(_loc5_);
               _loc7_.content.extraContent = _loc9_;
            }
         }
         if(_loc12_.chatType == "TP" || _loc12_.chatType == "SP" || _loc12_.chatType == "FP")
         {
            _loc7_.pindao = 6;
            if(_loc7_.content)
            {
               if(EnvConfig.ins.ptId == 33)
               {
                  DuoWanGameMsgCollector.ins.collectMessage(_loc7_.content.content,_loc7_.name,false);
               }
               else if(EnvConfig.ins.ptId == 15)
               {
               }
            }
            if(Uint64Util.equal(PlayerModel.ins.playerInfo.id,_loc7_.playerId))
            {
            }
            if(Uint64Util.equal(PlayerModel.ins.playerInfo.id,_loc7_.playerId))
            {
               this.dispatchEvent(new MzEvent("evtAddPrivateChat",_loc7_));
            }
            else
            {
               _loc2_ = Uint64Util.indexByAttr(FriendService.ins.recentlyArr,"playerId",_loc7_.playerId);
               if(_loc2_ > -1)
               {
                  ArrayUtil.append((FriendService.ins.recentlyArr[_loc2_] as PrivChatHistoryVo).historyArr,[_loc7_]);
               }
               else
               {
                  _loc4_ = new PrivChatHistoryVo();
                  _loc4_.friendData = FriendService.ins.findFriend(_loc7_.playerId);
                  if(_loc4_.friendData == null)
                  {
                     if(_loc7_.content && _loc7_.content.sendPlayer)
                     {
                        if(ChatUtils.isGMTypeCanPriChat(_loc7_.content.sendPlayer.gmType))
                        {
                           _loc4_.friendData = FriendUtils.createTempFriendData(_loc7_.playerId,_loc7_.name,_loc7_.content.sendPlayer.gmType,_loc7_.content.sendPlayer.npcId,_loc7_.content.sendPlayer.ability,_loc7_.content.sendPlayer.lv);
                        }
                        else
                        {
                           return;
                        }
                     }
                     else
                     {
                        return;
                     }
                  }
                  _loc4_.historyArr = [_loc7_];
                  FriendService.ins.addRecently(_loc4_);
               }
               if(ModuleMgr.ins.isShow(10540))
               {
                  this.dispatchEvent(new MzEvent("evtAddPrivateChat",_loc7_));
               }
               else
               {
                  ObserverMgr.ins.sendNotice("msg_new_bottom_msg",new BottomMsgVo(5,_loc7_.playerId));
               }
            }
         }
         else if(_loc12_.chatType == "FG")
         {
            _loc7_.pindao = ChatConsts.gpIdtoChannelId(_loc12_.gpid);
            server_publicTalk(_loc7_);
         }
         else
         {
            if(FriendService.ins.isBlock(_loc7_.playerId))
            {
               return;
            }
            if(_loc7_.content)
            {
               if(EnvConfig.ins.ptId == 33)
               {
                  DuoWanGameMsgCollector.ins.collectMessage(_loc7_.content.content,_loc7_.name,true);
               }
               else if(EnvConfig.ins.ptId == 15)
               {
               }
            }
            _loc7_.pindao = ChatConsts.gpIdtoChannelId(_loc12_.gpid);
            server_publicTalk(_loc7_);
         }
      }
      
      public function imclient_login_data(param1:PTChatPlayerInfoRes) : void
      {
         _imclient.setLoginData(param1.content);
         _imclient.init(ClientConfig.chatIP,ClientConfig.chatPorts);
         Log.debug("聊天服务器地址：",ClientConfig.chatIP,":",ClientConfig.chatPorts);
      }
      
      private function imclient_syn_data(param1:PTChatPlayerInfoRes) : void
      {
         _imclient.setLoginData(param1.content,false);
      }
      
      public function get imclient() : nslm2.modules.foundations.chatModules.IMClient2
      {
         return _imclient;
      }
      
      public function addNotifyBeforeStart(param1:PublicTalkNotify) : void
      {
         cacheBeforeStart.push(param1);
         unsaveNotify.push(param1);
      }
      
      public function start() : void
      {
         var _loc5_:* = 0;
         isStart = false;
         initLocalTalkData();
         var _loc4_:Vector.<PublicTalkNotify> = new Vector.<PublicTalkNotify>();
         _loc5_ = 0;
         while(_loc5_ < _localTalkDataList.length)
         {
            _loc4_.push((_localTalkDataList[_loc5_] as LocalTalkDataVo).notify);
            _loc5_++;
         }
         var _loc1_:int = Math.max(0,10);
         _loc5_ = _loc1_;
         while(_loc5_ < _loc4_.length)
         {
            localBeforeStart.push(_loc4_[_loc5_]);
            _loc5_++;
         }
         var _loc2_:Vector.<PublicTalkNotify> = new Vector.<PublicTalkNotify>();
         var _loc3_:Vector.<PublicTalkNotify> = new Vector.<PublicTalkNotify>();
         _loc5_ = 0;
         while(_loc5_ < cacheBeforeStart.length)
         {
            if(isTalkNotifyInList(cacheBeforeStart[_loc5_],_loc4_) == false)
            {
               _loc3_.push(cacheBeforeStart[_loc5_]);
            }
            else
            {
               _loc2_.push(cacheBeforeStart[_loc5_]);
            }
            _loc5_++;
         }
         cacheBeforeStart = _loc3_;
         localBeforeStart = _loc2_;
         isInInitLocalTalkData = true;
         isBeforeStartLock = true;
         initChatBeforeStart(0);
      }
      
      private function initChatBeforeStart(param1:int) : void
      {
         if(param1 < localBeforeStart.length)
         {
            isBeforeStartLock = false;
            server_publicTalk(localBeforeStart[param1]);
            isBeforeStartLock = true;
         }
         else if(param1 < localBeforeStart.length + cacheBeforeStart.length)
         {
            isInInitLocalTalkData = false;
            isBeforeStartLock = false;
            server_publicTalk(cacheBeforeStart[param1 - localBeforeStart.length]);
            isBeforeStartLock = true;
         }
         else
         {
            isStart = true;
            isInInitLocalTalkData = false;
            this.cacheBeforeStart.length = 0;
            this.localBeforeStart.length = 0;
            return;
         }
         initChatBeforeStart(param1 + 1);
      }
      
      private function isTalkNotifyInList(param1:PublicTalkNotify, param2:Vector.<PublicTalkNotify>) : Boolean
      {
         var _loc3_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < param2.length)
         {
            if(Uint64Util.equal(param1.playerId,param2[_loc3_].playerId) && param1.content.content == param2[_loc3_].content.content)
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      private function server_publicTalkMulti(param1:PublicTalkMultiNotify) : void
      {
         var _loc2_:* = null;
         if(isStart)
         {
            var _loc4_:int = 0;
            var _loc3_:* = param1.talk;
            for each(_loc2_ in param1.talk)
            {
               this.addHistory(_loc2_);
               this.dispatchEvent(new MzEvent("evtAddChat",_loc2_));
            }
         }
         else
         {
            var _loc6_:int = 0;
            var _loc5_:* = param1.talk;
            for each(_loc2_ in param1.talk)
            {
               cacheBeforeStart.push(_loc2_);
            }
         }
      }
      
      public function server_publicTalk(param1:PublicTalkNotify) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc8_:* = null;
         var _loc5_:* = null;
         var _loc7_:int = 0;
         var _loc4_:* = null;
         var _loc9_:int = 0;
         var _loc6_:int = 0;
         if(param1 && param1.content)
         {
            if(isStart == false && isBeforeStartLock)
            {
               localBeforeStart.push(param1);
               return;
            }
            if(isInInitLocalTalkData == false)
            {
               addLocalTalkData(param1);
            }
            _loc2_ = param1.content.content;
            if(_loc2_.indexOf("^#@^#@") != -1)
            {
               _loc2_ = StringUtil.replaceAll1(_loc2_,"<","*");
               param1.content.content = _loc2_;
            }
            if(_loc2_.indexOf("#RIP#") != -1 || _loc2_.indexOf("#rip#") != -1 || _loc2_.indexOf("#愛的真諦#") != -1)
            {
               _loc2_ = StringUtil.replaceAll1(_loc2_,"^#@","");
               _loc3_ = "";
               _loc8_ = [];
               _loc5_ = [];
               _loc7_ = 0;
               _loc2_ = StringUtil.replaceAll1(_loc2_,"#rip#","#RIP#");
               _loc2_ = StringUtil.replaceAll1(_loc2_,"#愛的真諦#","#RIP#");
               _loc4_ = _loc2_.split("#RIP#");
               _loc9_ = 0;
               while(_loc9_ < _loc4_.length)
               {
                  if(_loc4_[_loc9_] != null)
                  {
                     _loc3_ = _loc3_ + _loc4_[_loc9_];
                     if(_loc9_ < _loc4_.length - 1)
                     {
                        _loc8_.push("png::ui_ChannelChat_Face54");
                        _loc7_ = _loc7_ + String(_loc4_[_loc9_]).length;
                        _loc5_.push(_loc7_);
                     }
                  }
                  _loc9_++;
               }
               _loc2_ = _loc3_ + "^#@" + _loc8_.join(",") + "^#@" + _loc5_.join(",");
               param1.content.content = _loc2_;
            }
         }
         if(FriendService.ins.isBlock(param1.playerId))
         {
            return;
         }
         if(isStart || isBeforeStartLock == false)
         {
            _loc6_ = 1;
            while(true)
            {
               _loc6_--;
               if(!_loc6_)
               {
                  break;
               }
               this.addHistory(param1);
               this.dispatchEvent(new MzEvent("evtAddChat",param1));
            }
         }
         else
         {
            cacheBeforeStart.push(param1);
         }
      }
      
      private function doFrameOnce() : void
      {
         _appTime && App.timer.clearTimer(_appTime);
         this.dispatchEvent(new MzEvent("grayChatModule",true));
      }
      
      public function server_privateTalk(param1:PrivateTalkNotify) : void
      {
         var _loc3_:PrivChatHistoryVo = new PrivChatHistoryVo();
         _loc3_.friendData = FriendService.ins.findFriend(param1.playerId);
         var _loc2_:int = Uint64Util.indexByAttr(FriendService.ins.recentlyArr,"playerId",param1.playerId);
         if(_loc2_ > -1)
         {
            ArrayUtil.append((FriendService.ins.recentlyArr[_loc2_] as PrivChatHistoryVo).historyArr,[param1]);
         }
         else
         {
            _loc3_ = new PrivChatHistoryVo();
            _loc3_.friendData = FriendService.ins.findFriend(param1.playerId);
            if(_loc3_.friendData == null)
            {
               if(param1.content && param1.content.sendPlayer)
               {
                  if(ChatUtils.isGMTypeCanPriChat(param1.content.sendPlayer.gmType))
                  {
                     _loc3_.friendData = FriendUtils.createTempFriendData(param1.playerId,param1.name,param1.content.sendPlayer.gmType,param1.content.sendPlayer.npcId,param1.content.sendPlayer.ability,param1.content.sendPlayer.lv);
                  }
                  else
                  {
                     return;
                  }
               }
               else
               {
                  return;
               }
            }
            _loc3_.historyArr = [param1];
            FriendService.ins.addRecently(_loc3_);
         }
         if(ModuleMgr.ins.isShow(10540))
         {
            this.dispatchEvent(new MzEvent("evtAddPrivateChat",param1));
         }
         else
         {
            ObserverMgr.ins.sendNotice("msg_new_bottom_msg",new BottomMsgVo(5,param1.playerId));
         }
      }
      
      public function getHistory(param1:int) : Array
      {
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc2_:Array = [];
         var _loc4_:int = historyLib.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = historyLib[_loc5_];
            if(_loc3_.pindao == param1)
            {
               _loc2_.push(_loc3_);
            }
            _loc5_++;
         }
         return _loc2_;
      }
      
      public function getGroupHistory(param1:int) : Array
      {
         var _loc6_:int = 0;
         var _loc4_:* = null;
         var _loc3_:ChannelGroupVo = ChatConsts.ins.getChannelGroupVo(param1);
         var _loc2_:Array = [];
         var _loc5_:int = historyLib.length;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc4_ = historyLib[_loc6_];
            if(_loc3_.channelArr.indexOf(_loc4_.pindao) > -1)
            {
               _loc2_.push(_loc4_);
            }
            _loc6_++;
         }
         return _loc2_;
      }
      
      public function addHistory(param1:PublicTalkNotify, param2:Boolean = false) : void
      {
         if(param2 == false)
         {
            if(historyLib.length >= chat_HistoryChatMax + 10)
            {
               historyLib.splice(0,10);
               ObserverMgr.ins.sendNotice("CHAT_REMOVE_OLD");
            }
            historyLib.push(param1);
         }
         else
         {
            if(systemHistoryLib.length >= chat_HistoryChatMax + 10)
            {
               systemHistoryLib.splice(0,10);
               ObserverMgr.ins.sendNotice("CHAT_REMOVE_OLD_SYSTEM");
            }
            systemHistoryLib.push(param1);
         }
      }
      
      public function clearHistoryAll() : void
      {
         historyLib.length = 0;
      }
      
      public function getLastSendTime(param1:int) : int
      {
         return int(lastSendTimeDict[param1]);
      }
      
      public function saveLastSendTime(param1:int) : void
      {
         lastSendTimeDict[param1] = TimerManager.ins.currTimer;
      }
      
      public function checkSendTimer(param1:int) : Boolean
      {
         var _loc2_:int = this.chat_inputTimerLimite;
         if(EnvConfig.ins.ptId == 33 && param1 == 0)
         {
            _loc2_ = 8000;
         }
         if(TimerManager.ins.currTimer - nslm2.modules.foundations.chatModules.ChatModel.ins.getLastSendTime(param1) > _loc2_)
         {
            return true;
         }
         return false;
      }
      
      public function getLocalTalkDataList() : Array
      {
         return _localTalkDataList;
      }
      
      private function addLocalTalkData(param1:PublicTalkNotify) : void
      {
         if(isStart == false && unsaveNotify.indexOf(param1) >= 0)
         {
            return;
         }
         var _loc2_:LocalTalkDataVo = new LocalTalkDataVo();
         _loc2_.initByNotify(param1);
         _localTalkDataList.push(_loc2_);
         while(_localTalkDataList.length > 1000)
         {
            _localTalkDataList.shift();
         }
         _saveCountDown = Number(_saveCountDown) + 1;
         if(_saveCountDown >= 20)
         {
            saveLocalTalkData();
         }
         else if(_lastSaveTime < ServerTimer.ins.second - 120)
         {
            if(_saveCountDown > 0)
            {
               saveLocalTalkData();
            }
         }
      }
      
      private function saveLocalTalkData() : void
      {
         var _loc4_:int = 0;
         _saveCountDown = 0;
         _lastSaveTime = ServerTimer.ins.second;
         var _loc1_:int = getTimer();
         var _loc3_:ByteArray = new ByteArray();
         var _loc2_:Array = [];
         _loc4_ = 0;
         while(_loc4_ < _localTalkDataList.length)
         {
            _loc2_.push((_localTalkDataList[_loc4_] as LocalTalkDataVo).saveObj);
            _loc4_++;
         }
         _loc3_.writeObject(_loc2_);
         _loc3_.compress();
         _loc1_ = getTimer();
         LocalData.insCurPlayer.save("localTalk",_loc3_,false);
      }
      
      private function initLocalTalkData() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc5_:int = 0;
         var _loc4_:* = null;
         var _loc1_:int = getTimer();
         var _loc6_:ByteArray = LocalData.insCurPlayer.load("localTalk",null);
         try
         {
            if(_loc6_ != null)
            {
               _loc2_ = new ByteArray();
               _loc2_.writeBytes(_loc6_,0,_loc6_.bytesAvailable);
               _loc1_ = getTimer();
               _loc2_.position = 0;
               _loc2_.uncompress();
               _loc3_ = _loc2_.readObject() as Array;
               _localTalkDataList = [];
               _loc5_ = _loc3_.length - 1;
               while(_loc5_ >= 0)
               {
                  _loc4_ = new LocalTalkDataVo();
                  _loc4_.initByLocalObj(_loc3_[_loc5_]);
                  if(!_loc4_.isOutTime)
                  {
                     _localTalkDataList.unshift(_loc4_);
                     _loc5_--;
                     continue;
                  }
                  break;
               }
            }
            return;
         }
         catch(e:Error)
         {
            trace("解析本地数据错误");
            return;
         }
      }
   }
}
