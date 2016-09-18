package nslm2.modules.funnies.groupon.view
{
   import game.ui.groupon.BuyComfirmModuleUI;
   import nslm2.modules.funnies.groupon.vo.GrouponBuyInfo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import flash.events.Event;
   import nslm2.common.model.PlayerModel;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.funnies.groupon.service.GrouponService;
   import nslm2.nets.sockets.ServerEvent;
   import nslm2.modules.funnies.groupon.model.GrouponModel;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.common.uiEffects.ListIconFlyEff;
   import morn.customs.components.WealthRender;
   import nslm2.common.ui.components.comps2d.numBar.NumBarS1;
   
   public class GrouponBuyItemConfirmModule extends BuyComfirmModuleUI
   {
       
      
      private var _data:GrouponBuyInfo;
      
      private var useCouponCnt:int;
      
      private var useDmd:int;
      
      private var buyCnt:int;
      
      public function GrouponBuyItemConfirmModule()
      {
         super();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(50200401);
         _data = param1 as GrouponBuyInfo;
         if(_data)
         {
            list_items.repeatX = 1;
            list_items.dataSource = [_data.item];
            this.txt_buyLimit.text = LocaleMgr.ins.getStr(30100346,[_data.canBuyCnt]);
            numberBar.init(1,_data.canBuyCnt,1);
            numberBar.txt_input.addEventListener("change",changeSellPriceHandler);
            changeSellPriceHandler(null);
         }
         btn_ok.clickHandler = doBuy;
         super.preShow();
      }
      
      protected function changeSellPriceHandler(param1:Event) : void
      {
         buyCnt = int(numberBar.txt_input.text);
         useDmd = _data.diamond * buyCnt;
         useCouponCnt = Math.min(_data.coupon * buyCnt,PlayerModel.ins.getWealthValue(27));
         useDmd = useDmd - useCouponCnt;
         costDiamond.dataSource = WealthUtil.needVo(_data.wealthKind,1,useDmd);
         box_useCoupon.visible = _data.coupon > 0;
         if(_data.coupon > 0)
         {
            costCoupon.dataSource = WealthUtil.needVo(27,1,useCouponCnt);
         }
      }
      
      private function doBuy() : void
      {
         var _loc1_:int = 0;
         if(_data.wealthKind == 3)
         {
            _loc1_ = PlayerModel.ins.diamond;
         }
         else
         {
            _loc1_ = PlayerModel.ins.getWealthValue(4);
         }
         if(_loc1_ < useDmd)
         {
            AlertUtil.showRechargeAlert();
         }
         else
         {
            GrouponService.ins.requestBuyItem(_data.id,useCouponCnt,buyCnt,buySuccessHandler);
         }
      }
      
      private function buySuccessHandler(param1:Object, param2:ServerEvent) : void
      {
         GrouponModel.ins.currentGrouponVo.hasBuyCnt = GrouponModel.ins.currentGrouponVo.hasBuyCnt + buyCnt;
         FloatUtil.displayPlayerDataChange(param2.dataNotifyCacheVo,getToTargetHandler,60560);
         ObserverMgr.ins.sendNotice("groupon_notice_update_detail");
      }
      
      private function getToTargetHandler(param1:ListIconFlyEff, param2:WealthRender) : *
      {
         if(param2.wealthVoIsEnable)
         {
            switch(int(param2.wealthVo.kind) - 27)
            {
               case 0:
                  return GrouponModel.ins.grouponIcon;
               case 1:
                  return GrouponModel.ins.scoreIcon;
            }
         }
         else
         {
            return null;
         }
      }
      
      public function get numberBar() : NumBarS1
      {
         return numBarUI as NumBarS1;
      }
   }
}
