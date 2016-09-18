package nslm2.mgrs.stcMgrs.consts
{
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcStageVo;
   
   public class StcStageConsts
   {
      
      public static const DUNGEON_ONCE:int = 1;
      
      public static const DUNGEON:int = 2;
      
      public static const DUNGEON_ELITE:int = 3;
      
      public static const MAIN_CITY:int = 4;
      
      public static const CROSS_SCENE_MAIN_CITY:int = 41;
      
      public static const RESOURCE_DUNGEON:int = 5;
      
      public static const GUILD_DUNGEON:int = 6;
      
      public static const GUILD_BOSS_SCENE:int = 10;
      
      public static const WORLD_BOSS_SCENE:int = 13;
      
      public static const BATTLE_REPORT:int = 20;
       
      
      public function StcStageConsts()
      {
         super();
      }
      
      public static function isNormalDgStage(param1:int) : Boolean
      {
         var _loc2_:StcStageVo = StcMgr.ins.getStageVo(param1);
         if(_loc2_ == null)
         {
            return true;
         }
         if(_loc2_.kind == 3)
         {
            return false;
         }
         return true;
      }
   }
}
