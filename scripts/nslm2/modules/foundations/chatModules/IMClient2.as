package nslm2.modules.foundations.chatModules
{
   import nslm2.nets.imsdk.IMClient;
   import nslm2.common.model.PlayerModel;
   import com.mz.core.configs.ClientConfig;
   import com.mz.core.configs.EnvConfig;
   import nslm2.nets.imsdk.Base64;
   import nslm2.modules.battles.battlefields.model.BattlefieldModel;
   import nslm2.modules.battles.PeakSports.model.PeakSportsModel;
   import proto.PlayerBaseInfo;
   import nslm2.nets.sockets.ServerUtil;
   import flash.utils.ByteArray;
   import morn.core.utils.BaUtil;
   import com.mz.core.logging.Log;
   
   public class IMClient2 extends IMClient
   {
      
      public static var guildIMClicentGid:String;
       
      
      private var _loginSign:String;
      
      public function IMClient2()
      {
         super();
      }
      
      public function retryConnect() : void
      {
         this.socket.tryConnect();
      }
      
      public function CloseConnect() : void
      {
         this.socket.CloseConnect();
      }
      
      public function setLoginData(param1:String, param2:Boolean = true) : void
      {
         var _loc5_:Object = JSON.parse(param1);
         _loc5_.rname = PlayerModel.ins.playerInfo.name;
         _loc5_.rlevel = String(PlayerModel.ins.level);
         _loc5_.uid = ClientConfig.playId;
         _loc5_.cid = String(EnvConfig.ins.ptId);
         _loc5_.uip = ClientConfig.userIP;
         _loginSign = JSON.stringify(_loc5_);
         var _loc3_:String = Base64.decode(_loc5_.gps);
         if(param2)
         {
            this.setBaseConfig(_loc5_.gid,"");
            myuserinfo.sid = _loc5_.sid;
            myuserinfo.rid = _loc5_.rid;
         }
         var _loc6_:Object = JSON.parse(_loc3_);
         removeAllChannel();
         var _loc8_:int = 0;
         var _loc7_:* = _loc6_;
         for each(var _loc4_ in _loc6_)
         {
            if(_loc4_.type == 7)
            {
               BattlefieldModel.ins.chatChannelId = _loc4_.id;
               addChannel(_loc4_.sid,_loc4_.type,_loc4_.id,_loc4_.perm,"");
            }
            else if(_loc4_.type == 8)
            {
               PeakSportsModel.ins.chatChannelId = _loc4_.id;
               addChannel(_loc4_.sid,_loc4_.type,_loc4_.id,_loc4_.perm,"");
            }
            else
            {
               addChannel(_loc5_.sid,_loc4_.type,_loc4_.id,_loc4_.perm,"");
            }
         }
         if(param2 == false)
         {
            requestLogin();
         }
      }
      
      public function removeAllChannel() : void
      {
         myuserinfo.lstChannel.length = 0;
      }
      
      public function requestLoginWhenLvChange() : void
      {
         var _loc1_:* = null;
         if(_loginSign)
         {
            _loc1_ = JSON.parse(_loginSign);
            _loc1_.rlevel = String(PlayerModel.ins.level);
            _loginSign = JSON.stringify(_loc1_);
            socket.sendMsg("SI",_loginSign);
         }
      }
      
      override public function requestLogin() : void
      {
         socket.sendMsg("SI",_loginSign);
      }
      
      public function sendGroupChat(param1:String, param2:String, param3:Object = null, param4:String = "txt", param5:String = "") : void
      {
         param2 = createContent(param2);
         param3 = createExtObj(param3);
         var _loc6_:String = this.findChannelById(param1).sid;
         requestGroupchat(_loc6_,param1,param5,param4,param2,"",param3,onSendRet);
      }
      
      public function sendPrivateChat(param1:String, param2:String, param3:String, param4:String) : void
      {
         param2 = createContent(param2);
         var _loc6_:Object = createExtObj(null);
         var _loc5_:String = this.myuserinfo.sid;
         requestPrivatechat(_loc5_,param1,"txt",param2,"",_loc6_,onSendRet,param3,param4);
      }
      
      private function createContent(param1:String) : String
      {
         return param1;
      }
      
      private function createExtObj(param1:Object) : Object
      {
         var _loc4_:PlayerBaseInfo = new PlayerBaseInfo();
         var _loc3_:ByteArray = ServerUtil.createByteArray();
         _loc4_.id = PlayerModel.ins.playerInfo.id;
         _loc4_.name = PlayerModel.ins.playerInfo.name;
         _loc4_.npcId = PlayerModel.ins.playerInfo.playerHero.baseInfo.baseId;
         _loc4_.gmType = PlayerModel.ins.playerInfo.gmType;
         _loc4_.qqInfo = PlayerModel.ins.playerInfo.qqInfo;
         _loc4_.lv = PlayerModel.ins.level;
         _loc4_.writeTo(_loc3_);
         BaUtil.compress(_loc3_);
         var _loc2_:String = Base64.encodeByteArray(_loc3_);
         if(!param1)
         {
            param1 = {};
         }
         param1["player"] = _loc2_;
         param1["playId"] = ClientConfig.playId;
         param1["playerName"] = PlayerModel.ins.playerInfo.name;
         param1["playerIP"] = ClientConfig.userIP;
         return param1;
      }
      
      private function onSendRet(param1:String, param2:Object, param3:Boolean, param4:String) : void
      {
         Log.info(this,"send return ",param1,param2,param3,param4);
      }
   }
}
