package nslm2.modules.battles.battle.show
{
   import nslm2.modules.battles.battle.Player;
   
   public class RotBack extends ShowBase
   {
       
      
      public function RotBack()
      {
         super();
      }
      
      override public function start(param1:Player, param2:Object) : void
      {
         if(param1.isAttack)
         {
            param1.unitVo.rotation = 0;
         }
         else
         {
            param1.unitVo.rotation = 180;
         }
         param1.validateRo();
      }
   }
}
