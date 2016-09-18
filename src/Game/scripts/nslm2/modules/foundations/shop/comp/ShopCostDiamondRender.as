package nslm2.modules.foundations.shop.comp
{
   import game.ui.shopModules.render.ShopCostDiamondRenderUI;
   import nslm2.modules.foundations.shop.ShopBuyConfirmVo;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class ShopCostDiamondRender extends ShopCostDiamondRenderUI
   {
       
      
      public function ShopCostDiamondRender()
      {
         super();
      }
      
      private function get vo() : ShopBuyConfirmVo
      {
         return this.dataSource as ShopBuyConfirmVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         var _loc2_:WealthVo = WealthVo.parseCostStr(vo.shopVo.curr_res);
         _loc2_.count = _loc2_.count * vo.num;
         this.txt_limit.text = LocaleMgr.ins.getStr(60300019,["@{wealth:" + _loc2_.kind + "}" + _loc2_.count]);
         this.render_wealth.dataSource = vo;
      }
      
      public function addPlusResource(param1:WealthVo) : void
      {
         var _loc2_:WealthVo = WealthVo.parseCostStr(vo.shopVo.curr_res);
         this.txt_limit.text = LocaleMgr.ins.getStr(60300019,["@{wealth:" + _loc2_.kind + "}" + _loc2_.count + " " + "@{wealth:" + param1.kind + "}" + param1.count]);
      }
   }
}
