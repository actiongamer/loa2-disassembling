package nslm2.modules.funnies.guildPKCrossSer.skill
{
   import game.ui.guildPKCrossSer.GPKSkillRankPanelUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class GPKSkillRankPanel extends GPKSkillRankPanelUI
   {
       
      
      public function GPKSkillRankPanel()
      {
         super();
         this.t0.text = LocaleMgr.ins.getStr(99900133);
         this.t1.text = LocaleMgr.ins.getStr(99900134);
         this.t2.text = LocaleMgr.ins.getStr(99900135);
         this.t3.text = LocaleMgr.ins.getStr(99900136);
      }
   }
}
