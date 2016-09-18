package nslm2.modules.funnies.families.familyBosses.consts
{
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class FamilyBossConsts
   {
      
      public static const STAUTS_READY:int = 4;
      
      public static const STAUTS_START:int = 5;
      
      public static const STAUTS_WAIT_NEXT_WAVE:int = 6;
      
      public static const STAUTS_END:int = 7;
      
      public static const BOSS_BORN_POS:Array = [new Point(1180,380),new Point(1643,630),new Point(1770,660)];
      
      public static const BOSS_POS_CENTER:Point = new Point(1400,500);
      
      public static const PLAYER_REBORN_RECT:Rectangle = new Rectangle(70,810,720,360);
      
      public static const FAMILY_BOSS_GULI_TYPE_NORMAL:int = 1;
      
      public static const FAMILY_BOSS_GULI_TYPE_SUPER:int = 2;
      
      public static const FAMILY_BOSS_MODEL_SIMPLEREPORT:int = 1;
      
      public static const FAMILY_BOSS_MODEL_AUTOFIGHT:int = 2;
      
      public static const FIGHT_STAGE_ID:int = 30100;
      
      public static const FIGHT_MAP_ID:int = 100;
       
      
      public function FamilyBossConsts()
      {
         super();
      }
   }
}
