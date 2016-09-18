package nslm2.modules.foundations.shop.model
{
   import com.mz.core.utils.DictHash;
   import nslm2.mgrs.stcMgrs.vos.StcShopVo;
   import proto.BuyDoublePanelRes;
   import proto.BuyDoubleBuyItemInfo;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.modules.funnies.npcFuncLists.FuncOpenTimeVo;
   import proto.StaticBuyDoubleShopModel;
   import nslm2.utils.WealthUtil;
   import nslm2.common.model.PlayerModel;
   import proto.BuyDoubleBuyRes;
   import com.mz.core.event.MzEvent;
   
   public class ShopPlusModel
   {
      
      private static var _instance:nslm2.modules.foundations.shop.model.ShopPlusModel;
       
      
      private var stcShopsDict:DictHash;
      
      private var _shopBuyInfo:DictHash;
      
      public function ShopPlusModel()
      {
         super();
         stcShopsDict = new DictHash();
         _shopBuyInfo = new DictHash();
      }
      
      public static function get INS() : nslm2.modules.foundations.shop.model.ShopPlusModel
      {
         if(_instance == null)
         {
            _instance = new nslm2.modules.foundations.shop.model.ShopPlusModel();
         }
         return _instance;
      }
      
      public function requestList() : void
      {
      }
      
      public function addShopVo(param1:int, param2:StcShopVo) : void
      {
         if(!stcShopsDict.containsKey(param1))
         {
            stcShopsDict.put(param1,new DictHash());
         }
         stcShopsDict.getValue(param1).put(param2.id,param2);
      }
      
      public function initBuyDoubleInfo(param1:BuyDoublePanelRes) : void
      {
         if(param1 == null || param1.member == null || param1.member.buyinfo == null)
         {
            return;
         }
         var _loc4_:int = 0;
         var _loc3_:* = param1.member.buyinfo;
         for each(var _loc2_ in param1.member.buyinfo)
         {
            _shopBuyInfo.put(_loc2_.itemid,_loc2_);
         }
         NpcFuncService.ins.setOpenTimeVo(new FuncOpenTimeVo(900500,param1.starttime,param1.endtime));
      }
      
      public function getShopVO(param1:int, param2:int) : StcShopVo
      {
         return stcShopsDict.getValue(param1).getValue(param2) as StcShopVo;
      }
      
      public function getShopItemArrByKind(param1:int) : Array
      {
         if(stcShopsDict.containsKey(param1.toString()))
         {
            return stcShopsDict.getValue(param1).array;
         }
         return [];
      }
      
      public function convertAndAdd(param1:int, param2:*) : void
      {
         var _loc3_:* = null;
         var _loc4_:StcShopVo = new StcShopVo();
         if(param2 is StaticBuyDoubleShopModel)
         {
            _loc3_ = param2 as StaticBuyDoubleShopModel;
            _loc4_.id = _loc3_.id;
            _loc4_.limit_num = _loc3_.limit;
            _loc4_.ori_res = _loc3_.oriRes;
            _loc4_.sell_res = _loc3_.sellRes;
            _loc4_.curr_res = _loc3_.currRes;
            _loc4_.plusData = {};
            _loc4_.plusData.version = _loc3_.version;
            _loc4_.plusData.kind = param1;
            addShopVo(101,_loc4_);
         }
      }
      
      public function getCanBuyMaxCount(param1:StcShopVo) : int
      {
         var _loc3_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:Array = WealthUtil.costStrToArr(param1.curr_res);
         var _loc2_:int = 999;
         _loc5_ = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc2_ = Math.min(_loc2_,PlayerModel.ins.getCountByWealthVo(_loc4_[_loc5_]) / _loc4_[_loc5_].count);
            _loc5_++;
         }
         if(param1.limit_num != 0)
         {
            _loc3_ = param1.limit_num - this.getBuyedTimes(param1.id);
            return Math.min(_loc2_,_loc3_);
         }
         return _loc2_;
      }
      
      public function getShopBuyInfo(param1:int) : BuyDoubleBuyItemInfo
      {
         return _shopBuyInfo.getValue(param1);
      }
      
      public function getBuyedTimes(param1:int) : int
      {
         var _loc2_:BuyDoubleBuyItemInfo = this.getShopBuyInfo(param1);
         if(_loc2_)
         {
            return _loc2_.count;
         }
         return 0;
      }
      
      public function onDataChangeOne(param1:BuyDoubleBuyRes) : void
      {
         var _loc4_:BuyDoubleBuyItemInfo = this._shopBuyInfo.getValue(param1.buyinfo.itemid) as BuyDoubleBuyItemInfo;
         var _loc3_:int = !!_loc4_?(this._shopBuyInfo.getValue(param1.buyinfo.itemid) as BuyDoubleBuyItemInfo).count:0;
         var _loc2_:int = param1.buyinfo.count;
         this._shopBuyInfo.put(param1.buyinfo.itemid,param1.buyinfo);
         this.addCosted(param1,_loc2_ - _loc3_);
         ShopModel.ins.dispatchEvent(new MzEvent("evtShopBuyCpl",param1.buyinfo));
      }
      
      public function addCosted(param1:BuyDoubleBuyRes, param2:int) : void
      {
      }
   }
}
