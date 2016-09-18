package nslm2.modules.foundations.auctionShop.model
{
   import com.mz.core.interFace.IDispose;
   import nslm2.common.vo.WealthVo;
   import proto.AuctionItem;
   import nslm2.modules.foundations.auctionShop.vo.SortTitleVo;
   import nslm2.modules.cultivates.treasure.model.TreasureModel;
   import nslm2.modules.bag.itemModuels.BagModel;
   import com.mz.core.mgrs.ObserverMgr;
   import com.netease.protobuf.UInt64;
   import nslm2.utils.Uint64Util;
   import proto.BaoWu;
   import game.ui.roleInfos.NpcPropVo;
   import proto.BaoWuBuff;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class AuctionShopModel implements IDispose
   {
      
      private static var _ins:nslm2.modules.foundations.auctionShop.model.AuctionShopModel;
       
      
      private var _allTreausreArr:Array;
      
      private var _allItemsArr:Array;
      
      private var _myAuctionArr:Array;
      
      private var _myOrderArr:Array;
      
      public var buyFilterType:int;
      
      public var sellFilterType:int;
      
      private var _canSellItemArr:Array;
      
      public var selectedSellItem:WealthVo;
      
      public var selectedAuctionItem:AuctionItem;
      
      public var searchCondition:Array;
      
      public var searchLabels:Array;
      
      public var sortVo1:SortTitleVo;
      
      public var sortVo2:SortTitleVo;
      
      public var sortVo3:SortTitleVo;
      
      private var crtSortVo:SortTitleVo;
      
      public function AuctionShopModel()
      {
         var _loc2_:* = null;
         var _loc4_:int = 0;
         var _loc1_:int = 0;
         _allTreausreArr = [];
         _allItemsArr = [];
         _myAuctionArr = [];
         _myOrderArr = [];
         searchCondition = [0,11,12,15,16,21,22,401000,401100,401200,402000,402100,402200];
         super();
         searchLabels = [];
         var _loc3_:int = searchCondition.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc1_ = searchCondition[_loc4_];
            if(_loc1_ == 0)
            {
               searchLabels.push(LocaleMgr.ins.getStr(999000020));
            }
            else
            {
               searchLabels.push(LocaleMgr.ins.getStr(1000000000 + _loc1_));
            }
            _loc4_++;
         }
      }
      
      public static function get ins() : nslm2.modules.foundations.auctionShop.model.AuctionShopModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.foundations.auctionShop.model.AuctionShopModel();
         }
         return _ins;
      }
      
      public function get allTreausreArr() : Array
      {
         return _allTreausreArr;
      }
      
      public function set allTreausreArr(param1:Array) : void
      {
         _allTreausreArr = param1;
      }
      
      public function get allItemsArr() : Array
      {
         return _allItemsArr;
      }
      
      public function set allItemsArr(param1:Array) : void
      {
         _allItemsArr = param1;
      }
      
      public function set myAuctionArr(param1:*) : void
      {
         _myAuctionArr = param1;
      }
      
      public function get myAuctionArr() : Array
      {
         return _myAuctionArr;
      }
      
      public function get myOrderArr() : Array
      {
         return _myOrderArr;
      }
      
      public function set myOrderArr(param1:Array) : void
      {
         _myOrderArr = param1;
      }
      
      public function get canSellItemArr() : Array
      {
         _canSellItemArr = [];
         var _loc1_:Array = TreasureModel.ins.getALLTreausreData();
         var _loc4_:int = 0;
         var _loc3_:* = _loc1_;
         for each(var _loc2_ in _loc1_)
         {
            if(_loc2_.treasure.statue == 0 && _loc2_.quality >= 5)
            {
               _canSellItemArr.push(_loc2_);
            }
         }
         _canSellItemArr.sortOn("quality",16 | 2);
         _canSellItemArr = _canSellItemArr.concat(BagModel.ins.getAuctionItem());
         return _canSellItemArr;
      }
      
      public function addMySellItem(param1:AuctionItem) : void
      {
         if(param1.baowu)
         {
            _allTreausreArr.push(param1);
         }
         else
         {
            _allItemsArr.push(param1);
         }
         _myAuctionArr.push(param1);
         ObserverMgr.ins.sendNotice("auction_notice_update_my_sell_list",param1);
      }
      
      public function removeSellItem(param1:UInt64, param2:UInt64) : void
      {
         if(param2 && !Uint64Util.isZero(param2))
         {
            Uint64Util.removeItemByAttr(_allTreausreArr,"id",param1);
         }
         else
         {
            Uint64Util.removeItemByAttr(_allItemsArr,"id",param1);
         }
         Uint64Util.removeItemByAttr(_myAuctionArr,"id",param1);
         ObserverMgr.ins.sendNotice("auction_notice_update_my_sell_list");
      }
      
      public function searchItem(param1:Array) : Array
      {
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc8_:int = 0;
         var _loc7_:* = null;
         var _loc4_:Array = [];
         var _loc10_:int = 0;
         var _loc9_:* = param1;
         for each(var _loc3_ in param1)
         {
            if(_loc3_ > 0)
            {
               _loc4_.push(searchCondition[_loc3_]);
            }
         }
         var _loc2_:Array = [];
         if(buyFilterType == 0)
         {
            _loc5_ = _allTreausreArr;
         }
         else
         {
            _loc5_ = _allItemsArr;
         }
         if(_loc5_.length > 0)
         {
            _loc6_ = _loc5_.length;
            _loc8_ = 0;
            while(_loc8_ < _loc6_)
            {
               _loc7_ = _loc5_[_loc8_];
               if(_loc7_)
               {
                  if(_loc7_.baowu)
                  {
                     if(checkCondition(_loc4_,_loc7_.baowu))
                     {
                        _loc2_.push(_loc7_);
                     }
                  }
               }
               _loc8_++;
            }
         }
         return _loc2_;
      }
      
      private function checkCondition(param1:Array, param2:BaoWu) : Boolean
      {
         if(!param1.length)
         {
            return true;
         }
         var _loc9_:Array = NpcPropVo.parseFightProp(param2.base);
         var _loc8_:Array = NpcPropVo.parseFightProp(param2.random);
         var _loc5_:Array = _loc9_.concat(_loc8_);
         var _loc6_:Array = [];
         var _loc11_:int = 0;
         var _loc10_:* = _loc5_;
         for each(var _loc4_ in _loc5_)
         {
            _loc6_.push(int(_loc4_.propId));
         }
         var _loc13_:int = 0;
         var _loc12_:* = param2.buff;
         for each(var _loc7_ in param2.buff)
         {
            if(_loc7_)
            {
               _loc6_.push(int(_loc7_.id));
            }
         }
         var _loc15_:int = 0;
         var _loc14_:* = param1;
         for each(var _loc3_ in param1)
         {
            if(_loc3_ > 0 && _loc6_.indexOf(_loc3_) == -1)
            {
               return false;
            }
         }
         return true;
      }
      
      private function filterAuction(param1:AuctionItem, param2:Object, param3:Object) : Boolean
      {
         if(sellFilterType + 1 == 1 && param1.baowu)
         {
            return true;
         }
         if(sellFilterType + 1 == 2 && !param1.baowu)
         {
            return true;
         }
         return false;
      }
      
      public function sortAuctionList(param1:Array, param2:SortTitleVo) : Array
      {
         if(!param2)
         {
            param1.sort(sortAuctionItemDefaultFun);
         }
         else
         {
            crtSortVo = param2;
            param1.sort(sortAuctionItemFun);
         }
         return param1;
      }
      
      private function sortAuctionItemDefaultFun(param1:AuctionItem, param2:AuctionItem) : int
      {
         if(param1.endTm < param2.endTm)
         {
            return -1;
         }
         if(param1.endTm > param2.endTm)
         {
            return 1;
         }
         return 0;
      }
      
      private function sortAuctionItemFun(param1:AuctionItem, param2:AuctionItem) : int
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         if(crtSortVo.propName == "quality")
         {
            if(param1.baowu)
            {
               _loc4_ = WealthUtil.treasureToVo(param1.baowu).quality;
               _loc3_ = WealthUtil.treasureToVo(param2.baowu).quality;
            }
            else
            {
               _loc4_ = WealthUtil.getItemQuality(param1.item.id);
               _loc3_ = WealthUtil.getItemQuality(param2.item.id);
            }
         }
         else
         {
            _loc4_ = param1[crtSortVo.propName];
            _loc3_ = param2[crtSortVo.propName];
         }
         if(crtSortVo.isDESC)
         {
            if(_loc4_ > _loc3_)
            {
               return -1;
            }
            if(_loc4_ < _loc3_)
            {
               return 1;
            }
         }
         else
         {
            if(_loc4_ > _loc3_)
            {
               return 1;
            }
            if(_loc4_ < _loc3_)
            {
               return -1;
            }
         }
         return 0;
      }
      
      public function get canSell() : Boolean
      {
         return _myAuctionArr.length < int(DefindConsts.treasure_AH_maxSellNum);
      }
      
      public function get canBuy() : Boolean
      {
         return _myOrderArr.length < int(DefindConsts.treasure_AH_maxBuyNum);
      }
      
      public function changeAuctionItemPrice(param1:UInt64, param2:int) : void
      {
         var _loc5_:int = 0;
         var _loc4_:* = _allTreausreArr;
         for each(var _loc3_ in _allTreausreArr)
         {
            if(Uint64Util.equal(_loc3_.id,param1))
            {
               _loc3_.curPrice = param2;
            }
         }
      }
      
      public function removeAuctionItem(param1:UInt64) : void
      {
         Uint64Util.removeItemByAttr(_allTreausreArr,"id",param1);
      }
      
      public function dispose() : void
      {
         buyFilterType = 0;
         sellFilterType = 0;
         selectedSellItem = null;
         selectedAuctionItem = null;
      }
   }
}
