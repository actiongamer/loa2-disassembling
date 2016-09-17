package nslm2.modules.foundations.auctionShop.view
{
   import game.ui.auctionShopModule.AuctionBuyItemPanelUI;
   import proto.AuctionItem;
   import morn.core.components.Button;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.common.vo.WealthVo;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import flash.events.Event;
   import com.greensock.TweenLite;
   import nslm2.modules.foundations.auctionShop.service.AuctionShopService;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.AuctionBuyItemRes;
   import nslm2.modules.foundations.auctionShop.model.AuctionShopModel;
   import nslm2.common.ui.components.comps2d.numBar.NumBarS1;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.modules.footstones.tooltipsModules.TooltipUtils;
   
   public class AuctionBuyItemPanel extends AuctionBuyItemPanelUI
   {
       
      
      private var item:AuctionItem;
      
      private var cost:int;
      
      private var autoAuctionCost:int;
      
      private var totalCost:int;
      
      private var isSetting:Boolean;
      
      private var autoRiseStep:int;
      
      public function AuctionBuyItemPanel()
      {
         super();
         check_autoBuy.clickHandler = checkBoxClickHandler;
         check_onePrice.clickHandler = checkOnePriceBoxClickHandler;
         MornExpandUtil.addHandlerForBtnAll(this,btnClickHanlder);
         btn_help.setClickDelay(0);
         TooltipUtils.preventHideByMouseDown(btn_help);
         btn_help2.setClickDelay(0);
         TooltipUtils.preventHideByMouseDown(btn_help2);
         btn_help.toolTip = LocaleMgr.ins.getStr(30610096);
         btn_help2.toolTip = LocaleMgr.ins.getStr(30610116);
         moduleFadeInType = 2;
         check_onePrice.selected = false;
      }
      
      private function btnClickHanlder(param1:Button) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = param1;
         if(btn_ok !== _loc3_)
         {
            if(btn_cancel === _loc3_)
            {
               btnCloseHandler(null);
            }
         }
         else
         {
            validateInput(null);
            if(check_autoBuy.selected)
            {
               autoAuctionCost = int(numbar.txt_input.text);
               if(!isSetting)
               {
                  totalCost = cost + autoAuctionCost;
               }
               else
               {
                  totalCost = autoAuctionCost;
               }
            }
            else
            {
               totalCost = cost;
               if(check_onePrice.selected)
               {
                  totalCost = item.oncePrice;
               }
               if(isSetting)
               {
                  totalCost = 0;
               }
            }
            _loc2_ = PlayerModel.ins.getWealthValue(4);
            if(_loc2_ < totalCost)
            {
               AlertUtil.showRechargeAlert();
            }
            else if(!check_autoBuy.selected)
            {
               if(!isSetting)
               {
                  AlertUtil.comfirm(LocaleMgr.ins.getStr(30610063,[totalCost]),doBuy);
               }
               else
               {
                  btnCloseHandler(null);
               }
            }
            else if(isSetting)
            {
               AlertUtil.comfirm(LocaleMgr.ins.getStr(30610065,[totalCost]),doSet);
            }
            else
            {
               AlertUtil.comfirm(LocaleMgr.ins.getStr(30610064,[cost,autoAuctionCost]),doBuy);
            }
         }
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc6_:int = 0;
         var _loc3_:* = null;
         var _loc7_:int = 0;
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(30610050);
         item = param1 as AuctionItem;
         autoRiseStep = item.originPrice * DefindConsts.treasure_AH_growth;
         var _loc2_:WealthVo = new WealthVo();
         var _loc4_:int = PlayerModel.ins.getWealthValue(4);
         if(!item.baowu)
         {
            _loc2_.sid = item.item.id;
            _loc2_.kind = 20;
            _loc2_.count = item.item.count;
         }
         else
         {
            _loc2_ = WealthUtil.treasureToVo(item.baowu);
         }
         switch(int(_loc2_.quality) - 5)
         {
            case 0:
               _loc3_ = DefindConsts.treasure_AH_5;
               break;
            case 1:
               _loc3_ = DefindConsts.treasure_AH_6;
               break;
            case 2:
               _loc3_ = DefindConsts.treasure_AH_7;
         }
         _loc6_ = StcMgr.ins.getGlobalPriceVo(int(_loc3_.split("|")[1])).price;
         _loc6_ = Math.min(_loc6_,_loc4_);
         isSetting = item.myCurPrice > 0;
         if(isSetting)
         {
            cost = item.myPrice;
            check_autoBuy.label = LocaleMgr.ins.getStr(30610052);
            if(item.myIsAutoBuy)
            {
               check_autoBuy.selected = true;
               box_auto.visible = true;
               check_autoBuy.mouseEvent = false;
            }
            else
            {
               check_autoBuy.selected = false;
               box_auto.visible = false;
            }
            box_myPrice.y = 77;
            box_curPrice.visible = false;
            txt_tips.visible = false;
            txt_priceLabel.text = LocaleMgr.ins.getStr(30610092);
            txt_myCost.text = "@{wealth:4}" + cost + LocaleMgr.ins.getStr(30610093);
            _loc7_ = int((_loc6_ - cost) / autoRiseStep) * autoRiseStep;
            box_curPrice.visible = false;
            onePriceBox.visible = false;
         }
         else
         {
            cost = item.curPrice + item.originPrice * DefindConsts.treasure_AH_growth;
            check_autoBuy.selected = false;
            check_autoBuy.label = LocaleMgr.ins.getStr(30610094);
            box_auto.visible = false;
            txt_myCost.text = "@{wealth:4}" + cost;
            txt_curPrice.text = "@{wealth:4}" + item.curPrice;
            _loc7_ = int((_loc6_ - cost) / autoRiseStep) * autoRiseStep;
         }
         var _loc5_:int = autoRiseStep;
         _loc7_ = _loc7_ < _loc5_?_loc5_:int(_loc7_);
         itemRender.dataSource = _loc2_;
         numberBar.init(_loc5_,_loc7_,_loc5_,autoRiseStep);
         numberBar.addEventListener("evt_numbar_value_change",validateInput);
         super.preShow(param1);
      }
      
      protected function validateInput(param1:Event) : void
      {
         var _loc2_:int = numbar.txt_input.text;
         var _loc3_:int = int(_loc2_ / autoRiseStep) * autoRiseStep;
         numbar.txt_input.text = _loc3_ + "";
      }
      
      private function checkBoxClickHandler() : void
      {
         var _loc1_:Boolean = check_autoBuy.selected;
         TweenLite.killTweensOf(box_auto);
         box_auto.visible = true;
         if(check_autoBuy.selected)
         {
            box_auto.alpha = 0;
            TweenLite.to(box_auto,0.1,{"alpha":1});
            onePriceBox.visible = false;
            check_onePrice.selected = false;
         }
         else
         {
            box_auto.alpha = 1;
            TweenLite.to(box_auto,0.1,{"alpha":0});
            onePriceBox.visible = true;
         }
      }
      
      private function checkOnePriceBoxClickHandler() : void
      {
         if(check_onePrice.selected)
         {
            box_auto.visible = false;
            check_autoBuy.selected = false;
         }
      }
      
      private function doBuy() : void
      {
         AuctionShopService.ins.buyItem(item.id,check_autoBuy.selected,totalCost,buySuccessHandler);
      }
      
      private function doSet() : void
      {
         AuctionShopService.ins.setOrder(item.id,item.myPrice + totalCost,setPriceSuccess);
      }
      
      private function setPriceSuccess(param1:Object) : void
      {
         AlertUtil.float(LocaleMgr.ins.getStr(30610091));
         btnCloseHandler(null);
         ObserverMgr.ins.sendNotice("auction_notice_upate_order");
      }
      
      private function buySuccessHandler(param1:AuctionBuyItemRes) : void
      {
         AlertUtil.float(LocaleMgr.ins.getStr(30610090));
         AuctionShopModel.ins.myOrderArr.push(param1.item);
         AuctionShopModel.ins.changeAuctionItemPrice(param1.item.id,param1.item.curPrice);
         if(param1.isOncePriceSuc)
         {
            AuctionShopModel.ins.removeAuctionItem(param1.item.id);
         }
         ObserverMgr.ins.sendNotice("auction_notice_upate_order");
         btnCloseHandler(null);
      }
      
      private function get numberBar() : NumBarS1
      {
         return numbar as NumBarS1;
      }
   }
}
