package nslm2.modules.bag
{
   import game.ui.BagModules.SellBatchViewUI;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import com.mz.core.configs.EnvConfig;
   import nslm2.common.uiEffects.WealthFlyEffectTask;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.handlers.Handler;
   import proto.BagItemSellReq.SellInfo;
   import com.netease.protobuf.UInt64;
   import morn.customs.components.WealthRender;
   import flash.events.Event;
   import nslm2.common.uiEffects.IconFlyEff;
   import morn.core.components.Image;
   import nslm2.utils.Uint64Util;
   import com.mz.core.utils.ArrayUtil;
   import com.mz.core.event.MzEvent;
   import com.mz.core.event.ValueChangedEvent;
   import proto.BagItemSellReq;
   import nslm2.nets.sockets.ServerEngine;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   
   public class SellBatchView extends SellBatchViewUI
   {
      
      public static const SELL_CPL:String = "sellCpl";
      
      public static const REMOVE_ITEM:String = "REMOVE_ITEM";
      
      public static const DRAG_ITEM:String = "DRAG_ITEM";
      
      public static const GAP_WITH_BAG_VIEW:int = 12;
       
      
      public var hideX:int;
      
      public var isActived:Boolean = false;
      
      public var waitingSellIdArr:Vector.<UInt64>;
      
      private var currentSellPriceAll:int = 0;
      
      public function SellBatchView()
      {
         waitingSellIdArr = new Vector.<UInt64>();
         super();
         this.box_total.visible = false;
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         this.img_txtSellPriceAll.skin = UrlLib.moduleAssets_footstones("bagModules/TxtSellPriceAll.png");
         this.panelBg.titleImgId = 11020;
         this.list_sellItem.vScrollBarSkin = "png.a5.comps.scrollBar.vscroll_S3";
         this.list_sellItem.addEventListener("evtSellBatchRemove",sellBatchRemoveHandler);
         this.list_sellItem.addEventListener("evtSellBatchCountChanged",sellBatchCountChangedHandler);
         this.list_sellItem.array = [];
         changeSellPriceAll(0);
         BmcSpriteSheet.preload(new <int>[1000102,1000101]);
         this.setReceiveDrag(true,["BAG_SELL_BATCH"]);
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.btn_sell === _loc3_)
         {
            if(param2.altKey && EnvConfig.ins.showDebugModule)
            {
               new WealthFlyEffectTask(1,1000,ModuleMgr.ins.toGlobalPoi(this.renderSellPriceAll.img_icon)).exec();
            }
            else
            {
               toSell(true);
            }
         }
      }
      
      private function toSell(param1:Boolean) : void
      {
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc4_:int = this.list_sellItem.array.length;
         if(_loc4_ == 0)
         {
            return;
         }
         var _loc6_:Array = [];
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = this.list_sellItem.array[_loc5_];
            if(param1 && _loc3_.stcItemVo.quality >= 4)
            {
               AlertUtil.comfirm(LocaleMgr.ins.getStr(11000901),new Handler(this.toSell,[false]),null,"SELL_CHECK_QUALITY_NO_SHOW_KEY");
               return;
            }
            _loc2_ = new SellInfo();
            _loc2_.itemId = _loc3_.item.id;
            _loc2_.count = _loc3_.extraData["sellCount"];
            _loc6_.push(_loc2_);
            _loc5_++;
         }
         server_bagItemSell(_loc6_);
      }
      
      public function addWaitingSell(param1:WealthVo, param2:WealthRender) : void
      {
         var _loc3_:* = null;
         param1.extraData["sellCount"] = param1.showCount;
         waitingSellIdArr.push(param1.item.id);
         this.list_sellItem.addItem(param1);
         changeSellPriceAll(param1.stcItemVo.sellCount * param1.extraData["sellCount"]);
         this.txt_prompt.visible = list_sellItem.array.length <= 1;
         this.list_sellItem.scrollToBottom();
         if(param2)
         {
            this.list_sellItem.commitMeasure();
            _loc3_ = this.list_sellItem.lastCellActived as SellBatchItemRender;
            _loc3_.flyFrom(param2);
         }
      }
      
      private function changeSellPriceAll(param1:int) : void
      {
         currentSellPriceAll = currentSellPriceAll + param1;
         var _loc2_:WealthVo = new WealthVo();
         _loc2_.kind = 1;
         _loc2_.count = currentSellPriceAll;
         this.renderSellPriceAll.wealthVo = _loc2_;
      }
      
      private function sellBatchRemoveHandler(param1:Event) : void
      {
         var _loc4_:SellBatchItemRender = param1.target as SellBatchItemRender;
         var _loc3_:Image = IconFlyEff.copyImage(_loc4_.img_icon);
         Uint64Util.removeItemFromArray(this.waitingSellIdArr,_loc4_.wealthVo.item.id);
         var _loc2_:Array = this.list_sellItem.array;
         ArrayUtil.removeItem(_loc2_,_loc4_.wealthVo);
         this.list_sellItem.array = _loc2_;
         changeSellPriceAll(-_loc4_.wealthVo.stcItemVo.sellCount * _loc4_.wealthVo.extraData["sellCount"]);
         this.txt_prompt.visible = _loc2_.length <= 1;
         this.dispatchEvent(new MzEvent("REMOVE_ITEM",[_loc4_,_loc3_]));
      }
      
      private function sellBatchCountChangedHandler(param1:ValueChangedEvent) : void
      {
         var _loc2_:SellBatchItemRender = param1.target as SellBatchItemRender;
         changeSellPriceAll(_loc2_.wealthVo.stcItemVo.sellCount * (param1.newValue - param1.oldValue));
      }
      
      public function removeAllWaitingItem() : void
      {
         waitingSellIdArr.length = 0;
         this.list_sellItem.array = [];
         changeSellPriceAll(-currentSellPriceAll);
         this.txt_prompt.visible = true;
      }
      
      public function server_bagItemSell(param1:Array) : void
      {
         var _loc2_:BagItemSellReq = new BagItemSellReq();
         _loc2_.info = param1;
         ServerEngine.ins.send(4021,_loc2_,server_itemSellCpl);
      }
      
      private function server_itemSellCpl() : void
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         var _loc2_:int = this.list_sellItem.cells.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = this.list_sellItem.cells[_loc3_] as SellBatchItemRender;
            if(_loc1_)
            {
               _loc1_.wealthFly();
            }
            _loc3_++;
         }
         this.removeAllWaitingItem();
         this.dispatchEvent(new Event("sellCpl"));
      }
      
      override protected function receivedDragData(param1:String, param2:Object) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = param1;
         if("BAG_SELL_BATCH" === _loc4_)
         {
            _loc3_ = param2 as BagItemRender;
            this.dispatchEvent(new MzEvent("DRAG_ITEM",_loc3_));
         }
      }
   }
}
