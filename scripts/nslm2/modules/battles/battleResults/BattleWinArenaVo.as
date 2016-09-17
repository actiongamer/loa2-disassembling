package nslm2.modules.battles.battleResults
{
   public class BattleWinArenaVo
   {
       
      
      public var closeHandler;
      
      public var replayHandler;
      
      public var statisticHandler;
      
      public var selfTeamArr:Array;
      
      public var enemyTeamArr:Array;
      
      public function BattleWinArenaVo(param1:*, param2:* = null, param3:* = null, param4:Array = null, param5:Array = null)
      {
         super();
         closeHandler = param1;
         replayHandler = param2;
         statisticHandler = param3;
         selfTeamArr = param4;
         enemyTeamArr = param5;
      }
   }
}
