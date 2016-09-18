package nslm2.modules.funnies.families.familyBosses.view
{
   import game.ui.familyBosses.RevivePanelUI;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import nslm2.modules.foundations.TimePriceUtil;
   import nslm2.utils.TimeUtils;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.funnies.families.familyBosses.model.FamilyBossModel;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.FamilyBossJoinFightStartRes;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class FamilybossRevivePanel extends RevivePanelUI
   {
       
      
      private var cdCtr:TextCDCtrlS2;
      
      public function FamilybossRevivePanel()
      {
         super();
         btn_revive.clickHandler = revive;
         btn_revive.toolTip = LocaleMgr.ins.getStr(40740052);
      }
      
      public function show(param1:int) : void
      {
         if(!cdCtr)
         {
            cdCtr = new TextCDCtrlS2(txt_cd,cdFormat,null);
         }
         cdCtr.start(param1);
         costRender.dataSource = TimePriceUtil.curTimePriceVo(7);
      }
      
      private function cdFormat(param1:int) : String
      {
         return TimeUtils.isColonWithZero(param1);
      }
      
      private function revive() : void
      {
         var _loc1_:int = TimePriceUtil.curTimePriceVo(7).count;
         AlertUtil.comfirm(LocaleMgr.ins.getStr(40740140,[_loc1_]),doRevive,null,"familybossRevive");
      }
      
      private function immBattle() : void
      {
      }
      
      private function doRevive() : void
      {
         TimePriceUtil.buyTimes(7,1,reviveSuccessHandler);
      }
      
      private function reviveSuccessHandler() : void
      {
      }
      
      private function doImmBattle() : void
      {
      }
      
      private function fightImmHandler() : void
      {
         FamilyBossModel.ins.reviveCD = 0;
         if(FamilyBossModel.ins.autoAttackBossId)
         {
            ObserverMgr.ins.sendNotice("family_boss_attack_boss",FamilyBossModel.ins.autoAttackBossId);
         }
         else
         {
            AlertUtil.float(LocaleMgr.ins.getStr(999000417));
         }
      }
      
      private function startFight(param1:FamilyBossJoinFightStartRes) : void
      {
         ModuleMgr.ins.showModule(40741,param1);
      }
      
      override public function dispose() : void
      {
         if(cdCtr)
         {
            cdCtr.dispose();
         }
         cdCtr = null;
         super.dispose();
      }
   }
}
