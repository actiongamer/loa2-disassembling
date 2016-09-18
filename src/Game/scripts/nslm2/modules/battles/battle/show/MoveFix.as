package nslm2.modules.battles.battle.show
{
   import nslm2.modules.battles.battle.Player;
   import nslm2.modules.fightPlayer.PosConts;
   import flash.geom.Point;
   
   public class MoveFix extends ShowBase
   {
      
      public static const POS_DISTANCE:int = 100;
       
      
      public function MoveFix()
      {
         super();
      }
      
      override public function start(param1:Player, param2:Object) : void
      {
         var _loc7_:int = 0;
         var _loc6_:int = 0;
         var _loc5_:* = null;
         var _loc4_:int = param2.pos;
         var _loc3_:int = 100;
         if(param2.hasOwnProperty("distance"))
         {
            _loc3_ = param2.distance;
         }
         _loc5_ = PosConts.oriXY(_loc4_,param1.isAttack != 1,gm.vo.isBoss);
         if(param1.isAttack)
         {
            _loc7_ = _loc5_.x - _loc3_;
            _loc6_ = _loc5_.y;
         }
         else
         {
            _loc7_ = _loc5_.x + _loc3_;
            _loc6_ = _loc5_.y;
         }
         param1.moveTo(_loc7_,_loc6_,param2.dur);
      }
   }
}
