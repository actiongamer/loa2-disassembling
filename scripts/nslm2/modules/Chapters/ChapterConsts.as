package nslm2.modules.Chapters
{
   public class ChapterConsts
   {
      
      public static const MSG_PLAY_CHAPTER_SCRIPT:String = "msgPlayChapterScript";
      
      public static const EVT_NEW_DUNGEON:String = "evtNewDungeon";
      
      public static const EVT_CHAPTER_CPL:String = "evtChapterCpl";
      
      public static const EVT_CHAPTER_CPL_EFFECT_CPL:String = "evtChapterEffectCpl";
      
      public static const EVT_CHAPTER_STAR_CNT_ADDED:String = "evtChapterStarCntAdded";
      
      public static const EVT_CHAPTER_STAR_GLOBAL_POS:String = "evtChapterStarGlobalPos";
      
      public static const EVT_CHAPTER_TAB_CHANGED:String = "evtChapterTabChanged";
      
      public static const EVT_SHOW_STAGE_INFO:String = "evtShowStageInfo";
      
      public static const EVT_FIGHT:String = "evtFight";
      
      public static const EVT_ELITE_INFO_REFRESHED:String = "evtEliteInfoRefreshed";
      
      public static const EVT_SHOW_TARGET_STAGE:String = "evtShowTargetStage";
      
      public static const EVT_CHAPTER_REWARD_INFO_CPL:String = "evtChapterRewardInfoCpl";
      
      public static const EVT_STAGE_COUNT_CHANGE:String = "evtStageCountChange";
      
      public static const EVT_SAODANG_CPL:String = "evtSaodangCpl";
      
      public static const EVT_CHAPTER_SELECT_CHANGED:String = "evtChapterSelectChanged";
      
      public static const EVT_CHAPTER_SELECT_EFFECT_CPL:String = "evtChapterSelectEffectCpl";
      
      public static const EVT_DUNGEON_INFO_CLOSE:String = "evtDungeonInfoClose";
      
      public static const EVT_SHOW_MAP_MODULE:String = "showMapModule";
      
      public static const URL_ELITE_TITLE_BG:String = "png.uiChapter.dungeonMap.img_elite";
      
      public static const URL_NORMAL_FRAME:String = "png.uiChapter.dungeonMap.img_normalBg";
      
      public static const URL_ELITE_FRAME:String = "png.uiChapter.dungeonMap.img_eliteBg";
      
      public static const URL_SINGLE_DROP_BG:String = "png.uiChapter.dungeonMap.img_dropBgSingleLine";
      
      public static const URL_DROP_BG:String = "png.uiChapter.dungeonMap.img_dropBg";
      
      public static const FLAG:String = "flag";
      
      public static const SAO_DANG:String = "saoDang";
      
      public static const TREASURE_BOX:String = "treasureBox";
      
      public static const BOX:String = "box";
      
      public static const ALL:String = "all";
      
      public static const CHAPTER_TYPE_NORMAL:int = 1;
      
      public static const CHAPTER_TYPE_ELITE:int = 2;
      
      public static const ELITE_TITLEBG_Y:int = -8;
      
      public static const ELITE_TITLEBG_X:int = -8;
      
      public static const CHAPTER_TYPELIB:Array = [1,2];
      
      public static const FLAG_EFFECT_OFFSET_Y:int = 20;
      
      public static const CHAPTER_ROUTE_MC_FRAME:int = 80;
      
      public static const STATE_ONLY_FIGHT:int = 5;
      
      public static const STATE_CAN_SAODANG:int = 2;
      
      public static const STATE_SAODANGING:int = 3;
      
      public static const STATE_RESET:int = 4;
      
      public static const CAN_SAODANG_MAXTIMES:int = 10;
      
      public static const SHOW_ELITE_ALERT_MAX_LEVEL:int = 20;
      
      public static const NORMAL_NEED_SHOW_DROP_KIND:Array = [81,51,99];
      
      public static const ELITE_NEED_SHOW_DROP_KIND:Array = [1,3,2,4,51,21,99];
      
      public static const FIRST_CHAPTER_ID:int = 100;
       
      
      public function ChapterConsts()
      {
         super();
      }
   }
}
