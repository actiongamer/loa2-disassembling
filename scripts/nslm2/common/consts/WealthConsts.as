package nslm2.common.consts
{
   public class WealthConsts
   {
      
      public static const NONE:int = 0;
      
      public static const GOLD:int = 1;
      
      public static const STAMINA:int = 2;
      
      public static const DIAMOND:int = 3;
      
      public static const DIAMOND_BIND:int = 4;
      
      public static const ARENA_COIN:int = 5;
      
      public static const GUILD_CONTRIBUTION:int = 6;
      
      public static const GUAJI_COIN:int = 7;
      
      public static const GUAJI_ENERGY:int = 8;
      
      public static const GOLDEN_DIAMOND:int = 9;
      
      public static const PLAYER_EXP:int = 10;
      
      public static const HERO_EXP:int = 11;
      
      public static const SHENYUAN_COIN:int = 12;
      
      public static const HONOR:int = 14;
      
      public static const HERO_SOUL:int = 15;
      
      public static const PK_CROSS_COIN:int = 17;
      
      public static const GPK_COIN:int = 18;
      
      public static const TPKC_COIN:int = 19;
      
      public static const ITEM:int = 20;
      
      public static const MAGIC_POINT:int = 21;
      
      public static const DIAL_COIN:int = 31;
      
      public static const SE_COIN:int = 33;
      
      public static const SECRET_EXPLORE_POINT:int = 34;
      
      public static const LUCKTREE_COIN:int = 35;
      
      public static const DAY51_COIN:int = 36;
      
      public static const PET_AWAKEN_COIN:int = 42;
      
      public static const ARTIFACT_MINED_COIN:int = 50;
      
      public static const TASK_SCORE:int = 22;
      
      public static const NPC:int = 30;
      
      public static const TREASURE:int = 2121;
      
      public static const NPC_PROP:int = 3333;
      
      public static const FIGHT_VALUE:int = 5386;
      
      public static const STAMINA_MAX:int = 2222;
      
      public static const LV:int = 1010;
      
      public static const EMPTY:int = 999999;
      
      public static const SHENYUAN_STAR:int = 4444;
      
      public static const GUILD_CON:int = 4445;
      
      public static const GROUPON_COUPON:int = 27;
      
      public static const GROUPON_SCORE:int = 28;
      
      private static var _ins:nslm2.common.consts.WealthConsts;
       
      
      public function WealthConsts()
      {
         super();
      }
      
      public static function get ins() : nslm2.common.consts.WealthConsts
      {
         if(_ins == null)
         {
            _ins = new nslm2.common.consts.WealthConsts();
         }
         return _ins;
      }
   }
}
