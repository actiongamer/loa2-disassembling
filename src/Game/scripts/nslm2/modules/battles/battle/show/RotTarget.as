package nslm2.modules.battles.battle.show
{
   import nslm2.modules.battles.battle.Player;
   
   public class RotTarget extends ShowBase
   {
       
      
      public function RotTarget()
      {
         super();
      }
      
      override public function start(param1:Player, param2:Object) : void
      {
         var _loc3_:Player = gm.getPlayerId(param1.tarId);
         if(_loc3_ && _loc3_.unitVo)
         {
            param1.aimTo(_loc3_.unitVo.xy);
         }
      }
   }
}
