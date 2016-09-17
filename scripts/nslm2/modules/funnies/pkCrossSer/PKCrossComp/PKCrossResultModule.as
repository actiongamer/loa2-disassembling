package nslm2.modules.funnies.pkCrossSer.PKCrossComp
{
   import nslm2.modules.battles.battleResults.BattleWinArenaModule;
   import morn.core.utils.StringUtils;
   
   public class PKCrossResultModule extends BattleWinArenaModule
   {
       
      
      public function PKCrossResultModule()
      {
         super();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc2_:PKCrossResultVo = param1 as PKCrossResultVo;
         super.preShow(_loc2_.vo);
         this.txt_winRank.size = 20;
         this.txt_winRank.color = 65280;
         this.txt_winRank.text = _loc2_.rewardStr;
         this.txt_lossRank.text = "";
         if(!StringUtils.isNull(_loc2_.losserStr))
         {
            this.txt_lossRank.size = 20;
            this.txt_lossRank.color = 16711680;
            this.txt_lossRank.text = _loc2_.losserStr;
         }
      }
   }
}
