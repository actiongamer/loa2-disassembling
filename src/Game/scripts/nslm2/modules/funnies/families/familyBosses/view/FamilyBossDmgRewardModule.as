package nslm2.modules.funnies.families.familyBosses.view
{
   import game.ui.familyBosses.FamilyBossDamageRewardModuleUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.funnies.families.familyBosses.model.FamilyBossModel;
   import nslm2.modules.funnies.families.familyBosses.vo.DamageRewardVo;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleRedPointMsg;
   import nslm2.modules.funnies.families.familyBosses.service.FamilyBossServiceHandler;
   import morn.core.handlers.Handler;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.common.compsEffects.ListRemoveItemTweenEffect;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import com.greensock.TweenLite;
   
   public class FamilyBossDmgRewardModule extends FamilyBossDamageRewardModuleUI
   {
       
      
      public function FamilyBossDmgRewardModule()
      {
         super();
         btn_autoGet.clickHandler = autoGetReward;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(40740060);
         list_reward.dataSource = FamilyBossModel.ins.dmgRewardData;
         btn_autoGet.disabled = !FamilyBossModel.ins.rwdCnt;
         btn_autoGet.mouseEnabled = FamilyBossModel.ins.rwdCnt;
         super.preShow(null);
      }
      
      private function autoGetReward() : void
      {
         var _loc6_:int = 0;
         var _loc3_:* = null;
         if(isDisposed)
         {
            return;
         }
         list_reward.mouseEvent = false;
         btn_autoGet.mouseEvent = false;
         var _loc2_:Array = FamilyBossModel.ins.dmgRewardData;
         var _loc5_:int = _loc2_.length;
         var _loc1_:* = -1;
         var _loc4_:Array = [];
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc3_ = _loc2_[_loc6_];
            if(_loc3_.status == 1)
            {
               _loc4_.push(_loc3_);
               _loc1_ = _loc6_;
            }
            _loc6_++;
         }
         if(_loc1_ == -1)
         {
            btn_autoGet.disabled = true;
            list_reward.mouseEvent = true;
            FamilyBossModel.ins.rwdCnt = 0;
            ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(40743,false));
            return;
         }
         FamilyBossServiceHandler.ins.getDamageReward(0,new Handler(autoGetSuccess,[_loc4_]));
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["family_boss_update_dmg_rwd","family_boss_get_one_dmg_rwd_success"]);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = param1;
         if("family_boss_update_dmg_rwd" !== _loc4_)
         {
            if("family_boss_get_one_dmg_rwd_success" === _loc4_)
            {
               _loc3_ = ArrayUtil.indexByAttr(list_reward.dataSource as Array,"id",param2.id);
               FamilyBossModel.ins.updateDmgReward();
               new ListRemoveItemTweenEffect(this.list_reward,_loc3_,FamilyBossModel.ins.dmgRewardData).set_duration(0.2).set_Removeduration(0.1).exec();
            }
         }
         else
         {
            list_reward.dataSource = FamilyBossModel.ins.dmgRewardData;
            if(FamilyBossModel.ins.rwdCnt > 0)
            {
               btn_autoGet.disabled = false;
            }
            else
            {
               btn_autoGet.disabled = true;
            }
         }
      }
      
      private function autoGetSuccess(param1:Array) : void
      {
         var _loc2_:Array = [];
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for each(var _loc3_ in param1)
         {
            _loc3_.status = 2;
            _loc2_ = _loc2_.concat(_loc3_.reward);
         }
         FamilyBossModel.ins.updateDmgReward();
         FloatUtil.showGetItemsDisplayPanel(_loc2_);
         btn_autoGet.disabled = true;
         list_reward.mouseEvent = true;
      }
      
      override public function dispose() : void
      {
         TweenLite.killDelayedCallsTo(autoGetReward);
      }
   }
}
