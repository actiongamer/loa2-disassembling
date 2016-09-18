package nslm2.modules.cultivates.lotteryHeroModules.selectPanels
{
   import game.ui.lotteryHeroModules.selectPanels.LHSelectCommonUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class LHSelectCommon extends LHSelectCommonUI
   {
       
      
      public function LHSelectCommon()
      {
         super();
         wealthNeed1.buttonMode = true;
         wealthNeed10.buttonMode = true;
         this.btn_1.label = LocaleMgr.ins.getStr(11900012);
         this.btn_10.label = LocaleMgr.ins.getStr(11900013);
      }
   }
}
