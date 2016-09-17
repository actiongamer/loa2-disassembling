package nslm2.modules.funnies.newYears.charmStar.view
{
   import flash.display.Sprite;
   import com.mz.core.interFace.IObserver;
   import game.ui.newYears.charmStar.view.CharmShopViewUI;
   import nslm2.modules.funnies.newYears.charmStar.model.CharmStarModel;
   import nslm2.modules.funnies.newYears.charmStar.control.CharmStarControl;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   import nslm2.utils.WealthUtil;
   import flash.events.Event;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.shop.model.ShopModel;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.modules.funnies.newYears.charmStar.model.CharmStarShopVo;
   import proto.CharmRankShopInfoRes.Shop;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.TimeUtils;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.utils.RTools;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.utils.LabelUtils;
   import proto.StaticCharmRankShopModel;
   
   public class CharmShopView extends Sprite implements IObserver
   {
       
      
      public var childIndex:int;
      
      private var _display:CharmShopViewUI;
      
      private var _model:CharmStarModel;
      
      private var _control:CharmStarControl;
      
      private var _cdCtrl:TextCDCtrlS2;
      
      public function CharmShopView(param1:CharmShopViewUI, param2:CharmStarModel, param3:CharmStarControl)
      {
         super();
         _display = param1;
         if(_display && _display.parent)
         {
            this.x = _display.x;
            this.y = _display.y;
            _display.x = 0;
            _display.y = 0;
            childIndex = param1.parent.getChildIndex(_display);
            this.addChild(_display);
         }
         _model = param2;
         _control = param3;
         init();
         this.addEventListener("addedToStage",addToStage);
      }
      
      public function get pageBar() : IPageBar
      {
         return _display.pageBarUI as IPageBar;
      }
      
      private function init() : void
      {
         pageBar.bindList(_display.list_sales);
         _display.renderPoint.dataSource = WealthUtil.createItemVo(200012);
         _display.list_sales.itemRender = CharmShopRender;
      }
      
      protected function addToStage(param1:Event) : void
      {
         this.removeEventListener("addedToStage",addToStage);
         addListeners();
         show();
         this.addEventListener("removedFromStage",removeFromStage);
      }
      
      protected function removeFromStage(param1:Event) : void
      {
         this.removeEventListener("removedFromStage",removeFromStage);
         removeListeners();
         hide();
         this.addEventListener("addedToStage",addToStage);
      }
      
      private function addListeners() : void
      {
         ObserverMgr.ins.regObserver(this);
         ShopModel.ins.addEventListener("evtShopRefresh",shopRefresh);
      }
      
      private function removeListeners() : void
      {
         ObserverMgr.ins.unregObserver(this);
         ShopModel.ins.removeEventListener("evtShopRefresh",shopRefresh);
      }
      
      public function getFocusNotices() : Array
      {
         return ["refresh_point","CHARM_STAR_BUY_CONFIRM_REFRESH"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc4_:* = null;
         var _loc6_:* = param1;
         if("refresh_point" !== _loc6_)
         {
            if("CHARM_STAR_BUY_CONFIRM_REFRESH" === _loc6_)
            {
               _loc4_ = param2 as CharmStarShopVo;
               _loc6_ = 0;
               var _loc5_:* = _model.shopInfoArr;
               for each(var _loc3_ in _model.shopInfoArr)
               {
                  if(_loc3_.id == _loc4_.shopid)
                  {
                     _loc3_.num = _loc4_.curBuyTimes;
                     return;
                  }
               }
               _loc3_ = new Shop();
               _loc3_.id = _loc4_.shopid;
               _loc3_.num = _loc4_.curBuyTimes;
               _model.shopInfoArr.push(_loc3_);
            }
         }
         else
         {
            _display.cb_score.value = BagModel.ins.getStcCount(200012);
         }
      }
      
      protected function shopRefresh(param1:MzEvent) : void
      {
         refreshShopList();
      }
      
      private function show() : void
      {
         _display.clearTimeTxt.text = LocaleMgr.ins.getStr(999003120,[TimeUtils.getFullTimeStrCN(NpcFuncService.ins.getOpenTimeVo(13401).endTime,true,true,RTools.cl(false,true))]);
         refreshShopList();
      }
      
      private function hide() : void
      {
      }
      
      private function textCDFormat(param1:int) : String
      {
         return LocaleMgr.ins.getStr(13323003) + TextFieldUtil.htmlText2(TimeUtils.hisCNWithDay(param1),LabelUtils.cdColor(true));
      }
      
      private function textCDCpl() : void
      {
         _display.txt_cd.text = LocaleMgr.ins.getStr(10000024);
      }
      
      public function refreshShopList() : void
      {
         var _loc5_:* = null;
         if(_cdCtrl)
         {
            _cdCtrl.dispose();
            _cdCtrl = null;
         }
         _cdCtrl = new TextCDCtrlS2(_display.txt_cd,textCDFormat,textCDCpl);
         _cdCtrl.start(NpcFuncService.ins.getOpenTimeVo(13401).endTime);
         _display.cb_score.value = BagModel.ins.getStcCount(200012);
         var _loc2_:Array = [];
         var _loc4_:Array = _model.shopPropArr;
         var _loc9_:int = 0;
         var _loc8_:* = _loc4_;
         for each(var _loc3_ in _loc4_)
         {
            _loc5_ = new CharmStarShopVo();
            _loc5_.id = _loc3_.id;
            _loc5_.shopid = _loc3_.id;
            _loc5_.sellRes = _loc3_.sellRes;
            _loc5_.currRes = _loc3_.currRes;
            _loc5_.limit_num = _loc3_.limit;
            var _loc7_:int = 0;
            var _loc6_:* = _model.shopInfoArr;
            for each(var _loc1_ in _model.shopInfoArr)
            {
               if(_loc1_.id == _loc5_.shopid)
               {
                  _loc5_.curBuyTimes = _loc1_.num;
               }
            }
            _loc2_.push(_loc5_);
         }
         _loc2_.sortOn("id",16);
         _display.list_sales.dataSource = _loc2_;
         _display.renderPoint.img_quality.visible = false;
         _display.renderPoint.visible = true;
      }
      
      public function dispose() : void
      {
         if(this.hasEventListener("addedToStage"))
         {
            this.removeEventListener("addedToStage",addToStage);
         }
         _display = null;
         _model = null;
         _control = null;
      }
   }
}
