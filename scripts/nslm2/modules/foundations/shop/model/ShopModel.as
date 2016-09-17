package nslm2.modules.foundations.shop.model
{
   import flash.events.EventDispatcher;
   import com.mz.core.utils.DictHash;
   import proto.BoolMap;
   import nslm2.mgrs.stcMgrs.vos.StcShopVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import proto.ShopListRes;
   import com.mz.core.utils.ArrayUtil;
   import proto.ShopBuyInfo;
   import com.mz.core.event.MzEvent;
   import proto.StaticBuyDoubleShopModel;
   import proto.ShopBuyRes;
   import proto.ShopRefreshRes;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.utils.ServerTimer;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.vip.model.VipModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.vos.StcShopFunctionVo;
   import nslm2.common.vo.WealthVo;
   import morn.core.utils.StringUtils;
   import nslm2.utils.WealthUtil;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.foundations.shop.service.ShopService;
   import nslm2.modules.foundations.shop.consts.ShopConsts;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleRedPointMsg;
   import nslm2.utils.RestrictiveConditionUtils;
   import nslm2.common.model.HeroModel;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   
   public class ShopModel extends EventDispatcher
   {
      
      private static var _ins:nslm2.modules.foundations.shop.model.ShopModel;
       
      
      private var _shopBuyInfo:DictHash;
      
      private var _shopInfo:DictHash;
      
      private var _mysteryShopVec:Vector.<uint>;
      
      private var _mysteryBuyedItems:Vector.<uint>;
      
      private var _shopLimitTypeLocaleIdDic:DictHash;
      
      private var _shopItemDic:DictHash;
      
      public var lockItem:BoolMap;
      
      public var lockBuyedItems:Vector.<uint>;
      
      public var freshLockItem:Boolean;
      
      private var _notOpenTabArr:Array;
      
      public function ShopModel()
      {
         _mysteryShopVec = new Vector.<uint>();
         _mysteryBuyedItems = new Vector.<uint>();
         lockBuyedItems = new Vector.<uint>();
         _notOpenTabArr = [];
         super();
         _shopItemDic = new DictHash();
         _shopBuyInfo = new DictHash();
         _shopInfo = new DictHash();
         _shopLimitTypeLocaleIdDic = new DictHash();
         setLimitType();
      }
      
      public static function get ins() : nslm2.modules.foundations.shop.model.ShopModel
      {
         if(!_ins)
         {
            _ins = new nslm2.modules.foundations.shop.model.ShopModel();
         }
         return _ins;
      }
      
      public function getItemListByType(param1:int) : Array
      {
         var _loc2_:Array = _shopItemDic.getValue(param1);
         if(!_loc2_)
         {
            _loc2_ = initItemListByType(param1);
         }
         return _loc2_;
      }
      
      public function getStcShopVo(param1:int, param2:int) : StcShopVo
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:Array = getItemListByType(param1);
         _loc4_ = 0;
         while(_loc4_ < _loc5_.length)
         {
            _loc3_ = _loc5_[_loc4_] as StcShopVo;
            if(_loc3_ && _loc3_.id == param2)
            {
               return _loc3_;
            }
            _loc4_++;
         }
         return null;
      }
      
      private function checkTabOpen(param1:int) : int
      {
         var _loc2_:* = param1;
         if(_notOpenTabArr.indexOf(param1) != -1)
         {
            _loc2_ = int(_loc2_ + 1);
            if(_loc2_ > 15)
            {
               return _loc2_;
            }
            checkTabOpen(_loc2_);
         }
         return _loc2_;
      }
      
      public function getMysteryItemListByPage(param1:int, param2:int) : Array
      {
         var _loc6_:int = 0;
         var _loc5_:* = null;
         var _loc3_:int = checkTabOpen(param2);
         var _loc7_:Array = [];
         var _loc4_:Array = [];
         _loc4_ = getItemListByType(param1);
         _loc6_ = 0;
         while(_loc6_ < _mysteryShopVec.length)
         {
            _loc5_ = getStcShopVo(param1,_mysteryShopVec[_loc6_]);
            if(_loc5_ != null && _loc5_.page.split("|")[0] == _loc3_)
            {
               _loc7_.push(_loc5_);
            }
            _loc6_++;
         }
         _shopItemDic.put(param1 + "|" + _loc3_,_loc7_);
         return _loc7_;
      }
      
      public function getItemListByPage(param1:int, param2:int) : Array
      {
         var _loc3_:int = checkTabOpen(param2);
         var _loc6_:Array = [];
         var _loc4_:Array = [];
         _loc4_ = getItemListByType(param1);
         var _loc8_:int = 0;
         var _loc7_:* = _loc4_;
         for each(var _loc5_ in _loc4_)
         {
            if(isMysteryShop(param1))
            {
               if(_loc5_.page.split("|")[0] == _loc3_ && _mysteryShopVec.indexOf(_loc5_.id) != -1)
               {
                  _loc6_.push(_loc5_);
               }
            }
            else if(_loc5_.page.split("|")[0] == _loc3_)
            {
               _loc6_.push(_loc5_);
            }
         }
         _shopItemDic.put(param1 + "|" + _loc3_,_loc6_);
         return _loc6_.sortOn(["position","id"],16);
      }
      
      public function getTabIndexByShopId(param1:int) : int
      {
         var _loc2_:StcShopVo = StcMgr.ins.getShopVo(param1);
         if(_loc2_)
         {
            return _loc2_.page.split("|")[0] - 1;
         }
         return -1;
      }
      
      public function onDataChange(param1:ShopListRes) : void
      {
         if(isMysteryShop(param1.kind))
         {
            this.lockItem = param1.lockItem;
            this.freshLockItem = param1.freshLockItem;
            lockBuyedItems = new Vector.<uint>();
            ArrayUtil.fillVectorFromArr(lockBuyedItems,param1.lockFreshBuy);
            _mysteryBuyedItems = new Vector.<uint>();
            ArrayUtil.fillVectorFromArr(_mysteryBuyedItems,param1.freshBuy);
            if(param1.id && param1.kind)
            {
               _mysteryShopVec = new Vector.<uint>();
               ArrayUtil.fillVectorFromArr(_mysteryShopVec,param1.id);
            }
         }
         var _loc4_:int = 0;
         var _loc3_:* = param1.info;
         for each(var _loc2_ in param1.info)
         {
            _shopBuyInfo.put(_loc2_.id,_loc2_);
         }
         this._shopInfo.put(param1.kind,param1);
         this.checkRedPoint(param1.kind);
         this.dispatchEvent(new MzEvent("evtShopGetListOver",param1.kind));
      }
      
      public function initDoubleShop(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = param1;
         for each(var _loc2_ in param1)
         {
            ShopPlusModel.INS.convertAndAdd(101,_loc2_);
         }
      }
      
      public function getDoubleShop() : Array
      {
         return this._shopInfo.getValue(101) as Array;
      }
      
      public function onDataChangeOne(param1:ShopBuyRes) : void
      {
         var _loc4_:* = null;
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         if(!param1.buyLockItem)
         {
            _loc4_ = this._shopBuyInfo.getValue(param1.info.id) as ShopBuyInfo;
            _loc3_ = !!_loc4_?(this._shopBuyInfo.getValue(param1.info.id) as ShopBuyInfo).num:0;
            _loc2_ = param1.info.num;
            this._shopBuyInfo.put(param1.info.id,param1.info);
            this.addCosted(param1,_loc2_ - _loc3_);
            if(_mysteryShopVec.indexOf(param1.info.id) != -1)
            {
               _mysteryBuyedItems.push(param1.info.id);
            }
         }
         while(this.lockBuyedItems.length > 0)
         {
            this.lockBuyedItems.shift();
         }
         ArrayUtil.fillVectorFromArr(lockBuyedItems,param1.lockFreshBuy);
         this.dispatchEvent(new MzEvent("evtShopBuyCpl",param1.info));
      }
      
      public function refresh(param1:ShopRefreshRes) : void
      {
         while(lockBuyedItems && lockBuyedItems.length > 0)
         {
            lockBuyedItems.shift();
         }
         if(lockItem && lockItem.value)
         {
            freshLockItem = true;
         }
         else
         {
            lockItem = null;
            freshLockItem = false;
         }
         _mysteryShopVec = new Vector.<uint>();
         _mysteryBuyedItems = new Vector.<uint>();
         ArrayUtil.fillVectorFromArr(_mysteryShopVec,param1.id);
         var _loc4_:ShopListRes = new ShopListRes();
         _loc4_.id = param1.id;
         _loc4_.kind = param1.kind;
         _loc4_.time = param1.time;
         _loc4_.free = param1.free;
         var _loc3_:int = (this._shopInfo.getValue(_loc4_.kind) as ShopListRes).free;
         if(_loc3_ == DefindConsts.MYSTERY_MAX_FREE_REFRESH_TIME && _loc4_.free < _loc3_)
         {
            _loc4_.fresh = ServerTimer.ins.second;
         }
         else
         {
            _loc4_.fresh = (_shopInfo.getValue(_loc4_.kind) as ShopListRes).fresh;
         }
         this._shopInfo.put(_loc4_.kind,_loc4_);
         var _loc2_:* = _loc3_ != _loc4_.free;
         this.dispatchEvent(new MzEvent("evtShopRefresh",_loc2_));
         if(_loc2_)
         {
            ObserverMgr.ins.sendNotice("MSG_NPC_FUNC_VO_CHANGE");
         }
      }
      
      public function getLeftRefreshTimes(param1:uint) : uint
      {
         var _loc2_:uint = (_shopInfo.getValue(param1) as ShopListRes).time;
         var _loc3_:uint = int(VipModel.ins.getVipValue(10040));
         return _loc3_ - _loc2_;
      }
      
      public function getLeftFreeRefreshTimes(param1:uint) : uint
      {
         return (_shopInfo.getValue(param1) as ShopListRes).free;
      }
      
      public function addFreeRefreshTimes(param1:uint) : void
      {
         if((_shopInfo.getValue(param1) as ShopListRes).free >= DefindConsts.MYSTERY_MAX_FREE_REFRESH_TIME)
         {
            return;
         }
         (_shopInfo.getValue(param1) as ShopListRes).free++;
         (_shopInfo.getValue(param1) as ShopListRes).fresh = ServerTimer.ins.second;
         ObserverMgr.ins.sendNotice("MSG_NPC_FUNC_VO_CHANGE");
      }
      
      public function getLimitCanCost(param1:uint) : String
      {
         if(StcMgr.ins.getShopFunctionVo(param1).currency_limit == 0)
         {
            return "";
         }
         var _loc3_:uint = int(VipModel.ins.getVipValue(StcMgr.ins.getShopFunctionVo(param1).currency_limit));
         var _loc2_:uint = (_shopInfo.getValue(param1) as ShopListRes).consumeNum;
         return LocaleMgr.ins.getStr(999000368) + _loc2_ + "/" + _loc3_;
      }
      
      public function addCosted(param1:ShopBuyRes, param2:int) : void
      {
         var _loc5_:StcShopVo = StcMgr.ins.getShopVo(param1.info.id);
         var _loc7_:StcShopFunctionVo = StcMgr.ins.getShopFunctionVo(_loc5_.shop_type);
         if(_loc7_ == null || _loc7_.currency_limit == 0)
         {
            return;
         }
         var _loc6_:ShopListRes = _shopInfo.getValue(_loc5_.shop_type) as ShopListRes;
         var _loc4_:uint = int(VipModel.ins.getVipValue(StcMgr.ins.getShopFunctionVo(_loc6_.kind).currency_limit));
         var _loc3_:WealthVo = WealthVo.parseCostStr(_loc5_.curr_res);
         _loc6_.consumeNum = _loc6_.consumeNum + param2 * _loc3_.count;
      }
      
      public function shopTabConfigArrByType(param1:int) : Array
      {
         var _loc2_:Array = StcMgr.ins.getVoArrByColumnValue("static_shop","shop_type",param1);
         return shopTabConfigArrByIds(ArrayUtil.distill(_loc2_,"id"));
      }
      
      public function shopTabConfigArrByIds(param1:Array) : Array
      {
         var _loc9_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc3_:int = 0;
         var _loc8_:Array = [];
         var _loc2_:Array = [];
         var _loc7_:int = param1.length;
         _loc9_ = 0;
         while(_loc9_ < _loc7_)
         {
            _loc4_ = param1[_loc9_];
            _loc5_ = StcMgr.ins.getShopVo(_loc4_);
            if(!StringUtils.isNull(_loc5_.page))
            {
               _loc6_ = _loc5_.page.split("|");
               _loc3_ = int(_loc6_[0]) - 1;
               if(_loc2_.indexOf(_loc3_) == -1)
               {
                  _loc2_.push(_loc3_);
               }
            }
            _loc9_++;
         }
         return _loc8_;
      }
      
      public function getMysteryRefreshItemVo(param1:uint) : WealthVo
      {
         return WealthUtil.parseCostStr(StcMgr.ins.getShopFunctionVo(param1).fresh_cost);
      }
      
      public function getInitMysteryRefreshItemVo(param1:uint) : WealthVo
      {
         var _loc2_:Array = WealthUtil.costStrToArr(StcMgr.ins.getShopFunctionVo(param1).fresh_cost);
         return _loc2_[_loc2_.length - 1];
      }
      
      public function canRefresh(param1:uint) : Boolean
      {
         if(this.getMysteryRefreshItemVo(param1))
         {
            return true;
         }
         return false;
      }
      
      public function getShopLabel(param1:int) : String
      {
         var _loc6_:* = null;
         var _loc5_:int = 0;
         var _loc7_:Array = this.initItemListByType(param1);
         var _loc2_:Array = [];
         if(_loc7_ != null)
         {
            var _loc9_:int = 0;
            var _loc8_:* = _loc7_;
            for each(var _loc3_ in _loc7_)
            {
               if(_loc3_.shop_type == param1)
               {
                  _loc6_ = _loc3_.page.split("|");
                  if(_loc2_.indexOf("\\l" + _loc6_[1]) == -1)
                  {
                     _loc2_[_loc6_[0] - 1] = "\\l" + _loc6_[1];
                  }
               }
            }
         }
         _notOpenTabArr = [];
         var _loc4_:Array = [];
         _loc5_ = 0;
         while(_loc5_ < _loc2_.length)
         {
            if(_loc2_[_loc5_] != null)
            {
               _loc4_.push(_loc2_[_loc5_]);
            }
            else
            {
               _notOpenTabArr.push(_loc5_ + 1);
            }
            _loc5_++;
         }
         return _loc4_.join(",");
      }
      
      public function getNextTimeToAddFreeTimes(param1:int) : uint
      {
         var _loc2_:uint = (_shopInfo.getValue(param1) as ShopListRes).fresh;
         return _loc2_ + DefindConsts.MYSTERY_PER_REFRESH_TIME * 60 * 60;
      }
      
      public function getDiscount(param1:Number, param2:Number) : int
      {
         return Math.floor(param2 / param1 * 10);
      }
      
      public function getCost(param1:int) : Array
      {
         var _loc3_:StcShopFunctionVo = StcMgr.ins.getShopFunctionVo(param1);
         var _loc4_:Array = WealthUtil.costStrToArr(_loc3_.currency);
         if(_loc4_.length > 0)
         {
            var _loc6_:int = 0;
            var _loc5_:* = _loc4_;
            for each(var _loc2_ in _loc4_)
            {
               _loc2_.useStcCount = true;
            }
            return _loc4_;
         }
         return null;
      }
      
      public function getShopBuyInfo(param1:int) : ShopBuyInfo
      {
         return _shopBuyInfo.getValue(param1);
      }
      
      public function getBuyedTimes(param1:int) : int
      {
         var _loc2_:ShopBuyInfo = this.getShopBuyInfo(param1);
         if(_loc2_)
         {
            return _loc2_.num;
         }
         return 0;
      }
      
      public function getLimitLocaleId(param1:int) : int
      {
         return _shopLimitTypeLocaleIdDic.getValue(param1);
      }
      
      public function getCanBuyMaxCount(param1:int) : int
      {
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:StcShopVo = StcMgr.ins.getShopVo(param1);
         var _loc5_:Array = WealthUtil.costStrToArr(_loc2_.curr_res);
         var _loc3_:int = 999;
         _loc6_ = 0;
         while(_loc6_ < _loc5_.length)
         {
            _loc3_ = Math.min(_loc3_,PlayerModel.ins.getCountByWealthVo(_loc5_[_loc6_]) / _loc5_[_loc6_].count);
            _loc6_++;
         }
         if(_loc2_.limit_num != 0)
         {
            _loc4_ = _loc2_.limit_num - this.getBuyedTimes(param1);
            return Math.min(_loc3_,_loc4_);
         }
         return _loc3_;
      }
      
      public function getRefreshItemType(param1:int) : int
      {
         return 1;
      }
      
      public function mysteryItemHasBuyed(param1:int) : Boolean
      {
         return _mysteryBuyedItems.indexOf(param1) != -1;
      }
      
      public function hasLeftToBuy(param1:int) : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:StcShopVo = StcMgr.ins.getShopVo(param1);
         if(_loc3_.limit_num == 0)
         {
            return true;
         }
         _loc2_ = _shopBuyInfo.getValue(param1);
         if(_loc2_ && _loc2_.num >= _loc3_.limit_num)
         {
            return false;
         }
         return true;
      }
      
      public function isMysteryShop(param1:int) : Boolean
      {
         return param1 - 100000 > 0 || StcMgr.ins.getShopFunctionVo(param1 + 100000) != null;
      }
      
      public function checkRedPoint(param1:int) : void
      {
         var _loc2_:ShopListRes = _shopInfo.getValue(param1);
         if(_loc2_ == null)
         {
            ShopService.ins.requestList(param1);
         }
         else
         {
            needShowRedPoint(param1);
         }
      }
      
      public function needShowRedPoint(param1:int) : Boolean
      {
         var _loc2_:int = 0;
         var _loc4_:Boolean = false;
         var _loc5_:Array = this.getShopLabel(param1).split(",");
         var _loc3_:Array = ArrayUtil.intersectionBetweenArrs(_loc5_,ShopConsts.NEED_CHECK_RED_POINT_TAB_ARR);
         if(_loc3_.length == 0)
         {
            ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(param1,false));
            return false;
         }
         _loc2_ = 0;
         while(_loc2_ < _loc3_.length)
         {
            _loc4_ = hasRewardCanBuy(param1,_loc5_.indexOf(_loc3_[_loc2_]) + 1);
            if(_loc4_ == true)
            {
               ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(param1,true));
               return true;
            }
            _loc2_++;
         }
         ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(param1,false));
         return false;
      }
      
      public function hasRewardCanBuy(param1:int, param2:int) : Boolean
      {
         var _loc4_:Array = this.getItemListByPage(param1,param2);
         var _loc6_:int = 0;
         var _loc5_:* = _loc4_;
         for each(var _loc3_ in _loc4_)
         {
            if(RestrictiveConditionUtils.condSatisfied(_loc3_.condi) == true && hasLeftToBuy(_loc3_.id) && getCanBuyMaxCount(_loc3_.id) > 0)
            {
               return true;
            }
         }
         return false;
      }
      
      public function getRewardTabIndexArr(param1:int) : Array
      {
         var _loc5_:Array = this.getShopLabel(param1).split(",");
         var _loc3_:Array = ArrayUtil.intersectionBetweenArrs(_loc5_,ShopConsts.NEED_CHECK_RED_POINT_TAB_ARR);
         var _loc2_:Array = [];
         var _loc7_:int = 0;
         var _loc6_:* = _loc3_;
         for each(var _loc4_ in _loc3_)
         {
            _loc2_.push(_loc5_.indexOf(_loc4_));
         }
         return _loc2_;
      }
      
      public function mysteryShopHasHeroInTeam(param1:int) : Boolean
      {
         var _loc5_:* = null;
         var _loc3_:* = null;
         var _loc2_:Array = this.getItemListByPage(param1,1);
         var _loc7_:int = 0;
         var _loc6_:* = _loc2_;
         for each(var _loc4_ in _loc2_)
         {
            _loc5_ = WealthVo.parseCostStr(_loc4_.sell_res);
            _loc3_ = WealthVo.parseCostStr(_loc4_.curr_res);
            if(!(_loc3_.kind != 15 || this.mysteryItemHasBuyed(_loc4_.id) == true))
            {
               if(_loc5_.stcItemVo && _loc5_.stcItemVo.kind == 21 && HeroModel.ins.checkHeroInTeam(_loc5_.stcItemVo.heroPiece_stcNpcId))
               {
                  return true;
               }
               if(_loc5_.stcNpcVo && HeroModel.ins.checkHeroInTeam(_loc5_.stcNpcVo.id))
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      private function initItemListByType(param1:int) : Array
      {
         var _loc3_:* = null;
         var _loc5_:int = 0;
         var _loc2_:Array = StcMgr.ins.getVoArrByColumnValue("static_shop","shop_type",param1);
         if(_loc2_.length == 0)
         {
            _loc2_ = StcMgr.ins.getVoArrByColumnValue("static_shop","shop_type",param1 + 100000);
         }
         var _loc4_:Array = [];
         _loc5_ = 0;
         while(_loc5_ < _loc2_.length)
         {
            _loc3_ = _loc2_[_loc5_] as StcShopVo;
            if(_loc3_)
            {
               if(_loc3_.function_id == 0 || FuncOpenAutoCtrl.checkOpen(_loc3_.function_id))
               {
                  _loc4_.push(_loc3_);
               }
            }
            _loc5_++;
         }
         _shopItemDic.put(param1,_loc4_);
         return _loc4_;
      }
      
      private function setLimitType() : void
      {
         _shopLimitTypeLocaleIdDic.put(1,60300007);
         _shopLimitTypeLocaleIdDic.put(2,60300021);
         _shopLimitTypeLocaleIdDic.put(3,60300022);
         _shopLimitTypeLocaleIdDic.put(4,60300023);
         _shopLimitTypeLocaleIdDic.put(5,60300024);
         _shopLimitTypeLocaleIdDic.put(6,60300025);
      }
   }
}
