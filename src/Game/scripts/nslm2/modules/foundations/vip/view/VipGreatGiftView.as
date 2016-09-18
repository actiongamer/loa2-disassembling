package nslm2.modules.foundations.vip.view
{
   import game.ui.vipModule.view.VipGreatGiftViewUI;
   import nslm2.modules.foundations.vip.model.VipModel;
   import flash.display.Sprite;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.common.vo.WealthVo;
   import flash.events.MouseEvent;
   import nslm2.modules.foundations.vip.vo.VipVo;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.vip.service.VipService;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import proto.ProtocolStatusRes;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.model.PlayerModel;
   import morn.core.utils.ObjectUtils;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.common.ctrls.BtnLongBarCtrl;
   
   public class VipGreatGiftView extends VipGreatGiftViewUI
   {
       
      
      private var vip_level:int = 1;
      
      private var model:VipModel;
      
      private const LIST_END_POS:int = 474;
      
      private var effLayer:Sprite;
      
      private var eff:BmcSpriteSheet;
      
      public function VipGreatGiftView()
      {
         model = VipModel.ins;
         super();
         eff = new BmcSpriteSheet();
         eff.init(10800003,1,"all",true);
         eff.y = -16;
         DisplayUtils.addChildBelow(eff,this.txt_ad);
         this.txt_vip.value = PlayerModel.ins.vip;
         vip_level = txt_vip.value;
         this.list_gift.repeatX = model.getVipGiftItemArr().length;
         this.list_gift.dataSource = model.getVipGiftItemArr();
         this.list_gift.selectedIndex = 0;
         this.list_gift.x = 474 - list_gift.width;
         this.priceRender.dataSource = WealthUtil.parseCostStr("3:0:" + model.getVipGiftPrice(),true);
         this.oriRes.dataSource = WealthUtil.parseCostStr("3:0:" + StcMgr.ins.getGlobalPriceVo(int(model.getVipGiftPrice(vip_level))).price * 10,false);
         this.parts.push(new BtnLongBarCtrl(this.btn_leftArrow,img_leftBg));
         this.parts.push(new BtnLongBarCtrl(this.btn_rightArrow,img_rightBg));
         this.commitMeasure();
         if(vip_level == 0)
         {
            this.btn_leftArrow.disabled = true;
         }
         else if(vip_level == 15)
         {
            this.btn_rightArrow.disabled = true;
         }
         this.btn_leftArrow.addEventListener("click",onIndexMinus);
         this.btn_rightArrow.addEventListener("click",onIndexAdd);
         this.btn_buy.clickHandler = buyHandler;
         effLayer = new Sprite();
         effLayer.mouseChildren = false;
         effLayer.mouseEnabled = false;
         addChild(effLayer);
         updateList();
      }
      
      private function addEff() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         while(effLayer.numChildren > 0)
         {
            effLayer.removeChildAt(0);
         }
         _loc2_ = 0;
         while(_loc2_ < this.list_gift.array.length)
         {
            if((this.list_gift.array[_loc2_] as WealthVo).quality >= 4)
            {
               _loc1_ = new BmcSpriteSheet();
               _loc1_.x = list_gift.x + this.list_gift.cells[_loc2_].x;
               _loc1_.y = list_gift.y + this.list_gift.cells[_loc2_].y;
               _loc1_.x = _loc1_.x + -15;
               _loc1_.y = _loc1_.y + -8;
               _loc1_.scaleAll = 0.75;
               _loc1_.init(800000,1,"all",true);
               effLayer.addChild(_loc1_);
               _loc1_.mouseChildren = false;
               _loc1_.mouseEnabled = false;
            }
            _loc2_++;
         }
      }
      
      private function onMouseOver(param1:MouseEvent) : void
      {
         var _loc2_:VipVo = new VipVo();
         _loc2_.vip_level = this.txt_vip.value;
         ObserverMgr.ins.sendNotice("msg_tooltip_show",_loc2_);
      }
      
      private function onMouseOut(param1:MouseEvent) : void
      {
         ObserverMgr.ins.sendNotice("msg_tooltip_hide");
      }
      
      private function buyHandler() : void
      {
         this.btn_buy.disabled = true;
         VipService.ins.buyGift(vip_level,buyCplHandler,buyErrHandler);
      }
      
      private function buyCplHandler() : void
      {
         model.buyStatusArr[vip_level] = true;
         updateBuyBtn();
         ObserverMgr.ins.sendNotice("refreshHeaderRedPoint");
         FloatUtil.showGetItemsDisplayPanel(this.list_gift.dataSource as Array);
         NGUtil.checkModuleShow(10800);
      }
      
      private function buyErrHandler(param1:ProtocolStatusRes) : void
      {
         this.btn_buy.disabled = false;
         ServerEngine.ins.doDefaultErr(param1);
      }
      
      protected function onIndexAdd(param1:MouseEvent) : void
      {
         vip_level = Number(vip_level) + 1;
         if(vip_level == 15)
         {
            this.btn_rightArrow.disabled = true;
         }
         else
         {
            this.btn_leftArrow.disabled = false;
         }
         this.txt_vip.value = vip_level;
         updateList();
         NGUtil.checkModuleShow(10800);
      }
      
      public function updateBuyBtn() : void
      {
         if(model.buyStatusArr[vip_level])
         {
            this.btn_buy.label = LocaleMgr.ins.getStr(41500039);
            this.img_saleLine.visible = false;
            this.oriRes.visible = false;
            this.btn_buy.disabled = true;
            this.priceRender.visible = false;
         }
         else
         {
            this.btn_buy.label = "";
            this.priceRender.visible = true;
            this.img_saleLine.visible = true;
            this.oriRes.visible = true;
            if(vip_level > PlayerModel.ins.vip)
            {
               this.btn_buy.disabled = true;
               ObjectUtils.gray(this.priceRender);
            }
            else
            {
               this.btn_buy.disabled = false;
               ObjectUtils.gray(this.priceRender,false);
            }
         }
      }
      
      private function updateList() : void
      {
         this.txt_ad.text = LocaleMgr.ins.getStr(vip_level == 0?30100361:Number(30100317 + vip_level - 1));
         eff.scaleX = 1.2;
         eff.x = 390 + (1 - eff.scaleX) * 204;
         updateBuyBtn();
         this.list_gift.repeatX = model.getVipGiftItemArr(vip_level).length;
         this.list_gift.dataSource = model.getVipGiftItemArr(vip_level);
         this.list_gift.selectedIndex = 0;
         this.list_gift.x = 474 - list_gift.width;
         this.priceRender.dataSource = WealthUtil.parseCostStr("3:0:" + model.getVipGiftPrice(vip_level),true);
         this.oriRes.dataSource = WealthUtil.parseCostStr("3:0:" + StcMgr.ins.getGlobalPriceVo(int(model.getVipGiftPrice(vip_level))).price * 10,false);
         changeHandler();
         addEff();
         if((this.list_gift.array[0] as WealthVo).stcItemVo && (this.list_gift.array[0] as WealthVo).stcItemVo.kind == 97)
         {
            this.txt_hint.visible = true;
            this.txt_hint.x = 160;
            if((this.list_gift.array[1] as WealthVo).stcItemVo.kind == 97)
            {
               this.txt_hint.x = 128;
            }
         }
         else
         {
            this.txt_hint.visible = false;
         }
      }
      
      protected function onIndexMinus(param1:MouseEvent) : void
      {
         vip_level = Number(vip_level) - 1;
         if(vip_level == 0)
         {
            this.btn_leftArrow.disabled = true;
         }
         else
         {
            this.btn_rightArrow.disabled = false;
         }
         this.txt_vip.value = vip_level;
         updateList();
         NGUtil.checkModuleShow(10800);
      }
      
      private function changeHandler() : void
      {
         if(this.list_gift.selectedItem as WealthVo)
         {
            ObserverMgr.ins.sendNotice("vip_update_3d_model");
         }
      }
   }
}
