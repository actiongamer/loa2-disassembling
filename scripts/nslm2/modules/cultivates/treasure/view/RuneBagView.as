package nslm2.modules.cultivates.treasure.view
{
   import game.ui.treasures.runeBag.RuneBagViewUI;
   import com.mz.core.interFace.IViewStackPage;
   import com.mz.core.interFace.IObserver;
   import nslm2.common.ui.components.comps2d.HorseLampH;
   import nslm2.modules.cultivates.treasure.model.TreasureModel;
   import nslm2.modules.bag.SellBatchView;
   import flash.events.MouseEvent;
   import nslm2.modules.cultivates.treasure.view.render.RuneBagListRender;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.tipMenus.TipMenuMsg;
   import nslm2.modules.footstones.tipMenus.TipMenuConfigVo;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.footstones.tipMenus.TipMenuConsts;
   import nslm2.utils.Uint64Util;
   import morn.customs.components.WealthRender;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.bag.SellBatchItemRender;
   import morn.core.components.Image;
   import com.netease.protobuf.UInt64;
   import nslm2.modules.bag.RenderSellState;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import flash.geom.Point;
   import com.greensock.TweenLite;
   import com.greensock.easing.Cubic;
   import com.mz.core.utils.DisplayUtils;
   import flash.events.Event;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.MoshiRecord;
   import nslm2.common.compsEffects.ListCellTweenEffect;
   import com.greensock.easing.Back;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import nslm2.modules.cultivates.treasure.vo.RuneCategoryVo;
   import morn.core.components.Button;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.common.ui.components.comps2d.pageBar.PageBarS2;
   
   public class RuneBagView extends RuneBagViewUI implements IViewStackPage, IObserver
   {
       
      
      private var _horseLamp:HorseLampH;
      
      private var model:TreasureModel;
      
      private var sellBatchView:SellBatchView;
      
      public function RuneBagView()
      {
         model = TreasureModel.ins;
         super();
         (pagebar as PageBarS2).bindList(this.list_runeBag);
         list_runeBag.changeHandler = runeItemClickHandler;
         list_runeBag.useMouseDown = false;
         btn_batchCompose.clickHandler = doBatchComopse;
         model.list_rune = this.list_runeBag;
         initNotice();
         sellBatchView = new SellBatchView();
         sellBatchView.addEventListener("close",sellBatchView_closeHandler);
         sellBatchView.addEventListener("sellCpl",sellBatchView_sellCplHandler);
         sellBatchView.addEventListener("DRAG_ITEM",sellBatchView_dragItemHandler);
         sellBatchView.addEventListener("REMOVE_ITEM",sellBatchView_removeItemHandler);
         DisplayUtils.addChildBelow(sellBatchView,model.module_panelBg);
         sellBatchView.x = model.module_panelBg.width - sellBatchView.width;
         sellBatchView.hideX = sellBatchView.x;
         sellBatchView.alpha = 0;
         btn_recycle.clickHandler = recycleHandler;
         this.list_runeBag.mouseHandler = list_mouseHandler;
      }
      
      private function list_mouseHandler(param1:MouseEvent, param2:int) : void
      {
         var _loc3_:* = null;
         if(param1.type == "click")
         {
            _loc3_ = this.list_runeBag.getCell(param2) as RuneBagListRender;
            if(_loc3_.wealthVoIsEnable)
            {
               if(this.sellBatchView && this.sellBatchView.isActived)
               {
                  checkAndAddSell(_loc3_);
               }
               else
               {
                  ObserverMgr.ins.sendNotice("MSG_TIP_MENU_SHOW",new TipMenuMsg(116,_loc3_.wealthVo).addHandlers(tipMenuHandlerExec,tipMenuHandlerCpl));
               }
            }
         }
      }
      
      private function tipMenuHandlerCpl(param1:TipMenuConfigVo, param2:*) : void
      {
         var _loc3_:WealthVo = param2 as WealthVo;
         var _loc4_:* = param1;
         if(TipMenuConsts.ins.TIP_MENU_USE_ALL !== _loc4_)
         {
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
      
      public function findRenderByWealthVo(param1:WealthVo) : RuneBagListRender
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         var _loc2_:int = list_runeBag.cells.length;
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = list_runeBag.cells[_loc4_] as RuneBagListRender;
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
      
      private function checkAndAddSell(param1:WealthRender, param2:Boolean = false) : void
      {
         if(Uint64Util.indexOfArray(this.sellBatchView.waitingSellIdArr,param1.wealthVo.item.id) == -1)
         {
            this.sellBatchView.addWaitingSell(param1.wealthVo,!!param2?null:param1);
            validateListSellState();
         }
      }
      
      private function recycleHandler() : void
      {
         switchSellBatch(!sellBatchView.isActived);
      }
      
      private function sellBatchView_removeItemHandler(param1:MzEvent) : void
      {
         var _loc3_:* = null;
         var _loc6_:SellBatchItemRender = param1.data[0];
         var _loc4_:Image = param1.data[1];
         var _loc5_:UInt64 = _loc6_.wealthVo.item.id;
         var _loc2_:RuneBagListRender = findRenderByWealthVo(_loc6_.wealthVo);
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
      
      private function sellBatchView_dragItemHandler(param1:MzEvent) : void
      {
         checkAndAddSell(param1.data,true);
      }
      
      private function sellBatchView_sellCplHandler(param1:Event) : void
      {
         ObserverMgr.ins.sendNotice("treasure_update_rune_data");
      }
      
      private function sellBatchView_closeHandler(param1:Event) : void
      {
         this.switchSellBatch(false);
      }
      
      private function initNotice() : void
      {
         var _loc2_:Array = [];
         var _loc1_:Array = LocaleMgr.ins.getStr(30600210).split("|");
         var _loc5_:int = 0;
         var _loc4_:* = model.runeComposeNotice;
         for each(var _loc3_ in model.runeComposeNotice)
         {
            _loc2_.push(LocaleMgr.ins.getStr(30600209,[_loc3_.player,_loc3_.count,_loc3_.item]));
         }
         if(_loc2_.length < 4)
         {
            _loc2_ = _loc2_.concat(_loc1_);
         }
         creatHorseLamp(_loc2_);
      }
      
      private function runeItemClickHandler() : void
      {
         var _loc1_:WealthVo = list_runeBag.selectedItem as WealthVo;
         if(_loc1_)
         {
            ObserverMgr.ins.sendNotice("MSG_TIP_MENU_SHOW",new TipMenuMsg(116,_loc1_));
         }
      }
      
      public function getFocusNotices() : Array
      {
         return ["treasure_update_rune_bag","treasure_rune_data_change","treasure_open_recycle_rune_bag"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("treasure_update_rune_bag" !== _loc3_)
         {
            if("treasure_rune_data_change" !== _loc3_)
            {
               if("treasure_open_recycle_rune_bag" === _loc3_)
               {
                  switchSellBatch(true);
               }
            }
            addr43:
            return;
         }
         list_runeBag.dataSource = fillRuneDataArr(param2);
         this.fadeIn(0,30603);
         new ListCellTweenEffect(this.list_runeBag,fillRuneDataArr(param2)).set_compareDataHandler(compareDataHandler).exec();
         §§goto(addr43);
      }
      
      private function switchSellBatch(param1:Boolean) : void
      {
         sellBatchView.isActived = param1;
         if(param1)
         {
            this.btn_recycle.label = LocaleMgr.ins.getStr(30616023);
            TweenLite.to(sellBatchView,0.5,{
               "x":model.module_panelBg.width + 12,
               "alpha":1,
               "ease":Back.easeOut,
               "onComplete":sellBatchView_showCpl
            });
            sellBatchView.removeAllWaitingItem();
            list_runeBag.changeHandler = null;
         }
         else
         {
            list_runeBag.changeHandler = runeItemClickHandler;
            this.btn_recycle.label = "回  收";
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
         var _loc1_:int = this.list_runeBag.cells.length;
         _loc3_ = 0;
         while(_loc3_ < _loc1_)
         {
            _loc2_ = this.list_runeBag.cells[_loc3_] as RuneBagListRender;
            _loc2_.renderSellState = new RenderSellState(this.sellBatchView.isActived,this.sellBatchView.waitingSellIdArr);
            _loc2_.validateSellState();
            _loc3_++;
         }
      }
      
      private function fillRuneDataArr(param1:RuneCategoryVo) : Array
      {
         var _loc2_:Array = param1.runeArr;
         while(_loc2_.length == 0 || _loc2_.length % (list_runeBag.repeatX * list_runeBag.repeatY))
         {
            _loc2_.push(null);
         }
         return _loc2_;
      }
      
      private function compareDataHandler(param1:WealthVo) : String
      {
         return Uint64Util.toString(param1.item.id);
      }
      
      private function creatHorseLamp(param1:Array) : void
      {
         removeHorseLamp();
         _horseLamp = new HorseLampH(14,4);
         _horseLamp.txtGap = 60;
         _horseLamp.show(param1);
         DisplayUtils.addChildAbove(_horseLamp,this.horseLampBg);
         _horseLamp.width = this.horseLampBg.width - 38;
         img_txtMask.cacheAsBitmap = true;
         _horseLamp.mask = img_txtMask;
         _horseLamp.cacheAsBitmap = true;
         _horseLamp.x = this.horseLampBg.x + 24;
         _horseLamp.y = this.horseLampBg.y + 8;
      }
      
      private function removeHorseLamp() : void
      {
         if(_horseLamp)
         {
            _horseLamp.dispose();
         }
      }
      
      private function doBatchComopse(param1:Button) : void
      {
         if(model.checkCanCompose())
         {
            ModuleMgr.ins.showModule(30604,null,30600);
         }
         else
         {
            AlertUtil.float(LocaleMgr.ins.getStr(30600211));
         }
      }
      
      public function viewStackIn() : void
      {
         ObserverMgr.ins.regObserver(this);
         this.fadeIn();
         this.visible = true;
         this.fadeIn(0,30603);
      }
      
      public function viewStackOut() : void
      {
         ObserverMgr.ins.unregObserver(this);
         this.visible = false;
      }
   }
}
