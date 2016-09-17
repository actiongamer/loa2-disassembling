package nslm2.modules.foundations.recycle.consts
{
   import flash.geom.Point;
   
   public class RecycleConsts
   {
      
      public static const MAX_REC_CNT:int = 5;
      
      public static const AUTO_ADD_QUALITY_MAX:int = 3;
      
      public static const SHOW_RED_POINT_CNT:int = 5;
      
      public static const REC_TYPE_HERO:int = 0;
      
      public static const REC_TYPE_EQUIP:int = 1;
      
      public static const REC_TYPE_HERO_REBORN:int = 2;
      
      public static const REC_TYPE_TREASURE_REBORN:int = 3;
      
      public static var REC_TYPE_EQUIP_REBORN:int = 4;
      
      public static var REC_TYPE_TREASURE:int = 5;
      
      public static const REC_TYPE_MIRROR:int = 6;
      
      public static const REC_TYPE_PET:int = 7;
      
      public static const MIRROR_COSTHERO_POS:Point = new Point(-198,-121);
      
      public static const MIRROR_REWARDHERO_POS:Point = new Point(198,-121);
      
      public static const MIRROR_LEFT_BG_POS:Point = new Point(-196,27);
      
      public static const MIRROR_RIGHT_BG_POS:Point = new Point(196,27);
      
      public static const MIRROR_BOTTOM_POS:Point = new Point(0,-83);
      
      public static const MIRROR_STATE_CHOOSE_COST:int = 0;
      
      public static const MIRROR_STATE_CHOOSE_REWARD:int = 1;
      
      public static const MIRROR_STATE_WAIT_CHANGE:int = 2;
      
      public static const MIRROR_STATE_CHANGE_CPL:int = 3;
      
      public static const CAN_CHANGE_HERO_QUALITY:Array = [5];
       
      
      public function RecycleConsts()
      {
         super();
      }
   }
}
