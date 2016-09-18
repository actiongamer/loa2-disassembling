package nslm2.modules.foundations.activities.consts
{
   import nslm2.modules.foundations.activities.panel.ActivityNormalPanel;
   import nslm2.modules.foundations.activities.panel.ActivityLinkPanel;
   
   public class ActivityConsts
   {
      
      public static const EVT_REWARD_CPL:String = "evtRewardCpl";
      
      public static const EVT_GET_INFO_CPL:String = "evtGetInfoCpl";
      
      public static const REPEATED_CHARGE_UPDATED:String = "repeated_charge_updated";
      
      public static const TITLE_BG_INIT:String = "png.uiActivity.img_titleInitBg";
      
      public static const MODULEID:String = "moduleId";
      
      public static const STATUS_CPL:int = 3;
      
      public static const STATUS_CAN_REWARD:int = 2;
      
      public static const STATUS_CAN_NOT_REWARD:int = 1;
      
      public static const KIND_LANG_PREFIX:int = 60500000;
      
      public static const NORMAL_TYPE:int = 1;
      
      public static const LINK_TYPE:int = 2;
      
      public static const idArr:Array = [1,2];
      
      public static const panelArr:Array = [ActivityNormalPanel,ActivityLinkPanel];
      
      public static const notShowProgressArr:Array = [2,1001,1000,1018,1019,1009,1010,1011,1012,1013,1020,1023,1025,1036,1021,1022,1030,5010];
      
      public static const exchangeArr:Array = [1007,1008,1028,1029,5007,5008];
      
      public static var newExchangeArr:Array = [];
      
      public static const repeatExchangeArr:Array = [1015];
      
      public static const exchangeArrWithVip:Array = [1028];
      
      public static const exchangeArrWithCharge:Array = [1029];
      
      public static const genderInfoArr:Array = [1007,1008];
      
      public static const showParam2Arr:Array = [43,5009];
      
      public static const autoFilterArr:Array = [1000,47];
       
      
      public function ActivityConsts()
      {
         super();
      }
   }
}
