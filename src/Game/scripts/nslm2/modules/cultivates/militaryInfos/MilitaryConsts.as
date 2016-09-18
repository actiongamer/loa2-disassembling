package nslm2.modules.cultivates.militaryInfos
{
   import flash.geom.Point;
   
   public class MilitaryConsts
   {
      
      public static const MAX_ITEM_COUNT:int = 5;
      
      public static const PER_MILITARY_COUNT:int = 5;
      
      public static const MILITARY_TYPE_ADDPROP:int = 1;
      
      public static const MILITARY_TYPE_CHANGEQUALITY:int = 2;
      
      public static const FIRST_MILITARY_ID:int = 100;
      
      public static const SHOW_TITLE_KIND_0_SCENE_ARRAY:Array = [41700,40740];
      
      public static const EVT_UPGRADE_CPL:String = "evtUpgradeCpl";
      
      public static const EVT_CHANGE_PLAYER_NAME_COLOR:String = "evtChangePlayerNameColor";
      
      public static const EVT_PLAYER_HEADER_REFRESH:String = "evtPlayerHeaderRefresh";
      
      public static const EVT_GET_INFO_CPL:String = "evtGetInfoCpl";
      
      public static const EVT_MILITARY_ROLL_IN:String = "evtMilitaryRollIn";
      
      public static const EVT_MILITARY_ROLL_OUT:String = "evtMilitaryRollOut";
      
      public static const floatOffsetPoi:Point = new Point(-72);
      
      public static const iconCntPerPage:int = 5;
       
      
      public function MilitaryConsts()
      {
         super();
      }
   }
}
