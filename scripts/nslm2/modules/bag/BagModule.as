package nslm2.modules.bag
{
   import game.ui.BagModules.BagModuleUI;
   import com.mz.core.interFace.ILogger;
   import com.mz.core.logging.Log;
   import nslm2.common.ui.components.comps2d.pageBar.PageBarS2;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.ui.components.comps2d.others.RedPoint;
   import morn.core.components.Component;
   import nslm2.nets.sockets.ServerEngine;
   import proto.GetSerialNumberRes;
   import nslm2.modules.foundations.AlertUtil;
   import proto.ProtocolStatusRes;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import com.mz.core.configs.EnvConfig;
   import nslm2.common.uiEffects.ListIconFlyEff;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import morn.customs.components.WealthRender;
   import com.greensock.TweenLite;
   import com.greensock.easing.Back;
   import com.greensock.easing.Cubic;
   import flash.events.Event;
   import com.mz.core.event.MzEvent;
   import nslm2.utils.WealthUtil;
   import nslm2.utils.Uint64Util;
   import morn.core.components.Image;
   import com.netease.protobuf.UInt64;
   import flash.geom.Point;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.tipMenus.TipMenuMsg;
   import nslm2.modules.footstones.tipMenus.TipMenuConfigVo;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.footstones.tipMenus.TipMenuConsts;
   import nslm2.modules.cultivates.treasure.model.TreasureModel;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.common.compsEffects.ListCellTweenEffect;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.modules.bag.itemModuels.BagConsts;
   import nslm2.modules.battles.heroAwakenRoad.model.HeroAwakenRoadModel;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.mgrs.stcMgrs.StcMgr;
   
   public class BagModule extends BagModuleUI
   {
      
      private static var logger:ILogger = Log.getClassLogger(BagModule);
      
      private static const kindGroup_equipPieces:int = 4;
      
      private static const kindGroup_treasure:int = 6;
       
      
      private var kindGroupArr:Array;
      
      private var kindBtns:Array;
      
      private var sellBatchView:nslm2.modules.bag.SellBatchView;
      
      public var curPage:int;
      
      private var redPoint:Component;
      
      private var filterArr:Array;
      
      public function BagModule()
      {
         kindGroupArr = [0,1,2,3,4,6,5];
         kindBtns = [[1,2,3],[1,3],[1],[1,2],[1,2],[1],[1,2]];
         filterArr = [21,61];
         super();
      }
      
      public function get pageBar() : PageBarS2
      {
         return this.pageBarUI as PageBarS2;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc4_:int = 0;
         this.panelBg.titleImgId = this.moduleId;
         this.boxBtns.commitMeasure();
         DisplayUtils.addChildFromGlobal(this.btn_order,img_icon_order);
         DisplayUtils.addChildFromGlobal(this.btn_sell,img_icon_sell);
         DisplayUtils.addChildFromGlobal(this.btn_recycle,img_icon_recycle);
         var _loc2_:int = kindGroupArr.length;
         var _loc3_:Array = [];
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_.push(LocaleMgr.ins.getStr(4100 + kindGroupArr[_loc4_]));
            _loc4_++;
         }
         this.tabKindGroup.labels = _loc3_.join(",");
         this.tabKindGroup.selectedIndex = 0;
         this.tabKindGroup.userChangeHandler = tabKind_change;
         redPoint = new RedPoint();
         redPoint.right = -2;
         redPoint.top = -2;
         (this.tabKindGroup.items[4] as Component).addChild(redPoint);
         this.countEquipComposeRedPoint();
         this.pageBar.bindList(this.list_items);
         this.list_items.mouseHandler = list_mouseHandler;
         sellBatchView = new nslm2.modules.bag.SellBatchView();
         sellBatchView.addEventListener("close",sellBatchView_closeHandler);
         sellBatchView.addEventListener("sellCpl",sellBatchView_sellCplHandler);
         sellBatchView.addEventListener("DRAG_ITEM",sellBatchView_dragItemHandler);
         sellBatchView.addEventListener("REMOVE_ITEM",sellBatchView_removeItemHandler);
         DisplayUtils.addChildBelow(sellBatchView,this.panelBg);
         sellBatchView.x = this.width - sellBatchView.width;
         sellBatchView.hideX = sellBatchView.x;
         sellBatchView.alpha = 0;
         this.refresh();
         ServerEngine.ins.addAlwayHandler(10000,yiYeInfoNotifyHander,yiYeInfoNotifyErrorHander);
         super.preShow(param1);
      }
      
      private function yiYeInfoNotifyHander(param1:GetSerialNumberRes) : void
      {
         if(param1.code == "0")
         {
            AlertUtil.float(LocaleMgr.ins.getStr(999000592,[param1.resultInfo]));
         }
         this.refresh();
      }
      
      private function yiYeInfoNotifyErrorHander(param1:ProtocolStatusRes) : void
      {
         AlertUtil.float(LocaleMgr.ins.getStr(param1.errCode));
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         NGUtil.checkModuleShow(this.moduleId,this);
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(btn_order !== _loc3_)
         {
            if(btn_sell !== _loc3_)
            {
               if(btn_recycle === _loc3_)
               {
                  ModuleMgr.ins.showModule(11300,1);
               }
            }
            else if(EnvConfig.ins.showDebugModule && param2.altKey)
            {
               new ListIconFlyEff(this.list_items).set_getToTargetHandler(getToTargetHandler).exec();
            }
            else
            {
               switchSellBatch(!sellBatchView.isActived);
            }
         }
         else if(EnvConfig.ins.showDebugModule && param2.altKey)
         {
            new ListIconFlyEff(this.list_items).set_autoHideFrom(false).exec();
         }
         else
         {
            BagModel.ins.order();
            this.refresh(true,true);
         }
      }
      
      private function getToTargetHandler(param1:ListIconFlyEff, param2:WealthRender) : *
      {
         if(param2.wealthVoIsEnable)
         {
            switch(int(param2.wealthVo.kind) - 12)
            {
               case 0:
                  return this.btn_sell;
               default:
               default:
                  return ListIconFlyEff.getToTargetFromWealthRender(param1,param2);
               case 3:
                  return this.btn_order;
            }
         }
         else
         {
            return null;
         }
      }
      
      private function switchSellBatch(param1:Boolean) : void
      {
         sellBatchView.isActived = param1;
         if(param1)
         {
            this.btn_sell.label = LocaleMgr.ins.getStr(999000017);
            TweenLite.to(sellBatchView,0.5,{
               "x":this.width + 12,
               "alpha":1,
               "ease":Back.easeOut,
               "onComplete":sellBatchView_showCpl
            });
            sellBatchView.removeAllWaitingItem();
         }
         else
         {
            this.btn_sell.label = LocaleMgr.ins.getStr(999000018);
            TweenLite.to(sellBatchView,0.5,{
               "x":sellBatchView.hideX,
               "alpha":0,
               "ease":Cubic.easeOut
            });
         }
         validateListSellState();
      }
      
      private function sellBatchView_showCpl() : void
      {
         NGUtil.checkModuleShow(11020,this.sellBatchView);
      }
      
      private function validateListSellState() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = null;
         var _loc1_:int = this.list_items.cells.length;
         _loc3_ = 0;
         while(_loc3_ < _loc1_)
         {
            _loc2_ = this.list_items.cells[_loc3_] as BagItemRender;
            _loc2_.renderSellState = new RenderSellState(this.sellBatchView.isActived,this.sellBatchView.waitingSellIdArr);
            _loc2_.validateSellState();
            _loc3_++;
         }
      }
      
      private function sellBatchView_sellCplHandler(param1:Event) : void
      {
         this.refresh(true,false);
      }
      
      private function sellBatchView_dragItemHandler(param1:MzEvent) : void
      {
         checkAndAddSell(param1.data,true);
      }
      
      private function checkAndAddSell(param1:BagItemRender, param2:Boolean = false) : void
      {
         if(WealthUtil.isCanSell(param1.wealthVo.stcItemVo.sell_price))
         {
            if(Uint64Util.indexOfArray(this.sellBatchView.waitingSellIdArr,param1.wealthVo.item.id) == -1)
            {
               this.sellBatchView.addWaitingSell(param1.wealthVo,!!param2?null:param1);
               validateListSellState();
            }
         }
      }
      
      private function sellBatchView_removeItemHandler(param1:MzEvent) : void
      {
         var _loc3_:* = null;
         var _loc6_:SellBatchItemRender = param1.data[0];
         var _loc4_:Image = param1.data[1];
         var _loc5_:UInt64 = _loc6_.wealthVo.item.id;
         var _loc2_:BagItemRender = findRenderByWealthVo(_loc6_.wealthVo);
         if(_loc2_)
         {
            _loc2_.renderSellState = new RenderSellState(this.sellBatchView.isActived,this.sellBatchView.waitingSellIdArr);
            _loc2_.validateSellState();
            _loc2_.flyFrom(_loc6_.img_icon);
         }
         else
         {
            _loc3_ = ModuleMgr.ins.toGlobalPoi(_loc6_.img_icon);
            ModuleMgr.ins.topEffectLayer.addChild(_loc4_);
            _loc4_.x = _loc3_.x;
            _loc4_.y = _loc3_.y;
            TweenLite.to(_loc4_,0.3,{
               "x":_loc4_.x - 40,
               "alpha":0,
               "onComplete":removeItemHandler,
               "onCompleteParams":[_loc4_],
               "ease":Cubic.easeOut
            });
         }
      }
      
      private function removeItemHandler(param1:Image) : void
      {
         DisplayUtils.removeSelf(param1);
      }
      
      private function sellBatchView_closeHandler(param1:Event) : void
      {
         this.switchSellBatch(false);
      }
      
      private function list_mouseHandler(param1:MouseEvent, param2:int) : void
      {
         var _loc3_:* = null;
         if(param1.type == "click")
         {
            _loc3_ = this.list_items.getCell(param2) as BagItemRender;
            if(_loc3_.wealthVoIsEnable)
            {
               if(this.sellBatchView && this.sellBatchView.isActived)
               {
                  checkAndAddSell(_loc3_);
               }
               else
               {
                  ObserverMgr.ins.sendNotice("MSG_TIP_MENU_SHOW",new TipMenuMsg(121,_loc3_.wealthVo).addHandlers(tipMenuHandlerExec,tipMenuHandlerCpl));
               }
            }
         }
      }
      
      private function tipMenuHandlerExec(param1:TipMenuConfigVo, param2:*) : void
      {
         var _loc3_:WealthVo = param2 as WealthVo;
         var _loc4_:* = param1;
         if(TipMenuConsts.ins.TIP_MENU_SELL === _loc4_)
         {
            this.switchSellBatch(true);
            this.sellBatchView.addWaitingSell(_loc3_,findRenderByWealthVo(_loc3_));
         }
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            NGUtil.regTempFunc(11020,sellBatchView);
         }
         else
         {
            NGUtil.unregTempFunc(11020);
         }
      }
      
      public function findRenderByWealthVo(param1:WealthVo) : BagItemRender
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         var _loc2_:int = list_items.cells.length;
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = list_items.cells[_loc4_] as BagItemRender;
            if(_loc3_.wealthVo && _loc3_.wealthVo.item)
            {
               if(Uint64Util.equal(_loc3_.wealthVo.item.id,param1.item.id))
               {
                  return _loc3_;
               }
            }
            _loc4_++;
         }
         return null;
      }
      
      private function tipMenuHandlerCpl(param1:TipMenuConfigVo, param2:*) : void
      {
         var _loc3_:WealthVo = param2 as WealthVo;
         var _loc4_:* = param1;
         if(TipMenuConsts.ins.TIP_MENU_USE_ALL !== _loc4_)
         {
         }
      }
      
      public function tabKind_change(param1:int) : void
      {
         refresh(false);
         this.fadeIn(0,11010);
         var _loc2_:Array = this.kindBtns[param1];
         this.btn_order.visible = _loc2_.indexOf(1) > -1;
         this.btn_sell.visible = _loc2_.indexOf(2) > -1;
         this.btn_recycle.visible = _loc2_.indexOf(3) > -1;
         this.boxBtns.countItems();
      }
      
      private function refresh(param1:Boolean = false, param2:Boolean = false) : void
      {
         $tween = param1;
         $shake = param2;
         var $kindGroup:int = kindGroupArr[this.tabKindGroup.selectedIndex];
         var $pageSize:int = this.list_items.repeatX * this.list_items.repeatY;
         var $itemArr:Array = BagModel.ins.itemArr;
         var $wealthVoArr:Array = WealthUtil.itemArrToWealthVoArr($itemArr).reverse();
         var bwArr:Array = TreasureModel.ins.getALLTreausreData().concat();
         bwArr.sort(BagModel.itemOrderSortFunc);
         bwArr = bwArr.reverse();
         $wealthVoArr = $wealthVoArr.concat(bwArr);
         $wealthVoArr = $wealthVoArr.filter(function(param1:WealthVo, ... rest):Boolean
         {
            return ($kindGroup == 0 || param1.stcItemVo.display_type == $kindGroup) && filterArr.indexOf(param1.stcItemVo.kind) == -1;
         });
         if($kindGroup == 4)
         {
            $wealthVoArr.sort(sortByEquipPiece);
         }
         if($kindGroup == 6)
         {
         }
         ArrayUtil.fillBySameItem($wealthVoArr,this.list_items.repeatX * this.list_items.repeatY - $wealthVoArr.length,null);
         if($tween)
         {
            new ListCellTweenEffect(this.list_items,$wealthVoArr).set_needShake($shake).set_compareDataHandler(compareDataHandler).exec();
         }
         else
         {
            this.list_items.dataSource = $wealthVoArr;
            this.list_items.commitMeasure();
         }
         this.validateListSellState();
      }
      
      private function sortByEquipPiece(param1:WealthVo, param2:WealthVo) : int
      {
         var _loc4_:StcItemVo = param1.stcItemVo;
         var _loc3_:StcItemVo = param2.stcItemVo;
         if(_loc4_.kind == 51 && param1.item.count >= _loc4_.equipPieceComposeCount)
         {
            return -1;
         }
         if(_loc3_.kind == 51 && param2.item.count >= _loc3_.equipPieceComposeCount)
         {
            return 1;
         }
         return 0;
      }
      
      private function compareDataHandler(param1:WealthVo) : String
      {
         if(param1.item)
         {
            return Uint64Util.toString(param1.item.id);
         }
         if(param1.treasure)
         {
            return Uint64Util.toString(param1.treasure.id);
         }
         return null;
      }
      
      override public function preClose(param1:Object = null) : void
      {
         super.preClose(param1);
         BagModel.ins.newItemArr.length = 0;
         ServerEngine.ins.removeAlwayHandler(10000,yiYeInfoNotifyHander,yiYeInfoNotifyErrorHander);
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat("MSG_ITEM_USE_CPL","MSG_ITEM_YIYE","MSG_EQUIP_COMPOSE_SUCCESS","notice_refresh_module_need_resource_data");
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         var _loc6_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:* = null;
         super.handleNotices(param1,param2);
         var _loc7_:* = param1;
         if("MSG_ITEM_USE_CPL" !== _loc7_)
         {
            if("MSG_EQUIP_COMPOSE_SUCCESS" !== _loc7_)
            {
               if("notice_refresh_module_need_resource_data" !== _loc7_)
               {
                  if("MSG_ITEM_YIYE" !== _loc7_)
                  {
                  }
               }
               else
               {
                  this.refresh(false,false);
               }
            }
            else
            {
               this.refresh(true,false);
               countEquipComposeRedPoint();
            }
         }
         else
         {
            if(param2 && param2 is Array)
            {
               _loc3_ = param2 as Array;
               _loc6_ = _loc3_[0];
               _loc5_ = _loc3_[1];
               if(_loc6_ == BagConsts.PVP_COUNT_CARD_ID)
               {
                  AlertUtil.float(LocaleMgr.ins.getStr(41300246,[_loc5_]));
               }
               if(_loc6_ == BagConsts.HEOR_AWKAN_ROAD_CARD)
               {
                  AlertUtil.float(LocaleMgr.ins.getStr(30121027,[_loc5_]));
                  HeroAwakenRoadModel.ins.leftCount = HeroAwakenRoadModel.ins.leftCount + _loc5_;
                  NpcFuncService.ins.changeCount(30121,HeroAwakenRoadModel.ins.leftCount);
               }
               _loc4_ = StcMgr.ins.getItemVo(_loc6_);
               if(_loc4_)
               {
                  switch(int(_loc4_.kind) - 35)
                  {
                     case 0:
                     case 1:
                        AlertUtil.float(LocaleMgr.ins.getStr(200026));
                  }
               }
            }
            this.refresh(true,false);
         }
      }
      
      private function countEquipComposeRedPoint() : void
      {
         if(BagModel.ins.equipPieceCanCompose)
         {
            this.redPoint.visible = true;
         }
         else
         {
            this.redPoint.visible = false;
         }
      }
   }
}
