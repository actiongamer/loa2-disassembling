package nslm2.modules.battles.battle.show
{
   import nslm2.modules.battles.battle.Player;
   
   public class SoundPlay extends ShowBase
   {
       
      
      public function SoundPlay()
      {
         super();
      }
      
      override public function start(param1:Player, param2:Object) : void
      {
         param1.playTexiaoSound(param2.name);
      }
   }
}
