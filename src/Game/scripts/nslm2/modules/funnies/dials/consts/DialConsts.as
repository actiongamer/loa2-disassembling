package nslm2.modules.funnies.dials.consts
{
   import nslm2.modules.funnies.dials.panels.DialNormalPanel;
   import nslm2.modules.funnies.dials.panels.DialVipPanel;
   import nslm2.modules.funnies.dials.panels.DialRankPanel;
   import nslm2.modules.funnies.dials.panels.DialShopPanel;
   import nslm2.modules.funnies.newYears.day51s.panels.Day51ScorePanel;
   
   public class DialConsts
   {
      
      public static const VIEW_CLASSES:Array = [DialNormalPanel,DialVipPanel,DialRankPanel,DialShopPanel];
      
      public static const VIEW_CLASSES_CROSS:Array = [DialNormalPanel,DialVipPanel,DialRankPanel,DialShopPanel,Day51ScorePanel];
      
      public static const SPLIT_CNT:int = 12;
      
      public static const SHOP_KIND_ARR:Array = [2,1];
      
      public static const NORMAL_DIAL_KIND:int = 1;
      
      public static const VIP_DIAL_KIND:int = 2;
      
      public static const ONCE:int = 1;
      
      public static const TENTH:int = 2;
      
      public static const CAN_USE_VIP_DIAL_VIPLEVEL:int = 4;
      
      public static const SUPER_CNT:int = 10;
      
      public static const SHOP_COIN_ID2:int = 60590;
      
      public static const COST_TYPE_DIAMOND:int = 0;
      
      public static const COST_TYPE_TICKET:int = 1;
      
      public static const COST_TYPE_TICKET_AND_DIAMOND:int = 2;
      
      public static const IMG_SCORE:String = "img_score";
      
      public static const AUTO_REQUEST_RANK_GAP:int = 5;
      
      public static const TAB_NORMAL_DIAL:int = 0;
      
      public static const TAB_SUPER_DIAL:int = 1;
      
      public static const TAB_SHOP_DIAL:int = 3;
      
      public static const TAB_SCORE_DIAL:int = 4;
      
      public static const DISTANCE:int = 140;
      
      public static const TYPE_CROSS_SERVER:int = 60810;
      
      public static const TYPE_SINGLE_SERVER:int = 60800;
      
      public static const URL_TITLE_SINGLE:String = "png.uiDialModules.img_title";
      
      public static const URL_TITLE_CROSS:String = "png.uiDialModules.img_titleCross";
       
      
      public function DialConsts()
      {
         super();
      }
      
      public static function get timeKind_funny() : int
      {
         return 300000 + 30;
      }
      
      public static function get timeKind_all() : int
      {
         return 30;
      }
   }
}
