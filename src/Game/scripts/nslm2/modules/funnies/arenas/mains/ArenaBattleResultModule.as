package nslm2.modules.funnies.arenas.mains
{
   import game.ui.arenas.mains.ArenaBattleResultModuleUI;
   import nslm2.modules.funnies.arenas.ArenaChallengeResultVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import morn.core.components.Button;
   import morn.core.managers.timerMgrs.TimerManager;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import morn.customs.expands.MornExpandUtil;
   
   public class ArenaBattleResultModule extends ArenaBattleResultModuleUI
   {
       
      
      private var _vo:ArenaChallengeResultVo;
      
      public function ArenaBattleResultModule()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,onBtnConfirm);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         _vo = param1 as ArenaChallengeResultVo;
         this.txt_historyRank.text = LocaleMgr.ins.getStr(50200406,[TextFieldUtil.htmlText2(_vo.challengeRank,458496)]);
         this.txt_upedRank.text = LocaleMgr.ins.getStr(50200407,[TextFieldUtil.htmlText2(_vo.upedRank,458496)]);
         this.txt_reward.text = LocaleMgr.ins.getStr(50200408,[_vo.rewardDiamond]);
         this.preShowCpl();
      }
      
      private function onBtnConfirm(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(this.btn_confirm === _loc2_)
         {
            TimerManager.ins.doOnce(100,delayShow);
            ModuleMgr.ins.closeModule(this.moduleId);
         }
      }
      
      private function delayShow() : void
      {
         var _loc1_:WealthVo = WealthUtil.createWealthVo(3,0,_vo.rewardDiamond);
         FloatUtil.showGetItemsDisplayPanel([_loc1_],null,null,0,false);
      }
   }
}
