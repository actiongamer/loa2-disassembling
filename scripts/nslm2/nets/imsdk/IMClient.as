package nslm2.nets.imsdk
{
   import nslm2.modules.foundations.chatModules.ChatModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class IMClient extends IMClientBase
   {
       
      
      public function IMClient()
      {
         super();
         socket.addEventListener("onConnect",onConnect);
         addMsgProc("SI",onMsg_loginret);
         addMsgProc("TP",onMsg_privatechat);
         addMsgProc("TG",onMsg_groupchat);
         addMsgProc("SP",onMsg_privatechatret);
         addMsgProc("SG",onMsg_groupchatret);
         addMsgProc("FP",onMsg_getofflinemsgret);
         addMsgProc("FG",onMsg_getgroupofflinemsgret);
         addMsgProc("KO",onMsg_ko);
         addMsgProc("00",onHeartBeat);
      }
      
      private function onHeartBeat(param1:String, param2:String) : void
      {
         ChatModel.heartbeatcount--;
      }
      
      private function onConnect(param1:IMEvent) : void
      {
         requestLogin();
      }
      
      public function onMsg_loginret(param1:String, param2:String) : void
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         if(param2.length > 0)
         {
            _loc4_ = JSON.parse(param2);
            config.servts = _loc4_.ts;
            if(_loc4_.code == "00")
            {
               _loc3_ = new IMEvent("onLoginSuccess");
               dispatchEvent(_loc3_);
            }
         }
      }
      
      public function onMsg_privatechat(param1:String, param2:String) : void
      {
         var _loc3_:* = null;
         if(param2.length > 0)
         {
            _loc3_ = JSON.parse(param2);
            onChatMessage(_loc3_,param1);
         }
      }
      
      public function onMsg_groupchat(param1:String, param2:String) : void
      {
         var _loc3_:* = null;
         if(param2.length > 0)
         {
            _loc3_ = JSON.parse(param2);
            onChatMessage(_loc3_,param1);
         }
      }
      
      public function onMsg_privatechatret(param1:String, param2:String) : void
      {
         var _loc3_:* = null;
         if(param2.length > 0)
         {
            _loc3_ = JSON.parse(param2);
            onChatRequest(param1,_loc3_);
         }
      }
      
      public function onMsg_groupchatret(param1:String, param2:String) : void
      {
         var _loc3_:* = null;
         if(param2.length > 0)
         {
            _loc3_ = JSON.parse(param2);
            onChatRequest(param1,_loc3_);
         }
      }
      
      public function onMsg_getofflinemsgret(param1:String, param2:String) : void
      {
         var _loc3_:* = null;
         if(param2.length > 0)
         {
            _loc3_ = JSON.parse(param2);
            onOfflineChatMessage(_loc3_,param1);
         }
      }
      
      public function onMsg_getgroupofflinemsgret(param1:String, param2:String) : void
      {
         var _loc3_:* = null;
         if(param2.length > 0)
         {
            _loc3_ = JSON.parse(param2);
            onOfflineGroupChatMessage(_loc3_,param1);
         }
      }
      
      public function onMsg_ko(param1:String, param2:String) : void
      {
         var _loc3_:* = null;
         if(param2.length > 0)
         {
            _loc3_ = JSON.parse(param2);
         }
      }
      
      public function requestLogin() : void
      {
         var _loc2_:Object = {};
         _loc2_.gid = config.gid;
         _loc2_.sid = myuserinfo.sid;
         _loc2_.rid = myuserinfo.rid;
         _loc2_.gps = procSI_gps(_loc2_);
         _loc2_.sign = procSI_sign(_loc2_);
         var _loc1_:String = JSON.stringify(_loc2_);
         socket.sendMsg("SI",_loc1_);
      }
      
      public function requestHeartbeat() : void
      {
         socket.sendMsg("00","");
      }
      
      public function requestPrivatechat(param1:String, param2:String, param3:String, param4:String, param5:String, param6:*, param7:Function, param8:*, param9:String) : void
      {
         var _loc11_:Object = {};
         _loc11_.toSid = param1;
         _loc11_.toRid = param2;
         _loc11_.msg = {};
         _loc11_.msg.type = param3;
         _loc11_.msg.content = param4;
         _loc11_.msg.tag = param5;
         _loc11_.msg.ext = param6;
         _loc11_.seq = procSPSG_seq(_loc11_);
         _loc11_.toUid = !!param8?param8:"";
         _loc11_.toRname = param9;
         _loc11_.gpName = LocaleMgr.ins.getStr(999000526);
         var _loc10_:String = JSON.stringify(_loc11_);
         addChatRequest("SP",_loc11_,param7);
         socket.sendMsg("SP",_loc10_);
      }
      
      public function requestGroupchat(param1:String, param2:String, param3:String, param4:String, param5:String, param6:String, param7:*, param8:Function) : void
      {
         var _loc10_:Object = {};
         _loc10_.gpid = param2;
         _loc10_.msg = {};
         _loc10_.msg.type = param4;
         _loc10_.msg.content = param5;
         _loc10_.msg.tag = param6;
         _loc10_.msg.ext = param7;
         _loc10_.seq = procSPSG_seq(_loc10_);
         _loc10_.gpType = procSG_gpType(_loc10_);
         if(_loc10_.gpType == 7)
         {
            _loc10_.gpSid = param1;
         }
         _loc10_.gpName = param3;
         var _loc9_:String = JSON.stringify(_loc10_);
         addChatRequest("SG",_loc10_,param8);
         socket.sendMsg("SG",_loc9_);
      }
      
      public function requestGroupOffLine(param1:String, param2:String, param3:int, param4:int, param5:String = null, param6:String = null) : void
      {
         var _loc8_:Object = {};
         _loc8_.gps = {};
         if(param5)
         {
            _loc8_.gps.sig = param5;
         }
         if(param6)
         {
            _loc8_.gps.gid = param6;
         }
         _loc8_.gps.type = param1;
         _loc8_.gps.id = param2;
         _loc8_.gps.index = param3;
         _loc8_.gps.count = param4;
         var _loc7_:String = JSON.stringify([_loc8_]);
         socket.sendMsg("FG",_loc7_);
      }
      
      public function requestPersonalOffLine(param1:int, param2:int) : void
      {
         var _loc4_:Object = {};
         _loc4_.index = param1;
         _loc4_.count = param2;
         var _loc3_:String = JSON.stringify(_loc4_);
         socket.sendMsg("FP",_loc3_);
      }
   }
}
