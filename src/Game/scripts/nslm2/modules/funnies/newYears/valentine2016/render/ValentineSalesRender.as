package nslm2.modules.funnies.newYears.valentine2016.render
{
   import game.ui.newYears.valentine2016s.render.ValentineSalesRenderUI;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.funnies.newYears.valentine2016.vo.ValentineSaleVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcShopVo;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.alerts.FloatUtil;
   
   public class ValentineSalesRender extends ValentineSalesRenderUI
   {
       
      
      private var wealthVo:WealthVo;
      
      public function ValentineSalesRender()
      {
         super();
      }
      
      public function get vo() : ValentineSaleVo
      {
         return this.dataSource as ValentineSaleVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         .super.dataSource = param1;
         if(vo)
         {
            _loc2_ = StcMgr.ins.getShopVo(this.vo.shopid);
            wealthVo = WealthVo.parseCostStr(_loc2_.sell_res);
            this.render_item.dataSource = wealthVo;
            this.render_cost.dataSource = WealthVo.parseCostStr(_loc2_.curr_res);
            this.render_item.txt_name.visible = false;
            _loc3_ = WealthVo.parseCostStr(_loc2_.ori_res);
            if(_loc3_.count)
            {
               this.oriRes.dataSource = _loc3_;
               this.oriRes.visible = true;
               this.img_saleLine.visible = true;
            }
            else
            {
               this.oriRes.visible = false;
               this.img_saleLine.visible = false;
            }
            this.label_name.color = ColorLib.qualityColor(wealthVo.quality);
            this.label_name.text = wealthVo.showName;
            this.btn_buy.clickHandler = buyHandler;
            if(_loc2_.limit_num == 0)
            {
               this.label_limit.visible = false;
            }
            else
            {
               this.label_limit.text = LocaleMgr.ins.getStr(60300007,[_loc2_.limit_num - this.vo.curBuyTimes,_loc2_.limit_num]);
            }
         }
      }
      
      private function buyHandler() : void
      {
         ModuleMgr.ins.showModule(13322,this.vo,ModuleMgr.ins.popLayer.curModuleId);
      }
      
      private function buyCpl() : void
      {
         FloatUtil.showGetItemsDisplayPanel([wealthVo]);
      }
   }
}
