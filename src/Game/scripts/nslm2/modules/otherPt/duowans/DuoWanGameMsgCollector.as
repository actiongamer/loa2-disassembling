package nslm2.modules.otherPt.duowans
{
   import flash.events.EventDispatcher;
   import com.mz.core.configs.ClientConfig;
   import com.yy.game.GameProfileParams;
   import com.mz.core.logging.Log;
   import com.yy.game.GameMsgCollector;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.scenes.commons.SceneModel;
   import nslm2.modules.foundations.chatModules.ChatUtils;
   
   public class DuoWanGameMsgCollector extends EventDispatcher
   {
      
      private static var _ins:nslm2.modules.otherPt.duowans.DuoWanGameMsgCollector;
       
      
      private var msgType:String = "2";
      
      private var gameId:String = "NSLM2";
      
      public var preSend:Boolean = false;
      
      public function DuoWanGameMsgCollector()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.otherPt.duowans.DuoWanGameMsgCollector
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.otherPt.duowans.DuoWanGameMsgCollector();
         }
         return _ins;
      }
      
      public function get getServerId() : String
      {
         return "s" + String(ClientConfig.district % 10000);
      }
      
      public function reportCreateRole() : void
      {
         var _loc1_:* = null;
         try
         {
            _loc1_ = new GameProfileParams();
            _loc1_.sex = ClientConfig.createRoleSex == 1?"m":"f";
            Log.info(this,"reportGameProfile",null,int(ClientConfig.playId),gameId,getServerId,ClientConfig.createRoleName,1,"new_role",_loc1_);
            GameMsgCollector.instance.reportGameProfile(null,int(ClientConfig.playId),gameId,getServerId,ClientConfig.createRoleName,1,"new_role",_loc1_);
            return;
         }
         catch($err:Error)
         {
            Log.error(this,$err,$err.getStackTrace());
            return;
         }
      }
      
      public function reportLevelUp() : void
      {
         reportProfile(true);
      }
      
      private function reportProfile(param1:Boolean = false) : void
      {
         var _loc2_:* = null;
         try
         {
            _loc2_ = new GameProfileParams();
            _loc2_.sex = PlayerModel.ins.sex == 1?"m":"f";
            Log.info(this,"reportGameProfile",null,int(ClientConfig.playId),gameId,getServerId,PlayerModel.ins.playerInfo.name,PlayerModel.ins.level,!!param1?"level_change":"new_role",_loc2_);
            GameMsgCollector.instance.reportGameProfile(null,int(ClientConfig.playId),gameId,getServerId,PlayerModel.ins.playerInfo.name,PlayerModel.ins.level,!!param1?"level_change":"new_role",_loc2_);
            return;
         }
         catch($err:Error)
         {
            Log.error(this,$err,$err.getStackTrace());
            return;
         }
      }
      
      public function reportScene() : void
      {
         try
         {
            preSend = true;
            Log.info(this,"getReportable",PlayerModel.ins.playerInfo.name,String(SceneModel.ins.sceneId),getServerId,gameId);
            GameMsgCollector.instance.getReportable(PlayerModel.ins.playerInfo.name,String(SceneModel.ins.sceneId),getServerId,gameId);
            return;
         }
         catch($err:Error)
         {
            Log.error(this,$err,$err.getStackTrace());
            return;
         }
      }
      
      public function collectSendMailMessage(param1:String, param2:String) : void
      {
         var _loc3_:* = null;
         try
         {
            if(preSend && param2 != PlayerModel.ins.playerInfo.name && param1 != null)
            {
               _loc3_ = "1";
               Log.info(this,"collectMessage",param1,param2,PlayerModel.ins.playerInfo.name,_loc3_,String(SceneModel.ins.sceneId),this.getServerId,gameId);
               GameMsgCollector.instance.collectMessage(param1,param2,PlayerModel.ins.playerInfo.name,_loc3_,String(SceneModel.ins.sceneId),this.getServerId,gameId,onSend);
            }
            return;
         }
         catch($err:Error)
         {
            Log.error(this,$err,$err.getStackTrace());
            return;
         }
      }
      
      public function collectReadNewMailMessage(param1:String, param2:String) : void
      {
         collectMessage(param1,param2,false);
      }
      
      public function collectMessage(param1:String, param2:String, param3:Boolean) : void
      {
         var _loc4_:* = null;
         try
         {
            if(preSend && param2 != PlayerModel.ins.playerInfo.name && param1 != null)
            {
               param1 = param1.replace(ChatUtils.SplitStrReg,"");
               _loc4_ = !!param3?"2":"1";
               Log.info(this,"collectMessage",param1,PlayerModel.ins.playerInfo.name,param2,_loc4_,String(SceneModel.ins.sceneId),this.getServerId,gameId);
               GameMsgCollector.instance.collectMessage(param1,PlayerModel.ins.playerInfo.name,param2,_loc4_,String(SceneModel.ins.sceneId),this.getServerId,gameId,onSend);
            }
            return;
         }
         catch($err:Error)
         {
            Log.error(this,$err,$err.getStackTrace());
            return;
         }
      }
      
      private function onSend(param1:Boolean) : void
      {
      }
   }
}
