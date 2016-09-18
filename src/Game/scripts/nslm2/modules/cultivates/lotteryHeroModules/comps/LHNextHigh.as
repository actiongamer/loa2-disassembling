package nslm2.modules.cultivates.lotteryHeroModules.comps
{
   import game.ui.lotteryHeroModules.comps.LHNextHighUI;
   import nslm2.modules.cultivates.lotteryHeroModules.LHModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class LHNextHigh extends LHNextHighUI
   {
       
      
      public function LHNextHigh()
      {
         super();
         this.txt_nextHigh1.text = LocaleMgr.ins.getStr(11900026);
      }
      
      public function show() : void
      {
         this.clip_nextHigh.value = LHModel.ins.panelInfo.cashYuLiang;
         if(LHModel.ins.panelInfo.quality == 5)
         {
            this.txt_nextHigh2.text = LocaleMgr.ins.getStr(11900028);
         }
         else
         {
            this.txt_nextHigh2.text = LocaleMgr.ins.getStr(11900027);
         }
         this.box_nextHigh.refresh();
      }
   }
}
