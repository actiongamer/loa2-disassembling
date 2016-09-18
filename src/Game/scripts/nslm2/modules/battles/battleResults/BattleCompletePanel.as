package nslm2.modules.battles.battleResults
{
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class BattleCompletePanel extends BattleWinDgPanel
   {
       
      
      public function BattleCompletePanel()
      {
         super();
      }
      
      override public function init(param1:BattleResultConfigVo) : void
      {
         super.init(param1);
         txt_tip.visible = true;
         txt_tip.text = LocaleMgr.ins.getStr(40740240,[param1.resVo.familyBossDmg]);
         if(list_item.dataSource.length > 0 || list_award.dataSource.length > 0)
         {
            txt_tip.y = list_award.y - 30;
         }
      }
   }
}
