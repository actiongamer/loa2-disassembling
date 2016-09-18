package nslm2.modules.battles.PeakSports.type
{
   import flash.events.EventDispatcher;
   
   public class PeakSportsMsgs extends EventDispatcher
   {
      
      private static var _ins:nslm2.modules.battles.PeakSports.type.PeakSportsMsgs;
      
      public static const MSG_PEAK_SPORTS_INFO_CPL:String = "msgPeakSportsInfoCpl";
      
      public static const MSG_PEAK_SPORTS_APPLY_CPL:String = "msgPeakSportsApplyCpl";
      
      public static const MSG_PEAK_SPORTS_EXIT_CPL:String = "msgPeakSportsExitCpl";
      
      public static const MSG_PEAK_SPORTS_START:String = "msgPeakSportsStart";
      
      public static const MSG_BATTLEFIELD_REPORT_TAB_CHANGED:String = "msgPeakSportsReportTabChanged";
      
      public static const MSG_BATTLEFIELD_ENTER_SCENE:String = "msgPeakSportsEnterScene";
      
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
      
      public static const MSG_STOP_RUN:String = "msgStopRun";
      
      public static const MSG_BATTLE_START:String = "msgBattleStart";
      
      public static const MSG_BATTLE_END:String = "msgBattleEnd";
      
      public static const MSG_ERROR:String = "msgError";
      
      public static const PEAK_SPORTS_STEP:String = "peakSportsStep";
      
      public static const PEAK_SPORTS_PATTERN_INFO:String = "peakSportsPatternInfo";
       
      
      public function PeakSportsMsgs()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.battles.PeakSports.type.PeakSportsMsgs
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.battles.PeakSports.type.PeakSportsMsgs();
         }
         return _ins;
      }
   }
}
