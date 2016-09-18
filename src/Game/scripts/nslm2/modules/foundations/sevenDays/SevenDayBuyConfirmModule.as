package nslm2.modules.foundations.sevenDays
{
   import game.ui.mallModule.MallBuyComfirmModuleUI;
   import nslm2.mgrs.stcMgrs.vos.StcShopVo;
   import nslm2.modules.foundations.sevenDays.vo.SevenDaysVo;
   import nslm2.common.ui.components.comps2d.numBar.NumBarS1;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.foundations.sevenDays.service.SevenDaysService;
   import nslm2.modules.foundations.sevenDays.model.SevenDaysModel;
   import nslm2.common.vo.WealthVo;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import proto.ProtocolStatusRes;
   import proto.SevenDayInfoReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.SevenDayInfoRes;
   import flash.events.Event;
   
   public class SevenDayBuyConfirmModule extends MallBuyComfirmModuleUI
   {
       
      
      private var shopVo:StcShopVo;
      
      public function SevenDayBuyConfirmModule()
      {
         super();
      }
      
      private function get vo() : SevenDaysVo
      {
         return this.dataSource as SevenDaysVo;
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
         shopVo = StcMgr.ins.getShopVo(int(vo.sdStcVO.shop_id));
         var _loc2_:Array = WealthUtil.costStrToArr(shopVo.sell_res).sortOn("sid");
         this.numBarRef.addEventListener("evt_numbar_value_change",numBarRef_change);
         this.list_items.repeatX = _loc2_.length;
         this.list_items.dataSource = _loc2_;
         this.numBarRef.init(1,Math.min(vo.sdStcVO.shop_limit_num - this.vo.myHalfPriceBought,vo.halfPriceLimit - vo.halfPriceBought),1);
         btn_ok.clickHandler = buyHandler;
         this.render_totalPrize.dataSource = WealthUtil.parseCostStr(shopVo.curr_res);
         super.preShow(param1);
      }
      
      private function buyHandler() : void
      {
         SevenDaysService.ins.getShopReward(SevenDaysModel.ins.currentDay,int(vo.sdStcVO.shop_id),numBarRef.nowNum,cplHandler);
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
         this.vo.myHalfPriceBought = this.vo.myHalfPriceBought + numBarRef.nowNum;
         this.vo.halfPriceBought = this.vo.halfPriceBought + numBarRef.nowNum;
         if(this.vo.myHalfPriceBought == this.vo.sdStcVO.shop_limit_num)
         {
            this.vo.halfPriceStatus = 3;
            SevenDaysModel.ins.hasHalfPrice = false;
            ObserverMgr.ins.sendNotice("sevenday_notice_update_red_point","do not minus");
         }
         ModuleMgr.ins.closeModule(this.moduleId);
         FloatUtil.showGetItemsDisplayPanel(_loc1_);
         ObserverMgr.ins.sendNotice("sevenday_notice_update_shop");
      }
      
      private function errHandler(param1:ProtocolStatusRes) : void
      {
         var _loc2_:* = null;
         if(param1.errCode == 300004128)
         {
            _loc2_ = new SevenDayInfoReq();
            ServerEngine.ins.send(4070,_loc2_,onDailyInfoCpl);
         }
         ServerEngine.ins.doDefaultErr(param1);
      }
      
      private function onDailyInfoCpl(param1:SevenDayInfoRes) : void
      {
         SevenDaysModel.ins.initShop(param1.shopInfo);
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
