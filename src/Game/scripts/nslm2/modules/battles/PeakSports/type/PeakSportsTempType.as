package nslm2.modules.battles.PeakSports.type
{
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   
   public class PeakSportsTempType
   {
      
      public static const playerLimit:uint = 6;
      
      public static const resLimit:uint = DefindConsts.BATTLE_KING_VICTORY_SCORE;
      
      public static const battleTime:uint = DefindConsts.BATTLE_KING_STAGE_MAX_TIME;
      
      public static const dieModelTime:uint = DefindConsts.BATTLE_KING_DEAD_MOD_TIME;
      
      public static const BK_CONFIRM_TIME = DefindConsts.BATTLE_KING_STAGE_WAIT_TIME;
      
      public static const PROGRESS_VALUE:String = DefindConsts.BATTLE_KING_FLAG_PROGRESS_MAX;
      
      public static const BK_WAITING_TIME = DefindConsts.BATTLE_KING_STAGE_WAIT_TIME;
       
      
      public function PeakSportsTempType()
      {
         super();
      }
      
      public static function getLimitProgress(param1:int) : int
      {
         var _loc2_:* = null;
         var _loc4_:* = 0;
         var _loc3_:Array = PROGRESS_VALUE.split("|");
         _loc4_ = uint(0);
         while(_loc4_ < _loc3_.length)
         {
            _loc2_ = _loc3_[_loc4_].split(":");
            if(int(_loc2_[0]) == param1)
            {
               return int(_loc2_[1]);
            }
            _loc4_++;
         }
         return 0;
      }
   }
}
