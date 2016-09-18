package nslm2.modules.battles.battlefields
{
   import game.ui.battlefield.BattlefieldRankReward.BattlefieldRankRewardModuleUI;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.modules.funnies.arenas.rewards.ActRewardVo;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import morn.core.components.Button;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class BattlefieldRankRewardModule extends BattlefieldRankRewardModuleUI
   {
       
      
      public function BattlefieldRankRewardModule()
      {
         super();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
         this.panelBg.titleImgId = this.moduleId;
         var _loc2_:ActRewardVo = param1 as ActRewardVo;
         if(_loc2_.hideTxtRank)
         {
            txt_myRank.visible = false;
            txt_rank.visible = false;
         }
         var _loc3_:String = _loc2_.rank > 0?TextFieldUtil.htmlText2(_loc2_.rank,65280):LocaleMgr.ins.getStr(40400009);
         this.txt_myRank.text = _loc3_;
         this.list_ranks.dataSource = _loc2_.list_items;
         this.img_bg.url = UrlLib.battlefieldUI("img_rankRewardBg");
         this.preShowCpl();
      }
      
      private function onBtnFunc(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(this.btn_confirm === _loc2_)
         {
            ModuleMgr.ins.closeModule(50510);
         }
      }
   }
}
