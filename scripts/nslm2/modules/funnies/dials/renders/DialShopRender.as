package nslm2.modules.funnies.dials.renders
{
   import game.ui.dialModule.renders.DialShopRenderUI;
   import proto.StaticZhuanPanShopModel;
   import nslm2.modules.funnies.dials.msgs.DialMsgs;
   import com.mz.core.event.MzEvent;
   import nslm2.common.vo.WealthVo;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.foundations.shop.model.ShopModel;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.utils.LabelUtils;
   import nslm2.modules.funnies.dials.model.DialModel;
   import nslm2.common.ui.components.comps2d.others.CommonBuyConfirm;
   import morn.core.components.Button;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.common.vo.CommonBuyVo;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.funnies.dials.service.DialService;
   import morn.customs.expands.MornExpandUtil;
   import com.mz.core.utils.DisplayUtils;
   
   public class DialShopRender extends DialShopRenderUI
   {
       
      
      private var _commonBuyConfirm:CommonBuyConfirm;
      
      public function DialShopRender()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
         this.txt_discount.font = "Em_YaHeiB";
         this.txt_discount.rotation = -45;
         DisplayUtils.addChildFromGlobal(this.btn_buy,this.render_curRes);
      }
      
      public function get vo() : StaticZhuanPanShopModel
      {
         return this.dataSource as StaticZhuanPanShopModel;
      }
      
      private function switchEventListener(param1:Boolean) : void
      {
         if(param1)
         {
            DialMsgs.ins.addEventListener("shop_buy_cpl",onBuyCpl);
         }
         else
         {
            DialMsgs.ins.removeEventListener("shop_buy_cpl",onBuyCpl);
         }
      }
      
      private function onBuyCpl(param1:MzEvent) : void
      {
         refresh();
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
         this.render_oriRes.dataSource = WealthVo.parseCostStr(vo.orires);
         this.render_curRes.dataSource = WealthVo.parseCostStr(vo.currres);
         setDiscount();
         setPiece();
         setLimitAndCondi();
         setBuyed();
      }
      
      private function setDiscount() : void
      {
         var _loc1_:WealthVo = WealthVo.parseCostStr(vo.currres);
         var _loc2_:WealthVo = WealthVo.parseCostStr(vo.orires);
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
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:WealthVo = WealthVo.parseCostStr(this.vo.item);
         if(BagModel.ins.itemCanCompose(_loc3_.sid))
         {
            this.txt_pieceNum.visible = true;
            _loc1_ = BagModel.ins.getStcCount(_loc3_.sid);
            _loc2_ = StcMgr.ins.getItemVo(_loc3_.sid).extend_1;
            this.txt_pieceNum.text = "(" + _loc1_ + "/" + _loc2_ + ")";
            this.txt_pieceNum.color = LabelUtils.getCountNeedColor(_loc1_,_loc2_);
         }
         else
         {
            this.txt_pieceNum.visible = false;
         }
      }
      
      private function setLimitAndCondi() : void
      {
         var _loc1_:int = this.vo.limitnum;
         if(_loc1_ > 0)
         {
            this.txt_limit.visible = true;
            this.txt_limit.text = LocaleMgr.ins.getStr(ShopModel.ins.getLimitLocaleId(1),[_loc1_ - DialModel.ins.getBuyedTimes(this.vo.id),_loc1_]);
         }
         else
         {
            this.txt_limit.visible = false;
         }
      }
      
      private function setBuyed() : void
      {
         this.img_buyed.visible = !DialModel.ins.hasLeftToBuy(this.vo.id);
         this.btn_buy.visible = DialModel.ins.hasLeftToBuy(this.vo.id);
      }
      
      private function onBtnFunc(param1:Button) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = param1;
         if(this.btn_buy === _loc3_)
         {
            _loc2_ = WealthVo.parseCostStr(vo.currres);
            if(PlayerModel.ins.getCountByWealthVo(_loc2_) < _loc2_.count)
            {
               AlertUtil.float(LocaleMgr.ins.getStr(60800027,[_loc2_.showName]));
            }
            else
            {
               _commonBuyConfirm = new CommonBuyConfirm(new CommonBuyVo(WealthUtil.parseCostStr(vo.currres),WealthUtil.parseCostStr(vo.item),DialModel.ins.getCanBuyMaxCount(vo.id)));
               AlertUtil.comfirm(new CommonBuyConfirm(new CommonBuyVo(WealthUtil.parseCostStr(vo.currres),WealthUtil.parseCostStr(vo.item),DialModel.ins.getCanBuyMaxCount(vo.id))),buyItem);
            }
         }
      }
      
      private function buyItem() : void
      {
         DialService.ins.buyItem(vo.id,_commonBuyConfirm.numBar.nowNum);
      }
   }
}
