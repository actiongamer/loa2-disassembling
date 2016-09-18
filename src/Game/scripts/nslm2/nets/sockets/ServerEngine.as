package nslm2.nets.sockets
{
   import nslm2.nets.sockets.ServerSocket;
   import com.mz.core.logging.Log;
   import nslm2.modules.foundations.chatModules.ChatModel;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.alerts.AlertMsgVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.managers.timerMgrs.TimerManager;
   import com.greensock.TweenLite;
   import proto.HeartBeat;
   import com.mz.core.configs.EnvConfig;
   import proto.ProtocolStatusRes;
   import morn.core.handlers.Handler;
   import morn.core.handlers.HandlerBatch;
   import com.mz.core.configs.ClientConfig;
   import morn.core.utils.URLUtils;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import com.netease.protobuf.Message;
   import proto.CMD;
   import com.mz.core.utils2.reflects.ReflectUtil;
   import proto.PlayerDataNotify;
   import proto.HeroInfoNotify;
   import com.mz.core.utils.ArrayUtil;
   import flash.utils.ByteArray;
   
   public class ServerEngine
   {
      
      private static var _ins:nslm2.nets.sockets.ServerEngine;
       
      
      private var blockLogCMDArr:Vector.<int>;
      
      public var disConn:Boolean;
      
      private var resHash:nslm2.nets.sockets.CmdResHash;
      
      public var ecHash:nslm2.nets.sockets.ECHash;
      
      private var cmdHash:nslm2.nets.sockets.CMDHash;
      
      private var socket:ServerSocket;
      
      private var _hasInited:Boolean;
      
      public var cplHandlerBatch:HandlerBatch;
      
      private var errHandlerBatch:HandlerBatch;
      
      public var onceHandlerDict:Object;
      
      private var dataNotifyCache:Vector.<nslm2.nets.sockets.DataNotifyCacheVo>;
      
      private var heroNotifyCache:Vector.<nslm2.nets.sockets.HeroNotifyCacheVo>;
      
      public function ServerEngine()
      {
         blockLogCMDArr = new Vector.<int>();
         cplHandlerBatch = new HandlerBatch();
         errHandlerBatch = new HandlerBatch();
         onceHandlerDict = {};
         dataNotifyCache = new Vector.<nslm2.nets.sockets.DataNotifyCacheVo>();
         heroNotifyCache = new Vector.<nslm2.nets.sockets.HeroNotifyCacheVo>();
         super();
      }
      
      public static function get ins() : nslm2.nets.sockets.ServerEngine
      {
         if(_ins == null)
         {
            _ins = new nslm2.nets.sockets.ServerEngine();
         }
         return _ins;
      }
      
      public function doDisConnect() : void
      {
         Log.info(this,"disConnect");
         if(this.disConn == false)
         {
            this.disConn = true;
            socket.removeEventListener("onDisconnect",onDisConn);
            socket.removeEventListener("onPack",onPack);
            this.socket.close();
            ChatModel.ins.CloseConnect();
            ObserverMgr.ins.sendNotice("alertTop",new AlertMsgVo(LocaleMgr.ins.getStr(999000528),netDisconnHander).setCloseFlg(false));
         }
      }
      
      public function init() : void
      {
         if(_hasInited == false)
         {
            blockLogCMDArr.push(7000);
            blockLogCMDArr.push(7001);
            blockLogCMDArr.push(8001);
            blockLogCMDArr.push(8002);
            blockLogCMDArr.push(8003);
            resHash = new nslm2.nets.sockets.CmdResHash();
            ecHash = new nslm2.nets.sockets.ECHash();
            cmdHash = new nslm2.nets.sockets.CMDHash();
            socket = ServerSocket.ins;
            socket.eventClass = ServerEvent;
            socket.addEventListener("onDisconnect",onDisConn);
            socket.addEventListener("onPack",onPack);
            this.addAlwayHandler(1,onHeartBeat);
            this.addAlwayHandler(2,onProtocolStatus);
            TimerManager.ins.doLoop(3000,checkTimeout);
            TweenLite.delayedCall(60,loop);
            _hasInited = true;
         }
      }
      
      private function loop() : void
      {
         var _loc1_:HeartBeat = new HeartBeat();
         _loc1_.v = new Date().time / 1000;
         this.send(1,_loc1_);
         TweenLite.delayedCall(60,loop);
      }
      
      private function checkTimeout() : void
      {
         var _loc1_:* = null;
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(this.disConn == false)
         {
            var _loc7_:int = 0;
            var _loc6_:* = this.onceHandlerDict;
            for(var _loc5_ in this.onceHandlerDict)
            {
               _loc1_ = onceHandlerDict[_loc5_];
               _loc4_ = TimerManager.ins.currTimer;
               if(_loc4_ - _loc1_.sendTimer > 9000)
               {
                  removeOnceHandler(_loc5_);
                  if(EnvConfig.ins.showDevModule)
                  {
                     ObserverMgr.ins.sendNotice("alertTop",new AlertMsgVo(LocaleMgr.ins.getStr(999000529) + _loc5_));
                     Log.fatal(this,LocaleMgr.ins.getStr(999000530),_loc5_);
                  }
                  ObserverMgr.ins.sendNotice("SERVICE_NET_TIME_OUT");
                  if(_loc1_.errHandler != null)
                  {
                     _loc2_ = new ServerEvent("onPack");
                     _loc2_.cmd = _loc1_.cmd;
                     _loc3_ = new ProtocolStatusRes();
                     _loc3_.cmd = _loc1_.cmd;
                     _loc3_.errCode = 1;
                     _loc2_.message = _loc3_;
                     Handler.execute(_loc1_.errHandler,[_loc2_.message,_loc2_]);
                  }
               }
            }
         }
      }
      
      public function addAlwayHandler(param1:int, param2:* = null, param3:* = null) : void
      {
         if(param2 && cplHandlerBatch.hasFunc(param1,param2) == false)
         {
            cplHandlerBatch.addHandler(param1,param2);
         }
         if(param3 && errHandlerBatch.hasFunc(param1,param3) == false)
         {
            errHandlerBatch.addHandler(param1,param3);
         }
      }
      
      public function removeAlwayHandler(param1:int, param2:* = null, param3:* = null) : void
      {
         if(param2)
         {
            cplHandlerBatch.removeHandler(param1,param2);
         }
         if(param3)
         {
            errHandlerBatch.removeHandler(param1,param3);
         }
      }
      
      private function onDisConn(param1:ServerEvent) : void
      {
         if(this.disConn == false)
         {
            this.disConn = true;
            ChatModel.ins.CloseConnect();
            ObserverMgr.ins.sendNotice("alertTop",new AlertMsgVo(LocaleMgr.ins.getStr(999000531),netDisconnHander).setCloseFlg(false));
         }
      }
      
      private function netDisconnHanderReLogin() : void
      {
         if(ClientConfig.reStartCallBack)
         {
            URLUtils.refreshCurPage();
         }
         else
         {
            URLUtils.refreshCurPage();
         }
      }
      
      private function netDisconnHander() : void
      {
         netDisconnHanderReLogin();
      }
      
      private function onPack(param1:ServerEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(param1.cmd == 2)
         {
            _loc2_ = new ProtocolStatusRes();
            _loc2_.readFromSlice(param1.body,0);
            _loc3_ = new ServerEvent("onPack");
            _loc3_.cmd = _loc2_.cmd;
            _loc3_.message = _loc2_;
            onPackErr(_loc3_);
         }
         else
         {
            packSuccess(param1);
         }
      }
      
      private function onPackErr(param1:ServerEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:ProtocolStatusRes = param1.message as ProtocolStatusRes;
         if(_loc3_.errCode == 300000000)
         {
            if(this.disConn == false)
            {
               this.disConn = true;
               ChatModel.ins.CloseConnect();
               ObserverMgr.ins.sendNotice("alertTop",new AlertMsgVo(LocaleMgr.ins.getStr(999000532),netDisconnHander).setCloseFlg(false));
            }
         }
         else if(_loc3_.errCode == 300000002)
         {
            if(this.disConn == false)
            {
               this.disConn = true;
               ChatModel.ins.CloseConnect();
               ObserverMgr.ins.sendNotice("alertTop",new AlertMsgVo(LocaleMgr.ins.getStr(999000533),netDisconnHander).setCloseFlg(false));
            }
         }
         else if(_loc3_.errCode == 300000001)
         {
            if(this.disConn == false)
            {
               this.disConn = true;
               ChatModel.ins.CloseConnect();
               ObserverMgr.ins.sendNotice("alertTop",new AlertMsgVo(LocaleMgr.ins.getStr(999000534),netDisconnHanderReLogin).setCloseFlg(false));
            }
         }
         else if(_loc3_.errCode == 300000005)
         {
            if(this.disConn == false)
            {
               this.disConn = true;
               ChatModel.ins.CloseConnect();
               ObserverMgr.ins.sendNotice("alertTop",new AlertMsgVo(LocaleMgr.ins.getStr(999000535),netDisconnHanderReLogin).setCloseFlg(false));
            }
         }
         else if(_loc3_.errCode == 0)
         {
            param1.body = null;
            param1.message = null;
            this.packSuccess(param1);
         }
         else
         {
            if(ClientConfig.showLog)
            {
               Log.warn(this,"Pack<<","CMD:" + cmdHash.getName(param1.cmd) + "(" + param1.cmd + ")","EC:",_loc3_.errCode,"(" + ecHash.getName(_loc3_.errCode) + ")",_loc3_);
            }
            if(hasOnceHandlerErr(param1.cmd) || errHandlerBatch.hasType(param1.cmd))
            {
               errHandlerBatch.execute(param1.cmd,[param1.message,param1],false);
               execOnceHandler(param1.cmd,param1,false);
            }
            else
            {
               _loc2_ = onceHandlerDict[param1.cmd];
               if(_loc2_)
               {
                  removeOnceHandler(param1.cmd);
               }
               doDefaultErr(_loc3_);
            }
         }
      }
      
      public function doDefaultErr(param1:ProtocolStatusRes) : void
      {
         if(param1.res && param1.res.kind)
         {
            if(param1.res.kind == 3 || param1.res.kind == 4)
            {
               AlertUtil.showRechargeAlert();
               return;
            }
            ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByWealth(param1.res.kind,param1.res.modelId),ModuleMgr.ins.popLayer.curModuleId);
         }
         else if(param1.errCode == 350000005 || param1.errCode == 300007202)
         {
            ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByLessId(int(DefindConsts.HERO_FULL_ID)),ModuleMgr.ins.popLayer.curModuleId);
         }
         else
         {
            AlertUtil.floatErr(LocaleMgr.ins.getStr(param1.errCode));
         }
      }
      
      private function packSuccess(param1:ServerEvent) : void
      {
         var _loc6_:* = null;
         var _loc2_:* = null;
         var _loc5_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc4_:int = 0;
         var _loc3_:* = null;
         if(param1.body != null)
         {
            if(resHash.containsKey(param1.cmd))
            {
               _loc6_ = resHash.getResClass(param1.cmd);
               if(_loc6_)
               {
                  _loc2_ = new _loc6_();
                  try
                  {
                     _loc2_.readFromSlice(param1.body,0);
                  }
                  catch($err:Error)
                  {
                     Log.fatal(this,"protobuf parse error",CMD,param1.cmd,$err,$err.getStackTrace());
                  }
                  param1.message = _loc2_;
               }
            }
            else
            {
               Log.fatal(this,"Unknown Server CMD:",param1.cmd,"Please defined in",ReflectUtil.getShortClassName(nslm2.nets.sockets.CmdResHash));
            }
         }
         if(ClientConfig.showLog)
         {
            _loc5_ = [this,"Pack<<","CMD:" + cmdHash.getName(param1.cmd) + "(" + param1.cmd + ")"];
            if(param1.message)
            {
               try
               {
                  _loc7_ = String(param1.message);
               }
               catch($err:Error)
               {
                  _loc7_ = "proto对象toString错误";
               }
               _loc5_.push(ReflectUtil.getShortClassName(param1.message),_loc7_);
            }
            if(blockLogCMDArr.indexOf(param1.cmd) == -1)
            {
               Log.debug.apply(null,_loc5_);
            }
         }
         if(param1.cmd == 8004)
         {
            if(dataNotifyCache.length > 5)
            {
               dataNotifyCache.shift();
            }
            if((param1.message as PlayerDataNotify).cmd != 2003)
            {
               _loc8_ = new nslm2.nets.sockets.DataNotifyCacheVo(param1.message as PlayerDataNotify);
               this.dataNotifyCache.push(_loc8_);
               param1.dataNotifyCacheVo = _loc8_;
            }
         }
         else if(param1.cmd == 5011)
         {
            if(heroNotifyCache.length > 5)
            {
               heroNotifyCache.shift();
            }
            heroNotifyCache.push(new nslm2.nets.sockets.HeroNotifyCacheVo(param1.message as HeroInfoNotify));
         }
         else
         {
            _loc4_ = ArrayUtil.indexByAttr(dataNotifyCache,"triggerCmd",param1.cmd);
            if(_loc4_ > -1)
            {
               _loc3_ = this.dataNotifyCache[_loc4_];
               ArrayUtil.removeItemAt(dataNotifyCache,_loc4_);
               param1.dataNotifyCacheVo = _loc3_;
            }
            if(heroNotifyCache.length > 0)
            {
               param1.heroNotifyCacheVo = heroNotifyCache[heroNotifyCache.length - 1];
            }
         }
         cplHandlerBatch.execute(param1.cmd,[param1.message,param1],false);
         execOnceHandler(param1.cmd,param1,true);
      }
      
      private function hasOnceHandlerErr(param1:int) : Boolean
      {
         var _loc2_:OnceHandlerVo = onceHandlerDict[param1];
         return _loc2_ && _loc2_.errHandler != null;
      }
      
      private function execOnceHandler(param1:int, param2:ServerEvent, param3:Boolean) : void
      {
         var _loc4_:OnceHandlerVo = onceHandlerDict[param1];
         if(_loc4_)
         {
            removeOnceHandler(param1);
            if(param3)
            {
               if(_loc4_.cplHandler != null)
               {
                  Handler.execute(_loc4_.cplHandler,[param2.message,param2]);
               }
            }
            else if(_loc4_.errHandler != null)
            {
               Handler.execute(_loc4_.errHandler,[param2.message,param2]);
            }
         }
      }
      
      public function send(param1:int, param2:Message = null, param3:* = null, param4:* = null) : void
      {
         addOnceHandler(param1,param3,param4);
         sendMessage(param1,param2);
      }
      
      private function sendMessage(param1:int, param2:Message = null) : void
      {
         var _loc4_:int = 0;
         if(disConn)
         {
            return;
         }
         var _loc3_:ByteArray = ServerUtil.createByteArray();
         if(param2)
         {
            if(ClientConfig.showLog)
            {
               if(blockLogCMDArr.indexOf(param1) == -1)
               {
                  Log.info(this,"Send>>","CMD:" + cmdHash.getName(param1) + "(" + param1 + ")",ReflectUtil.getShortClassName(param2),"{\"protoID\":" + param1 + ",\"values\":VALUE}".replace("VALUE",param2));
               }
            }
            param2.writeTo(_loc3_);
         }
         else if(ClientConfig.showLog)
         {
            if(blockLogCMDArr.indexOf(param1) == -1)
            {
               Log.info(this,"Send>>","CMD:" + cmdHash.getName(param1) + "(" + param1 + ")");
            }
         }
         switch(int(param1) - 2001)
         {
            case 0:
            case 1:
               _loc4_ = 3;
         }
         socket.send_to_net(param1,_loc3_,_loc4_);
      }
      
      public function addOnceHandler(param1:int, param2:* = null, param3:* = null) : void
      {
         var _loc4_:* = null;
         if(param2 != null || param3 != null)
         {
            _loc4_ = new OnceHandlerVo();
            _loc4_.cmd = param1;
            _loc4_.cplHandler = param2;
            _loc4_.errHandler = param3;
            onceHandlerDict[param1] = _loc4_;
         }
      }
      
      public function removeOnceHandler(param1:int) : void
      {
      }
      
      public function onProtocolStatus(param1:ProtocolStatusRes) : void
      {
      }
      
      public function onHeartBeat(param1:HeartBeat) : void
      {
      }
   }
}
