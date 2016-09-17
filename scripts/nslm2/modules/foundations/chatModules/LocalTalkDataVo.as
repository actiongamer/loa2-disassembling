package nslm2.modules.foundations.chatModules
{
   import proto.PublicTalkNotify;
   import nslm2.utils.ServerTimer;
   import com.netease.protobuf.UInt64;
   import proto.TalkContent;
   
   public class LocalTalkDataVo
   {
      
      public static const MAX_LOCAL_SAVE_TIME:int = 86400;
       
      
      private var _obj:Object;
      
      private var _notify:PublicTalkNotify;
      
      public var pindao:uint;
      
      public var time:int;
      
      public function LocalTalkDataVo()
      {
         super();
      }
      
      public function initByLocalObj(param1:Object) : void
      {
         this._obj = param1;
         this.pindao = param1.pindao;
         this.time = param1.time;
      }
      
      public function get isOutTime() : Boolean
      {
         return ServerTimer.ins.second - this.time > 86400;
      }
      
      public function initByNotify(param1:PublicTalkNotify) : void
      {
         this._notify = param1;
         this.pindao = param1.pindao;
         this.time = ServerTimer.ins.second;
         if(Boolean(_notify.content.sendTimerSecond) == false)
         {
            _notify.content.sendTimerSecond = this.time;
         }
      }
      
      public function get notify() : PublicTalkNotify
      {
         if(_notify != null)
         {
            return _notify;
         }
         _notify = new PublicTalkNotify();
         _notify.playerId = new UInt64(_obj.playerId.low,_obj.playerId.high);
         _notify.content = new TalkContent();
         _notify.content.content = _obj.content.content;
         _notify.content.extraContent = _obj.content.extraContent;
         _notify.content.sendPlayer = _obj.content.sendPlayer;
         _notify.content.sendTimerSecond = _obj.content.sendTimerSecond;
         _notify.gmType = _obj.gmType;
         _notify.name = _obj.name;
         _notify.npcId = _obj.npcId;
         _notify.pindao = _obj.pindao;
         if(Boolean(_notify.content.sendTimerSecond) == false)
         {
            _notify.content.sendTimerSecond = _obj.time;
         }
         return _notify;
      }
      
      public function get saveObj() : Object
      {
         if(_obj != null)
         {
            return _obj;
         }
         _obj = {};
         _obj.playerId = _notify.playerId;
         _obj.content = new TalkContent();
         _obj.content.content = _notify.content.content;
         _obj.content.extraContent = _notify.content.extraContent;
         _obj.content.sendPlayer = _notify.content.sendPlayer;
         _obj.content.sendTimerSecond = _notify.content.sendTimerSecond;
         _obj.gmType = _notify.gmType;
         _obj.name = _notify.name;
         _obj.npcId = _notify.npcId;
         _obj.pindao = _notify.pindao;
         _obj.time = this.time;
         return _obj;
      }
   }
}
