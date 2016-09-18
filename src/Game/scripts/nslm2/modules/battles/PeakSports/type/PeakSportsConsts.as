package nslm2.modules.battles.PeakSports.type
{
   import com.mz.core.utils.DictHash;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class PeakSportsConsts
   {
      
      public static const SIDE_BLUE:int = 1;
      
      public static const SIDE_RED:int = 2;
      
      public static const SIDE_ALL:int = 99;
      
      public static const LEFT_GEMSTONE:int = 9002;
      
      public static const CENTER_GEMSTONE:int = 9003;
      
      public static const RIGHT_GEMSTONE:int = 9004;
      
      public static const LOCAL_RANK:int = 1;
      
      public static const CROSS_RANK:int = 2;
      
      public static const START_TIME:int = 13;
      
      public static const END_TIME:int = 23;
      
      public static const PLAYER_STATE_INVITED:int = 1;
      
      public static const PLAYER_STATE_INTEAM:int = 2;
      
      public static const PLAYER_STATE_NOTINVITED:int = 3;
      
      public static const BATTLEFIELD_ID_CRYSTAL:int = 1000;
      
      public static const BATTLEFIELD_ID_FLAG:int = 1001;
      
      public static const MODULE_BOTTOM_ARR:Array = [50504,50505,50503];
      
      public static const MODULE_TOP_RIGHT_ARR:Array = [50506,50502];
      
      public static const OPEN_DATE_ALLDAY:int = 0;
      
      public static const OPEN_DATE_SINGLE:int = 1;
      
      public static const OPEN_DATE_EVEN:int = 2;
      
      public static const SIDE_NAME_PREFIX:int = 50500900;
      
      public static const REPORT_LIST_DATA:Array = [99,1,2];
      
      public static const RANK_NAME:Array = [50500122,50500123,50500124];
      
      public static const BATTLEFIELD_CAN_CLICK_DIS:int = 255;
      
      public static const BATTLEFIELD_CLICK_RANGE:int = 100;
      
      public static const STATUS_DIED:int = 0;
      
      public static const STATUS_ALIVE:int = 1;
      
      public static const SEND_POS_TIME_CD:int = 500;
      
      public static const BG_BLUE_START_PATH:int = 1;
      
      public static const BG_RED_START_PATH:int = 2;
      
      public static const BG_ALL_START_PATH:int = 3;
      
      public static const BG_READY_PATH:int = 0;
      
      public static const DOUBLE_KILL_NUM:int = 2;
      
      public static const TRIPPLE_KILL_NUM:int = 3;
      
      public static const KILLING_SPREE_NUM:int = 5;
      
      public static const UNSTOPPABLE_NUM:int = 8;
      
      public static const HOLY_SHIT_NUM:int = 12;
      
      public static const BATTLE_PROTECT_GAP_TIME:int = 2;
      
      public static const FOG_BUFF_ID:int = 1;
      
      public static const MINIMAP_WIDTH:uint = 200;
      
      public static const MINIMAP_HEIGHT:uint = 182;
      
      public static const CHAT_TIPS_CD:uint = 2;
      
      private static var _openDateDict:DictHash;
       
      
      public function PeakSportsConsts()
      {
         super();
      }
      
      public static function get openDate() : DictHash
      {
         if(_openDateDict == null)
         {
            _openDateDict = new DictHash();
            _openDateDict.put(0,LocaleMgr.ins.getStr(50500102));
            _openDateDict.put(1,LocaleMgr.ins.getStr(50500103));
            _openDateDict.put(2,LocaleMgr.ins.getStr(50500104));
         }
         return _openDateDict;
      }
   }
}
