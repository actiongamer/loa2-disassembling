package nslm2.modules.foundations.goldenShopModules
{
   import game.ui.goldenShopModules.GoldenDiamondChangeModuleUI;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.configs.EnvConfig;
   import nslm2.common.ui.components.comps2d.numBar.NumBarS1;
   import morn.core.components.Button;
   import nslm2.modules.foundations.vip.model.VipModel;
   import nslm2.modules.foundations.mall.model.MallModel;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.foundations.mall.service.MallService;
   import nslm2.modules.foundations.mall.consts.MallConsts;
   import proto.MallBuyRes;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcMallItemVo;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import com.mz.core.event.MzEvent;
   import nslm2.common.event.WealthChangeEvent;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.mgrs.skins.Effect2DUtils;
   
   public class GoldenDiamondChangeModule extends GoldenDiamondChangeModuleUI
   {
       
      
      public function GoldenDiamondChangeModule()
      {
         super();
         this.render_changeGolden.needShowZero = true;
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
         this.render_changeGolden.dataSource = WealthUtil.createWealthVo(9,0,0);
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
         initLanguage();
         Effect2DUtils.showBtnEff_btnBig(this.btn_swap);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         refresh();
         this.preShowCpl();
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            ObserverMgr.ins.regObserver(this);
            this.numBarRef.addEventListener("evt_numbar_value_change",onNumChange);
         }
         else
         {
            ObserverMgr.ins.unregObserver(this);
            this.numBarRef.removeEventListener("evt_numbar_value_change",onNumChange);
         }
      }
      
      private function initLanguage() : void
      {
         this.btn_swap.label = LocaleMgr.ins.getStr(50200402);
         if(EnvConfig.ins.showQQModule)
         {
            this.txt_11200502.text = LocaleMgr.ins.getStr(11200509);
         }
         else
         {
            this.txt_11200502.text = LocaleMgr.ins.getStr(11200502);
         }
      }
      
      private function get numBarRef() : NumBarS1
      {
         return this.numBar as NumBarS1;
      }
      
      private function onBtnFunc(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(btn_recharge !== _loc2_)
         {
            if(btn_swap !== _loc2_)
            {
               if(this.btn_close === _loc2_)
               {
                  this.btnCloseHandler();
               }
            }
            else if(MallModel.ins.goldenCanChangeLimit > 0)
            {
               if(PlayerModel.ins.getWealthValue(4) > 0)
               {
                  if(this.numBarRef.nowNum > 0)
                  {
                     if(EnvConfig.ins.showQQModule)
                     {
                        AlertUtil.comfirm(LocaleMgr.ins.getStr(11200507,[this.numBarRef.nowNum * 1.2,this.numBarRef.nowNum]),doBuy,null,"goldenDiamondChange");
                     }
                     else
                     {
                        AlertUtil.comfirm(LocaleMgr.ins.getStr(11200507,[this.numBarRef.nowNum,this.numBarRef.nowNum]),doBuy,null,"goldenDiamondChange");
                     }
                  }
               }
               else
               {
                  AlertUtil.showRechargeAlert();
               }
            }
            else
            {
               AlertUtil.comfirm(LocaleMgr.ins.getStr(11200506),VipModel.ins.gotoCharge,null,null,LocaleMgr.ins.getStr(12110016));
            }
         }
         else
         {
            VipModel.ins.gotoCharge();
         }
      }
      
      private function doBuy() : void
      {
         MallService.ins.buy(90000,this.numBarRef.nowNum / MallConsts.getGoldenDiamondCountPerCopy(),onBuySuccessHandler);
      }
      
      private function onBuySuccessHandler(param1:MallBuyRes) : void
      {
         MallModel.ins.goldenCanChangeLimit = MallModel.ins.goldenCanChangeLimit - MallModel.ins.crtBuyItemCnt * MallConsts.getGoldenDiamondCountPerCopy();
         MallModel.ins.updateItemBuyInfo(param1);
         var _loc2_:StcMallItemVo = StcMgr.ins.getMallItemVo(90000);
         var _loc3_:Array = WealthUtil.costStrToArr(_loc2_.items);
         if(MallModel.ins.crtBuyItemCnt > 1)
         {
            var _loc6_:int = 0;
            var _loc5_:* = _loc3_;
            for each(var _loc4_ in _loc3_)
            {
               _loc4_.count = _loc4_.count * MallModel.ins.crtBuyItemCnt;
            }
         }
         FloatUtil.showGetItemsDisplayPanel(_loc3_);
         ObserverMgr.ins.sendNotice("mall_buy_success");
      }
      
      private function refresh() : void
      {
         this.txt_gold.text = PlayerModel.ins.getWealthValue(4);
         this.txt_swapLimit.text = LocaleMgr.ins.getStr(11200504,[MallModel.ins.goldenCanChangeLimit]);
         this.numBarRef.init(0,MallModel.ins.goldenCanChangeLimit,0,MallConsts.getGoldenDiamondCountPerCopy());
         this.render_changeGolden.dataSource = WealthUtil.createWealthVo(9,0,0);
      }
      
      private function onNumChange(param1:MzEvent) : void
      {
         this.render_changeGolden.dataSource = WealthUtil.createWealthVo(9,0,this.numBarRef.nowNum);
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["wealthChange","mall_notice_update_info","PLAYER_VIP_UP"]);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         super.handleNotices(param1,param2);
         var _loc4_:* = param1;
         if("wealthChange" !== _loc4_)
         {
            if("mall_notice_update_info" === _loc4_)
            {
               refresh();
            }
         }
         else
         {
            _loc3_ = param2 as WealthChangeEvent;
            if(_loc3_.wealthType == 4)
            {
               this.txt_gold.text = PlayerModel.ins.getWealthValue(4);
            }
         }
      }
   }
}
