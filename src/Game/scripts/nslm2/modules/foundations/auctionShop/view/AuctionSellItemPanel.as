package nslm2.modules.foundations.auctionShop.view
{
   import game.ui.auctionShopModule.AuctionSellItemPanelUI;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.mgrs.stcMgrs.vos.StcAuctionVo;
   import proto.Item;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.common.ui.components.comps2d.numBar.NumBarS1;
   import flash.events.Event;
   import morn.core.components.Button;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.foundations.auctionShop.service.AuctionShopService;
   import nslm2.common.model.PlayerModel;
   import proto.AuctionSellItemRes;
   import nslm2.modules.cultivates.treasure.model.TreasureModel;
   import nslm2.modules.foundations.auctionShop.model.AuctionShopModel;
   import morn.customs.expands.MornExpandUtil;
   
   public class AuctionSellItemPanel extends AuctionSellItemPanelUI
   {
       
      
      private var vo:WealthVo;
      
      private var timeSelection:Array;
      
      public function AuctionSellItemPanel()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btnClickHandler);
         moduleFadeInType = 2;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc9_:* = null;
         var _loc12_:int = 0;
         var _loc3_:int = 0;
         var _loc15_:int = 0;
         var _loc8_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc16_:int = 0;
         var _loc10_:* = null;
         var _loc7_:* = null;
         var _loc13_:int = 0;
         var _loc4_:int = 0;
         var _loc11_:int = 0;
         panelBg.txt_titleName.text = LocaleMgr.ins.getStr(30610040);
         vo = param1 as WealthVo;
         if(vo)
         {
            if(vo.treasure)
            {
               _loc9_ = StcMgr.ins.getItemVo(vo.sid);
               _loc12_ = _loc9_.quality;
               switch(int(_loc12_) - 5)
               {
                  case 0:
                     _loc8_ = DefindConsts.treasure_AH_5_shangjia;
                     _loc5_ = DefindConsts.treasure_AH_5;
                     break;
                  case 1:
                     _loc8_ = DefindConsts.treasure_AH_6_shangjia;
                     _loc5_ = DefindConsts.treasure_AH_6;
                     break;
                  case 2:
                     _loc8_ = DefindConsts.treasure_AH_7_shangjia;
                     _loc5_ = DefindConsts.treasure_AH_7;
               }
               _loc15_ = StcMgr.ins.getGlobalPriceVo(int(_loc8_.split("|")[0])).price;
               _loc3_ = StcMgr.ins.getGlobalPriceVo(int(_loc8_.split("|")[1])).price;
               _loc6_ = StcMgr.ins.getGlobalPriceVo(int(_loc5_.split("|")[0])).price;
               _loc16_ = StcMgr.ins.getGlobalPriceVo(int(_loc5_.split("|")[1])).price;
               itemRender.dataSource = vo;
               box_num.visible = false;
            }
            else
            {
               box_onePrice.visible = false;
               box_sjfy.visible = false;
               _loc10_ = StcMgr.ins.getAuctionVo(vo.itemId);
               _loc7_ = new WealthVo();
               _loc7_.kind = 20;
               _loc7_.item = new Item();
               _loc7_.item.itemId = vo.item.itemId;
               _loc7_.item.id = vo.item.id;
               _loc7_.sid = vo.sid;
               _loc7_.item.count = _loc10_.duidie_num;
               _loc15_ = _loc10_.cost;
               _loc3_ = 9999999999999;
               itemRender.dataSource = _loc7_;
               numberBar.disabled = true;
               _loc13_ = BagModel.ins.getStcCount(vo.itemId) / _loc10_.duidie_num;
               (numbarCnt as NumBarS1).init(1,_loc13_,1);
               (numbarCnt as NumBarS1).addEventListener("evt_numbar_value_change",changeNumHandler);
               box_num.visible = true;
               txt_priceLbl.text = LocaleMgr.ins.getStr(30610108);
            }
            numberBar.init(_loc15_,_loc3_,_loc15_);
            numberBar.addEventListener("evt_numbar_value_change",changeSellPriceHandler);
            (numbarOnePrice as NumBarS1).init(_loc6_,_loc16_,_loc6_);
            txt_cost.text = "@{wealth:3}" + DefindConsts.treasure_AH_onsaleCost;
         }
         timeSelection = String(DefindConsts.treasure_AH_totaltime).split("|");
         var _loc14_:Array = [];
         var _loc2_:int = timeSelection.length;
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc11_ = timeSelection[_loc4_];
            _loc14_.push(_loc11_ + LocaleMgr.ins.getStr(999000196));
            _loc4_++;
         }
         numbarOnePrice.addEventListener("evt_numbar_value_change",changeOneSellPriceHandler);
         comb_time.labels = _loc14_.join(",");
         comb_time.selectedIndex = 0;
         numbar.btn_max.visible = false;
         numbarOnePrice.btn_max.visible = false;
         super.preShow(param1);
      }
      
      protected function changeOneSellPriceHandler(param1:Event) : void
      {
         if(int(numbarOnePrice.txt_input.text) < int(numberBar.txt_input.text))
         {
            numbarOnePrice.txt_input.text = numberBar.txt_input.text;
         }
      }
      
      protected function changeSellPriceHandler(param1:Event) : void
      {
         if(int(numbarOnePrice.txt_input.text) < int(numberBar.txt_input.text))
         {
            numbarOnePrice.txt_input.text = numberBar.txt_input.text;
         }
      }
      
      protected function changeNumHandler(param1:Event) : void
      {
         var _loc2_:StcAuctionVo = StcMgr.ins.getAuctionVo(vo.itemId);
         numbar.txt_input.text = _loc2_.cost * int(numbarCnt.txt_input.text) + "";
      }
      
      private function btnClickHandler(param1:Button) : void
      {
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         var _loc6_:* = param1;
         if(btn_ok !== _loc6_)
         {
            if(btn_cancel === _loc6_)
            {
               btnCloseHandler(null);
            }
         }
         else if(vo.kind == 20)
         {
            _loc5_ = 2;
            _loc3_ = StcMgr.ins.getAuctionVo(vo.itemId);
            _loc2_ = BagModel.ins.getStcCount(vo.itemId);
            _loc4_ = _loc3_.duidie_num * int(numbarCnt.txt_input.text);
            if(_loc2_ < _loc4_)
            {
               AlertUtil.float(30610100);
            }
            else
            {
               AuctionShopService.ins.sellItem(vo.id,int(numberBar.txt_input.text),int(numberBar.txt_input.text),comb_time.selectedIndex + 1,_loc5_,sellSuccessHandler,_loc4_);
            }
         }
         else
         {
            _loc5_ = 1;
            if(PlayerModel.ins.diamond < DefindConsts.treasure_AH_onsaleCost)
            {
               AlertUtil.showRechargeAlert();
               return;
            }
            AuctionShopService.ins.sellItem(vo.id,int(numberBar.txt_input.text),int(numbarOnePrice.txt_input.text),comb_time.selectedIndex + 1,_loc5_,sellSuccessHandler,vo.count);
         }
      }
      
      private function sellSuccessHandler(param1:AuctionSellItemRes) : void
      {
         if(vo.treasure)
         {
            TreasureModel.ins.updateTreasureStatus(vo.treasure.id,3);
         }
         if(param1 && param1.item)
         {
            AuctionShopModel.ins.addMySellItem(param1.item);
         }
         btnCloseHandler(null);
         AlertUtil.float(LocaleMgr.ins.getStr(30610540));
      }
      
      public function get numberBar() : NumBarS1
      {
         return numbar as NumBarS1;
      }
   }
}
