package nslm2.modules.battles.battle.show
{
   import nslm2.modules.battles.battle.Player;
   import nslm2.modules.fightPlayer.PosConts;
   import flash.geom.Point;
   
   public class MoveV extends ShowBase
   {
      
      public static const POS_DISTANCE:int = 100;
       
      
      public function MoveV()
      {
         super();
      }
      
      override public function start(param1:Player, param2:Object) : void
      {
         var _loc8_:int = 0;
         var _loc6_:int = 0;
         var _loc5_:* = null;
         var _loc7_:int = param1.tarId;
         var _loc3_:int = 3 * _loc7_ + 1;
         var _loc4_:int = 100;
         if(param2.hasOwnProperty("distance"))
         {
            _loc4_ = param2.distance;
         }
         _loc5_ = PosConts.oriXY(_loc3_,param1.isAttack != 1,gm.vo.isBoss);
         if(param1.isAttack)
         {
            _loc8_ = _loc5_.x - _loc4_;
            _loc6_ = _loc5_.y;
         }
         else
         {
            _loc8_ = _loc5_.x + _loc4_;
            _loc6_ = _loc5_.y;
         }
         param1.moveTo(_loc8_,_loc6_,param2.dur);
      }
   }
}
