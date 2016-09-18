package nslm2.modules.foundations.shop.comp
{
   import game.ui.shopModules.render.ShopBuyRenderUI;
   import nslm2.mgrs.stcMgrs.vos.StcShopVo;
   import nslm2.modules.foundations.shop.ShopBuyConfirmVo;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.foundations.shop.model.ShopModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.skins.ColorLib;
   
   public class ShopBuyRender extends ShopBuyRenderUI
   {
       
      
      public function ShopBuyRender()
      {
         super();
      }
      
      public function get vo() : StcShopVo
      {
         return this.dataSource as StcShopVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc4_:int = 0;
         if(param1 is ShopBuyConfirmVo)
         {
            .super.dataSource = param1.shopVo;
         }
         else
         {
            .super.dataSource = param1;
         }
         var _loc3_:WealthVo = WealthVo.parseCostStr(vo.sell_res);
         if(param1 is ShopBuyConfirmVo)
         {
            _loc3_.count = _loc3_.count * param1.num;
         }
         this.wealthRender.dataSource = _loc3_;
         this.txt_hasNum.text = LocaleConsts.getNumberAbbr2(PlayerModel.ins.getCountByWealthVo(_loc3_).toString());
         var _loc2_:int = ShopModel.ins.getLimitLocaleId(this.vo.limit_type);
         if(_loc2_ != 0)
         {
            _loc4_ = this.vo.limit_num;
            if(_loc4_ > 0)
            {
               this.txt_limit.text = LocaleMgr.ins.getStr(ShopModel.ins.getLimitLocaleId(this.vo.limit_type),[_loc4_ - ShopModel.ins.getBuyedTimes(this.vo.id),_loc4_]);
               this.txt_limit.visible = true;
            }
            else
            {
               this.txt_limit.visible = false;
            }
         }
         else
         {
            this.txt_limit.visible = false;
         }
         this.txt_name.color = ColorLib.qualityColor(_loc3_.quality);
         this.txt_name.text = _loc3_.showName;
      }
   }
}
