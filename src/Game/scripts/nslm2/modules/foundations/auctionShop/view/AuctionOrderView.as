package nslm2.modules.foundations.auctionShop.view
{
   import game.ui.auctionShopModule.MyOrderViewUI;
   import com.mz.core.interFace.IViewStackPage;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.foundations.auctionShop.model.AuctionShopModel;
   import nslm2.modules.foundations.auctionShop.service.AuctionShopService;
   import nslm2.modules.foundations.auctionShop.ctr.BtnCountDownCtr;
   import morn.core.components.Button;
   import nslm2.modules.foundations.vip.model.VipModel;
   import proto.AuctionItem;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.common.model.PlayerModel;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.AuctionMyOrderRes;
   import nslm2.common.event.WealthChangeEvent;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.modules.foundations.auctionShop.vo.SortTitleVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   
   public class AuctionOrderView extends MyOrderViewUI implements IViewStackPage, IObserver
   {
       
      
      private var model:AuctionShopModel;
      
      private var service:AuctionShopService;
      
      private var btnCountDownCtr:BtnCountDownCtr;
      
      public function AuctionOrderView()
      {
         model = AuctionShopModel.ins;
         service = AuctionShopService.ins;
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btnClickHandler);
         list_title.dataSource = [new SortTitleVo(LocaleMgr.ins.getStr(30610017),"endTm"),new SortTitleVo(LocaleMgr.ins.getStr(30610019),"curPrice")];
         (pageBarUI as IPageBar).bindList(list_item);
      }
      
      private function btnClickHandler(param1:Button) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = param1;
         if(btn_refresh !== _loc3_)
         {
            if(btn_recharge !== _loc3_)
            {
               if(btn_set === _loc3_)
               {
                  _loc2_ = list_item.selectedItem as AuctionItem;
                  if(_loc2_)
                  {
                     ModuleMgr.ins.showModule(30612,_loc2_,ModuleMgr.ins.popLayer.curModuleId);
                  }
               }
            }
            else
            {
               VipModel.ins.gotoCharge();
            }
         }
         else
         {
            if(!btnCountDownCtr)
            {
               btnCountDownCtr = new BtnCountDownCtr();
               btnCountDownCtr.init(btn_refresh,5);
               this.parts.push(btnCountDownCtr);
            }
            btnCountDownCtr.start();
            service.reqMyOrderList(updateMyOrderList);
         }
      }
      
      public function viewStackIn() : void
      {
         this.visible = true;
         this.list_item.dataSource = model.myOrderArr;
         txt_gold.text = PlayerModel.ins.getWealthValue(4) + "";
         ObserverMgr.ins.regObserver(this);
         service.reqMyOrderList(updateMyOrderList);
         this.fadeIn();
      }
      
      private function updateMyOrderList(param1:AuctionMyOrderRes) : void
      {
         if(param1 && param1.items)
         {
            model.myOrderArr = param1.items;
            model.sortAuctionList(model.myOrderArr,model.sortVo3);
            list_item.dataSource = model.myOrderArr;
         }
         else
         {
            model.myOrderArr = [];
            list_item.dataSource = [];
         }
      }
      
      public function viewStackOut() : void
      {
         this.visible = false;
         ObserverMgr.ins.unregObserver(this);
         this.fadeOut();
      }
      
      public function getFocusNotices() : Array
      {
         return ["auction_notice_sort","auction_notice_upate_order","wealthChange","auction_notice_refresh_list"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = param1;
         if("auction_notice_sort" !== _loc4_)
         {
            if("auction_notice_upate_order" !== _loc4_)
            {
               if("wealthChange" !== _loc4_)
               {
                  if("auction_notice_refresh_list" === _loc4_)
                  {
                     if(param2 == 1)
                     {
                        service.reqMyOrderList(updateMyOrderList);
                     }
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
               service.reqMyOrderList(updateMyOrderList);
            }
         }
         else
         {
            model.sortVo3 = param2;
            list_item.dataSource = model.sortAuctionList(list_item.dataSource as Array,param2);
         }
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         super.dispose();
      }
   }
}
