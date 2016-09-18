package nslm2.modules.foundations.fourteenDays
{
   import game.ui.mallModule.MallBuyComfirmModuleUI;
   import nslm2.mgrs.stcMgrs.vos.StcShopVo;
   import proto.FourteenDayShopBuyTimesRes;
   import nslm2.common.ui.components.comps2d.numBar.NumBarS1;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.foundations.fourteenDays.service.FourteenDaysService;
   import nslm2.modules.foundations.fourteenDays.model.FourteenDaysModel;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import flash.events.Event;
   
   public class FouteenDayBuyComfirmModule extends MallBuyComfirmModuleUI
   {
       
      
      private var shopVo:StcShopVo;
      
      public function FouteenDayBuyComfirmModule()
      {
         super();
      }
      
      private function get vo() : FourteenDayShopBuyTimesRes
      {
         return this.dataSource as FourteenDayShopBuyTimesRes;
      }
      
      public function get numBarRef() : NumBarS1
      {
         return this.numBar as NumBarS1;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.box_qqAlert.visible = false;
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(13300002);
         this.dataSource = param1;
         shopVo = StcMgr.ins.getShopVo(vo.id);
         var _loc2_:Array = WealthUtil.costStrToArr(shopVo.sell_res).sortOn("sid");
         this.numBarRef.addEventListener("evt_numbar_value_change",numBarRef_change);
         this.list_items.repeatX = _loc2_.length;
         this.list_items.dataSource = _loc2_;
         this.numBarRef.init(1,shopVo.limit_num - this.vo.buyTime,1);
         btn_ok.clickHandler = buyHandler;
         this.render_totalPrize.dataSource = WealthUtil.parseCostStr(shopVo.curr_res);
         super.preShow(param1);
      }
      
      private function buyHandler() : void
      {
         FourteenDaysService.ins.getShopReward(FourteenDaysModel.ins.currentDay,vo.id,numBarRef.nowNum,cplHandler);
      }
      
      private function cplHandler() : void
      {
         var _loc1_:Array = WealthUtil.costStrToArr(shopVo.sell_res).sortOn("sid");
         var _loc4_:int = 0;
         var _loc3_:* = _loc1_;
         for each(var _loc2_ in _loc1_)
         {
            _loc2_.count = _loc2_.count * numBarRef.nowNum;
         }
         ModuleMgr.ins.closeModule(this.moduleId);
         FloatUtil.showGetItemsDisplayPanel(_loc1_);
      }
      
      private function numBarRef_change(param1:Event) : void
      {
         var _loc2_:WealthVo = WealthUtil.parseCostStr(shopVo.curr_res);
         var _loc3_:Array = WealthUtil.costStrToArr(shopVo.sell_res).sortOn("sid");
         var _loc6_:int = 0;
         var _loc5_:* = _loc3_;
         for each(var _loc4_ in _loc3_)
         {
            _loc4_.count = _loc4_.count * numBarRef.nowNum;
         }
         this.list_items.dataSource = _loc3_;
         _loc2_.count = this.numBarRef.nowNum * _loc2_.count;
         this.render_totalPrize.dataSource = _loc2_;
      }
      
      private function clickHandler() : void
      {
         ModuleMgr.ins.closeModule(this.moduleId);
      }
      
      override public function preClose(param1:Object = null) : void
      {
         super.preClose(param1);
      }
   }
}
