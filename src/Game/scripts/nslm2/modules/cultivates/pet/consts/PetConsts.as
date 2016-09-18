package nslm2.modules.cultivates.pet.consts
{
   import flash.geom.Point;
   
   public class PetConsts
   {
      
      public static const PET_NPC_KIND:int = 21;
      
      public static const PET_ON_BATTLE:int = 1;
      
      public static const PET_OFF_BATTLE:int = 2;
      
      public static const PET_ON_BATTLE_POS:int = 7;
      
      public static const PET_AVATAR_POS_BASE:Point = new Point(-65,-460);
      
      public static const PET_AVATAR_POS_CULTIVATE:Point = new Point(30,-460);
      
      public static const PET_AVATAR_POS_BLESS:Point = new Point(30,-460);
      
      public static const NAME_TILE_BOX_X:Array = [230,340,340,340,230];
      
      public static const STAR_STONE_ID:int = 60610;
      
      public static const EXTEND_MODE_CANCEL:String = "extend_mode_cancel";
      
      public static const LIST_MAX_STAR:int = 10;
      
      public static const SERVER_FOLLOW_KIND_1:int = 1;
      
      public static const SERVER_FOLLOW_KIND_2:int = 2;
      
      public static const AWAKE_LIGHT_BG_PRE:String = "png.uiPet.img_lightBg";
      
      public static const AWAKE_DARK_BG_PRE:String = "png.a5.commonImgs.petAwake.img_darkBg";
      
      public static const AWAKE_NODE_STATUS_IDLE:int = 1;
      
      public static const AWAKE_NODE_STATUS_EQUIPED:int = 2;
      
      public static const AWAKE_NODE_STATUS_CAN_EQUIP:int = 3;
      
      public static const AWAKE_NODE_STATUS_LEVEL_NOT_ENOUGH:int = 4;
      
      public static const AWAKE_NODE_CNT:int = 10;
      
      public static const PET_AWAKE_CENTER_X:int = 161;
      
      public static const PET_AWAKE_CENTER_Y:int = 129;
      
      public static const PET_SUB_BASE:int = 32000;
      
      public static const PET_SUB_LVL_UP:int = 32010;
      
      public static const PET_SUB_PHASE_UP:int = 32020;
      
      public static const PET_SUB_STAR_UP:int = 32030;
      
      public static const PET_SUB_AWAKE:int = 32050;
      
      public static const PET_SUB_BLESS:int = 32040;
       
      
      public function PetConsts()
      {
         super();
      }
   }
}
