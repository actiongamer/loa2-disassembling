package nslm2.modules.battles.battleResults
{
   public class BattleResultGlobel
   {
      
      private static var _ins:nslm2.modules.battles.battleResults.BattleResultGlobel;
       
      
      public var doubleId:int;
      
      public function BattleResultGlobel()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.battles.battleResults.BattleResultGlobel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.battles.battleResults.BattleResultGlobel();
         }
         return _ins;
      }
   }
}
