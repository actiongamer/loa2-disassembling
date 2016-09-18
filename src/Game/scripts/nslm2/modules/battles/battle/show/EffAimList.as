package nslm2.modules.battles.battle.show
{
   import nslm2.modules.battles.battle.Player;
   import nslm2.modules.battles.battle.GameObjectManager;
   
   public class EffAimList extends ShowBase
   {
       
      
      public function EffAimList()
      {
         super();
      }
      
      override public function start(param1:Player, param2:Object) : void
      {
         if(GameObjectManager.effectOff)
         {
            return;
         }
         var _loc4_:Array = param1.aimList;
         var _loc5_:int = 0;
         if(param2.hasOwnProperty("targetType"))
         {
            _loc5_ = param2["targetType"];
         }
         var _loc7_:int = 0;
         var _loc6_:* = _loc4_;
         for each(var _loc3_ in _loc4_)
         {
            if(_loc5_ == 1)
            {
               if(param1.objId / 1000 == _loc3_ / 1000)
               {
                  continue;
               }
            }
            else if(_loc5_ == 2)
            {
               if(param1.objId / 1000 != _loc3_ / 1000)
               {
                  continue;
               }
            }
            param1.tarId = _loc3_;
            new EffTarget().start(param1,param2);
         }
      }
   }
}
