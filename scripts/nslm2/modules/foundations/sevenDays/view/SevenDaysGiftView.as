package nslm2.modules.foundations.sevenDays.view
{
   import game.ui.sevenDayModule.view.SevenDaysGiftViewUI;
   import com.mz.core.interFace.IViewStackPage;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.foundations.sevenDays.model.SevenDaysModel;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import game.ui.sevenDayModule.view.DayGiftRenderUI;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import morn.core.components.Component;
   import flash.geom.PerspectiveProjection;
   import flash.geom.Point;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import com.greensock.TweenLite;
   import com.mz.core.utils.FilterUtil;
   import flash.events.MouseEvent;
   import nslm2.modules.foundations.sevenDays.service.SevenDaysService;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcSevendayRewardVo;
   import nslm2.utils.WealthUtil;
   import morn.core.handlers.Handler;
   
   public class SevenDaysGiftView extends SevenDaysGiftViewUI implements IViewStackPage, IObserver
   {
       
      
      private var model:SevenDaysModel;
      
      private var btnEff:BmcSpriteSheet;
      
      private var firstRunFlg:Boolean = true;
      
      public function SevenDaysGiftView()
      {
         model = SevenDaysModel.ins;
         super();
         daily_list.renderHandler = new Handler(listRender);
         daily_list.changeHandler = onClickCard;
         var _loc1_:String = model.currentDayRewardVo.sdStcVO.login_reward;
         var _loc2_:Array = WealthUtil.costStrToArr(_loc1_);
         list_reward.repeatX = _loc2_.length;
         list_reward.dataSource = _loc2_;
         this.img_bg.skin = UrlLib.sevenDayDailyGift();
      }
      
      public function updateView() : void
      {
      }
      
      public function viewStackIn() : void
      {
         this.visible = true;
         this.fadeIn();
         updateButton();
         ObserverMgr.ins.regObserver(this);
      }
      
      public function viewStackOut() : void
      {
         this.visible = false;
         ObserverMgr.ins.unregObserver(this);
      }
      
      public function updateGiftList(param1:int) : void
      {
         daily_list.selectedIndex = param1;
         daily_list.array = [param1,param1,param1,param1,param1,param1,param1];
      }
      
      public function updateButton() : void
      {
         if(model.currentDayRewardVo.loginBonusStatus == 1)
         {
            get_gift.disabled = false;
            get_gift.label = LocaleMgr.ins.getStr(999000361);
            get_gift.addEventListener("click",onClickGetGift);
            if(daily_list.selection)
            {
               (daily_list.selection as DayGiftRenderUI).have_got.visible = false;
            }
         }
         else if(model.currentDayRewardVo.loginBonusStatus == 3)
         {
            get_gift.disabled = true;
            get_gift.label = LocaleMgr.ins.getStr(999000362);
            if(daily_list.selection)
            {
               (daily_list.selection as DayGiftRenderUI).have_got.visible = true;
            }
         }
         else if(model.currentDayRewardVo.loginBonusStatus == 2)
         {
            get_gift.disabled = true;
            get_gift.label = LocaleMgr.ins.getStr(999000363);
         }
         showOrHideBtnEffect();
      }
      
      private function showOrHideBtnEffect() : void
      {
         if(!get_gift.disabled)
         {
            if(!btnEff)
            {
               btnEff = new BmcSpriteSheet();
               btnEff.init(115002,1,"all",true);
               btnEff.x = get_gift.x - 46 + 4 + 33;
               btnEff.y = get_gift.y - 25 + 4 + 11;
               this.addChild(btnEff);
            }
         }
         else if(btnEff)
         {
            btnEff.dispose();
            btnEff = null;
         }
      }
      
      private function listRender(param1:Component, param2:int) : void
      {
         if(param2 < daily_list.length)
         {
            if(firstRunFlg)
            {
               param1.x = daily_list.array[0] * 52;
               param1.y = 0;
               param1.name = "card" + param2;
               param1.transform.perspectiveProjection = new PerspectiveProjection();
               param1.transform.perspectiveProjection.projectionCenter = new Point(param2 * 52 + 36,0);
               (param1 as DayGiftRender).img_gift.skin = UrlLib.sevenDayGiftIcon(param2 + 1);
               (param1 as DayGiftRender).gift_hint.text = LocaleMgr.ins.getStr(13100008 + param2);
               (param1 as DayGiftRender).day_hint.text = LocaleMgr.ins.getStr(13100001 + param2);
               if(param2 + 1 == daily_list.length)
               {
                  firstRunFlg = false;
               }
            }
            TweenLite.killTweensOf(param1);
            if(param2 == daily_list.array[0])
            {
               TweenLite.to(param1,1,{
                  "rotationY":0,
                  "scale":1,
                  "x":param2 * 52
               });
               TweenLite.delayedCall(0.01,setIndex,[param1]);
               param1.filters = [FilterUtil.highLightFilter(0)];
            }
            else if(param2 < daily_list.array[0])
            {
               TweenLite.to(param1,1,{
                  "rotationY":-45,
                  "scale":1,
                  "x":param2 * 52,
                  "delay":0.1 * (daily_list.array[0] - param2)
               });
               param1.parent.setChildIndex(param1,param2);
            }
            else if(param2 > daily_list.array[0])
            {
               TweenLite.to(param1,1,{
                  "rotationY":45,
                  "scale":0.936708860759494,
                  "x":341 - (6 - param2) * 52,
                  "delay":0.1 * param2
               });
               param1.parent.setChildIndex(param1,6 + daily_list.array[0] - param2);
            }
            if(model.getLoginBonusStatus(param2) == 3)
            {
               (param1 as DayGiftRender).have_got.visible = true;
            }
            if(param2 > model.actualDay)
            {
               param1.disabled = true;
            }
            else
            {
               param1.filters = [FilterUtil.highLightFilter(0)];
               param1.disabled = false;
            }
         }
      }
      
      private function setIndex(param1:DayGiftRenderUI) : void
      {
         if(!firstRunFlg)
         {
            param1.parent.setChildIndex(param1,6);
         }
      }
      
      private function onClickGetGift(param1:MouseEvent) : void
      {
         SevenDaysService.ins.getLoginReward(daily_list.selectedIndex,0,getRewardSuccessHandler);
      }
      
      public function getFocusNotices() : Array
      {
         return ["sevenday_notice_get_reward_success","sevenday_notice_get_reward_effect","sevenday_notice_update_login"];
      }
      
      private function getRewardSuccessHandler() : void
      {
         FloatUtil.showGetItemsDisplayPanel(list_reward.array);
         get_gift.disabled = true;
         get_gift.label = LocaleMgr.ins.getStr(999000362);
         (daily_list.selection as DayGiftRenderUI).have_got.visible = true;
         showOrHideBtnEffect();
         model.hasLoginBonus = false;
         ObserverMgr.ins.sendNotice("sevenday_notice_update_red_point");
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("sevenday_notice_get_reward_success" !== _loc3_)
         {
            if("sevenday_notice_update_login" === _loc3_)
            {
               updateGiftList(param2 as int);
               updateWealthList(param2 as int);
               updateButton();
            }
         }
         else
         {
            getRewardSuccessHandler();
         }
      }
      
      private function updateWealthList(param1:int) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:StcSevendayRewardVo = StcMgr.ins.getSevendayRewardVo(param1 + 1);
         if(_loc4_)
         {
            _loc2_ = _loc4_.login_reward;
            _loc3_ = WealthUtil.costStrToArr(_loc2_);
            list_reward.repeatX = _loc3_.length;
            list_reward.dataSource = _loc3_;
         }
      }
      
      private function onClickCard(param1:int) : void
      {
         if(param1 > -1 && param1 < 7)
         {
            updateGiftList(param1);
         }
         ObserverMgr.ins.sendNotice("sevenday_notice_card_click",param1);
      }
   }
}
