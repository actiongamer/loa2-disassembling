package nslm2.nets.sockets
{
   import morn.core.handlers.HandlerBatch;
   import com.mz.core.utils.DictHash;
   import com.mz.core.configs.ClientConfig;
   import proto.HeartBeat;
   import proto.OnlineSceneNotify;
   import proto.RandomNameRes;
   import com.mz.core.logging.Log;
   import com.greensock.TweenLite;
   import proto.LoginReq;
   import flash.system.Capabilities;
   import com.mz.core.configs.EnvConfig;
   import proto.ProtocolStatusRes;
   import com.netease.protobuf.Message;
   import flash.utils.ByteArray;
   import com.mz.core.utils2.reflects.ReflectUtil;
   import morn.core.handlers.Handler;
   
   public class SimpleServerEngine
   {
      
      private static var _ins:nslm2.nets.sockets.SimpleServerEngine;
       
      
      private var cplHandlerBatch:HandlerBatch;
      
      private var errHandlerBatch:HandlerBatch;
      
      private var socket:nslm2.nets.sockets.ServerSocket;
      
      private var resHash:DictHash;
      
      private var onceHandlerDict:Object;
      
      private var _forbidenFun:Function;
      
      public var disConnHandler:Function;
      
      public function SimpleServerEngine()
      {
         cplHandlerBatch = new HandlerBatch();
         errHandlerBatch = new HandlerBatch();
         onceHandlerDict = {};
         super();
      }
      
      public static function get ins() : nslm2.nets.sockets.SimpleServerEngine
      {
         if(_ins == null)
         {
            _ins = new nslm2.nets.sockets.SimpleServerEngine();
         }
         return _ins;
      }
      
      public function init() : void
      {
         socket = nslm2.nets.sockets.ServerSocket.ins;
         socket.addEventListener("onConnect",onConn);
         socket.addEventListener("onDisconnect",onDisConn);
         socket.addEventListener("onErrConnect",onDisConn);
         socket.addEventListener("onPack",onPack);
         socket.init(ClientConfig.serverIP,ClientConfig.serverPort);
         resHash = new DictHash();
         resHash.put(1,HeartBeat);
         resHash.put(2008,OnlineSceneNotify);
         resHash.put(2004,RandomNameRes);
         resHash.put(2002,null);
      }
      
      protected function onConn(param1:SimpleServerEvent) : void
      {
         Log.uid = String(ClientConfig.playId);
         requestRoleStatus();
         loop();
      }
      
      private function loop() : void
      {
         var _loc1_:HeartBeat = new HeartBeat();
         _loc1_.v = new Date().time / 1000;
         this.send(1,_loc1_);
         TweenLite.delayedCall(60,loop);
      }
      
      private function requestRoleStatus() : void
      {
         var _loc1_:LoginReq = new LoginReq();
         _loc1_.flashVersion = Capabilities.version;
         _loc1_.resolution = Capabilities.screenResolutionX + "x" + Capabilities.screenResolutionY;
         _loc1_.ip = ClientConfig.userIP;
         _loc1_.account = ClientConfig.playId;
         _loc1_.token = ClientConfig.token;
         _loc1_.district = ClientConfig.district;
         _loc1_.adult = ClientConfig.adultFlag;
         _loc1_.time = ClientConfig.time;
         _loc1_.gameTime = ClientConfig.gameTime;
         _loc1_.qqParam = ClientConfig.qqParam;
         _loc1_.weiduan = EnvConfig.ins.weiDuan;
         _loc1_.adInfo = ClientConfig.adInfo;
         _loc1_.regTime = ClientConfig.regTime;
         _loc1_.osInfo = Capabilities.os;
         _loc1_.opId = EnvConfig.ins.ptId;
         this.addAlwayHandler(2008,onlineSceneNotiyCpl);
         this.addAlwayHandler(2001,null,logErrCpl);
         send(2001,_loc1_);
      }
      
      private function logErrCpl(param1:ProtocolStatusRes) : void
      {
         ClientConfig.firstBattle = 1;
      }
      
      private function onlineSceneNotiyCpl(param1:OnlineSceneNotify) : void
      {
         if(param1.sceneId == 100)
         {
            ClientConfig.firstBattle = 1;
            if(param1.hasName)
            {
               ClientConfig.createRoleName = param1.name;
            }
            if(param1.hasSex)
            {
               ClientConfig.createRoleSex = param1.sex;
            }
         }
         if(param1.langNow != null && param1.langNow != "")
         {
            ClientConfig.language = param1.langNow;
         }
         if(ClientConfig.language == "cn")
         {
            ClientConfig.language = "common";
         }
         if(ClientConfig.languageAry.indexOf(ClientConfig.language) < 0)
         {
            ClientConfig.language = ClientConfig.languageAry[0];
         }
         if(param1.name != "")
         {
            ClientConfig.firstBattle = 0;
         }
         else
         {
            ClientConfig.firstBattle = 1;
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
         var _loc3_:ByteArray = ServerUtil.createByteArray();
         if(param2)
         {
            Log.info(this,"Send>>","CMD:(" + param1 + ")",ReflectUtil.getShortClassName(param2),"{\"protoID\":" + param1 + ",\"values\":VALUE}".replace("VALUE",JSON.stringify(param2)));
            param2.writeTo(_loc3_);
         }
         else
         {
            Log.info(this,"Send>>","CMD:(" + param1 + ")");
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
      
      public function addForbidenFun(param1:Function) : void
      {
         _forbidenFun = param1;
      }
      
      public function addAlwayHandler(param1:int, param2:* = null, param3:* = null) : void
      {
         if(param2)
         {
            cplHandlerBatch.addHandler(param1,param2);
         }
         if(param3)
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
      
      public function dispose() : void
      {
         disConnHandler = null;
         this.removeAlwayHandler(2008,null,onlineSceneNotiyCpl);
         this.removeAlwayHandler(2001,null,logErrCpl);
         TweenLite.killDelayedCallsTo(loop);
         socket.removeEventListener("onConnect",onConn);
         socket.removeEventListener("onDisconnect",onDisConn);
         socket.removeEventListener("onPack",onPack);
         socket = null;
      }
      
      protected function onPack(param1:SimpleServerEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(param1.cmd == 2)
         {
            _loc2_ = new ProtocolStatusRes();
            _loc2_.readFromSlice(param1.body,0);
            _loc3_ = new SimpleServerEvent("onPack");
            _loc3_.cmd = _loc2_.cmd;
            _loc3_.message = _loc2_;
            onPackErr(_loc3_);
         }
         else
         {
            packSuccess(param1);
         }
      }
      
      private function onPackErr(param1:SimpleServerEvent) : void
      {
         var _loc2_:ProtocolStatusRes = param1.message as ProtocolStatusRes;
         if(_loc2_.errCode == 0)
         {
            param1.body = null;
            param1.message = null;
            this.packSuccess(param1);
         }
         else
         {
            if(hasOnceHandlerErr(param1.cmd) || errHandlerBatch.hasType(param1.cmd))
            {
               errHandlerBatch.execute(param1.cmd,[param1.message,param1],false);
               execOnceHandler(param1.cmd,param1,false);
            }
            if(_loc2_.errCode == 300000002)
            {
               if(_forbidenFun)
               {
                  _forbidenFun.apply();
               }
            }
         }
      }
      
      private function hasOnceHandlerErr(param1:int) : Boolean
      {
         var _loc2_:OnceHandlerVo = onceHandlerDict[param1];
         return _loc2_ && _loc2_.errHandler != null;
      }
      
      protected function packSuccess(param1:SimpleServerEvent) : void
      {
         var _loc4_:* = null;
         var _loc2_:* = null;
         if(param1.body != null)
         {
            if(resHash.containsKey(param1.cmd))
            {
               _loc4_ = resHash.getValue(param1.cmd) as Class;
               if(_loc4_)
               {
                  _loc2_ = new _loc4_();
                  _loc2_.readFromSlice(param1.body,0);
                  param1.message = _loc2_;
               }
            }
            else
            {
               Log.warn(this,"Unknown Server CMD:",param1.cmd);
            }
         }
         var _loc3_:Array = [this,"Pack<<","CMD:" + param1.cmd + ")"];
         if(param1.message)
         {
            _loc3_.push(ReflectUtil.getShortClassName(param1.message),JSON.stringify(param1.message));
         }
         Log.debug.apply(null,_loc3_);
         cplHandlerBatch.execute(param1.cmd,[param1.message,param1],false);
         execOnceHandler(param1.cmd,param1,true);
      }
      
      private function execOnceHandler(param1:int, param2:SimpleServerEvent, param3:Boolean) : void
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
      
      private function onDisConn(param1:SimpleServerEvent) : void
      {
         if(disConnHandler)
         {
            disConnHandler.call();
         }
      }
   }
}
