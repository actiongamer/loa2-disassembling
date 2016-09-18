package nslm2.modules.foundations.shop
{
   import game.ui.shopModules.ShopModuleUI;
   import nslm2.common.ui.components.comps2d.others.RedPoint;
   import nslm2.modules.foundations.shop.model.ShopModel;
   import nslm2.modules.foundations.shop.service.ShopService;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   import nslm2.modules.foundations.shop.vo.ShopOpenVo;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import morn.core.components.Component;
   import com.mz.core.utils.DisplayUtils;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.common.ui.components.comps2d.pageBar.PageBarS2;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   
   public class ShopModule extends ShopModuleUI
   {
       
      
      private var _shopType:int;
      
      private var _firstShow:Boolean;
      
      private var _redPointArr:Vector.<RedPoint>;
      
      private var _firstShowShopId:int;
      
      public function ShopModule()
      {
         _redPointArr = new Vector.<RedPoint>();
         super();
         switchEventListeners(true);
         this.tab_shop.selectHandler = onTabChanged;
      }
      
      private function get model() : ShopModel
      {
         return ShopModel.ins;
      }
      
      private function get service() : ShopService
      {
         return ShopService.ins;
      }
      
      private function get pageBar() : IPageBar
      {
         return this.pageBarRef as IPageBar;
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         var _loc2_:* = null;
         if(param1)
         {
            _loc2_ = param1 as ShopOpenVo;
            _shopType = _loc2_.funId;
            _firstShowShopId = _loc2_.itemId;
         }
         else
         {
            _shopType = 11306;
         }
         this.requestData();
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            model.addEventListener("evtShopGetListOver",onInitList);
            model.addEventListener("evtShopBuyCpl",onBuyCpl);
         }
         else
         {
            model.removeEventListener("evtShopGetListOver",onInitList);
            model.removeEventListener("evtShopBuyCpl",onBuyCpl);
         }
      }
      
      private function requestData() : void
      {
         ShopService.ins.requestList(_shopType);
      }
      
      private function onInitList(param1:MzEvent) : void
      {
         this.moduleServerCpl();
      }
      
      private function onBuyCpl(param1:MzEvent) : void
      {
         this.txt_limit.text = ShopModel.ins.getLimitCanCost(_shopType);
         checkRedPoint();
         ShopModel.ins.checkRedPoint(_shopType);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc2_:int = 0;
         this.tab_shop.labels = ShopModel.ins.getShopLabel(_shopType);
         initRedPoint();
         checkRedPoint();
         this.pageBar.bindList(this.list_items);
         this.txt_limit.text = ShopModel.ins.getLimitCanCost(_shopType);
         if(_firstShowShopId != 0)
         {
            _loc2_ = ShopModel.ins.getTabIndexByShopId(_firstShowShopId);
            if(_loc2_ != -1)
            {
               this.tab_shop.selectedIndex = _loc2_;
            }
            else
            {
               _firstShowShopId = 0;
               this.refresh();
            }
         }
         else
         {
            this.refresh();
         }
         this.img_avatar.url = UrlLib.shopUI("img_avatar");
         this.panelBg.img_rimBg.url = UrlLib.shopUI("img_shopPanelBg");
         this.panelBg.titleImgId = 60300;
         this.preShowCpl();
      }
      
      private function initRedPoint() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = this.tab_shop.labels.split(",").length;
         _loc1_ = 0;
         while(_loc1_ < _loc3_)
         {
            _loc2_ = new RedPoint();
            _loc2_.top = -2;
            _loc2_.right = -2;
            _redPointArr.push(_loc2_);
            _loc1_++;
         }
      }
      
      private function checkRedPoint() : void
      {
         var _loc1_:Array = ShopModel.ins.getRewardTabIndexArr(_shopType);
         var _loc4_:int = 0;
         var _loc3_:* = _loc1_;
         for each(var _loc2_ in _loc1_)
         {
            if(ShopModel.ins.hasRewardCanBuy(_shopType,_loc2_ + 1) == true)
            {
               (this.tab_shop.items[_loc2_] as Component).addChild(_redPointArr[_loc2_]);
            }
            else
            {
               DisplayUtils.removeSelf(_redPointArr[_loc2_]);
            }
         }
      }
      
      private function onTabChanged(param1:int) : void
      {
         refresh();
         this.list_items.page = 0;
         pageBar.pageTo(0,false);
         this.fadeIn(0,11010);
      }
      
      private function refresh() : void
      {
         var _loc2_:int = 0;
         var _loc1_:Array = ShopModel.ins.getItemListByPage(_shopType,this.tab_shop.selectedIndex + 1);
         this.list_items.dataSource = _loc1_;
         if(_firstShowShopId)
         {
            _loc2_ = Math.floor(ArrayUtil.indexByAttr(_loc1_,"id",_firstShowShopId) / (list_items.repeatX * list_items.repeatY));
            (this.pageBarRef as PageBarS2).pageTo(_loc2_,false);
            _firstShowShopId = 0;
         }
         var _loc3_:Array = model.getCost(_shopType);
         this.list_res.repeatX = _loc3_.length;
         this.list_res.dataSource = model.getCost(_shopType);
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
         NGUtil.checkModuleShow(60300);
      }
      
      override public function dispose() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = _redPointArr;
         for each(var _loc1_ in _redPointArr)
         {
            _loc1_.dispose();
         }
         super.dispose();
      }
   }
}
