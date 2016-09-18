package nslm2.modules.funnies.arenas
{
   public class ArenaChallengeResultVo
   {
       
      
      public var rewardDiamond:int;
      
      public var isFirstToRank:Boolean;
      
      public var challengeRank:int;
      
      public var upedRank:int;
      
      public var isWin:Boolean;
      
      public function ArenaChallengeResultVo(param1:int, param2:int, param3:int, param4:Boolean, param5:Boolean)
      {
         super();
         challengeRank = param1;
         upedRank = param2;
         rewardDiamond = param3;
         isFirstToRank = param4;
         isWin = param5;
      }
   }
}
