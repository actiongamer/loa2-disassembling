package nslm2.modules.funnies.families.familyBosses.view.render
{
   import game.ui.familyBosses.render.FamilyBossDmgRewardRenderUI;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.funnies.families.familyBosses.vo.DamageRewardVo;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.common.uiEffects.ListIconFlyEff;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   import nslm2.modules.funnies.families.familyBosses.service.FamilyBossServiceHandler;
   import morn.core.handlers.Handler;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import com.greensock.TweenLite;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.funnies.families.familyBosses.model.FamilyBossModel;
   
   public class DamageRewardListRender extends FamilyBossDmgRewardRenderUI implements IObserver
   {
       
      
      private var _vo:DamageRewardVo;
      
      private var eff:BmcSpriteSheet;
      
      private var iconFlyEfF:ListIconFlyEff;
      
      public function DamageRewardListRender()
      {
         super();
         btn_get.clickHandler = getReward;
         ObserverMgr.ins.regObserver(this);
      }
      
      override public function set dataSource(param1:Object) : void
      {
         _vo = param1 as DamageRewardVo;
         img_got.visible = false;
         btn_get.visible = true;
         if(_vo)
         {
            updateStatus();
            list_rwd.dataSource = _vo.reward;
            txt_condition.text = LocaleMgr.ins.getStr(40740061,[LocaleConsts.getNumberAbbr2(_vo.needDmg + "")]);
            txt_progress.color = _vo.crtDmg >= _vo.needDmg?458496:16723968;
            txt_progress.text = _vo.crtDmg + "/" + _vo.needDmg;
         }
      }
      
      private function getReward() : void
      {
         FamilyBossServiceHandler.ins.getDamageReward(_vo.id,new Handler(getRewardSuccess));
      }
      
      private function getRewardSuccess() : void
      {
         getRewardSuccessHandler();
      }
      
      private function getRewardSuccessHandler() : void
      {
         FloatUtil.showGetItemsDisplayPanel(_vo.reward);
         _vo.status = 2;
         img_got.visible = true;
         updateStatus();
         TweenLite.delayedCall(0.3,ObserverMgr.ins.sendNotice,["family_boss_get_one_dmg_rwd_success",_vo]);
      }
      
      private function updateStatus() : void
      {
         switch(int(_vo.status))
         {
            case 0:
               btn_get.disabled = true;
               break;
            case 1:
               btn_get.disabled = false;
               break;
            case 2:
               btn_get.visible = false;
               img_got.visible = true;
         }
      }
      
      private function showBtnEff(param1:Boolean) : void
      {
         if(param1)
         {
            if(!eff)
            {
               eff = new BmcSpriteSheet();
               eff.init(115002,1,"all",true);
               eff.x = btn_get.x - 8;
               eff.y = btn_get.y - 10;
               addChild(eff);
            }
         }
         else if(eff)
         {
            eff.dispose();
            eff = null;
         }
      }
      
      public function getFocusNotices() : Array
      {
         return ["family_boss_get_dmg_rwd_success"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         if(param1 == "family_boss_get_dmg_rwd_success")
         {
            if(_vo && _vo.id == param2.id)
            {
               getRewardSuccessHandler();
            }
         }
      }
      
      override public function changeSelectState(param1:int) : void
      {
         img_selected.visible = param1 == 2 || param1 == 3;
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         TweenLite.killDelayedCallsTo(FamilyBossModel.ins.updateDmgReward);
         super.dispose();
      }
   }
}
