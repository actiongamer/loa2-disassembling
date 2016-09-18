package nslm2.modules.foundations.mall
{
   import game.ui.mallModule.MallBuyComfirmModuleUI;
   import nslm2.modules.foundations.mall.vo.MallItemVo;
   import com.mz.core.event.MzEvent;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.WealthUtil;
   import com.mz.core.configs.EnvConfig;
   import morn.core.components.Button;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.common.ui.components.comps2d.numBar.NumBarS1;
   import nslm2.modules.foundations.mall.model.MallModel;
   import nslm2.modules.foundations.mall.service.MallService;
   import proto.MallBuyRes;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import com.mz.core.mgrs.ObserverMgr;
   import morn.customs.expands.MornExpandUtil;
   
   public class MallBuyConfirmModule extends MallBuyComfirmModuleUI
   {
       
      
      private var _mallItemVo:MallItemVo;
      
      public function MallBuyConfirmModule()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btnFun);
         this.box_qqAlert.visible = false;
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            this.numBarRef.addEventListener("evt_numbar_value_change",numBarRef_change);
         }
         else
         {
            this.numBarRef.removeEventListener("evt_numbar_value_change",numBarRef_change);
         }
      }
      
      private function numBarRef_change(param1:MzEvent) : void
      {
         var _loc2_:WealthVo = _mallItemVo.price;
         _loc2_.count = this.numBarRef.nowNum * _loc2_.count;
         this.render_totalPrize.dataSource = _loc2_;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(9060320);
         _mallItemVo = param1 as MallItemVo;
         if(!_mallItemVo)
         {
            return;
         }
         var _loc2_:Array = WealthUtil.costStrToArr(_mallItemVo.stcMallItemVo.items);
         list_items.repeatX = _loc2_.length;
         list_items.dataSource = _loc2_;
         list_items.x = width - list_items.width >> 1;
         var _loc3_:WealthVo = _mallItemVo.price;
         this.numBarRef.init(1,_mallItemVo.canBuyCount,1);
         this.render_totalPrize.dataSource = _loc3_;
         this.box_qqAlert.visible = EnvConfig.ins.showQQModule;
         this.preShowCpl();
      }
      
      private function btnFun(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(this.btn_ok !== _loc2_)
         {
            if(this.btn_gotoMall === _loc2_)
            {
               ModuleMgr.ins.closeModule(this.moduleId);
               ModuleMgr.ins.showModule(11200,null,ModuleMgr.ins.popLayer.curModuleId);
            }
         }
         else
         {
            doBuyItem(this.numBarRef.nowNum);
         }
      }
      
      public function get numBarRef() : NumBarS1
      {
         return this.numBar as NumBarS1;
      }
      
      private function doBuyItem(param1:int) : void
      {
         MallModel.ins.crtBuyItem = _mallItemVo;
         MallService.ins.buy(_mallItemVo.id,param1,buySucessHandler);
      }
      
      private function buySucessHandler(param1:MallBuyRes) : void
      {
         MallModel.ins.updateItemBuyInfo(param1);
         close();
         var _loc2_:Array = WealthUtil.costStrToArr(_mallItemVo.stcMallItemVo.items);
         if(MallModel.ins.crtBuyItemCnt > 1)
         {
            var _loc5_:int = 0;
            var _loc4_:* = _loc2_;
            for each(var _loc3_ in _loc2_)
            {
               _loc3_.count = _loc3_.count * MallModel.ins.crtBuyItemCnt;
            }
         }
         FloatUtil.showGetItemsDisplayPanel(_loc2_,LocaleMgr.ins.getStr(999000309));
         ObserverMgr.ins.sendNotice("mall_buy_success");
      }
      
      private function close() : void
      {
         btnCloseHandler(null);
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.sendNotice("mall_start_auto_scroll_banner",true);
         super.dispose();
      }
   }
}
