package nslm2.modules.battles.PeakSports.view
{
   import game.ui.peakSports.PeakSportsRewardModuleUI;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.common.model.PlayerModel;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import morn.customs.expands.MornExpandUtil;
   
   public class PeakSportsRewardModule extends PeakSportsRewardModuleUI
   {
       
      
      public function PeakSportsRewardModule()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
      }
      
      private function onBtnFunc(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(closeBtn === _loc3_)
         {
            btnCloseHandler();
         }
      }
      
      override public function preShow(param1:Object = null) : void
      {
         super.preShow(param1);
         this.panelBg.titleImgId = this.moduleId;
         bgImage.url = UrlLib.peakSportsUI("img_teamInfoBg");
         if(PlayerModel.ins.level < 55)
         {
            rewardItem.dataSource = WealthUtil.costStrToArr("20:" + DefindConsts.BATTLE_KING_WIN_REWARD.split("|")[0].split(":")[1] + ":1")[0];
            rewardList1.dataSource = WealthUtil.costStrToArr(DefindConsts.BATTLE_KING_WIN_REWARD_SHOW_30);
         }
         else if(PlayerModel.ins.level < 80)
         {
            rewardItem.dataSource = WealthUtil.costStrToArr("20:" + DefindConsts.BATTLE_KING_WIN_REWARD.split("|")[1].split(":")[1] + ":1")[0];
            rewardList1.dataSource = WealthUtil.costStrToArr(DefindConsts.BATTLE_KING_WIN_REWARD_SHOW_50);
         }
         else
         {
            rewardItem.dataSource = WealthUtil.costStrToArr("20:" + DefindConsts.BATTLE_KING_WIN_REWARD.split("|")[2].split(":")[1] + ":1")[0];
            rewardList1.dataSource = WealthUtil.costStrToArr(DefindConsts.BATTLE_KING_WIN_REWARD_SHOW_80);
         }
         rewardList2.dataSource = WealthUtil.costStrToArr("20:" + DefindConsts.BATTLE_KING_LOSE_REWARD.split("|")[0].split(":")[1] + ":1");
      }
   }
}
