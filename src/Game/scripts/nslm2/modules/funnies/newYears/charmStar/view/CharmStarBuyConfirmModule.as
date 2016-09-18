package nslm2.modules.funnies.newYears.charmStar.view
{
   import game.ui.mallModule.MallBuyComfirmModuleUI;
   import nslm2.modules.funnies.newYears.charmStar.model.CharmStarShopVo;
   import nslm2.common.ui.components.comps2d.numBar.NumBarS1;
   import nslm2.modules.foundations.shop.model.ShopModel;
   import com.mz.core.event.MzEvent;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.CharmRankShopReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.ProtocolStatusRes;
   import nslm2.modules.foundations.AlertUtil;
   import com.mz.core.utils.TextFieldUtil;
   import flash.events.Event;
   
   public class CharmStarBuyConfirmModule extends MallBuyComfirmModuleUI
   {
       
      
      public function CharmStarBuyConfirmModule()
      {
         super();
      }
      
      private function get vo() : CharmStarShopVo
      {
         return this.dataSource as CharmStarShopVo;
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
            ShopModel.ins.addEventListener("evtShopBuyCpl",shopBuyCpl);
         }
         else
         {
            ShopModel.ins.removeEventListener("evtShopBuyCpl",shopBuyCpl);
         }
      }
      
      protected function shopBuyCpl(param1:MzEvent) : void
      {
         var _loc2_:Array = WealthUtil.costStrToArr(vo.sellRes).sortOn("sid");
         var _loc5_:int = 0;
         var _loc4_:* = _loc2_;
         for each(var _loc3_ in _loc2_)
         {
            _loc3_.count = _loc3_.count * numBarRef.nowNum;
         }
         this.vo.curBuyTimes = this.vo.curBuyTimes + this.numBarRef.nowNum;
         ObserverMgr.ins.sendNotice("refresh_buy_list",this.vo);
         if(BagModel.ins.getStcCount(200011) == 0)
         {
            NpcFuncService.ins.changeCount(13401,0);
            if(NpcFuncService.ins.getVo(13402).count > 0 || NpcFuncService.ins.getVo(13401).count > 0)
            {
               NpcFuncService.ins.changeCount(13400,1);
            }
            else
            {
               NpcFuncService.ins.changeCount(13400,0);
            }
         }
         ModuleMgr.ins.closeModule(this.moduleId);
         FloatUtil.showGetItemsDisplayPanel(_loc2_);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.box_qqAlert.visible = false;
         this.switchEventListeners(true);
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(13320002);
         this.dataSource = param1;
         var _loc2_:Array = WealthUtil.costStrToArr(vo.sellRes).sortOn("sid");
         this.numBarRef.addEventListener("evt_numbar_value_change",numBarRef_change);
         this.list_items.repeatX = _loc2_.length;
         this.list_items.dataSource = _loc2_;
         if(vo.limit_num == 0)
         {
            this.numBarRef.init(1,99,1);
         }
         else
         {
            this.numBarRef.init(1,vo.limit_num - this.vo.curBuyTimes,1);
         }
         btn_ok.clickHandler = buyHandler;
         this.render_totalPrize.dataSource = WealthUtil.parseCostStr(vo.currRes);
         super.preShow(param1);
      }
      
      private function buyHandler() : void
      {
         var _loc1_:CharmRankShopReq = new CharmRankShopReq();
         _loc1_.id = vo.id;
         _loc1_.num = numBarRef.nowNum;
         ServerEngine.ins.send(10013,_loc1_,cplHandler,errHandler);
      }
      
      private function cplHandler() : void
      {
         var _loc1_:Array = WealthUtil.costStrToArr(vo.sellRes).sortOn("sid");
         var _loc4_:int = 0;
         var _loc3_:* = _loc1_;
         for each(var _loc2_ in _loc1_)
         {
            _loc2_.count = _loc2_.count * numBarRef.nowNum;
         }
         this.vo.curBuyTimes = this.vo.curBuyTimes + this.numBarRef.nowNum;
         ObserverMgr.ins.sendNotice("CHARM_STAR_BUY_CONFIRM_REFRESH",vo);
         ModuleMgr.ins.closeModule(this.moduleId);
         FloatUtil.showGetItemsDisplayPanel(_loc1_);
      }
      
      private function errHandler(param1:ProtocolStatusRes) : void
      {
         if(param1.errCode == 300004024)
         {
            AlertUtil.float(TextFieldUtil.htmlText2(LocaleMgr.ins.getStr(13323017),16723968));
         }
         else
         {
            ServerEngine.ins.doDefaultErr(param1);
         }
      }
      
      private function numBarRef_change(param1:Event) : void
      {
         var _loc2_:WealthVo = WealthUtil.parseCostStr(vo.currRes);
         var _loc3_:Array = WealthUtil.costStrToArr(vo.sellRes).sortOn("sid");
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
