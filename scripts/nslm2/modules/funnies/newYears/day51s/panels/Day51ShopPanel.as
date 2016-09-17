package nslm2.modules.funnies.newYears.day51s.panels
{
   import game.ui.newYears.day51s.panels.Day51ShopPanelUI;
   import com.mz.core.interFace.IViewStackPage;
   import nslm2.modules.funnies.funnyCommons.IFuncIdView;
   import nslm2.modules.funnies.funnyCommons.IInitView;
   import nslm2.modules.funnies.busyActivity.towers.services.TowerService;
   import nslm2.modules.funnies.busyActivity.dragonBoats.services.DragonBoatService;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   import nslm2.common.model.OpActivityStaticDataModel;
   import proto.StaticOpActivityTmModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.TimeUtils;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.common.vo.WealthVo;
   import morn.core.components.Box;
   import nslm2.modules.funnies.funnyCommons.FunnyServiceShopPart;
   import nslm2.modules.funnies.newYears.day51s.services.Day51Service;
   import flash.events.Event;
   import proto.StaticLuckTreeShopModel;
   
   public class Day51ShopPanel extends Day51ShopPanelUI implements IViewStackPage, IFuncIdView, IInitView
   {
       
      
      private var _funcId:int;
      
      public function Day51ShopPanel()
      {
         super();
      }
      
      public function get funcId() : int
      {
         return _funcId;
      }
      
      public function set funcId(param1:int) : void
      {
         _funcId = param1;
      }
      
      public function get getOpenTimeId() : int
      {
         switch(int(funcId) - 13376)
         {
            case 0:
               return DragonBoatService.ins.timeKind_all;
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
               return 16;
            case 10:
               return TowerService.ins.timeKind_all;
         }
      }
      
      public function get tip1_langId() : int
      {
         switch(int(funcId) - 13376)
         {
            case 0:
               return 13376009;
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
               return 133550008;
            case 10:
               return 13386022;
         }
      }
      
      public function get pageBar() : IPageBar
      {
         return pageBarUI as IPageBar;
      }
      
      public function init() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         _loc3_ = null;
         var _loc1_:StaticOpActivityTmModel = OpActivityStaticDataModel.ins.getActivityOpenTime(getOpenTimeId);
         if(_loc1_)
         {
            this.txt_cd.text = LocaleMgr.ins.getStr(50600046) + TimeUtils.ymdhisCN(_loc1_.startTm) + " - " + TimeUtils.ymdhisCN(_loc1_.endTm);
         }
         switch(int(funcId) - 13376)
         {
            case 0:
               this.img_avatar.skin = "png.uiDragonBoat.img_avatar";
               _loc2_ = WealthUtil.parseCostStr(DefindConsts.DRAGON_GOLD_SHOP_ITEM);
               this.render_coin.visible = true;
               _loc3_ = WealthUtil.parseCostStr(DefindConsts.DRAGON_SILVER_SHOP_ITEM);
               _loc3_.useStcCount = true;
               this.render_coin2.dataSource = _loc3_;
               break;
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
               this.img_avatar.skin = "png.uiDay51.img_avatar";
               _loc2_ = WealthUtil.createWealthVo(36);
               this.render_coin2.visible = false;
               break;
            case 10:
               this.img_avatar.skin = "png.uiTower.img_avatar";
               this.img_avatar.y = this.img_avatar.y + 52;
               _loc2_ = WealthUtil.parseCostStr(DefindConsts.TOWER_SILVER_SHOP_ITEM);
               this.render_coin.visible = true;
               _loc3_ = WealthUtil.parseCostStr(DefindConsts.TOWER_GOLD_SHOP_ITEM);
               _loc3_.useStcCount = true;
               this.render_coin2.dataSource = _loc3_;
         }
         _loc2_.useStcCount = true;
         this.render_coin.dataSource = _loc2_;
         this.txt_tip1.text = LocaleMgr.ins.getStr(tip1_langId);
         switch(int(funcId) - 13376)
         {
            case 0:
               this.tab.visible = true;
               this.tab.labels = [LocaleMgr.ins.getStr(13376024),LocaleMgr.ins.getStr(13376025)].join(",");
               this.tab.userChangeHandler = tab_userChangeHandler;
               break;
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
               this.tab.visible = false;
               break;
            case 10:
               this.tab.visible = true;
               this.tab.labels = [LocaleMgr.ins.getStr(13386019),LocaleMgr.ins.getStr(13386020)].join(",");
               this.tab.userChangeHandler = tab_userChangeHandler;
               this.txt_tip1.text = "";
         }
         this.pageBar.bindList(list_shop);
         this.list_shop.createCellHandler = list_createCellHandler;
      }
      
      private function tab_userChangeHandler(param1:int) : void
      {
         refreshUI();
      }
      
      private function list_createCellHandler(param1:Box) : void
      {
         (param1 as IFuncIdView).funcId = this.funcId;
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
      
      public function viewStackIn() : void
      {
         this.visible = true;
         this.shop.addEventListener("EVT_SHOP_BUY_CPL",onShopBuyCpl);
         this.refreshUI();
      }
      
      public function viewStackOut() : void
      {
         this.shop.removeEventListener("EVT_SHOP_BUY_CPL",onShopBuyCpl);
         this.visible = false;
      }
      
      private function onShopBuyCpl(param1:Event) : void
      {
         this.refreshUI();
      }
      
      private function refreshUI() : void
      {
         var _loc2_:* = null;
         var _loc1_:* = null;
         var _loc3_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:* = null;
         _loc1_ = null;
         _loc3_ = 0;
         _loc5_ = 0;
         _loc4_ = null;
         _loc2_ = this.shop.shopDict.array;
         switch(int(funcId) - 13376)
         {
            case 0:
               _loc1_ = [];
               _loc3_ = _loc2_.length;
               _loc5_ = 0;
               while(_loc5_ < _loc3_)
               {
                  _loc4_ = _loc2_[_loc5_];
                  if(_loc4_.kind == this.tab.selectedIndex + 1)
                  {
                     _loc1_.push(_loc4_);
                  }
                  _loc5_++;
               }
               _loc2_ = _loc1_;
               break;
            default:
               _loc1_ = [];
               _loc3_ = _loc2_.length;
               _loc5_ = 0;
               while(_loc5_ < _loc3_)
               {
                  _loc4_ = _loc2_[_loc5_];
                  if(_loc4_.kind == this.tab.selectedIndex + 1)
                  {
                     _loc1_.push(_loc4_);
                  }
                  _loc5_++;
               }
               _loc2_ = _loc1_;
               break;
            default:
               _loc1_ = [];
               _loc3_ = _loc2_.length;
               _loc5_ = 0;
               while(_loc5_ < _loc3_)
               {
                  _loc4_ = _loc2_[_loc5_];
                  if(_loc4_.kind == this.tab.selectedIndex + 1)
                  {
                     _loc1_.push(_loc4_);
                  }
                  _loc5_++;
               }
               _loc2_ = _loc1_;
               break;
            default:
               _loc1_ = [];
               _loc3_ = _loc2_.length;
               _loc5_ = 0;
               while(_loc5_ < _loc3_)
               {
                  _loc4_ = _loc2_[_loc5_];
                  if(_loc4_.kind == this.tab.selectedIndex + 1)
                  {
                     _loc1_.push(_loc4_);
                  }
                  _loc5_++;
               }
               _loc2_ = _loc1_;
               break;
            default:
               _loc1_ = [];
               _loc3_ = _loc2_.length;
               _loc5_ = 0;
               while(_loc5_ < _loc3_)
               {
                  _loc4_ = _loc2_[_loc5_];
                  if(_loc4_.kind == this.tab.selectedIndex + 1)
                  {
                     _loc1_.push(_loc4_);
                  }
                  _loc5_++;
               }
               _loc2_ = _loc1_;
               break;
            default:
               _loc1_ = [];
               _loc3_ = _loc2_.length;
               _loc5_ = 0;
               while(_loc5_ < _loc3_)
               {
                  _loc4_ = _loc2_[_loc5_];
                  if(_loc4_.kind == this.tab.selectedIndex + 1)
                  {
                     _loc1_.push(_loc4_);
                  }
                  _loc5_++;
               }
               _loc2_ = _loc1_;
               break;
            default:
               _loc1_ = [];
               _loc3_ = _loc2_.length;
               _loc5_ = 0;
               while(_loc5_ < _loc3_)
               {
                  _loc4_ = _loc2_[_loc5_];
                  if(_loc4_.kind == this.tab.selectedIndex + 1)
                  {
                     _loc1_.push(_loc4_);
                  }
                  _loc5_++;
               }
               _loc2_ = _loc1_;
               break;
            default:
               _loc1_ = [];
               _loc3_ = _loc2_.length;
               _loc5_ = 0;
               while(_loc5_ < _loc3_)
               {
                  _loc4_ = _loc2_[_loc5_];
                  if(_loc4_.kind == this.tab.selectedIndex + 1)
                  {
                     _loc1_.push(_loc4_);
                  }
                  _loc5_++;
               }
               _loc2_ = _loc1_;
               break;
            default:
               _loc1_ = [];
               _loc3_ = _loc2_.length;
               _loc5_ = 0;
               while(_loc5_ < _loc3_)
               {
                  _loc4_ = _loc2_[_loc5_];
                  if(_loc4_.kind == this.tab.selectedIndex + 1)
                  {
                     _loc1_.push(_loc4_);
                  }
                  _loc5_++;
               }
               _loc2_ = _loc1_;
               break;
            default:
               _loc1_ = [];
               _loc3_ = _loc2_.length;
               _loc5_ = 0;
               while(_loc5_ < _loc3_)
               {
                  _loc4_ = _loc2_[_loc5_];
                  if(_loc4_.kind == this.tab.selectedIndex + 1)
                  {
                     _loc1_.push(_loc4_);
                  }
                  _loc5_++;
               }
               _loc2_ = _loc1_;
               break;
            case 10:
               _loc1_ = [];
               _loc3_ = _loc2_.length;
               _loc5_ = 0;
               while(_loc5_ < _loc3_)
               {
                  _loc4_ = _loc2_[_loc5_];
                  if(_loc4_.kind == this.tab.selectedIndex)
                  {
                     _loc1_.push(_loc4_);
                  }
                  _loc5_++;
               }
               _loc2_ = _loc1_;
         }
         _loc2_.sortOn(StaticLuckTreeShopModel.ID.name,16);
         this.list_shop.dataSource = _loc2_;
      }
      
      override public function dispose() : void
      {
         this.shop.removeEventListener("EVT_SHOP_BUY_CPL",onShopBuyCpl);
         super.dispose();
      }
   }
}
