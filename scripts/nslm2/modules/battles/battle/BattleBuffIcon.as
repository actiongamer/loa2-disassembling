package nslm2.modules.battles.battle
{
   import game.ui.fightPlayers.BattleBuffIconUI;
   
   public class BattleBuffIcon extends BattleBuffIconUI
   {
       
      
      public function BattleBuffIcon()
      {
         super();
      }
      
      public function get vo() : BuffVo
      {
         return this.dataSource as BuffVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(vo)
         {
            this.txt_cd.text = "cd" + vo.cd;
            this.txt_stack.text = vo.stacks + "";
         }
      }
   }
}
