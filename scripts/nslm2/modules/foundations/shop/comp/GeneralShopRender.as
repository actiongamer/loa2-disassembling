package nslm2.modules.foundations.shop.comp
{
   import game.ui.shopModules.render.GeneralShopRenderUI;
   import nslm2.mgrs.stcMgrs.vos.StcShopVo;
   import nslm2.modules.foundations.shop.model.ShopModel;
   import com.mz.core.event.MzEvent;
   import proto.ShopBuyInfo;
   import nslm2.common.vo.WealthVo;
   import nslm2.mgrs.stcMgrs.vos.StcFacebookFeedVo;
   import nslm2.utils.PlatformUtil;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.utils.LabelUtils;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.mgrs.stcMgrs.vos.StcGridNodeVo;
   import nslm2.utils.RestrictiveConditionUtils;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.components.Button;
   import com.greensock.TweenLite;
   import nslm2.modules.cultivates.treasure.model.TreasureModel;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import morn.customs.expands.MornExpandUtil;
   
   public class GeneralShopRender extends GeneralShopRenderUI
   {
       
      
      public function GeneralShopRender()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btnFunc);
      }
      
      private function get vo() : StcShopVo
      {
         return this.dataSource as StcShopVo;
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
         $e = param1;
         var shopBuyInfo:ShopBuyInfo = $e.data as ShopBuyInfo;
         if(shopBuyInfo && vo && shopBuyInfo.id == vo.id)
         {
            var $wealthVo:WealthVo = WealthVo.parseCostStr(vo.sell_res);
            if(PlatformUtil.isFeedShowFaceBook && $wealthVo.kind == 3)
            {
               var $arr:Array = vo.condi.split(":");
               var feedConfig:StcFacebookFeedVo = StcMgr.ins.getVoByMultiColumnValue("static_facebook_feed",["feedType","para_1"],[5,$arr[0]]) as StcFacebookFeedVo;
               if(feedConfig)
               {
                  var obj:Object = {};
                  obj.vo = feedConfig;
                  obj.para_1 = $wealthVo.count;
                  obj.para_2 = 0;
                  App.timer.doOnce(3000,function():void
                  {
                     ModuleMgr.ins.showModule(88002,obj,ModuleMgr.ins.popLayer.curModuleId);
                  });
               }
            }
         }
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
         var _loc3_:int = 0;
         var _loc2_:* = null;
         var _loc5_:* = null;
         var _loc4_:WealthVo = WealthVo.parseCostStr(this.vo.sell_res);
         this.txt_pieceNum.visible = false;
         if(BagModel.ins.itemCanCompose(_loc4_.sid))
         {
            this.txt_pieceNum.visible = true;
            _loc1_ = BagModel.ins.getStcCount(_loc4_.sid);
            _loc3_ = StcMgr.ins.getItemVo(_loc4_.sid).extend_1;
            this.txt_pieceNum.text = "(" + _loc1_ + "/" + _loc3_ + ")";
            this.txt_pieceNum.color = LabelUtils.getCountNeedColor(_loc1_,_loc3_);
         }
         else
         {
            _loc2_ = StcMgr.ins.getItemVo(_loc4_.sid);
            if(_loc2_ && _loc2_.kind == 82)
            {
               this.txt_pieceNum.visible = true;
               _loc5_ = StcMgr.ins.getGridNodeVo(int(_loc2_.extend_1));
               _loc1_ = BagModel.ins.getStcCount(_loc4_.sid);
               _loc3_ = _loc5_.cost_item.split(":")[2];
               this.txt_pieceNum.text = "(" + _loc1_ + "/" + _loc3_ + ")";
               this.txt_pieceNum.color = LabelUtils.getCountNeedColor(_loc1_,_loc3_);
            }
         }
      }
      
      private function setLimitAndCondi() : void
      {
         if(RestrictiveConditionUtils.condSatisfied(this.vo.condi) == false)
         {
            this.txt_limit.text = TextFieldUtil.htmlText2(RestrictiveConditionUtils.getLocaleStr(this.vo.condi),16723968);
            this.txt_limit.visible = true;
            return;
         }
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
         this.img_buyed.visible = !ShopModel.ins.hasLeftToBuy(this.vo.id);
         this.btn_buy.visible = ShopModel.ins.hasLeftToBuy(this.vo.id);
      }
      
      private function btnFunc(param1:Button) : void
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc5_:int = 0;
         var _loc6_:* = param1;
         if(this.btn_buy === _loc6_)
         {
            if(RestrictiveConditionUtils.condSatisfied(this.vo.condi) == false)
            {
               TweenLite.to(this.txt_limit,0.2,{"scale":1.4});
               TweenLite.to(this.txt_limit,0.2,{
                  "scale":1,
                  "delay":0.2
               });
               return;
            }
            _loc4_ = WealthUtil.costStrToArr(this.vo.curr_res);
            _loc3_ = WealthVo.parseCostStr(vo.sell_res);
            if(_loc3_.stcItemVo && (_loc3_.stcItemVo.kind == 8 || _loc3_.stcItemVo.kind == 9))
            {
               if(TreasureModel.ins.getALLTreausreData().length >= 400)
               {
                  AlertUtil.float(LocaleMgr.ins.getStr(30600331));
                  return;
               }
            }
            if(ShopModel.ins.getCanBuyMaxCount(this.vo.id) > 0)
            {
               doBuyItem();
            }
            else
            {
               _loc5_ = 0;
               while(_loc5_ < _loc4_.length)
               {
                  if(PlayerModel.ins.getCountByWealthVo(_loc4_[_loc5_]) < _loc4_[_loc5_].count)
                  {
                     _loc2_ = _loc4_[_loc5_];
                     break;
                  }
                  _loc5_++;
               }
               ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByWealthVo(_loc2_),ModuleMgr.ins.popLayer.curModuleId);
            }
         }
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
