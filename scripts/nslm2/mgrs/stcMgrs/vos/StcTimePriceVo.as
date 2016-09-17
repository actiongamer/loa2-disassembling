package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcTimePriceVo extends StcVoBase
   {
      
      public static const KIND:String = "kind";
      
      public static const TIMES:String = "times";
      
      public static const KIND_STAMINA:int = 1;
      
      public static const KIND_GUILD_DUNGEON_TIMES:int = 3;
      
      public static const GUAJI_ENERGY:int = 4;
      
      public static const GUAJI_PVP_COUNT:int = 5;
      
      public static const FAMILY_BOSS_REVIVE:int = 7;
      
      public static const FAMILY_BOSS_IMM_FIGHT:int = 8;
      
      public static const PK_CROSS_SER:int = 9;
      
      public static const PK_CROSS_FINAL:int = 10;
      
      public static const PK_CROSS_CHEER:int = 11;
      
      public static const SHENYUAN_OPEN_BOX:int = 6;
      
      public static const NEW_YEAR_2016_BOSS:int = 12;
      
      public static const HERO_AWAKEN_ROAD:int = 13;
      
      public static const WORLD_BOSS_REVIVE:int = 15;
      
      public static const CITY_WAR_TICKET:int = 16;
      
      public static const CITY_WAR_TICKET_SUPER:int = 17;
      
      public static const GPK:int = 18;
      
      public static const SECRET_EXPLORE:int = 19;
      
      public static const TPKC:int = 20;
      
      public static const PET_AWAKEN_ROAD:int = 24;
      
      public static const AM_GRAB:int = 25;
      
      public static const AM_STEAL:int = 26;
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_time_price";
       
      
      public var id:int;
      
      public var kind:int;
      
      public var times:int;
      
      public var price:String;
      
      public function StcTimePriceVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         kind = param1[1];
         times = param1[2];
         price = param1[3];
      }
   }
}
