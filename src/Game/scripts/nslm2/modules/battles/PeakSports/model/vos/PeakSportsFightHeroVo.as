package nslm2.modules.battles.PeakSports.model.vos
{
   import proto.BattlePlayer;
   
   public class PeakSportsFightHeroVo
   {
       
      
      public var battlePlayer:BattlePlayer;
      
      public var isEnd:Boolean;
      
      public function PeakSportsFightHeroVo(param1:BattlePlayer, param2:Boolean)
      {
         super();
         battlePlayer = param1;
         isEnd = param2;
      }
      
      public static function createFightHeroArr(param1:Array, param2:Boolean = false) : Array
      {
         var _loc4_:Array = [];
         var _loc6_:int = 0;
         var _loc5_:* = param1;
         for(var _loc3_ in param1)
         {
            _loc4_[_loc3_] = new PeakSportsFightHeroVo(param1[_loc3_],param2);
         }
         return _loc4_;
      }
   }
}
