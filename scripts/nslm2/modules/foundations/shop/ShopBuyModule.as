package nslm2.modules.foundations.shop
{
   import game.ui.shopModules.ShopBuyModuleUI;
   import nslm2.mgrs.stcMgrs.vos.StcShopVo;
   import nslm2.common.ui.components.comps2d.numBar.NumBarS1;
   import nslm2.modules.foundations.shop.model.ShopModel;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.foundations.shop.model.ShopPlusModel;
   import com.mz.core.event.MzEvent;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import morn.core.components.Button;
   import nslm2.modules.foundations.shop.comp.ShopCostDiamondRender;
   import nslm2.modules.foundations.AlertUtil;
   import morn.core.handlers.Handler;
   import nslm2.modules.foundations.shop.service.ShopService;
   import morn.customs.expands.MornExpandUtil;
   
   public class ShopBuyModule extends ShopBuyModuleUI
   {
       
      
      private var _shopVo:StcShopVo;
      
      public function ShopBuyModule()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btnFun);
      }
      
      public function get numBarRef() : NumBarS1
      {
         return this.numBar as NumBarS1;
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            this.numBarRef.addEventListener("evt_numbar_value_change",numBarRef_change);
            ShopModel.ins.addEventListener("evtShopBuyCpl",onBuyCpl);
         }
         else
         {
            this.numBarRef.removeEventListener("evt_numbar_value_change",numBarRef_change);
            ShopModel.ins.removeEventListener("evtShopBuyCpl",onBuyCpl);
         }
      }
      
      override public function preShow(param1:Object = null) : void
      {
         if(param1 == null)
         {
            throw new Error("shopId不能为空");
         }
         _shopVo = param1 as StcShopVo;
         var _loc2_:Array = WealthUtil.costStrToArr(_shopVo.curr_res);
         this.render_wealth.dataSource = _shopVo;
         if(_shopVo.plusData && _shopVo.plusData.version)
         {
            this.numBarRef.init(1,ShopPlusModel.INS.getCanBuyMaxCount(_shopVo),1);
         }
         else
         {
            this.numBarRef.init(1,ShopModel.ins.getCanBuyMaxCount(_shopVo.id),1);
         }
         this.list_totalPrize.repeatX = _loc2_.length;
         this.list_totalPrize.dataSource = _loc2_;
         this.list_totalPrize.commitMeasure();
         this.txt_prizeAll.x = this.list_totalPrize.x - 94;
         this.panelBg.titleImgId = this.moduleId;
         this.preShowCpl();
      }
      
      private function onBuyCpl(param1:MzEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:Array = [];
         var _loc4_:WealthVo = WealthVo.parseCostStr(_shopVo.sell_res);
         _loc4_.count = _loc4_.count * this.numBarRef.nowNum;
         _loc2_ = [_loc4_];
         if(_shopVo.plusData && _shopVo.plusData.hasOwnProperty("kind") && _shopVo.plusData.kind == 101)
         {
            _loc3_ = WealthVo.parseCostStr(_shopVo.sell_res);
            _loc3_.count = _loc3_.count * this.numBarRef.nowNum;
            _loc2_.push(_loc3_);
         }
         FloatUtil.showGetItemsDisplayPanel(_loc2_,null,null,this.moduleInfo.parentModuleId);
         ModuleMgr.ins.closeModule(this.moduleId);
      }
      
      private function numBarRef_change(param1:MzEvent) : void
      {
         var _loc4_:int = 0;
         var _loc3_:Array = WealthUtil.costStrToArr(_shopVo.curr_res);
         var _loc2_:int = _loc3_.length;
         while(_loc4_ < _loc2_)
         {
            _loc3_[_loc4_].count = _loc3_[_loc4_].count * this.numBarRef.nowNum;
            _loc4_++;
         }
         this.list_totalPrize.dataSource = _loc3_;
      }
      
      private function btnFun(param1:Button) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = param1;
         if(this.btn_confirm.btn_ok !== _loc5_)
         {
            if(this.btn_cancel.btn_cancel === _loc5_)
            {
               ModuleMgr.ins.closeModule(this.moduleId);
            }
         }
         else
         {
            _loc3_ = WealthVo.parseCostStr(this._shopVo.curr_res);
            if(_loc3_.kind == 3 || _loc3_.kind == 4)
            {
               _loc2_ = new ShopBuyConfirmVo(this._shopVo,this.numBarRef.nowNum);
               _loc4_ = new ShopCostDiamondRender();
               _loc4_.dataSource = _loc2_;
               AlertUtil.comfirm(_loc4_,new Handler(doBuyItem,[this.numBarRef.nowNum]),null,"shopCostDiamondNoShow");
            }
            else
            {
               doBuyItem(this.numBarRef.nowNum);
            }
         }
      }
      
      private function doBuyItem(param1:int) : void
      {
         ShopService.ins.buy(_shopVo.id,param1,null,_shopVo);
      }
   }
}
