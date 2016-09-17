package nslm2.modules.foundations.chatModules.privChats
{
   import com.netease.protobuf.UInt64;
   import proto.GameFriendData;
   import proto.PublicTalkNotify;
   import nslm2.utils.Uint64Util;
   
   public class PrivChatHistoryVo
   {
      
      public static const PLAYER_ID:String = "playerId";
       
      
      public var friendData:GameFriendData;
      
      public var historyArr:Array;
      
      public function PrivChatHistoryVo()
      {
         historyArr = [];
         super();
      }
      
      public function get playerId() : UInt64
      {
         return friendData.id;
      }
      
      public function get recentlyFriendChat() : PublicTalkNotify
      {
         var _loc1_:* = undefined;
         var _loc2_:* = null;
         var _loc3_:int = historyArr.length;
         while(true)
         {
            _loc3_--;
            if(_loc3_ <= -1)
            {
               break;
            }
            _loc1_ = historyArr[_loc3_];
            _loc2_ = new PublicTalkNotify();
            _loc2_.playerId = _loc1_.playerId;
            _loc2_.name = _loc1_.name;
            _loc2_.pindao = 6;
            _loc2_.content = _loc1_.content;
            if(Uint64Util.equal(_loc2_.playerId,friendData.id))
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
