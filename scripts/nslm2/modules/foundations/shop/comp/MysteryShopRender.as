package nslm2.modules.foundations.shop.comp
{
   import game.ui.shopModules.render.MysteryShopRenderUI;
   import flash.events.Event;
   import proto.HeroShopShardLockReq;
   import nslm2.modules.foundations.shop.model.ShopModel;
   import nslm2.nets.sockets.ServerEngine;
   import proto.HeroShopShardLockRes;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.common.model.PlayerModel;
   import nslm2.utils.LabelUtils;
   import nslm2.mgrs.stcMgrs.vos.StcShopVo;
   import com.mz.core.event.MzEvent;
   import proto.ShopBuyInfo;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import nslm2.common.vo.WealthVo;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.utils.RestrictiveConditionUtils;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.common.model.HeroModel;
   import morn.core.components.Button;
   import nslm2.modules.foundations.shop.ShopBuyConfirmVo;
   import morn.core.handlers.Handler;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.foundations.shop.service.ShopService;
   import morn.customs.expands.MornExpandUtil;
   
   public class MysteryShopRender extends MysteryShopRenderUI
   {
       
      
      private var isLock:Boolean = false;
      
      private var ceilIndex:int;
      
      public function MysteryShopRender()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btnFunc);
         this.txt_other.font = "Em_YaHeiB";
         this.txt_other.rotation = -45;
         this.box_other.mouseEvent = false;
         this.box_lock.visible = false;
      }
      
      private function onBtnLockClickHandler(param1:Event) : void
      {
         var _loc2_:* = null;
         if(isLock)
         {
            _loc2_ = new HeroShopShardLockReq();
            _loc2_.itemId = ShopModel.ins.lockItem.key;
            _loc2_.lock = false;
            _loc2_.shopType = 60310 + 100000;
            ShopModel.ins.lockItem.value = false;
            ServerEngine.ins.send(10032,_loc2_,onServerCpl_Lock);
         }
      }
      
      private function onServerCpl_Lock(param1:HeroShopShardLockRes) : void
      {
         while(ShopModel.ins.lockBuyedItems.length > 0)
         {
            ShopModel.ins.lockBuyedItems.shift();
         }
         ArrayUtil.fillVectorFromArr(ShopModel.ins.lockBuyedItems,param1.lockFreshBuy);
         doLock(false);
      }
      
      public function doLock(param1:Boolean) : void
      {
         if(!checkCanWork)
         {
            return;
         }
         isLock = param1;
         this.img_lock.visible = isLock;
         this.img_unlock.visible = !isLock;
         this.txt_lock_info.text = !!isLock?LocaleMgr.ins.getStr(999902519):"";
         if(!isLock)
         {
            this.render_background.skin = "png.uiShop.img_mysteryBg1";
            this.dataSource = ShopModel.ins.getMysteryItemListByPage(60310 + 100000,1)[1];
         }
         else
         {
            this.render_background.skin = "png.uiShop.img_mysteryBg2";
            this.dataSource = StcMgr.ins.getShopVo(ShopModel.ins.lockItem.key);
         }
      }
      
      private function onBtnSelectClickHandler(param1:Event) : void
      {
         if(!checkCanWork)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(999902520));
            return;
         }
         ModuleMgr.ins.showModule(1410065407,null,60310);
      }
      
      public function setFirstCeilSpecialMode(param1:int) : void
      {
         this.ceilIndex = param1;
         if(this.ceilIndex == 1)
         {
            this.render_background.skin = "png.uiShop.img_mysteryBg1";
            this.box_lock.visible = true;
            this.img_help.toolTip = LocaleMgr.ins.getStr(999902521);
            this.btn_link_select.addEventListener("click",onBtnSelectClickHandler);
            if(PlayerModel.ins.vip >= int(StcMgr.ins.getDefineVo("HERO_SHOP_SHARD_LOCK_VIP_LIMIT").define_value))
            {
               isLock = true;
               this.img_lock.visible = isLock;
               this.img_unlock.visible = !isLock;
               this.txt_lock_info.text = !!isLock?LocaleMgr.ins.getStr(999902519):"";
               this.box_ckb.addEventListener("click",onBtnLockClickHandler);
               this.img_lock.visible = true;
               this.img_unlock.visible = true;
               this.txt_lock_info.visible = true;
               this.box_ckb.visible = true;
               this.btn_link_select.visible = true;
            }
            else
            {
               this.img_lock.visible = false;
               this.img_unlock.visible = false;
               this.txt_lock_info.visible = false;
               this.box_ckb.visible = false;
            }
            txt_vip_info.text = LocaleMgr.ins.getStr(999902517,[StcMgr.ins.getDefineVo("HERO_SHOP_SHARD_LOCK_VIP_LIMIT").define_value]);
            txt_vip_info.color = LabelUtils.getCountNeedColor(PlayerModel.ins.vip,int(StcMgr.ins.getDefineVo("HERO_SHOP_SHARD_LOCK_VIP_LIMIT").define_value));
         }
         else
         {
            isLock = false;
            this.box_lock.visible = false;
         }
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
         this.curr_res.txt_num.color = LabelUtils.getCountColor(PlayerModel.ins.getCountByWealthVo(this.curr_res.wealthVo),this.curr_res.wealthVo.count);
         if((param1.data as ShopBuyInfo).id == this.vo.id)
         {
            refresh();
            FloatUtil.showGetItemsDisplayPanel(list_render.dataSource as Array);
         }
      }
      
      override public function set dataSource(param1:Object) : void
      {
         switchEventListener(true);
         .super.dataSource = param1;
         if(ShopModel.ins.lockItem && ShopModel.ins.lockItem.value && this.box_lock.visible)
         {
            .super.dataSource = StcMgr.ins.getShopVo(ShopModel.ins.lockItem.key);
         }
         if(param1)
         {
            refresh();
         }
      }
      
      private function refresh() : void
      {
         var _loc1_:WealthVo = WealthVo.parseCostStr(vo.sell_res);
         this.list_render.dataSource = [_loc1_];
         this.txt_name.text = _loc1_.showName;
         this.txt_name.color = ColorLib.qualityColor(_loc1_.quality);
         this.oriRes.dataSource = WealthVo.parseCostStr(vo.ori_res);
         this.curr_res.dataSource = WealthVo.parseCostStr(vo.curr_res);
         setDiscount();
         setPiece();
         setBuyed();
         setOther();
         this.curr_res.txt_num.color = LabelUtils.getCountColor(PlayerModel.ins.getCountByWealthVo(this.curr_res.wealthVo),this.curr_res.wealthVo.count);
      }
      
      private function setDiscount() : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc4_:int = 0;
         var _loc1_:* = null;
         if(box_lock.visible && checkCanWork && (ShopModel.ins.lockItem && ShopModel.ins.lockItem.value || ShopModel.ins.freshLockItem))
         {
            this.box_discount.visible = true;
            this.line_discount.visible = false;
            this.oriRes.scale = 1;
            this.oriRes.dataSource = WealthVo.parseCostStr(vo.curr_res);
            _loc3_ = WealthVo.parseCostStr(vo.sell_res);
            _loc2_ = StcMgr.ins.getDefineVo("HERO_SHOP_SHARD_LOCK_QUALITY").define_value.split("|");
            _loc4_ = 0;
            while(_loc4_ < _loc2_.length)
            {
               if(_loc2_[_loc4_] == _loc3_.quality)
               {
                  _loc1_ = WealthVo.parseCostStr(StcMgr.ins.getDefineVo("HERO_SHOP_SHARD_LOCK_COST").define_value.split("|")[_loc4_]);
                  this.oriRes.dataSource = _loc1_;
                  this.curr_res.txt_num.color = LabelUtils.getCountColor(PlayerModel.ins.getCountByWealthVo(_loc1_),_loc1_.count);
                  break;
               }
               _loc4_++;
            }
            return;
         }
         this.line_discount.visible = true;
         this.oriRes.scale = 0.9;
         if(this.oriRes.wealthVo.sid == 0 || this.oriRes.wealthVo.count == this.curr_res.wealthVo.count)
         {
            this.box_discount.visible = false;
         }
         else
         {
            this.box_discount.visible = true;
            this.img_discount.url = UrlLib.discountIconLeft(ShopModel.ins.getDiscount(this.oriRes.wealthVo.count,this.curr_res.wealthVo.count));
         }
      }
      
      private function setPiece() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:WealthVo = WealthVo.parseCostStr(vo.sell_res);
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
      
      private function get checkCanWork() : Boolean
      {
         return PlayerModel.ins.vip >= int(StcMgr.ins.getDefineVo("HERO_SHOP_SHARD_LOCK_VIP_LIMIT").define_value);
      }
      
      private function setBuyed() : void
      {
         var _loc1_:int = 0;
         this.txt_limit.visible = false;
         if(box_lock.visible && checkCanWork && ShopModel.ins.lockItem && ShopModel.ins.lockItem.value)
         {
            if(ShopModel.ins.lockBuyedItems && ShopModel.ins.lockBuyedItems.length > 0 && ShopModel.ins.lockBuyedItems[0] == ShopModel.ins.lockItem.key && ShopModel.ins.freshLockItem && ShopModel.ins.lockItem.key == ShopModel.ins.getMysteryItemListByPage(60310 + 100000,1)[1].id)
            {
               this.img_buyed.visible = true;
               this.btn_buy.visible = false;
            }
            else if(ShopModel.ins.lockBuyedItems && ShopModel.ins.lockBuyedItems.length > 0)
            {
               this.img_buyed.visible = false;
               this.btn_buy.visible = true;
               this.btn_buy.disabled = true;
            }
            else
            {
               this.img_buyed.visible = false;
               this.btn_buy.visible = true;
               this.btn_buy.disabled = false;
            }
         }
         else if(box_lock.visible && checkCanWork && ShopModel.ins.freshLockItem)
         {
            if(ShopModel.ins.lockBuyedItems && ShopModel.ins.lockBuyedItems.length > 0)
            {
               this.img_buyed.visible = true;
               this.btn_buy.visible = false;
            }
            else
            {
               this.img_buyed.visible = false;
               this.btn_buy.visible = true;
               this.btn_buy.disabled = false;
            }
         }
         else
         {
            this.btn_buy.disabled = false;
            _loc1_ = this.vo.limit_num;
            if(_loc1_ > 0)
            {
               this.txt_limit.visible = true;
               this.txt_limit.text = LocaleMgr.ins.getStr(ShopModel.ins.getLimitLocaleId(this.vo.limit_type),[_loc1_ - ShopModel.ins.getBuyedTimes(this.vo.id),_loc1_]);
            }
            else
            {
               this.txt_limit.visible = false;
            }
            this.img_buyed.visible = ShopModel.ins.mysteryItemHasBuyed(this.vo.id);
            this.btn_buy.visible = !ShopModel.ins.mysteryItemHasBuyed(this.vo.id);
         }
      }
      
      private function setOther() : void
      {
         var _loc1_:WealthVo = WealthVo.parseCostStr(vo.sell_res);
         if(_loc1_.stcItemVo && _loc1_.stcItemVo.kind == 21)
         {
            if(HeroModel.ins.checkHeroInTeam(_loc1_.stcItemVo.heroPiece_stcNpcId))
            {
               this.img_other.skin = "png.a5.commonImgs.img_blueLabel";
               this.txt_other.text = LocaleMgr.ins.getStr(60300027);
               this.box_other.visible = true;
               return;
            }
         }
         else if(_loc1_.stcNpcVo)
         {
            if(HeroModel.ins.checkHeroInTeam(_loc1_.stcNpcVo.id))
            {
               this.img_other.skin = "png.a5.commonImgs.img_blueLabel";
               this.txt_other.text = LocaleMgr.ins.getStr(60300027);
               this.box_other.visible = true;
               return;
            }
         }
         if(_loc1_.stcItemVo && _loc1_.stcItemVo.quality >= 5 || _loc1_.stcNpcVo && _loc1_.stcNpcVo.quality >= 5)
         {
            this.img_other.skin = "png.a5.commonImgs.img_redLabel";
            this.txt_other.text = LocaleMgr.ins.getStr(60300026);
            this.box_other.visible = true;
         }
         else
         {
            this.box_other.visible = false;
         }
      }
      
      private function btnFunc(param1:Button) : void
      {
         var _loc5_:* = null;
         var _loc2_:* = null;
         var _loc6_:* = null;
         _loc2_ = null;
         _loc6_ = null;
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc7_:int = 0;
         var _loc8_:* = param1;
         if(this.btn_buy === _loc8_)
         {
            _loc5_ = WealthVo.parseCostStr(this.vo.curr_res);
            if(_loc5_.kind == 3)
            {
               _loc2_ = new ShopBuyConfirmVo(this.vo,1);
               _loc6_ = new ShopCostDiamondRender();
               _loc6_.dataSource = _loc2_;
               AlertUtil.comfirm(_loc6_,new Handler(doBuyItem),null,"shopCostDiamondNoShow");
            }
            else if(box_lock.visible && checkCanWork && ShopModel.ins.freshLockItem)
            {
               _loc2_ = new ShopBuyConfirmVo(this.vo,1);
               _loc6_ = new ShopCostDiamondRender();
               _loc6_.dataSource = _loc2_;
               _loc4_ = WealthVo.parseCostStr(vo.sell_res);
               _loc3_ = StcMgr.ins.getDefineVo("HERO_SHOP_SHARD_LOCK_QUALITY").define_value.split("|");
               _loc7_ = 0;
               while(_loc7_ < _loc3_.length)
               {
                  if(_loc3_[_loc7_] == _loc4_.quality)
                  {
                     _loc6_.addPlusResource(WealthVo.parseCostStr(StcMgr.ins.getDefineVo("HERO_SHOP_SHARD_LOCK_COST").define_value.split("|")[_loc7_]));
                     break;
                  }
                  _loc7_++;
               }
               AlertUtil.comfirm(_loc6_,new Handler(doBuyItem),null,"shopCostDiamondNoShow");
            }
            else if(ShopModel.ins.getCanBuyMaxCount(this.vo.id) > 0)
            {
               doBuyItem();
            }
            else
            {
               ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByLessId(int(DefindConsts.JIANGHUN_LESS_ID)),ModuleMgr.ins.popLayer.curModuleId);
            }
         }
      }
      
      private function doBuyItem() : void
      {
         ShopService.ins.buy(this.vo.id,1,null,null,this.ceilIndex);
      }
      
      override public function dispose() : void
      {
         switchEventListener(false);
         super.dispose();
      }
   }
}
