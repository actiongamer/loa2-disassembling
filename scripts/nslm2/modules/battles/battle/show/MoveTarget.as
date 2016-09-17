package nslm2.modules.battles.battle.show
{
   import nslm2.modules.battles.battle.Player;
   
   public class MoveTarget extends ShowBase
   {
      
      public static const POS_DISTANCE:int = 150;
       
      
      public function MoveTarget()
      {
         super();
      }
      
      override public function start(param1:Player, param2:Object) : void
      {
         var _loc3_:int = 0;
         var _loc5_:int = 0;
         var _loc7_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc4_:Player = gm.getPlayerId(param1.tarId);
         if(_loc4_)
         {
            _loc3_ = 0;
            _loc5_ = 150;
            if(param2.hasOwnProperty("distance"))
            {
               _loc5_ = param2.distance;
            }
            _loc7_ = _loc4_.unitVo.oriXY.x;
            _loc6_ = _loc4_.unitVo.oriXY.y;
            if(_loc4_.isAttack)
            {
               _loc3_ = _loc7_ + _loc5_;
            }
            else
            {
               _loc3_ = _loc7_ - _loc5_;
            }
            param1.moveTo(_loc3_,_loc6_,param2.dur);
         }
      }
   }
}
