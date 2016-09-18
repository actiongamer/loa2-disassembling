package nslm2.modules.funnies.newYears.luckTrees.renders
{
   import game.ui.newYears.luckTrees.renders.LuckTreeShopRenderUI;
   import nslm2.modules.funnies.newYears.luckTrees.services.LuckTreeService;
   import proto.StaticLuckTreeShopModel;
   import nslm2.common.vo.WealthVo;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.foundations.shop.model.ShopModel;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.utils.LabelUtils;
   import nslm2.common.ui.components.comps2d.others.CommonBuyConfirm;
   import morn.core.components.Button;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.common.vo.CommonBuyVo;
   import nslm2.utils.WealthUtil;
   import morn.customs.expands.MornExpandUtil;
   import com.mz.core.utils.DisplayUtils;
   
   public class LuckTreeShopRender extends LuckTreeShopRenderUI
   {
       
      
      private var _commonBuyConfirm:CommonBuyConfirm;
      
      public function LuckTreeShopRender()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
         this.txt_discount.font = "Em_YaHeiB";
         this.txt_discount.rotation = -45;
         DisplayUtils.addChildFromGlobal(this.btn_buy,this.render_curRes);
      }
      
      public function get service() : LuckTreeService
      {
         return LuckTreeService.ins;
      }
      
      public function get vo() : StaticLuckTreeShopModel
      {
         return this.dataSource as StaticLuckTreeShopModel;
      }
      
      private function switchEventListener(param1:Boolean) : void
      {
         if(param1)
         {
         }
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(param1)
         {
            refresh();
            switchEventListener(true);
         }
         else
         {
            switchEventListener(false);
         }
      }
      
      private function refresh() : void
      {
         var _loc1_:WealthVo = WealthVo.parseCostStr(vo.item);
         this.render_item.dataSource = _loc1_;
         this.txt_name.text = _loc1_.showName;
         this.txt_name.color = ColorLib.qualityColor(_loc1_.quality);
         this.render_oriRes.dataSource = WealthVo.parseCostStr(vo.cost);
         this.render_curRes.dataSource = WealthVo.parseCostStr(vo.cost);
         setDiscount();
         setPiece();
         setLimitAndCondi();
         setBuyed();
      }
      
      private function setDiscount() : void
      {
         var _loc2_:WealthVo = WealthVo.parseCostStr(vo.cost);
         var _loc1_:WealthVo = WealthVo.parseCostStr(vo.cost);
         if(_loc2_.kind == 0 || _loc2_.count <= _loc1_.count)
         {
            this.box_discount.visible = false;
         }
         else
         {
            this.txt_discount.text = LocaleMgr.ins.getStr(13300007,[Math.max(1,ShopModel.ins.getDiscount(_loc2_.count,_loc1_.count))]);
            this.box_discount.visible = true;
         }
      }
      
      private function setPiece() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc1_:* = null;
         var _loc4_:WealthVo = WealthVo.parseCostStr(this.vo.item);
         if(BagModel.ins.itemCanCompose(_loc4_.sid))
         {
            _loc2_ = BagModel.ins.getStcCount(_loc4_.sid);
            _loc3_ = StcMgr.ins.getItemVo(_loc4_.sid).extend_1;
            _loc1_ = TextFieldUtil.htmlText2("(" + _loc2_ + "/" + _loc3_ + ")",LabelUtils.getCountNeedColor(_loc2_,_loc3_));
            this.txt_name.text = this.txt_name.text + _loc1_;
         }
      }
      
      private function setLimitAndCondi() : void
      {
         var _loc1_:int = this.vo.limit;
         if(_loc1_ > 0)
         {
            this.txt_limit.visible = true;
            this.txt_limit.text = LocaleMgr.ins.getStr(ShopModel.ins.getLimitLocaleId(1),[_loc1_ - LuckTreeService.ins.getBuyedTimes(this.vo.id),_loc1_]);
         }
         else
         {
            this.txt_limit.visible = false;
         }
      }
      
      private function setBuyed() : void
      {
         this.img_buyed.visible = !service.hasLeftToBuy(this.vo.id);
         this.btn_buy.visible = service.hasLeftToBuy(this.vo.id);
      }
      
      private function onBtnFunc(param1:Button) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = param1;
         if(this.btn_buy === _loc3_)
         {
            _loc2_ = WealthVo.parseCostStr(vo.cost);
            if(PlayerModel.ins.getCountByWealthVo(_loc2_) < _loc2_.count)
            {
               AlertUtil.float(LocaleMgr.ins.getStr(60800027,[_loc2_.showName]));
            }
            else
            {
               _commonBuyConfirm = new CommonBuyConfirm(new CommonBuyVo(WealthUtil.parseCostStr(vo.cost),WealthUtil.parseCostStr(vo.item),service.getCanBuyMaxCount(vo.id)));
               AlertUtil.comfirm(new CommonBuyConfirm(new CommonBuyVo(WealthUtil.parseCostStr(vo.cost),WealthUtil.parseCostStr(vo.item),service.getCanBuyMaxCount(vo.id))),buyItem);
            }
         }
      }
      
      private function buyItem() : void
      {
         service.server_luckTreeBuy(vo.id,_commonBuyConfirm.numBar.nowNum);
      }
   }
}
