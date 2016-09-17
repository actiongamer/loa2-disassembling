package nslm2.modules.funnies.worldBoss.consts
{
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class WorldBossConsts
   {
      
      public static const STAUTS_READY:int = 4;
      
      public static const STAUTS_START:int = 5;
      
      public static const STAUTS_WAIT_NEXT_WAVE:int = 6;
      
      public static const STAUTS_END:int = 7;
      
      public static const BOSS_BORN_POS:Array = [new Point(2620,600),new Point(2620,600),new Point(2620,600)];
      
      public static const BOSS_POS_CENTER:Point = new Point(2620,600);
      
      public static const PLAYER_REBORN_RECT:Rectangle = new Rectangle(70,450,1000,300);
      
      public static const WORLD_BOSS_GULI_TYPE_NORMAL:int = 1;
      
      public static const WORLD_BOSS_GULI_TYPE_SUPER:int = 2;
      
      public static const WORLD_BOSS_MODEL_SIMPLEREPORT:int = 1;
      
      public static const WORLD_BOSS_MODEL_AUTOFIGHT:int = 2;
      
      public static const FIGHT_MAP_ID:int = 9001;
       
      
      public function WorldBossConsts()
      {
         super();
      }
   }
}
