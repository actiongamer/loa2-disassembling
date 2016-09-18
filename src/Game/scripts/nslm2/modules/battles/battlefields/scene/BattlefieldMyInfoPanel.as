package nslm2.modules.battles.battlefields.scene
{
   import game.ui.battlefield.BattlefieldScene.panel.BattlefieldMyInfoPanelUI;
   import proto.BgCryStageInfoNotify;
   import nslm2.modules.battles.battlefields.model.BattlefieldModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.BgFireStageInfoNotify;
   
   public class BattlefieldMyInfoPanel extends BattlefieldMyInfoPanelUI
   {
       
      
      public function BattlefieldMyInfoPanel()
      {
         super();
      }
      
      public function show(param1:BgCryStageInfoNotify) : void
      {
         if(BattlefieldModel.ins.curBattlefieldId == 1000)
         {
            this.txt_gathered.text = LocaleMgr.ins.getStr(50500069,[param1.myInfo.gatherNum]);
         }
         else
         {
            this.txt_gathered.text = LocaleMgr.ins.getStr(50500159,[param1.myInfo.gatherNum]);
         }
         this.txt_assisted.text = LocaleMgr.ins.getStr(50500068,[param1.myInfo.assistNum]);
         this.txt_honor.text = LocaleMgr.ins.getStr(50500070,[param1.myInfo.honor]);
         this.txt_killed.text = LocaleMgr.ins.getStr(50500067,[param1.myInfo.killNum]);
         this.rule_desc.toolTip = LocaleMgr.ins.getStr(50500142);
      }
      
      public function show2(param1:BgFireStageInfoNotify) : void
      {
         if(BattlefieldModel.ins.curBattlefieldId == 1000)
         {
            this.txt_gathered.text = LocaleMgr.ins.getStr(50500069,[param1.myInfo.gatherNum]);
         }
         else
         {
            this.txt_gathered.text = LocaleMgr.ins.getStr(50500159,[param1.myInfo.gatherNum]);
         }
         this.txt_assisted.text = LocaleMgr.ins.getStr(50500068,[param1.myInfo.assistNum]);
         this.txt_honor.text = LocaleMgr.ins.getStr(50500070,[param1.myInfo.honor]);
         this.txt_killed.text = LocaleMgr.ins.getStr(50500067,[param1.myInfo.killNum]);
         this.rule_desc.toolTip = LocaleMgr.ins.getStr(50500179);
      }
   }
}
