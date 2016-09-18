package nslm2.modules.foundations.chatModules
{
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.battles.battlefields.model.BattlefieldModel;
   import nslm2.modules.battles.PeakSports.model.PeakSportsModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.Uint64Util;
   import com.mz.core.utils.DictHash;
   import com.mz.core.configs.EnvConfig;
   
   public class ChatConsts
   {
      
      public static const SHOW_ALL_TIP:String = "SHOW_ALL_TIP";
      
      public static const W1250:int = 1310;
      
      public static const HISTORY2HEIGHT:int = 450;
      
      public static var chat_bottom:int;
      
      public static const HISTORY_CONTENT_BOTTOM:int = 6;
      
      public static const HISTORY_CHANGE_HEIGHT:int = 70;
      
      public static const MSG_CHAT_HISTORY_SHOW_KIND_CHANGE:String = "msg_chat_history_show_kind_change";
      
      public static const EVENT_HISTORY_GROUP_ID_CHANGE:String = "eventHistoryGroupIdChange";
      
      public static const EXTRA_KEY:String = "extraKey";
      
      public static const ITEM_KIND:String = "item";
      
      public static const ITEM_TREAUSRE:String = "baowu";
      
      public static const PLAYER_KIND:String = "player";
      
      public static const PLAY_ID:String = "playId";
      
      public static const EXT_KEY_PLAYER_NAME:String = "playerName";
      
      public static const PLAYER_IP:String = "playerIP";
      
      public static const TEAM_GUAJI_INVITE_KIND:String = "TeamGuajiInvite";
      
      public static const BATTLEFIELD_INVITE_KIND:String = "battlefieldInviteKind";
      
      public static const WORLD:int = 0;
      
      public static const SYSTEM:int = 1;
      
      public static const NOTICE:int = 11;
      
      public static const GM:int = 2;
      
      public static const GUILD:int = 3;
      
      public static const TEAM:int = 4;
      
      public static const CROSS_SERVER:int = 5;
      
      public static const PRIVATE:int = 6;
      
      public static const BATTLEFIELD:int = 7;
      
      public static const PEAKSPORTS:int = 8;
      
      public static const WARM:int = 44;
      
      public static const GROUP_ALL:int = 1000;
      
      public static const GROUP_WORLD:int = 1001;
      
      public static const GROUP_SYSTEM_GM:int = 1002;
      
      public static const GROUP_GUILD:int = 1004;
      
      public static const GROUP_TEAM:int = 1005;
      
      public static const GROUP_CROSS_SERVER:int = 1006;
      
      public static const GROUP_PRIVATE:int = 1007;
      
      public static const GROUP_BATTLEFIELD:int = 1008;
      
      public static const LOCAL_TALK_MAX_COUNT:int = 1000;
      
      public static const LOCAL_TALK_SAVE_LIMIT:int = 20;
      
      public static const LOCAL_TALK_SAVE_TIME_LIMIT:int = 120;
      
      private static var _ins:nslm2.modules.foundations.chatModules.ChatConsts;
       
      
      private var channelLib:DictHash;
      
      private var channelGroupLib:DictHash;
      
      public var historyChannelArr:Array;
      
      public var sendChannelArr:Array;
      
      public function ChatConsts()
      {
         channelLib = new DictHash();
         channelGroupLib = new DictHash();
         historyChannelArr = [1000,1001,1002,1004,1005,1006];
         sendChannelArr = [0,3,4,5];
         super();
         channelLib.put(0,new ChatChannelVo(0,LocaleMgr.ins.getStr(999000201),16777215,false));
         channelLib.put(1,new ChatChannelVo(1,LocaleMgr.ins.getStr(999000202),16769838,true));
         channelLib.put(11,new ChatChannelVo(11,LocaleMgr.ins.getStr(999000203),16769838,true));
         channelLib.put(2,new ChatChannelVo(2,LocaleMgr.ins.getStr(999000204),16723968,true));
         channelLib.put(3,new ChatChannelVo(3,LocaleMgr.ins.getStr(999000205),8781631,false));
         channelLib.put(4,new ChatChannelVo(4,LocaleMgr.ins.getStr(999000206),5958399,false));
         channelLib.put(5,new ChatChannelVo(5,LocaleMgr.ins.getStr(999000207),4827135,false));
         channelLib.put(6,new ChatChannelVo(6,LocaleMgr.ins.getStr(999000208),16711935,false));
         channelLib.put(44,new ChatChannelVo(44,"",16723968,true));
         channelLib.put(7,new ChatChannelVo(7,LocaleMgr.ins.getStr(999000209),4827135,false));
         channelLib.put(8,new ChatChannelVo(8,LocaleMgr.ins.getStr(999000209),4827135,false));
         channelGroupLib.put(1000,new ChannelGroupVo(1000,LocaleMgr.ins.getStr(999000210),[0,1,11,2,3,4,5,44,7,8]));
         channelGroupLib.put(1001,new ChannelGroupVo(1001,LocaleMgr.ins.getStr(999000211),[0,44],0));
         channelGroupLib.put(1002,new ChannelGroupVo(1002,LocaleMgr.ins.getStr(999000212),[1,11,44]));
         channelGroupLib.put(1004,new ChannelGroupVo(1004,LocaleMgr.ins.getStr(999000213),[3,44],3));
         channelGroupLib.put(1005,new ChannelGroupVo(1005,LocaleMgr.ins.getStr(999000214),[4,44],4));
         channelGroupLib.put(1006,new ChannelGroupVo(1006,LocaleMgr.ins.getStr(999000215),[5,44],5));
         channelGroupLib.put(1007,new ChannelGroupVo(1007,LocaleMgr.ins.getStr(999000216),[6,44],6));
         channelGroupLib.put(1008,new ChannelGroupVo(1008,LocaleMgr.ins.getStr(999000217),[7,44],7));
         if(EnvConfig.ins.hideForBS)
         {
            historyChannelArr = [1000,1001];
            sendChannelArr = [0];
         }
         else
         {
            historyChannelArr = [1000,1001,1004,1008];
            sendChannelArr = [0,3,7,8];
         }
      }
      
      public static function get ins() : nslm2.modules.foundations.chatModules.ChatConsts
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.foundations.chatModules.ChatConsts();
         }
         return _ins;
      }
      
      public static function channelIdTogpID(param1:int) : String
      {
         switch(int(param1))
         {
            case 0:
               return "1";
            default:
            default:
               return "";
            case 3:
            default:
            default:
            default:
               if(PlayerModel.ins.playerInfo.familyId)
               {
                  return PlayerModel.ins.playerInfo.familyId.toString();
               }
               return "";
            case 7:
               if(BattlefieldModel.ins.chatChannelId)
               {
                  return BattlefieldModel.ins.chatChannelId;
               }
               return "";
            case 8:
               if(PeakSportsModel.ins.chatChannelId)
               {
                  return PeakSportsModel.ins.chatChannelId;
               }
               return "";
         }
      }
      
      public static function channelIdTogpName(param1:int) : String
      {
         switch(int(param1))
         {
            case 0:
               return LocaleMgr.ins.getStr(999000218);
            default:
            default:
               return LocaleMgr.ins.getStr(999000222) + param1;
            case 3:
               return LocaleMgr.ins.getStr(999000219);
            case 4:
            default:
            default:
               return LocaleMgr.ins.getStr(999000220);
            case 7:
               return LocaleMgr.ins.getStr(999000221);
            case 8:
               return LocaleMgr.ins.getStr(999600100);
         }
      }
      
      public static function gpIdtoChannelId(param1:String) : int
      {
         var _loc2_:* = param1;
         if("1" !== _loc2_)
         {
            if(Uint64Util.toString(PlayerModel.ins.playerInfo.familyId) !== _loc2_)
            {
               if(BattlefieldModel.ins.chatChannelId !== _loc2_)
               {
                  if(PeakSportsModel.ins.chatChannelId !== _loc2_)
                  {
                     return 0;
                  }
                  return 8;
               }
               return 7;
            }
            return 3;
         }
         return 0;
      }
      
      public function getChannelVo(param1:int) : ChatChannelVo
      {
         return channelLib.getValue(param1);
      }
      
      public function getChannelGroupVo(param1:int) : ChannelGroupVo
      {
         return channelGroupLib.getValue(param1);
      }
   }
}
