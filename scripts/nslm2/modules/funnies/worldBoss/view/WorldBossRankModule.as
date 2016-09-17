package nslm2.modules.funnies.worldBoss.view
{
   import game.ui.worldBoss.WorldBossRankUI;
   import nslm2.modules.funnies.worldBoss.model.WorldBossModel;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.modules.funnies.worldBoss.service.WorldBossServiceHandler;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import proto.WorldBossHurtRewardRes;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import nslm2.utils.WealthUtil;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleRedPointMsg;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   
   public class WorldBossRankModule extends WorldBossRankUI
   {
       
      
      private var bossModel:WorldBossModel;
      
      private var btnEff:BmcSpriteSheet;
      
      public function WorldBossRankModule()
      {
         bossModel = WorldBossModel.ins;
         super();
         (this.pageBarUI as IPageBar).bindList(list_rank);
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         if(bossModel.status >= 5 && bossModel.status <= 7)
         {
            WorldBossServiceHandler.ins.requestDamageRank(getRankDataHandler);
         }
         else
         {
            moduleServerCpl();
         }
      }
      
      private function getRankDataHandler() : void
      {
         super.moduleServerCpl();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(41700000);
         this.txt_needDamage.text = LocaleConsts.getNumberAbbr2(DefindConsts.WORLD_BOSS_SHANGBANG,9999);
         updateRankData();
         btn_getReward.clickHandler = btnClickHandler;
         super.preShow(param1);
      }
      
      private function btnClickHandler() : void
      {
         WorldBossServiceHandler.ins.getDamageReward(getRewardSuccessHander);
      }
      
      private function getRewardSuccessHander(param1:WorldBossHurtRewardRes) : void
      {
         bossModel.canGetReward = false;
         bossModel.hasGotReward = true;
         updateBtnStatus();
         FloatUtil.showGetItemsDisplayPanel(WealthUtil.rewardArrToWealthVoArr(param1.rewards));
         ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(41701,false));
      }
      
      public function updateBtnStatus() : void
      {
         if(bossModel.hasGotReward || !bossModel.canGetReward)
         {
            btn_getReward.disabled = true;
         }
         else
         {
            btn_getReward.disabled = false;
         }
         if(bossModel.hasGotReward)
         {
            btn_getReward.label = LocaleMgr.ins.getStr(41300087);
         }
         else
         {
            btn_getReward.label = LocaleMgr.ins.getStr(41300230);
         }
         if(bossModel.canGetReward)
         {
            if(!btnEff)
            {
               btnEff = new BmcSpriteSheet();
               btnEff.init(10000002,1,"all",true);
               this.addChild(btnEff);
               btnEff.x = 619;
               btnEff.y = 495;
            }
         }
         else if(btnEff)
         {
            btnEff.dispose();
            btnEff = null;
         }
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["world_boss_update_damage_rank"]);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("world_boss_update_damage_rank" !== _loc3_)
         {
         }
      }
      
      private function updateRankData() : void
      {
         txt_myDamage.num = bossModel.myTotalDamage;
         if(bossModel.myRank > 50 || bossModel.myRank < 1)
         {
            if(bossModel.myTotalDamage >= DefindConsts.WORLD_BOSS_SHANGBANG)
            {
               txt_myRank.text = LocaleMgr.ins.getStr(60763018);
            }
            else
            {
               txt_myRank.text = LocaleMgr.ins.getStr(60763011);
            }
         }
         else
         {
            txt_myRank.num = bossModel.myRank;
         }
         list_rank.dataSource = WorldBossModel.ins.damageRankList;
         updateBtnStatus();
      }
   }
}
