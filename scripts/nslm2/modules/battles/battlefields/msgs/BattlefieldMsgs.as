package nslm2.modules.battles.battlefields.msgs
{
   import flash.events.EventDispatcher;
   
   public class BattlefieldMsgs extends EventDispatcher
   {
      
      private static var _ins:nslm2.modules.battles.battlefields.msgs.BattlefieldMsgs;
      
      public static const MSG_BATTLEFIELD_KAZHUSHOU:String = "kazhushou";
      
      public static const MSG_BATTLEFIELD_INFO_CPL:String = "msgBattlefieldInfoCpl";
      
      public static const MSG_BATTLEFIELD_APPLY_CPL:String = "msgBattlefieldApplyCpl";
      
      public static const MSG_BATTLEFIELD_CREATE_TEAM_CPL:String = "msgBattlefieldCreateTeamCpl";
      
      public static const MSG_BATTLEFIELD_EXIT_CPL:String = "msgBattlefieldExitCpl";
      
      public static const MSG_BATTLEFIELD_TIMEOUT:String = "msgBattlefieldTimeOut";
      
      public static const MSG_BATTLEFIELD_PLAYERS_READY:String = "msgBattlefieldPlayersReady";
      
      public static const MSG_BATTLEFIELD_MEM_CHANGED:String = "msgBattlefieldMemChanged";
      
      public static const MSG_BATTLEFIELD_TEAM_DISMISSED:String = "msgBattlefieldTeamDismissed";
      
      public static const MSG_BATTLEFIELD_INVITED_CHANGED:String = "msgBattlefieldInvitedChanged";
      
      public static const MSG_BATTLEFIELD_REPORT_TAB_CHANGED:String = "msgBattlefieldReportTabChanged";
      
      public static const MSG_BATTLEFIELD_DEGREE_RANK_REWARD_CPL:String = "msgBattlefieldDegreeRankRewardCpl";
      
      public static const MSG_BATTLEFIELD_RANK_DATA_CPL:String = "msgBattlefieldRankDataCpl";
      
      public static const MSG_BATTLEFIELD_GET_RANK_PAGE_CPL:String = "msgBattlefieldGetRankPageCpl";
      
      public static const MSG_BATTLEFIELD_START:String = "msgBattlefieldStart";
      
      public static const MSG_BATTLEFIELD_ENTER_SCENE:String = "msgBattlefieldEnterScene";
      
      public static const MSG_BATTLEFIELD_GET_TASK_INFO_CPL:String = "msgBattlefieldGetTaskInfoCpl";
      
      public static const MSG_FIGHT_NEW_PLAYER:String = "msgFightNewPlayer";
      
      public static const MSG_FIGHT_PLAYER_LEAVE:String = "msgFightPlayerLeave";
      
      public static const MSG_FIGHT_PLAYER_POS_CHANGED:String = "msgFightPlayerPosChanged";
      
      public static const MSG_FIGHT_PLAYER_DIED:String = "msgFightPlayerDied";
      
      public static const MSG_FIGHT_PLAYER_REVIVED:String = "msgFightPlayerRevived";
      
      public static const MSG_FIGHT_INFO_CHANGED:String = "msgFightInfoChanged";
      
      public static const MSG_FIGHT_REPORT_CHANGED:String = "msgFightReportChanged";
      
      public static const MSG_FIGHT_FINISHED:String = "msgFightFinished";
      
      public static const MSG_FIGHT_HP_CHANGED:String = "msgFightHpChanged";
      
      public static const MSG_FIGHT_MINIMAP_NEW_IMAGE:String = "msgFightMinimapNewImage";
      
      public static const MSG_FIGHT_NEW_HORSE_LAMP:String = "msgFightNewHorseLamp";
      
      public static const MSG_FIGHT_CON_KILL:String = "msgFightConKill";
      
      public static const MSG_STOP_RUN:String = "msgStopRun";
      
      public static const MSG_BATTLE_START:String = "msgBattleStart";
      
      public static const MSG_BATTLE_END:String = "msgBattleEnd";
      
      public static const MSG_ERROR:String = "msgError";
      
      public static const MSG_CRY_BEGIN_GATHER:String = "msgCryBeginGather";
      
      public static const MSG_CRY_STOP_GATHER:String = "msgCryStopGather";
      
      public static const MSG_CRY_MINE_DRY_UP:String = "msgCryMineDryUp";
      
      public static const MSG_CRY_MINE_RESET:String = "msgCryMineReset";
      
      public static const MSG_CRY_SELF_GATHERED:String = "msgCrySelfGathered";
      
      public static const MSG_FLAG_PICKED_UP:String = "msg_flag_picked_up";
      
      public static const MSG_FLAG_RESET:String = "msg_flag_reset";
      
      public static const MSG_FLAG_OWNER_UPDATE:String = "MSG_FLAG_OWNER_UPDATE";
      
      public static const MSG_FLAG_STAUTS_UPDATE:String = "MSG_FLAG_STAUTS_UPDATE";
      
      public static const MSG_MONSTER_RESET:String = "msg_moster_reset";
      
      public static const MSG_MONSTER_DIE:String = "MSG_MONSTER_DIE";
      
      public static const MSG_SIDE_BUFF_CHANGE:String = "MSG_MONSTER_BUFF_CHANGE";
      
      public static const MSG_MONSTER_COUNT_CHANGE:String = "MSG_MONSTER_COUNT_CHANGE";
       
      
      public function BattlefieldMsgs()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.battles.battlefields.msgs.BattlefieldMsgs
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.battles.battlefields.msgs.BattlefieldMsgs();
         }
         return _ins;
      }
   }
}
