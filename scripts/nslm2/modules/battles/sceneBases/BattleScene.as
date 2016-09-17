package nslm2.modules.battles.sceneBases
{
   import game.ui.fightPlayers.BattleSceneUI;
   import nslm2.modules.dungeons.NumScroll;
   
   public class BattleScene extends BattleSceneUI
   {
       
      
      private var numScroll:NumScroll;
      
      private var _turnCount:int;
      
      public function BattleScene()
      {
         super();
         numScroll = new NumScroll(this.txt_turn);
         this.turnCount = 0;
      }
      
      public function get turnCount() : int
      {
         return _turnCount;
      }
      
      public function set turnCount(param1:int) : void
      {
         _turnCount = param1;
         this.numScroll.value = param1;
      }
      
      override public function dispose() : void
      {
         numScroll.dispose();
         super.dispose();
      }
   }
}
