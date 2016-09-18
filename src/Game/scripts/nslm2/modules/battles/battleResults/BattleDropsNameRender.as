package nslm2.modules.battles.battleResults
{
   import game.ui.battleResults.BattleDropsNameRenderUI;
   import nslm2.common.vo.WealthVo;
   
   public class BattleDropsNameRender extends BattleDropsNameRenderUI
   {
       
      
      public function BattleDropsNameRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         if(param1)
         {
            this.txt_name.text = (param1 as WealthVo).showName;
         }
      }
   }
}
