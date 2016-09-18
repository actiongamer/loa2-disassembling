package nslm2.modules.funnies.newYears.day51s.renders
{
   import game.ui.newYears.day51s.renders.Day51ShopRenderUI;
   import nslm2.modules.funnies.funnyCommons.IFuncIdView;
   import nslm2.modules.funnies.busyActivity.towers.services.TowerService;
   import nslm2.modules.funnies.busyActivity.dragonBoats.services.DragonBoatService;
   import nslm2.modules.funnies.newYears.day51s.services.Day51Service;
   import nslm2.modules.funnies.funnyCommons.FunnyServiceShopPart;
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
   
   public class Day51ShopRender extends Day51ShopRenderUI implements IFuncIdView
   {
       
      
      private var _funcId:int;
      
      private var _commonBuyConfirm:CommonBuyConfirm;
      
      public function Day51ShopRender()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
         this.txt_discount.font = "Em_YaHeiB";
         this.txt_discount.rotation = -45;
         DisplayUtils.addChildFromGlobal(this.btn_buy,this.render_curRes);
      }
      
      public function get funcId() : int
      {
         return _funcId;
      }
      
      public function set funcId(param1:int) : void
      {
         _funcId = param1;
      }
      
      public function do_server_buy() : void
      {
         switch(int(funcId) - 13376)
         {
            case 0:
               DragonBoatService.ins.protos.server_DRAGON_BOAT_BUY(vo.id,_commonBuyConfirm.numBar.nowNum,null);
               return;
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
               Day51Service.ins.server_mineSweepBuy(vo.id,_commonBuyConfirm.numBar.nowNum);
               return;
            case 10:
               TowerService.ins.protos.server_TOWER_BUY(vo.id,_commonBuyConfirm.numBar.nowNum,null);
               return;
         }
      }
      
      public function get shop() : FunnyServiceShopPart
      {
         switch(int(this.funcId) - 13376)
         {
            case 0:
               return DragonBoatService.ins.shop;
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
               return Day51Service.ins.shop;
            case 10:
               return TowerService.ins.shop;
         }
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
            this.txt_limit.text = LabelUtils.leaveMaxStrGRWithLangId(_loc1_ - this.shop.getBuyedTimes(this.vo.id),_loc1_,ShopModel.ins.getLimitLocaleId(1));
         }
         else
         {
            this.txt_limit.visible = false;
         }
      }
      
      private function setBuyed() : void
      {
         this.img_buyed.visible = !this.shop.hasLeftToBuy(this.vo.id);
         this.btn_buy.visible = this.shop.hasLeftToBuy(this.vo.id);
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
               AlertUtil.float(LocaleMgr.ins.getStr(300004042));
            }
            else
            {
               _commonBuyConfirm = new CommonBuyConfirm(new CommonBuyVo(WealthUtil.parseCostStr(vo.cost),WealthUtil.parseCostStr(vo.item),this.shop.getCanBuyMaxCount(vo.id)));
               AlertUtil.comfirm(new CommonBuyConfirm(new CommonBuyVo(WealthUtil.parseCostStr(vo.cost),WealthUtil.parseCostStr(vo.item),this.shop.getCanBuyMaxCount(vo.id))),buyItem);
            }
         }
      }
      
      private function buyItem() : void
      {
         this.do_server_buy();
      }
   }
}
