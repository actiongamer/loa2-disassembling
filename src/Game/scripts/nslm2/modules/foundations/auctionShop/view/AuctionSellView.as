package nslm2.modules.foundations.auctionShop.view
{
   import game.ui.auctionShopModule.SellViewUI;
   import com.mz.core.interFace.IViewStackPage;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.foundations.auctionShop.model.AuctionShopModel;
   import nslm2.modules.foundations.auctionShop.service.AuctionShopService;
   import nslm2.modules.foundations.auctionShop.ctr.BtnCountDownCtr;
   import morn.core.components.Button;
   import proto.AuctionItem;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.AuctionMySellsRes;
   import com.mz.core.utils.ArrayUtil;
   import proto.AuctionUnsellItemRes;
   import nslm2.modules.cultivates.treasure.model.TreasureModel;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   import nslm2.modules.foundations.auctionShop.vo.SortTitleVo;
   
   public class AuctionSellView extends SellViewUI implements IViewStackPage, IObserver
   {
       
      
      private var model:AuctionShopModel;
      
      private var service:AuctionShopService;
      
      private var btnCountDownCtr:BtnCountDownCtr;
      
      public function AuctionSellView()
      {
         model = AuctionShopModel.ins;
         service = AuctionShopService.ins;
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btnHandler);
         (pageBar2 as IPageBar).bindList(list_treasure);
         (pageBar1 as IPageBar).bindList(sellView.list_item);
         var _loc1_:Array = [new SortTitleVo(LocaleMgr.ins.getStr(30610016),"quality"),new SortTitleVo(LocaleMgr.ins.getStr(30610017),"endTm"),new SortTitleVo(LocaleMgr.ins.getStr(30610114),"oncePrice"),new SortTitleVo(LocaleMgr.ins.getStr(30610019),"curPrice")];
         list_title.dataSource = _loc1_;
      }
      
      private function btnHandler(param1:Button) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = param1;
         if(btn_unSell !== _loc3_)
         {
            if(btn_sell !== _loc3_)
            {
               if(btn_refresh === _loc3_)
               {
                  if(!btnCountDownCtr)
                  {
                     btnCountDownCtr = new BtnCountDownCtr();
                     btnCountDownCtr.init(btn_refresh,5);
                     this.parts.push(btnCountDownCtr);
                  }
                  btnCountDownCtr.start();
                  service.reqMySellList(updateMySellList);
               }
            }
            else
            {
               _loc2_ = list_treasure.selectedItem as WealthVo;
               if(!_loc2_)
               {
                  AlertUtil.float(LocaleMgr.ins.getStr(30610083));
                  return;
               }
               if(model.canSell)
               {
                  ModuleMgr.ins.showModule(30611,_loc2_,ModuleMgr.ins.popLayer.curModuleId);
               }
               else
               {
                  AlertUtil.float(LocaleMgr.ins.getStr(30610084));
               }
            }
         }
         else
         {
            model.selectedAuctionItem = sellView.list_item.selectedItem as AuctionItem;
            if(!model.selectedAuctionItem)
            {
               return;
            }
            AlertUtil.comfirm(LocaleMgr.ins.getStr(30610098),doUnSell);
         }
      }
      
      public function viewStackIn() : void
      {
         this.visible = true;
         sellView.list_item.dataSource = model.myAuctionArr;
         service.reqMySellList(updateMySellList);
         updateTreausreList();
         ObserverMgr.ins.regObserver(this);
         this.fadeIn();
      }
      
      public function viewStackOut() : void
      {
         this.visible = false;
         ObserverMgr.ins.unregObserver(this);
         model.selectedSellItem = null;
         model.selectedAuctionItem = null;
         this.fadeOut();
      }
      
      public function getFocusNotices() : Array
      {
         return ["auction_notice_update_my_sell_list","auction_notice_sort","wealthChange","auction_notice_refresh_list"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("auction_notice_update_my_sell_list" !== _loc3_)
         {
            if("auction_notice_sort" !== _loc3_)
            {
               if("auction_notice_refresh_list" === _loc3_)
               {
                  if(param2 == 2)
                  {
                     service.reqMySellList(updateMySellList);
                  }
               }
            }
            else
            {
               model.sortVo2 = param2;
               updateMyAuctionList();
            }
         }
         else
         {
            updateMyAuctionList();
            updateTreausreList();
         }
      }
      
      private function updateMySellList(param1:AuctionMySellsRes) : void
      {
         if(param1 && param1.items)
         {
            model.myAuctionArr = param1.items;
         }
         else
         {
            model.myAuctionArr = [];
         }
         updateMyAuctionList();
      }
      
      private function updateTreausreList() : void
      {
         var _loc2_:Array = model.canSellItemArr;
         var _loc1_:Array = ArrayUtil.fillBySameItem(_loc2_,this.list_treasure.repeatX * this.list_treasure.repeatY - _loc2_.length,null);
         list_treasure.dataSource = _loc1_;
      }
      
      private function doUnSell() : void
      {
         service.unSellItem(model.selectedAuctionItem.id,unSellSuccess);
      }
      
      private function unSellSuccess(param1:AuctionUnsellItemRes) : void
      {
         AlertUtil.float(LocaleMgr.ins.getStr(30610085));
         TreasureModel.ins.updateTreasureStatus(param1.bwid,0);
         model.removeSellItem(param1.id,param1.bwid);
         updateMyAuctionList();
         updateTreausreList();
      }
      
      private function updateMyAuctionList() : void
      {
         sellView.list_item.dataSource = model.sortAuctionList(model.myAuctionArr,model.sortVo2);
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         super.dispose();
      }
   }
}
