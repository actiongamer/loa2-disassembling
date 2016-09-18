package nslm2.modules.foundations.mall.view.render
{
   import game.ui.mallModule.render.MallAlertWealthRenderUI;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.mall.vo.MallParamVo;
   import nslm2.modules.foundations.mall.vo.MallItemVo;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.foundations.shop.model.ShopModel;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   
   public class MallAlertWealthRender extends MallAlertWealthRenderUI
   {
       
      
      public function MallAlertWealthRender()
      {
         super();
         this.buttonMode = true;
         this.addEventListener("click",onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         ModuleMgr.ins.closeModule(11202);
         ModuleMgr.ins.showModule(11200,new MallParamVo(vo.stcMallItemVo.kind,vo.id));
      }
      
      private function get vo() : MallItemVo
      {
         return this.dataSource as MallItemVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         .super.dataSource = param1;
         if(param1)
         {
            _loc3_ = WealthUtil.costStrToArr(this.vo.stcMallItemVo.items);
            this.list_wealth.repeatX = _loc3_.length;
            this.list_wealth.dataSource = _loc3_;
            _loc2_ = WealthUtil.parseCostStr(this.vo.stcMallItemVo.old_price);
            _loc4_ = WealthUtil.parseCostStr(this.vo.stcMallItemVo.now_price);
            _loc5_ = ShopModel.ins.getDiscount(_loc2_.count,_loc4_.count);
            if(_loc5_ != 10)
            {
               this.img_barginBg.url = UrlLib.moduleMallBarginBg(_loc5_);
            }
            this.img_barginBg.visible = _loc5_ != 10;
         }
      }
   }
}
