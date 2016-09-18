package nslm2.modules.foundations.miniMaps
{
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class MiniMapConst
   {
      
      public static const MINIMAP_NPC_DOT:String = "png.uiMiniMap.圆点";
      
      public static const MINIMAP_NPC_ATTENTION:String = "png.uiMiniMap.感叹号";
      
      public static const MINIMAP_MINE:String = "png.uiMiniMap.img_mine";
      
      public static const MINIMAP_SPECIAL_MINE:String = "png.uiMiniMap.img_speMine";
      
      public static const MINIMAP_BLUE:String = "png.uiMiniMap.img_friend";
      
      public static const MINIMAP_RED:String = "png.uiMiniMap.img_enemy";
      
      public static const MINIMAP_SELF:String = "png.uiMiniMap.img_self";
      
      public static const MINIMAP_BLUE_FLAG:String = "png.uiMiniMap.img_blueFlag";
      
      public static const MINIMAP_YELLOW_FLAG:String = "png.uiMiniMap.img_yellowFlag";
      
      public static const MINIMAP_YELLOW_FLAG1:String = "png.uiMiniMap.img_yellowFlag1";
      
      public static const MINIMAP_YELLOW_FLAG2:String = "png.uiMiniMap.img_yellowFlag2";
      
      public static const MINIMAP_RED_FLAG:String = "png.uiMiniMap.img_redFlag";
      
      public static const MINIMAP_MONSTER:String = "png.uiMiniMap.img_monster";
       
      
      public function MiniMapConst()
      {
         super();
      }
      
      public static function get HINT_BOX_ARR() : Array
      {
         var _loc1_:Array = [LocaleMgr.ins.getStr(621001),LocaleMgr.ins.getStr(621002),LocaleMgr.ins.getStr(621009),LocaleMgr.ins.getStr(621010),LocaleMgr.ins.getStr(621005),LocaleMgr.ins.getStr(621011)];
         return _loc1_;
      }
   }
}
