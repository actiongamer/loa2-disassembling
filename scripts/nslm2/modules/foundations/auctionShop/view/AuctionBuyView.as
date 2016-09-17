package nslm2.modules.foundations.auctionShop.view
{
   import game.ui.auctionShopModule.BuyViewUI;
   import com.mz.core.interFace.IViewStackPage;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.foundations.auctionShop.model.AuctionShopModel;
   import nslm2.modules.foundations.auctionShop.service.AuctionShopService;
   import nslm2.modules.foundations.auctionShop.ctr.BtnCountDownCtr;
   import morn.core.components.Button;
   import nslm2.modules.foundations.vip.model.VipModel;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.AuctionItem;
   import nslm2.utils.Uint64Util;
   import nslm2.common.model.PlayerModel;
   import morn.core.handlers.Handler;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import proto.GetAuctionListRes;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.common.event.WealthChangeEvent;
   import proto.AuctionMyOrderRes;
   import flash.events.MouseEvent;
   import proto.AuctionBuyItemRes;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.modules.foundations.auctionShop.vo.SortTitleVo;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   
   public class AuctionBuyView extends BuyViewUI implements IViewStackPage, IObserver
   {
       
      
      private var model:AuctionShopModel;
      
      private var service:AuctionShopService;
      
      private var btnCountDownCtr:BtnCountDownCtr;
      
      public function AuctionBuyView()
      {
         model = AuctionShopModel.ins;
         service = AuctionShopService.ins;
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btnHandler);
         typeGroup.selectHandler = changeTypeHandler;
         var _loc2_:* = model.searchLabels.join(",");
         comb_3.labels = _loc2_;
         _loc2_ = _loc2_;
         comb_2.labels = _loc2_;
         comb_1.labels = _loc2_;
         var _loc1_:Array = [new SortTitleVo(LocaleMgr.ins.getStr(30610016),"quality"),new SortTitleVo(LocaleMgr.ins.getStr(30610017),"endTm"),new SortTitleVo(LocaleMgr.ins.getStr(30610114),"oncePrice"),new SortTitleVo(LocaleMgr.ins.getStr(30610019),"curPrice")];
         list_title.dataSource = _loc1_;
         (pageBarUI as IPageBar).bindList(list_item);
         list_item.mouseHandler = listMouseHandler;
      }
      
      private function btnHandler(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(btn_recharge !== _loc2_)
         {
            if(btn_buy !== _loc2_)
            {
               if(btn_search !== _loc2_)
               {
                  if(btn_refresh === _loc2_)
                  {
                     if(!btnCountDownCtr)
                     {
                        btnCountDownCtr = new BtnCountDownCtr();
                        btnCountDownCtr.init(btn_refresh,5);
                        this.parts.push(btnCountDownCtr);
                     }
                     btnCountDownCtr.start();
                     AuctionShopService.ins.reqAuctionList(model.buyFilterType + 1,getItemsSuccess);
                  }
               }
               else
               {
                  searchTreasure();
                  if(list_item.dataSource.length < 1)
                  {
                     AlertUtil.float(LocaleMgr.ins.getStr(30610105));
                  }
               }
            }
            else if(list_item.selectedItem)
            {
               buyItemHandler();
            }
         }
         else
         {
            VipModel.ins.gotoCharge();
         }
      }
      
      private function buyItemHandler() : void
      {
         var _loc1_:AuctionItem = list_item.selectedItem as AuctionItem;
         var _loc4_:int = 0;
         var _loc3_:* = AuctionShopModel.ins.myOrderArr;
         for each(var _loc2_ in AuctionShopModel.ins.myOrderArr)
         {
            if(Uint64Util.equal(_loc2_.id,_loc1_.id))
            {
               AlertUtil.float(LocaleMgr.ins.getStr(30610080));
               return;
            }
         }
         if(PlayerModel.ins.isCurPlayer(_loc1_.playerId) && _loc1_.dist == PlayerModel.ins.dist)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(30610081));
            return;
         }
         if(!model.canBuy)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(30610082));
         }
         else if(!_loc1_.baowu)
         {
            AlertUtil.comfirm(LocaleMgr.ins.getStr(30610095,[_loc1_.curPrice]),new Handler(doBuyItem,[_loc1_]));
         }
         else
         {
            ModuleMgr.ins.showModule(30612,_loc1_,ModuleMgr.ins.popLayer.curModuleId);
         }
      }
      
      private function getItemsSuccess(param1:GetAuctionListRes) : void
      {
         if(param1 && param1.items)
         {
            if(model.buyFilterType == 0)
            {
               model.allTreausreArr = param1.items;
            }
            else
            {
               model.allItemsArr = param1.items;
            }
            updateList();
         }
         else
         {
            if(model.buyFilterType == 0)
            {
               model.allTreausreArr = [];
            }
            else
            {
               model.allItemsArr = [];
            }
            list_item.dataSource = [];
         }
         showEmptyTip();
      }
      
      private function searchTreasure() : void
      {
         var _loc1_:Array = [];
         _loc1_.push(comb_1.selectedIndex,comb_2.selectedIndex,comb_3.selectedIndex);
         list_item.dataSource = model.searchItem(_loc1_);
      }
      
      private function changeTypeHandler() : void
      {
         model.buyFilterType = typeGroup.selectedIndex;
         if(model.buyFilterType == 0)
         {
            box_search.disabled = false;
         }
         else
         {
            if(!model.allItemsArr || model.allItemsArr.length == 0)
            {
               AuctionShopService.ins.reqAuctionList(model.buyFilterType + 1,getItemsSuccess);
            }
            box_search.disabled = true;
         }
         updateList();
      }
      
      public function viewStackIn() : void
      {
         this.visible = true;
         updateList();
         txt_gold.text = PlayerModel.ins.getWealthValue(4) + "";
         typeGroup.selectedIndex = model.buyFilterType;
         ObserverMgr.ins.regObserver(this);
         this.fadeIn();
      }
      
      private function updateList() : void
      {
         var _loc1_:* = null;
         if(model.buyFilterType == 0)
         {
            _loc1_ = model.allTreausreArr;
         }
         else
         {
            _loc1_ = model.allItemsArr;
         }
         model.sortAuctionList(_loc1_,model.sortVo1);
         if(model.buyFilterType == 0)
         {
            searchTreasure();
         }
         else
         {
            list_item.dataSource = _loc1_;
         }
         showEmptyTip();
      }
      
      public function viewStackOut() : void
      {
         this.visible = false;
         ObserverMgr.ins.unregObserver(this);
         this.fadeOut();
      }
      
      public function getFocusNotices() : Array
      {
         return ["auction_notice_sort","wealthChange","auction_notice_upate_order","auction_notice_refresh_list"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = param1;
         if("auction_notice_sort" !== _loc4_)
         {
            if("wealthChange" !== _loc4_)
            {
               if("auction_notice_refresh_list" !== _loc4_)
               {
                  if("auction_notice_upate_order" === _loc4_)
                  {
                     updateList();
                  }
               }
               else if(param2 == 1)
               {
                  service.reqMyOrderList(updateMyOrderList);
               }
            }
            else
            {
               _loc3_ = param2 as WealthChangeEvent;
               if(_loc3_.wealthType == 4)
               {
                  txt_gold.text = PlayerModel.ins.getWealthValue(4);
               }
            }
         }
         else
         {
            model.sortVo1 = param2;
            list_item.dataSource = model.sortAuctionList(list_item.dataSource as Array,param2);
         }
      }
      
      private function updateMyOrderList(param1:AuctionMyOrderRes) : void
      {
         if(param1 && param1.items)
         {
            model.myOrderArr = param1.items;
         }
         else
         {
            model.myOrderArr = [];
         }
         list_item.refresh();
      }
      
      private function listMouseHandler(param1:MouseEvent, param2:int) : void
      {
         if(param1.type == "doubleClick")
         {
            buyItemHandler();
         }
      }
      
      private function doBuyItem(param1:*) : void
      {
         AuctionShopService.ins.buyItem(param1.id,false,param1.curPrice,buyItemSuccessHandler);
      }
      
      private function buyItemSuccessHandler(param1:AuctionBuyItemRes) : void
      {
         var _loc3_:WealthVo = new WealthVo();
         _loc3_.kind = 20;
         _loc3_.sid = param1.item.item.id;
         _loc3_.count = param1.item.item.count;
         FloatUtil.showGetItemsDisplayPanel([_loc3_]);
         var _loc2_:Array = list_item.dataSource as Array;
         Uint64Util.removeItemByAttr(model.allItemsArr,"id",param1.item.id);
         Uint64Util.removeItemByAttr(_loc2_,"id",param1.item.id);
         list_item.dataSource = _loc2_;
         showEmptyTip();
      }
      
      private function showEmptyTip() : void
      {
         if(model.buyFilterType == 0)
         {
            if(!model.allTreausreArr.length)
            {
               txt_empty.text = LocaleMgr.ins.getStr(30610112);
               txt_empty.visible = true;
            }
            else
            {
               txt_empty.visible = false;
            }
         }
         else if(!model.allItemsArr.length)
         {
            txt_empty.text = LocaleMgr.ins.getStr(30610113);
            txt_empty.visible = true;
         }
         else
         {
            txt_empty.visible = false;
         }
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         super.dispose();
      }
   }
}
