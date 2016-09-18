package nslm2.modules.battles.battle.show
{
   import nslm2.modules.battles.battle.Player;
   import nslm2.modules.battles.battle.GameObjectManager;
   import nslm2.modules.battles.battle.Bullet;
   
   public class EffBulletTarget extends ShowBase
   {
       
      
      public function EffBulletTarget()
      {
         super();
      }
      
      override public function start(param1:Player, param2:Object) : void
      {
         var _loc4_:* = null;
         if(GameObjectManager.effectOff && int(GameObjectManager.bulletOff))
         {
            return;
         }
         var _loc3_:Player = gm.getPlayerId(param1.tarId);
         if(_loc3_)
         {
            _loc4_ = new Bullet();
            _loc4_.init(param1,_loc3_,param2);
            _loc4_.startup();
         }
      }
   }
}
