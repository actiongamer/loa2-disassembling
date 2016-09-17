package nslm2.modules.battles.battle.show
{
   import nslm2.modules.battles.battle.Player;
   import nslm2.modules.battles.battle.GameObjectManager;
   
   public class EffChainInit extends ShowBase
   {
       
      
      public function EffChainInit()
      {
         super();
      }
      
      override public function start(param1:Player, param2:Object) : void
      {
         if(GameObjectManager.effectOff)
         {
            return;
         }
         param1.initChainEff(param2);
      }
   }
}
