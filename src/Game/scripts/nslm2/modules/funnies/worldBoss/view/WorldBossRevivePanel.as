package nslm2.modules.funnies.worldBoss.view
{
   import game.ui.worldBoss.RevivePanelUI;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import nslm2.modules.foundations.TimePriceUtil;
   import nslm2.utils.TimeUtils;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class WorldBossRevivePanel extends RevivePanelUI
   {
      
      private static const WORLD_BOSS_REVIVE:String = "world_boss_revive";
       
      
      private var cdCtr:TextCDCtrlS2;
      
      public function WorldBossRevivePanel()
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
         costRender.dataSource = TimePriceUtil.curTimePriceVo(15);
      }
      
      private function cdFormat(param1:int) : String
      {
         return TimeUtils.isColonWithZero(param1);
      }
      
      private function revive() : void
      {
         var _loc1_:int = TimePriceUtil.curTimePriceVo(15).count;
         AlertUtil.comfirm(LocaleMgr.ins.getStr(40740140,[_loc1_]),doRevive,null,"world_boss_revive");
      }
      
      private function doRevive() : void
      {
         TimePriceUtil.buyTimes(15,1,reviveSuccessHandler);
      }
      
      private function reviveSuccessHandler() : void
      {
      }
      
      override public function dispose() : void
      {
         if(cdCtr)
         {
            cdCtr = null;
         }
         super.dispose();
      }
   }
}
