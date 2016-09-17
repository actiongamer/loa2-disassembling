package nslm2.modules.funnies.pkCrossSer.PKCrossComp
{
   import nslm2.modules.battles.battleResults.BattleWinArenaVo;
   
   public class PKCrossResultVo
   {
       
      
      public var vo:BattleWinArenaVo;
      
      public var isWin:Boolean;
      
      public var rewardStr:String;
      
      public var losserStr:String;
      
      public function PKCrossResultVo(param1:BattleWinArenaVo, param2:Boolean, param3:String, param4:String = "")
      {
         super();
         vo = param1;
         isWin = param2;
         rewardStr = param3;
         losserStr = param4;
      }
   }
}
