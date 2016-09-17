package nslm2.common.globals
{
   import proto.StagePhaseCheckReq;
   import nslm2.modules.foundations.playerHeaders.PlayerHeader;
   import flash.display.DisplayObject;
   import morn.core.components.Component;
   import nslm2.modules.foundations.mainToolBar.MainBottomIconModule;
   import nslm2.modules.Chapters.ChapterModuleInitVo;
   import nslm2.modules.footstones.loadingModules.LoadingModule;
   import morn.core.components.List;
   import nslm2.modules.funnies.mainCities.MainCityReshowParam;
   
   public class GlobalRef
   {
      
      public static var skipAllScript:Boolean = false;
      
      public static var firstBattleReqArr:Vector.<StagePhaseCheckReq> = new Vector.<StagePhaseCheckReq>();
      
      public static var playerHeader:PlayerHeader;
      
      public static var playerHeader_icon_gold:DisplayObject;
      
      public static var playerHeader_icon_diamond:DisplayObject;
      
      public static var playerHeader_icon_military:DisplayObject;
      
      public static var playerHeader_icon_stamina:DisplayObject;
      
      public static var bottom_icon_guaji_coin:DisplayObject;
      
      public static var bottom_icon_arena_coin:DisplayObject;
      
      public static var bottom_icon_shenYuanCoin:DisplayObject;
      
      public static var bottom_icon_pkcrossCoin:DisplayObject;
      
      public static var bottom_icon_GPKCoin:DisplayObject;
      
      public static var bottom_icon_tpkcCoin:DisplayObject;
      
      public static var playerHeader_icon_fullscreen:Component;
      
      public static var bottomModuleBtns:MainBottomIconModule;
      
      public static var bottom_icon_SecretExplore:DisplayObject;
      
      public static var icon_secretExplore_point:DisplayObject;
      
      public static var chapterModuleShowAgainVo:ChapterModuleInitVo;
      
      public static var exitFromBattleReportModule:Boolean;
      
      public static var needShowVip:Boolean;
      
      public static var loadingModule:LoadingModule;
      
      public static var isInBattleModule:Boolean;
      
      public static var hint_list:List;
      
      public static var RAM_MAX:int = 999111222;
      
      public static var needShowAutoAlert:Boolean = true;
      
      public static var needAutoRefresh:Boolean = false;
      
      public static var mainCityReshowParam:MainCityReshowParam = new MainCityReshowParam();
       
      
      public function GlobalRef()
      {
         super();
      }
   }
}
