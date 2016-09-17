package nslm2.modules.footstones.assistantModules.subAssistants.shop
{
   import game.ui.assistantModules.renders.AssisShopRenderUI;
   import flash.events.Event;
   import nslm2.modules.footstones.assistantModules.model.AssistantModel;
   import nslm2.modules.footstones.assistantModules.vos.AssistantShopSetVo;
   import nslm2.modules.footstones.assistantModules.vos.AssistantShopPropVo;
   import nslm2.modules.footstones.assistantModules.vos.AssistantShopVo;
   import nslm2.mgrs.stcMgrs.vos.StcShopVo;
   import nslm2.common.ui.components.comps2d.numBar.NumBarS1;
   import nslm2.modules.foundations.shop.model.ShopModel;
   import com.mz.core.event.MzEvent;
   import nslm2.common.vo.WealthVo;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.utils.LabelUtils;
   import nslm2.utils.RestrictiveConditionUtils;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.components.Button;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import morn.customs.expands.MornExpandUtil;
   
   public class AssisShopItemRender extends AssisShopRenderUI
   {
       
      
      private var _shopType:int;
      
      public function AssisShopItemRender()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btnFunc);
         numBarS1.addEventListener("evt_numbar_value_change",numBarS1Change);
      }
      
      protected function numBarS1Change(param1:Event) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:* = null;
         if(vo)
         {
            _loc2_ = AssistantModel.ins.assistantShopSetVo;
            if(_loc2_)
            {
               if(_loc2_.shopVoObj[_shopType])
               {
                  _loc3_ = _loc2_.shopVoObj[_shopType];
                  if(_loc3_.assistantShopVoObj[vo.id])
                  {
                     _loc4_ = _loc3_.assistantShopVoObj[vo.id];
                     _loc4_.num = numBarS1.nowNum;
                  }
                  else
                  {
                     _loc4_ = new AssistantShopPropVo();
                     _loc4_.id = vo.id;
                     _loc4_.num = numBarS1.nowNum;
                     _loc3_.assistantShopVoObj[vo.id] = _loc4_;
                  }
               }
               else
               {
                  _loc3_ = new AssistantShopVo();
                  _loc3_.shopId = _shopType;
                  _loc2_.shopVoObj[_shopType] = _loc3_;
                  _loc4_ = new AssistantShopPropVo();
                  _loc4_.id = vo.id;
                  _loc4_.num = numBarS1.nowNum;
                  _loc3_.assistantShopVoObj[vo.id] = _loc4_;
               }
            }
         }
      }
      
      private function get vo() : StcShopVo
      {
         return this.dataSource as StcShopVo;
      }
      
      private function get numBarS1() : NumBarS1
      {
         return this.inputNumView as NumBarS1;
      }
      
      private function switchEventListener(param1:Boolean) : void
      {
         if(param1)
         {
            ShopModel.ins.addEventListener("evtShopBuyCpl",onBuyCpl);
         }
         else
         {
            ShopModel.ins.removeEventListener("evtShopBuyCpl",onBuyCpl);
         }
      }
      
      private function onBuyCpl(param1:MzEvent) : void
      {
         refresh();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         if(param1)
         {
            _shopType = param1.shopType;
            .super.dataSource = param1.stcShopVo;
            refresh();
            switchEventListener(true);
         }
         else
         {
            .super.dataSource = null;
            switchEventListener(false);
         }
      }
      
      private function refresh() : void
      {
         var _loc2_:WealthVo = WealthVo.parseCostStr(vo.sell_res);
         this.list_render.dataSource = [_loc2_];
         this.txt_name.text = _loc2_.showName;
         this.txt_name.color = ColorLib.qualityColor(_loc2_.quality);
         var _loc1_:Array = WealthUtil.costStrToArr(vo.ori_res);
         this.oriRes.dataSource = _loc1_[0];
         this.list_currRes.dataSource = WealthUtil.costStrToArr(vo.curr_res);
         setDiscount();
         setPiece();
         setLimitAndCondi();
         setBuyed();
         if(_loc2_.stcItemVo && (_loc2_.stcItemVo.kind == 8 || _loc2_.stcItemVo.kind == 9))
         {
            txt_bind.visible = true;
         }
         else
         {
            txt_bind.visible = false;
         }
      }
      
      private function setDiscount() : void
      {
         var _loc2_:Array = WealthUtil.costStrToArr(this.vo.curr_res);
         var _loc1_:Array = WealthUtil.costStrToArr(this.vo.ori_res);
         if(this.oriRes.wealthVo.kind == 0 || this.oriRes.wealthVo.count == _loc2_[0].count)
         {
            this.box_discount.visible = false;
         }
         else
         {
            this.box_discount.visible = true;
            this.img_discount.url = UrlLib.discountIconLeft(ShopModel.ins.getDiscount(_loc1_[0].count,_loc2_[0].count));
         }
      }
      
      private function setPiece() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:WealthVo = WealthVo.parseCostStr(this.vo.sell_res);
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
         if(RestrictiveConditionUtils.condSatisfied(this.vo.condi) == false)
         {
            this.txt_limit.text = TextFieldUtil.htmlText2(RestrictiveConditionUtils.getLocaleStr(this.vo.condi),16723968);
            this.txt_limit.visible = true;
            inputNumView.disabled = true;
            return;
         }
         inputNumView.disabled = false;
         var _loc1_:int = this.vo.limit_num;
         if(_loc1_ > 0)
         {
            this.txt_limit.visible = true;
            this.txt_limit.text = LocaleMgr.ins.getStr(ShopModel.ins.getLimitLocaleId(this.vo.limit_type),[_loc1_ - ShopModel.ins.getBuyedTimes(this.vo.id),_loc1_]);
         }
         else
         {
            this.txt_limit.visible = false;
         }
      }
      
      private function setBuyed() : void
      {
         var _loc1_:Object = AssistantModel.ins.getShopPropVo(_shopType,vo.id);
         if(_loc1_)
         {
            if(vo.limit_type == 0)
            {
               numBarS1.init(0,999,_loc1_.num);
            }
            else
            {
               if(_loc1_.num > vo.limit_num)
               {
                  _loc1_.num = vo.limit_num;
               }
               numBarS1.init(0,vo.limit_num,_loc1_.num);
            }
         }
         else if(vo.limit_type == 0)
         {
            numBarS1.init(0,999,0);
         }
         else
         {
            numBarS1.init(0,vo.limit_num,0);
         }
      }
      
      private function btnFunc(param1:Button) : void
      {
      }
      
      private function doBuyItem() : void
      {
         ModuleMgr.ins.showModule(60320,this.vo,ModuleMgr.ins.popLayer.curModuleId);
      }
      
      override public function dispose() : void
      {
         switchEventListener(false);
         super.dispose();
      }
   }
}
