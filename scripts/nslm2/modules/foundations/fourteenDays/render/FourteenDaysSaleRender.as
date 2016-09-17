package nslm2.modules.foundations.fourteenDays.render
{
   import game.ui.sevenDayModule.view.SevenDaysSaleRenderUI;
   import proto.FourteenDayShopBuyTimesRes;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcShopVo;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import com.mz.core.configs.ClientConfig;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.alerts.FloatUtil;
   
   public class FourteenDaysSaleRender extends SevenDaysSaleRenderUI
   {
       
      
      public function FourteenDaysSaleRender()
      {
         super();
      }
      
      public function get vo() : FourteenDayShopBuyTimesRes
      {
         return this.dataSource as FourteenDayShopBuyTimesRes;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc3_:* = null;
         .super.dataSource = param1;
         if(this.vo)
         {
            _loc2_ = StcMgr.ins.getShopVo(vo.id);
            _loc4_ = WealthVo.parseCostStr(_loc2_.sell_res);
            this.itemRender.dataSource = _loc4_;
            _loc5_ = WealthVo.parseCostStr(_loc2_.ori_res);
            this.oriRes.dataSource = _loc5_;
            _loc3_ = WealthVo.parseCostStr(_loc2_.curr_res);
            this.priceRender.dataSource = _loc3_;
            this.txt_limit.text = LocaleMgr.ins.parseParamAdvance(LocaleMgr.ins.getStr(999000239) + TextFieldUtil.htmlText2(_loc2_.limit_num - this.vo.buyTime + "/" + _loc2_.limit_num,_loc2_.limit_num - this.vo.buyTime > 0?458496:16723968),null);
            if(_loc3_.count / _loc5_.count < 1)
            {
               if(ClientConfig.isChineseLang())
               {
                  this.txt_status.text = LocaleMgr.ins.getStr(13300007,[Math.round(_loc3_.count / _loc5_.count * 100) / 10]);
               }
               else
               {
                  this.txt_status.text = LocaleMgr.ins.getStr(13300007,[Math.round((1 - _loc3_.count / _loc5_.count) * 100)]);
               }
            }
            this.txt_name.text = _loc4_.showName;
            this.btn_buy.clickHandler = clickHandler;
         }
      }
      
      private function clickHandler() : void
      {
         ModuleMgr.ins.showModule(13301,this.vo,ModuleMgr.ins.popLayer.curModuleId);
      }
      
      private function cplHandler() : void
      {
         FloatUtil.showGetItemsDisplayPanel([this.itemRender.dataSource]);
      }
   }
}
