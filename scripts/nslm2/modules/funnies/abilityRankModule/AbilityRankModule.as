package nslm2.modules.funnies.abilityRankModule
{
   import game.ui.abilityRankModule.AbilibyRankModuleUI;
   import nslm2.modules.funnies.abilityRankModule.model.AbilityRankModel;
   import nslm2.modules.funnies.abilityRankModule.service.AbilityRankService;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import proto.OpenChallengeInfoRes;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import org.manager.DateUtils;
   import nslm2.utils.TimeUtils;
   import nslm2.utils.Uint64Util;
   import proto.OpenChallengeGetRewardRes;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   
   public class AbilityRankModule extends AbilibyRankModuleUI
   {
       
      
      private var model:AbilityRankModel;
      
      private var service:AbilityRankService;
      
      private var btnEff:BmcSpriteSheet;
      
      public function AbilityRankModule()
      {
         model = AbilityRankModel.ins;
         service = AbilityRankService.ins;
         super();
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         service.getInfo(getRankDataHandler);
      }
      
      private function getRankDataHandler(param1:OpenChallengeInfoRes) : void
      {
         model.myInfo = param1.self;
         model.canGetReward = param1.cangetreward;
         model.hasGotReward = param1.hasgetreward;
         model.updateRankList(param1.members);
         super.moduleServerCpl();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         (pageBar as IPageBar).bindList(list_rank);
         panelBg.txt_titleName.text = LocaleMgr.ins.getStr(60763000);
         txt_superTitle.text = LocaleMgr.ins.getStr(60763005) + LocaleMgr.ins.getStr(60763006,[DefindConsts.CHONGJI_CHAOJIJIANG]);
         txt_condition.text = DefindConsts.CHONGJI_SHANGBANG + "";
         var _loc2_:DateUtils = new DateUtils(model.activityStartTime * 1000);
         var _loc3_:DateUtils = new DateUtils();
         _loc3_.time = (model.activityStartTime + 518400) * 1000;
         var _loc4_:DateUtils = new DateUtils();
         _loc4_.time = (model.activityStartTime + 604800) * 1000;
         var _loc5_:DateUtils = new DateUtils();
         _loc5_.time = (model.activityStartTime + 86400 * (7 + (int(DefindConsts.CHONGJI_OPENTIME - 1)))) * 1000;
         txt_openTime.text = TimeUtils.getShortTimeStr(model.activityStartTime) + " 00:00" + " - " + TimeUtils.getShortTimeStr(model.activityStartTime + 518400) + " 23:59";
         txt_getRwdTime.text = TimeUtils.getShortTimeStr(model.activityStartTime + 604800) + " 00:00" + " - " + TimeUtils.getShortTimeStr(model.activityStartTime + 86400 * (7 + (int(DefindConsts.CHONGJI_OPENTIME - 1)))) + " 23:59";
         update();
         btn_get.clickHandler = btnClickHandler;
         super.preShow(param1);
      }
      
      private function update() : void
      {
         list_rank.dataSource = model.rankListArr;
         var _loc1_:int = Uint64Util.toNumber(model.myInfo.ability);
         if(Uint64Util.toNumber(model.myInfo.ability) >= int(DefindConsts.CHONGJI_SHANGBANG))
         {
            txt_myValue.color = 458496;
            if(model.myInfo.rank < 1 || model.myInfo.rank > 50)
            {
               txt_myValue.text = _loc1_ + LocaleMgr.ins.getStr(60763018);
            }
            else
            {
               txt_myValue.text = _loc1_ + LocaleMgr.ins.getStr(60763012,[model.myInfo.rank]);
            }
         }
         else
         {
            txt_myValue.color = 16723968;
            txt_myValue.text = _loc1_ + " (" + LocaleMgr.ins.getStr(11800104) + ")";
         }
         updateBtnStatus();
      }
      
      private function btnClickHandler() : void
      {
         service.getReward(getRewardSuccessHander);
      }
      
      private function getRewardSuccessHander(param1:OpenChallengeGetRewardRes) : void
      {
         model.canGetReward = false;
         model.hasGotReward = true;
         updateBtnStatus();
         FloatUtil.showGetItemsDisplayPanel(WealthUtil.rewardArrToWealthVoArr(param1.rewards));
         NpcFuncService.ins.changeCount(60763,0);
      }
      
      public function updateBtnStatus() : void
      {
         if(model.hasGotReward || !model.canGetReward)
         {
            btn_get.disabled = true;
         }
         else
         {
            btn_get.disabled = false;
         }
         if(model.hasGotReward)
         {
            btn_get.label = LocaleMgr.ins.getStr(41300087);
         }
         else
         {
            btn_get.label = LocaleMgr.ins.getStr(41300230);
         }
         if(model.canGetReward)
         {
            if(!btnEff)
            {
               btnEff = new BmcSpriteSheet();
               btnEff.init(10000002,1,"all",true);
               this.addChild(btnEff);
               btnEff.x = 663;
               btnEff.y = 502;
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
         return super.getFocusNotices().concat(["ablili_rank_update"]);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("ablili_rank_update" === _loc3_)
         {
            service.getInfo(updateRankDataHandler);
         }
         super.handleNotices(param1,param2);
      }
      
      private function updateRankDataHandler(param1:OpenChallengeInfoRes) : void
      {
         model.myInfo = param1.self;
         model.updateRankList(param1.members);
         update();
      }
   }
}
