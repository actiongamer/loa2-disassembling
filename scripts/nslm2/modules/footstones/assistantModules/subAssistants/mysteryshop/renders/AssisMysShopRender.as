package nslm2.modules.footstones.assistantModules.subAssistants.mysteryshop.renders
{
   import game.ui.assistantModules.renders.AssisMysShopRenderUI;
   import nslm2.mgrs.stcMgrs.vos.StcShopVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.footstones.assistantModules.subAssistants.mysteryshop.AssisMysteryShopModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.vo.WealthVo;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.utils.LabelUtils;
   import morn.core.components.Button;
   import morn.customs.expands.MornExpandUtil;
   
   public class AssisMysShopRender extends AssisMysShopRenderUI
   {
       
      
      public function AssisMysShopRender()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
      }
      
      private function get vo() : StcShopVo
      {
         return StcMgr.ins.getShopVo(this.dataSource as int);
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(param1)
         {
            this.render_item.dataSource = WealthUtil.parseCostStr(vo.sell_res);
            this.render_cost.dataSource = WealthUtil.parseCostStr(vo.curr_res);
            setPiece();
            if(AssisMysteryShopModel.ins.isSelected(vo.id))
            {
               this.btn_change.label = LocaleMgr.ins.getStr(60200080);
            }
            else
            {
               this.btn_change.label = LocaleMgr.ins.getStr(60200081);
            }
         }
      }
      
      private function setPiece() : void
      {
         var _loc2_:int = 0;
         var _loc3_:WealthVo = WealthVo.parseCostStr(vo.sell_res);
         var _loc1_:int = PlayerModel.ins.getCountByWealthVo(_loc3_);
         if(BagModel.ins.itemCanCompose(_loc3_.sid))
         {
            _loc2_ = StcMgr.ins.getItemVo(_loc3_.sid).extend_1;
            this.txt_has.text = _loc1_ + "/" + _loc2_;
            this.txt_has.color = LabelUtils.getCountNeedColor(_loc1_,_loc2_);
         }
         else
         {
            this.txt_has.color = 458496;
            this.txt_has.num = _loc1_;
         }
      }
      
      private function onBtnFunc(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(this.btn_change === _loc2_)
         {
            if(AssisMysteryShopModel.ins.isSelected(vo.id))
            {
               AssisMysteryShopModel.ins.removeNeedBuyShopId(vo.id);
            }
            else
            {
               AssisMysteryShopModel.ins.addNeedBuyShopId(vo.id);
            }
         }
      }
   }
}
