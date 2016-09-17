package nslm2.modules.battles.battle.show
{
   import nslm2.modules.battles.battle.Player;
   import nslm2.modules.battles.battle.FPUtil;
   
   public class Act extends ShowBase
   {
       
      
      public function Act()
      {
         super();
      }
      
      override public function start(param1:Player, param2:Object) : void
      {
         param1.avatarBody.playbackSpeed = FPUtil.playSpeed();
         param1.action = param2["name"];
      }
   }
}
