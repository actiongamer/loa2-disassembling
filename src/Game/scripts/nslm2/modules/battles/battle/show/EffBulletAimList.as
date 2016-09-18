package nslm2.modules.battles.battle.show
{
   import nslm2.modules.battles.battle.Player;
   import nslm2.modules.battles.battle.GameObjectManager;
   import nslm2.modules.battles.battle.Bullet;
   
   public class EffBulletAimList extends ShowBase
   {
       
      
      public function EffBulletAimList()
      {
         super();
      }
      
      override public function start(param1:Player, param2:Object) : void
      {
         var _loc4_:* = null;
         var _loc6_:* = null;
         if(GameObjectManager.effectOff && int(GameObjectManager.bulletOff))
         {
            return;
         }
         var _loc5_:Array = param1.aimList;
         var _loc8_:int = 0;
         var _loc7_:* = _loc5_;
         for each(var _loc3_ in _loc5_)
         {
            if(_loc3_ != param1.objId)
            {
               _loc4_ = gm.getPlayerId(_loc3_);
               if(_loc4_)
               {
                  _loc6_ = new Bullet();
                  _loc6_.init(param1,_loc4_,param2);
                  _loc6_.startup();
               }
            }
         }
      }
   }
}
