package nslm2.modules.foundations.mall.model
{
   import com.mz.core.utils.DictHash;
   import proto.MallListRes;
   import nslm2.modules.foundations.mall.vo.MallItemVo;
   import proto.MallBuyRes;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.ShopBuyInfo;
   import proto.mallItem;
   import nslm2.modules.foundations.mall.util.MallUtil;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcMallItemVo;
   
   public class MallModel
   {
      
      private static var _ins:nslm2.modules.foundations.mall.model.MallModel;
      
      public static const TAB_PAGE_COUNT:int = 4;
       
      
      private var mallItemDic:DictHash;
      
      private var mallInfo:MallListRes;
      
      private var allMallItemDic:DictHash;
      
      private var _recMallItemList:Array;
      
      private var _specialMallItemList:Array;
      
      private var specialPrice:DictHash;
      
      public var bannerItemList:Array;
      
      private var hotSaleItemArr:Array;
      
      public var crtBuyItem:MallItemVo;
      
      public var crtBuyItemCnt:int;
      
      public var currentPage:int;
      
      public function MallModel()
      {
         _recMallItemList = [];
         _specialMallItemList = [];
         bannerItemList = [];
         hotSaleItemArr = [];
         super();
         mallItemDic = new DictHash();
         specialPrice = new DictHash();
         allMallItemDic = new DictHash();
         initAllItem();
      }
      
      public static function get ins() : nslm2.modules.foundations.mall.model.MallModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.foundations.mall.model.MallModel();
         }
         return _ins;
      }
      
      private function initAllItem() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 1;
         while(_loc1_ <= 4)
         {
            getMallItemListByPage(_loc1_);
            _loc1_++;
         }
      }
      
      public function updateMallData(param1:MallListRes) : void
      {
         mallInfo = param1;
         if(!mallInfo)
         {
            return;
         }
         updateRecommendList(param1.tuijian);
         updateSpecialItemList(param1.tejia);
         updateHotSaleItemList(param1.rexiao);
         updateBannerList(param1.libao);
         updateSelfBuyInfo(param1.person);
         updateServerBuyInfo(param1.global);
      }
      
      public function updateItemBuyInfo(param1:MallBuyRes) : void
      {
         updateSelfBuyInfo([param1.person]);
         updateServerBuyInfo([param1.global]);
         ObserverMgr.ins.sendNotice("mall_notice_update_info");
      }
      
      private function updateSelfBuyInfo(param1:Array) : void
      {
         var _loc3_:* = null;
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for each(var _loc2_ in param1)
         {
            _loc3_ = allMallItemDic.getValue(_loc2_.id);
            if(_loc3_)
            {
               _loc3_.buyCount = _loc2_.num;
            }
         }
      }
      
      private function updateServerBuyInfo(param1:Array) : void
      {
         var _loc3_:* = null;
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for each(var _loc2_ in param1)
         {
            _loc3_ = allMallItemDic.getValue(_loc2_.id);
            if(_loc3_)
            {
               _loc3_.buyCountGlobal = _loc2_.num;
            }
         }
      }
      
      private function updateRecommendList(param1:Array) : void
      {
         var _loc3_:* = null;
         _recMallItemList = [];
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for each(var _loc2_ in param1)
         {
            _loc3_ = MallUtil.parseMallItemToMallItemVo(_loc2_);
            _recMallItemList.push(_loc3_);
            _loc3_.isHotSale = true;
            allMallItemDic.put(_loc3_.id,_loc3_);
         }
         _recMallItemList.sortOn("position",16);
      }
      
      private function updateBannerList(param1:Array) : void
      {
         var _loc3_:* = null;
         bannerItemList = [];
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for each(var _loc2_ in param1)
         {
            _loc3_ = MallUtil.parseMallItemToMallItemVo(_loc2_);
            bannerItemList.push(_loc3_);
            _loc3_.isHotSale = true;
            allMallItemDic.put(_loc3_.id,_loc3_);
         }
         bannerItemList.sortOn("position",16);
      }
      
      private function updateSpecialItemList(param1:Array) : void
      {
         var _loc3_:* = null;
         _specialMallItemList = [];
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for each(var _loc2_ in param1)
         {
            _loc3_ = MallUtil.parseMallItemToMallItemVo(_loc2_);
            _specialMallItemList.push(_loc3_);
            _loc3_.isHotSale = true;
            allMallItemDic.put(_loc3_.id,_loc3_);
         }
         _specialMallItemList.sortOn("position",16);
      }
      
      private function updateHotSaleItemList(param1:Array) : void
      {
         var _loc3_:* = null;
         hotSaleItemArr = [];
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for each(var _loc2_ in param1)
         {
            _loc3_ = MallUtil.parseMallItemToMallItemVo(_loc2_);
            _loc3_.isHotSale = true;
            hotSaleItemArr.push(_loc3_);
            allMallItemDic.put(_loc3_.id,_loc3_);
         }
         hotSaleItemArr.sortOn("position",16);
      }
      
      public function getMallItemListByPage(param1:int) : Array
      {
         var _loc5_:* = null;
         var _loc2_:* = null;
         var _loc3_:Array = [];
         _loc5_ = mallItemDic.getValue(param1);
         if(!_loc5_ || !_loc5_.length)
         {
            if(!_loc5_)
            {
               _loc5_ = [];
            }
            _loc3_ = StcMgr.ins.getVoArrByColumnValue("static_mall_item","kind",param1);
            _loc3_.sortOn("position",16);
            var _loc7_:int = 0;
            var _loc6_:* = _loc3_;
            for each(var _loc4_ in _loc3_)
            {
               _loc2_ = new MallItemVo();
               _loc2_.stcMallItemVo = _loc4_;
               _loc2_.id = _loc4_.id;
               _loc5_.push(_loc2_);
               allMallItemDic.put(_loc4_.id,_loc2_);
            }
            mallItemDic.put(param1,_loc5_);
         }
         return _loc5_;
      }
      
      public function getCrtPageItemList() : Array
      {
         return getMallItemListByPage(currentPage);
      }
      
      public function get specialMallItemList() : Array
      {
         return _specialMallItemList;
      }
      
      public function get recommendMallItemList() : Array
      {
         return _recMallItemList;
      }
      
      public function get goldenCanChangeLimit() : int
      {
         return 0;
      }
      
      public function set goldenCanChangeLimit(param1:int) : void
      {
      }
   }
}
