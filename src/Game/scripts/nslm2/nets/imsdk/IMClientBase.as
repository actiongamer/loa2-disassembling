package nslm2.nets.imsdk
{
   import flash.events.EventDispatcher;
   import flash.utils.Dictionary;
   import com.mz.core.logging.Log;
   
   public class IMClientBase extends EventDispatcher
   {
       
      
      protected var socket:nslm2.nets.imsdk.IMSocket;
      
      public var myuserinfo:nslm2.nets.imsdk.UserInfo;
      
      public var config:nslm2.nets.imsdk.Config;
      
      private var dictMsgProc:Dictionary;
      
      private var lstChatRequest:Vector.<nslm2.nets.imsdk.ChatRequest>;
      
      public function IMClientBase()
      {
         socket = new nslm2.nets.imsdk.IMSocket();
         myuserinfo = new nslm2.nets.imsdk.UserInfo();
         config = new nslm2.nets.imsdk.Config();
         dictMsgProc = new Dictionary();
         lstChatRequest = new Vector.<nslm2.nets.imsdk.ChatRequest>();
         super();
         socket.addEventListener("onPack",onPack);
         socket.addEventListener("onErr",onErr);
      }
      
      public function init(param1:String, param2:String) : void
      {
         socket.init(param1,param2);
      }
      
      private function onErr(param1:IMEvent) : void
      {
         this.onChatErr(0,param1.msg);
      }
      
      private function onPack(param1:IMEvent) : void
      {
         onMsgProc(param1.header.msgid,param1.msg);
      }
      
      protected function onMsgProc(param1:String, param2:String) : void
      {
         if(dictMsgProc[param1])
         {
            dictMsgProc[param1].call(this,param1,param2);
         }
      }
      
      protected function addMsgProc(param1:String, param2:Function) : void
      {
         dictMsgProc[param1] = param2;
      }
      
      public function setBaseConfig(param1:String, param2:String) : void
      {
         config.gid = param1;
         config.md5key = param2;
      }
      
      public function addChannel(param1:String, param2:String, param3:String, param4:String, param5:String) : void
      {
         var _loc6_:ChannelInfo = new ChannelInfo();
         _loc6_.sid = param1;
         _loc6_.type = param2;
         _loc6_.id = param3;
         _loc6_.perm = param4;
         _loc6_.code = param5;
         myuserinfo.lstChannel.push(_loc6_);
      }
      
      public function findChannel(param1:String, param2:String) : ChannelInfo
      {
         var _loc3_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < myuserinfo.lstChannel.length)
         {
            if(myuserinfo.lstChannel[_loc3_].sid == param1 && myuserinfo.lstChannel[_loc3_].id == param2)
            {
               return myuserinfo.lstChannel[_loc3_];
            }
            _loc3_++;
         }
         return null;
      }
      
      public function findChannelById(param1:String) : ChannelInfo
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < myuserinfo.lstChannel.length)
         {
            if(myuserinfo.lstChannel[_loc2_].id == param1)
            {
               return myuserinfo.lstChannel[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function removeChannel(param1:String, param2:String) : void
      {
         var _loc3_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < myuserinfo.lstChannel.length)
         {
            if(myuserinfo.lstChannel[_loc3_].sid == param1 && myuserinfo.lstChannel[_loc3_].id == param2)
            {
               myuserinfo.lstChannel.splice(_loc3_,1);
               break;
            }
            _loc3_++;
         }
      }
      
      protected function procSI_gps(param1:Object) : String
      {
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc4_:Array = [];
         _loc5_ = 0;
         while(_loc5_ < myuserinfo.lstChannel.length)
         {
            _loc3_ = new ChannelInfo();
            _loc3_.sid = myuserinfo.lstChannel[_loc5_].sid;
            _loc3_.id = myuserinfo.lstChannel[_loc5_].id;
            _loc3_.type = myuserinfo.lstChannel[_loc5_].type;
            _loc3_.perm = myuserinfo.lstChannel[_loc5_].perm;
            _loc3_.code = myuserinfo.lstChannel[_loc5_].code;
            _loc4_.push(_loc3_);
            _loc5_++;
         }
         var _loc2_:String = JSON.stringify(_loc4_);
         return Base64.encode(_loc2_);
      }
      
      protected function procSI_sign(param1:Object) : String
      {
         var _loc2_:String = param1.gid + param1.gps + param1.rid + param1.sid + config.md5key;
         return MD5.hash(_loc2_);
      }
      
      protected function procSPSG_seq(param1:Object) : String
      {
         myuserinfo.curseq++;
         return myuserinfo.curseq.toString();
      }
      
      protected function procSG_gpType(param1:Object) : String
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < myuserinfo.lstChannel.length)
         {
            if(myuserinfo.lstChannel[_loc2_].id == param1.gpid)
            {
               return myuserinfo.lstChannel[_loc2_].type;
            }
            _loc2_++;
         }
         return "";
      }
      
      protected function onOfflineChatMessage(param1:Object, param2:String) : void
      {
         var _loc6_:int = 0;
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc5_:int = param1.msgs.length;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc4_ = new ChatMessage();
            _loc4_.id = param1.msgs[_loc6_].id;
            _loc4_.sid = param1.msgs[_loc6_].sid;
            _loc4_.rid = param1.msgs[_loc6_].rid;
            _loc4_.type = param1.msgs[_loc6_].type;
            _loc4_.content = param1.msgs[_loc6_].content;
            _loc4_.url = param1.msgs[_loc6_].url;
            _loc4_.ts = param1.msgs[_loc6_].ts;
            _loc4_.tag = param1.msgs[_loc6_].tag;
            _loc4_.ext = param1.msgs[_loc6_].ext;
            _loc4_.chatType = param2;
            if(param1.gpSid)
            {
               _loc4_.sid = param1.gpSid;
            }
            if(param1.gpType)
            {
               _loc4_.gpType = param1.gpType;
            }
            if(param1.gpid)
            {
               _loc4_.gpid = param1.gpid;
            }
            _loc3_ = new IMEvent("onChatMessage");
            _loc3_.chat = _loc4_;
            Log.info(this,"onOfflineChatMessage " + JSON.stringify(_loc4_));
            dispatchEvent(_loc3_);
            _loc6_++;
         }
      }
      
      protected function onOfflineGroupChatMessage(param1:Object, param2:String) : void
      {
         var _loc6_:int = 0;
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc5_:int = param1.msgs.length;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc4_ = new ChatMessage();
            _loc4_.sid = param1.msgs[_loc6_].sid;
            _loc4_.rid = param1.msgs[_loc6_].rid;
            _loc4_.id = param1.msgs[_loc6_].id;
            _loc4_.type = param1.msgs[_loc6_].type;
            _loc4_.content = param1.msgs[_loc6_].content;
            _loc4_.url = param1.msgs[_loc6_].url;
            _loc4_.tag = param1.msgs[_loc6_].tag;
            _loc4_.ts = param1.msgs[_loc6_].ts;
            _loc4_.ext = param1.msgs[_loc6_].ext;
            _loc4_.chatType = param2;
            if(param1.gid)
            {
               _loc4_.gid = param1.gid;
            }
            if(param1.sid)
            {
               _loc4_.sid = param1.sid;
            }
            if(param1.gpType)
            {
               _loc4_.gpType = param1.gpType;
            }
            if(param1.gpid)
            {
               _loc4_.gpid = param1.gpid;
            }
            _loc3_ = new IMEvent("onChatMessage");
            _loc3_.chat = _loc4_;
            dispatchEvent(_loc3_);
            _loc6_++;
         }
      }
      
      protected function onChatMessage(param1:Object, param2:String) : void
      {
         var _loc4_:ChatMessage = new ChatMessage();
         _loc4_.content = param1.msg.content;
         _loc4_.id = param1.msg.id;
         _loc4_.rid = param1.msg.rid;
         _loc4_.tag = param1.msg.tag;
         _loc4_.ts = param1.msg.ts;
         _loc4_.type = param1.msg.type;
         _loc4_.seq = param1.seq;
         _loc4_.sid = param1.sid;
         _loc4_.ext = param1.msg.ext;
         _loc4_.chatType = param2;
         if(param1.gpSid)
         {
            _loc4_.sid = param1.gpSid;
         }
         if(param1.gpType)
         {
            _loc4_.gpType = param1.gpType;
         }
         if(param1.gpid)
         {
            _loc4_.gpid = param1.gpid;
         }
         var _loc3_:IMEvent = new IMEvent("onChatMessage");
         _loc3_.chat = _loc4_;
         Log.info(this,"onChatMessage " + JSON.stringify(_loc4_));
         dispatchEvent(_loc3_);
      }
      
      protected function onChatRequest(param1:String, param2:Object) : void
      {
         var _loc3_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < lstChatRequest.length)
         {
            if(param1 == lstChatRequest[_loc3_].msgid && param2.seq == lstChatRequest[_loc3_].msg.seq)
            {
               var _loc4_:* = param2.code;
               if("00" !== _loc4_)
               {
                  if("02" !== _loc4_)
                  {
                     this.onChatErr(param2.code,param2.desc);
                  }
                  else
                  {
                     onMyChatMessage(lstChatRequest[_loc3_].msg,param2,param1,true);
                  }
               }
               else
               {
                  onMyChatMessage(lstChatRequest[_loc3_].msg,param2,param1);
                  if(lstChatRequest[_loc3_].func)
                  {
                     lstChatRequest[_loc3_].func(lstChatRequest[_loc3_].msgid,lstChatRequest[_loc3_].msg,true,"");
                  }
                  else
                  {
                     lstChatRequest[_loc3_].func(lstChatRequest[_loc3_].msgid,lstChatRequest[_loc3_].msg,false,param2.desc);
                  }
               }
               lstChatRequest.splice(_loc3_,1);
               break;
            }
            _loc3_++;
         }
      }
      
      protected function onChatErr(param1:int, param2:String) : void
      {
         var _loc3_:IMEvent = new IMEvent("onChatErr");
         var _loc4_:ChatMessage = new ChatMessage();
         _loc4_.content = param2;
         _loc3_.chat = _loc4_;
         _loc3_.offline = false;
         dispatchEvent(_loc3_);
      }
      
      protected function onMyChatMessage(param1:Object, param2:Object, param3:String, param4:Boolean = false) : void
      {
         var _loc6_:ChatMessage = new ChatMessage();
         _loc6_.content = param1.msg.content;
         _loc6_.id = param2.mid;
         _loc6_.rid = myuserinfo.rid;
         _loc6_.tag = param1.msg.tag;
         _loc6_.type = param1.msg.type;
         _loc6_.seq = param2.seq;
         _loc6_.sid = param1.sid;
         _loc6_.ext = param1.msg.ext;
         _loc6_.chatType = param3;
         if(param1.gpType)
         {
            _loc6_.gpType = param1.gpType;
         }
         if(param1.gpid)
         {
            _loc6_.gpid = param1.gpid;
         }
         var _loc5_:IMEvent = new IMEvent("onChatMessage");
         _loc5_.chat = _loc6_;
         _loc5_.offline = param4;
         Log.info(this,"onMyChatMessage " + JSON.stringify(_loc6_));
         dispatchEvent(_loc5_);
      }
      
      protected function addChatRequest(param1:String, param2:Object, param3:Function) : void
      {
         var _loc4_:nslm2.nets.imsdk.ChatRequest = new nslm2.nets.imsdk.ChatRequest();
         _loc4_.msgid = param1;
         _loc4_.msg = param2;
         _loc4_.func = param3;
         lstChatRequest.push(_loc4_);
      }
   }
}
