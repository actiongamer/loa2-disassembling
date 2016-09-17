package nslm2.modules.battles.battle.show
{
   import nslm2.modules.battles.battle.Player;
   import nslm2.modules.battles.battle.GameObjectManager;
   
   public class ShowBase
   {
       
      
      public function ShowBase()
      {
         super();
      }
      
      public function start(param1:Player, param2:Object) : void
      {
      }
      
      protected function get gm() : GameObjectManager
      {
         return GameObjectManager.Instance;
      }
   }
}
