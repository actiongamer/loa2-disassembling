package nslm2.modules.foundations.shop
{
   import game.ui.shopModules.MysteryShopModuleUI;
   import nslm2.modules.footstones.newerGuideModules.INewerGuideGetComp;
   import nslm2.modules.footstones.newerGuideModules.INewerGuideCheckHandler;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import nslm2.modules.foundations.shop.model.ShopModel;
   import nslm2.modules.foundations.shop.service.ShopService;
   import nslm2.modules.foundations.shop.comp.MysteryShopRender;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import com.mz.core.configs.ClientConfig;
   import morn.core.components.Button;
   import nslm2.modules.foundations.vip.view.VipHintBox;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import com.mz.core.event.MzEvent;
   import com.greensock.TweenMax;
   import morn.core.managers.timerMgrs.TimerManager;
   import com.greensock.TweenLite;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.modules.foundations.vip.model.VipModel;
   import flash.text.TextFormat;
   import nslm2.utils.LabelUtils;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.common.vo.WealthVo;
   import nslm2.utils.TimeUtils;
   import morn.core.components.Component;
   import nslm2.mgrs.stcMgrs.vos.StcGuideVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcShopVo;
   import nslm2.common.model.PlayerModel;
   
   public class MysteryShopModule extends MysteryShopModuleUI implements INewerGuideGetComp, INewerGuideCheckHandler
   {
       
      
      private var _textCdCtrl:TextCDCtrlS2;
      
      private var _firstShow:Boolean;
      
      private var _shopType:int;
      
      private var _initXArr:Array;
      
      private var _initYArr:Array;
      
      public function MysteryShopModule()
      {
         var _loc1_:int = 0;
         _initXArr = [];
         _initYArr = [];
         super();
         switchEventListeners(true);
         this.tab_shop.selectHandler = onTabChanged;
         while(_loc1_ < list_items.cells.length)
         {
            (list_items.getCell(_loc1_) as MysteryShopRender).setFirstCeilSpecialMode(_loc1_);
            _initXArr.push(list_items.getCell(_loc1_).x);
            _initYArr.push(list_items.getCell(_loc1_).y);
            _loc1_++;
         }
      }
      
      private function get model() : ShopModel
      {
         return ShopModel.ins;
      }
      
      private function get service() : ShopService
      {
         return ShopService.ins;
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["EVT_MYSTERY_SHOP_LOCK_ITEM"]);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("EVT_MYSTERY_SHOP_LOCK_ITEM" === _loc3_)
         {
            if(param2)
            {
               specialLockCeil.doLock(true);
            }
         }
      }
      
      public function get specialLockCeil() : MysteryShopRender
      {
         return list_items.getCell(1) as MysteryShopRender;
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            model.addEventListener("evtShopGetListOver",onInitList);
            model.addEventListener("evtShopRefresh",onRefresh);
         }
         else
         {
            model.removeEventListener("evtShopGetListOver",onInitList);
            model.removeEventListener("evtShopRefresh",onRefresh);
         }
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         if(param1)
         {
            _shopType = (param1 as int) + 100000;
         }
         else
         {
            _shopType = 60310 + 100000;
         }
         requestData();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc2_:* = null;
         this.titleTxt.text = LocaleMgr.ins.getStr(9100000 + moduleId);
         this.panelBg.img_rimBg.url = UrlLib.shopUI("img_mysteryPanelBg");
         if(ClientConfig.isRuLang())
         {
            this.tab_shop.style = "TAB超长";
         }
         this.tab_shop.labels = ShopModel.ins.getShopLabel(_shopType);
         if(ClientConfig.isRuLang())
         {
            _loc2_ = this.tab_shop.items[0] as Button;
            _loc2_.bg.width = 120;
            _loc2_.btnLabel.width = 120;
         }
         specialLockCeil.doLock(ShopModel.ins.lockItem && ShopModel.ins.lockItem.value);
         this.refresh();
         this.addChild(new VipHintBox(10040,App.languageAry.indexOf(App.language) != -1 && App.languageAry.indexOf(App.language) != 1?322:Number(402),418));
         this.preShowCpl();
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
         NGUtil.checkModuleShow(this.moduleId,this);
      }
      
      private function requestData() : void
      {
         service.requestList(_shopType);
      }
      
      private function initCell(param1:int) : void
      {
         list_items.getCell(param1).x = _initXArr[param1];
         list_items.getCell(param1).y = _initYArr[param1];
      }
      
      private function onInitList(param1:MzEvent) : void
      {
         this.refresh();
         if(_firstShow == false)
         {
            this.moduleServerCpl();
         }
         _firstShow = true;
      }
      
      private function onRefresh(param1:MzEvent) : void
      {
         var _loc3_:int = 0;
         while(_loc3_ < list_items.cells.length)
         {
            TweenMax.killTweensOf(list_items.getCell(_loc3_));
            initCell(_loc3_);
            TweenMax.to(list_items.getCell(_loc3_),0.3,{
               "x":186,
               "y":109,
               "yoyo":true,
               "repeat":1
            });
            _loc3_++;
         }
         TimerManager.ins.doOnce(0.5,this.refresh);
         var _loc2_:Boolean = param1.data as Boolean;
         if(_loc2_)
         {
            TweenLite.to(this.txt_freeRefresh,0.2,{"scale":1.4});
            TweenLite.to(this.txt_freeRefresh,0.2,{
               "scale":1,
               "delay":0.2
            });
         }
         else
         {
            TweenLite.to(this.txt_refresh,0.2,{"scale":1.4});
            TweenLite.to(this.txt_refresh,0.2,{
               "scale":1,
               "delay":0.2
            });
         }
      }
      
      private function onTabChanged(param1:int) : void
      {
         refresh();
         this.fadeIn(0,11010);
      }
      
      private function refresh() : void
      {
         if(NGUtil.isCurFuncId(this.moduleId))
         {
            this.list_items.dataSource = model.getItemListByPage(99901,1);
         }
         else
         {
            this.list_items.dataSource = model.getMysteryItemListByPage(_shopType,this.tab_shop.selectedIndex + 1);
         }
         var _loc3_:int = model.getLeftRefreshTimes(_shopType);
         this.txt_refresh.text = TextFieldUtil.htmlText(_loc3_ + "/" + VipModel.ins.getVipValue(10040),new TextFormat(null,null,LabelUtils.getLeaveMaxColor(_loc3_,int(VipModel.ins.getVipValue(10040)))));
         var _loc2_:int = model.getLeftFreeRefreshTimes(_shopType);
         this.txt_freeRefresh.text = TextFieldUtil.htmlText(_loc2_ + "/" + DefindConsts.MSHOP_HERO_TIMES,new TextFormat(null,null,LabelUtils.getLeaveMaxColor(_loc2_,DefindConsts.MSHOP_HERO_TIMES)));
         var _loc1_:WealthVo = model.getInitMysteryRefreshItemVo(_shopType);
         _loc1_.useStcCount = true;
         this.refreshRender.dataSource = _loc1_;
         this.resRender.dataSource = model.getCost(_shopType)[0];
         this.render_refresh.dataSource = _shopType;
         refreshTimer();
      }
      
      private function refreshTimer() : void
      {
         if(ShopModel.ins.getLeftFreeRefreshTimes(_shopType) >= DefindConsts.MSHOP_HERO_TIMES)
         {
            this.txt_countDown.text = TextFieldUtil.htmlText2(LocaleMgr.ins.getStr(999000371),458496);
            if(this._textCdCtrl)
            {
               this._textCdCtrl.dispose();
               this._textCdCtrl = null;
            }
         }
         else if(this._textCdCtrl == null)
         {
            var _loc1_:* = new TextCDCtrlS2(this.txt_countDown,textCDFormat,txtCDCtrl_cpl);
            this._textCdCtrl = _loc1_;
            this.parts.push(_loc1_);
            this._textCdCtrl.start(ShopModel.ins.getNextTimeToAddFreeTimes(_shopType));
         }
      }
      
      private function textCDFormat(param1:int) : String
      {
         return LocaleMgr.ins.getStr(60300005,[TextFieldUtil.htmlText2(TimeUtils.hisColonFullAddZero(param1),458496)]);
      }
      
      private function txtCDCtrl_cpl() : void
      {
         ShopModel.ins.addFreeRefreshTimes(_shopType);
         if(this._textCdCtrl)
         {
            this._textCdCtrl.dispose();
            this._textCdCtrl = null;
         }
         refreshTimer();
      }
      
      public function getCompById(param1:String, param2:StcGuideVo) : Component
      {
         var _loc3_:* = param1;
         if("btn_buy:0" !== _loc3_)
         {
            return NGUtil.getCompById(this,param1,param2);
         }
         return (this.list_items.getCell(0) as MysteryShopRender).btn_buy;
      }
      
      public function ngCheck(param1:int, param2:Array, param3:StcGuideVo) : int
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(!(int(param1) - 10220))
         {
            _loc4_ = StcMgr.ins.getShopVo(8001);
            if(_loc4_)
            {
               _loc5_ = WealthVo.parseCostStr(_loc4_.curr_res);
               if(_loc5_ && PlayerModel.ins.getCountByWealthVo(_loc5_) < _loc5_.count)
               {
                  return 0;
               }
            }
         }
         return 1;
      }
      
      override public function dispose() : void
      {
         if(NGUtil.isCurFuncId(60310))
         {
            NGUtil.skipAll();
         }
         super.dispose();
      }
   }
}
