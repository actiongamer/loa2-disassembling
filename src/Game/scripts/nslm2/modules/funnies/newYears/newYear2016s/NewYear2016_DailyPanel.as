package nslm2.modules.funnies.newYears.newYear2016s
{
   import game.ui.sevenDayModule.view.SevenDaysGiftViewUI;
   import com.mz.core.interFace.IViewStackPage;
   import nslm2.modules.funnies.newYears.newYear2016s.models.NewYear2016Service;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import game.ui.sevenDayModule.view.DayGiftRenderUI;
   import nslm2.mgrs.skins.Effect2DUtils;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import morn.core.components.Component;
   import flash.geom.PerspectiveProjection;
   import flash.geom.Point;
   import nslm2.modules.foundations.sevenDays.view.DayGiftRender;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import com.greensock.TweenLite;
   import com.mz.core.utils.FilterUtil;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.utils.WealthUtil;
   import morn.core.handlers.Handler;
   
   public class NewYear2016_DailyPanel extends SevenDaysGiftViewUI implements IViewStackPage
   {
       
      
      private var btnEff:BmcSpriteSheet;
      
      private var firstRunFlg:Boolean = true;
      
      private var gap1:int = 36;
      
      public function NewYear2016_DailyPanel()
      {
         super();
         daily_list.repeatX = 10;
         daily_list.renderHandler = new Handler(listRender);
         daily_list.changeHandler = onClickCard;
         this.x = -30;
         this.y = 40;
         get_gift.addEventListener("click",onClickGetGift);
         this.service.removeEventListener("EVT_LOGIN_INFO_GET_REWARD",getRewardSuccessHandler);
         this.service.addEventListener("EVT_LOGIN_INFO_GET_REWARD",getRewardSuccessHandler);
         this.img_bg.skin = "png.uiNewYear2016.subPanels.img_bg_daily";
         this.img_bg.x = -this.x;
         this.img_bg.y = -this.y;
         this.img_bg.width = 511;
         this.img_bg.height = 498;
      }
      
      public function get service() : NewYear2016Service
      {
         return NewYear2016Service.ins;
      }
      
      public function updateView() : void
      {
      }
      
      public function viewStackIn() : void
      {
         this.visible = true;
         this.fadeIn();
         updateGiftList(this.service.nowLoginIndex);
      }
      
      public function viewStackOut() : void
      {
         this.visible = false;
      }
      
      public function get curDayIndex() : int
      {
         return this.daily_list.selectedIndex;
      }
      
      public function updateGiftList(param1:int) : void
      {
         daily_list.selectedIndex = param1;
         daily_list.array = ArrayUtil.fillBySameItem([],10,param1);
         this.updateWealthList(param1);
         updateButton();
      }
      
      public function updateButton() : void
      {
         if(service.canGetDailyLoginOne(this.curDayIndex))
         {
            if(this.curDayIndex <= service.nowLoginIndex)
            {
               get_gift.disabled = false;
               get_gift.label = LocaleMgr.ins.getStr(999000240);
               if(daily_list.selection)
               {
                  (daily_list.selection as DayGiftRenderUI).have_got.visible = false;
               }
               Effect2DUtils.showBtnEff_btnBig(this.get_gift);
            }
            else
            {
               get_gift.disabled = true;
               get_gift.label = LocaleMgr.ins.getStr(999000262);
               Effect2DUtils.hideBtnEff_btnBig(this.get_gift);
            }
         }
         else
         {
            get_gift.disabled = true;
            get_gift.label = LocaleMgr.ins.getStr(999000234);
            if(daily_list.selection)
            {
               (daily_list.selection as DayGiftRenderUI).have_got.visible = true;
            }
            Effect2DUtils.hideBtnEff_btnBig(this.get_gift);
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
               param1.x = daily_list.array[0] * 30;
               param1.y = 0;
               param1.name = "card" + param2;
               param1.transform.perspectiveProjection = new PerspectiveProjection();
               param1.transform.perspectiveProjection.projectionCenter = new Point(param2 * gap1 + 36,0);
               (param1 as DayGiftRender).img_gift.skin = UrlLib.newYearDayGiftIcon(param2 + 1);
               (param1 as DayGiftRender).gift_hint.text = "";
               (param1 as DayGiftRender).day_hint.text = "";
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
                  "x":param2 * gap1
               });
               TweenLite.delayedCall(0.01,setIndex,[param1]);
               param1.filters = [FilterUtil.highLightFilter(0)];
            }
            else if(param2 < daily_list.array[0])
            {
               TweenLite.to(param1,1,{
                  "rotationY":-45,
                  "scale":1,
                  "x":param2 * gap1,
                  "delay":0.1 * (daily_list.array[0] - param2)
               });
               param1.parent.setChildIndex(param1,param2);
            }
            else if(param2 > daily_list.array[0])
            {
               TweenLite.to(param1,1,{
                  "rotationY":45,
                  "scale":0.936708860759494,
                  "x":360 - (10 - 1 - param2) * gap1,
                  "delay":0.1 * param2
               });
               param1.parent.setChildIndex(param1,10 - 1 + daily_list.array[0] - param2);
            }
         }
      }
      
      private function setIndex(param1:DayGiftRenderUI) : void
      {
         if(!firstRunFlg)
         {
            param1.parent.setChildIndex(param1,10 - 1);
         }
      }
      
      private function onClickGetGift(param1:MouseEvent) : void
      {
         this.service.server_springLogin(this.curDayIndex + 1);
      }
      
      private function getRewardSuccessHandler(... rest) : void
      {
         FloatUtil.showGetItemsDisplayPanel(list_reward.array);
         this.updateButton();
      }
      
      private function updateWealthList(param1:int) : void
      {
         var _loc2_:String = DefindConsts.SPRING_DAY_(param1 + 1);
         var _loc3_:Array = WealthUtil.costStrToArr(_loc2_);
         list_reward.repeatX = _loc3_.length;
         list_reward.dataSource = _loc3_;
      }
      
      private function onClickCard(param1:int) : void
      {
         if(param1 > -1 && param1 < 10)
         {
            updateGiftList(param1);
         }
      }
      
      override public function dispose() : void
      {
         this.service.removeEventListener("EVT_LOGIN_INFO_GET_REWARD",getRewardSuccessHandler);
         super.dispose();
      }
   }
}
