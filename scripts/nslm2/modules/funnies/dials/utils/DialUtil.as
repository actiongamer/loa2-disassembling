package nslm2.modules.funnies.dials.utils
{
   import proto.ZhuanPanBuyItemInfo;
   import proto.ZhuanpanCrossBuyRes;
   import proto.MineSweepShopInfo;
   import proto.ZhuanPanInfoRes;
   import proto.ZhuanpanCrossInfoRes;
   import proto.ZhuanPanMemberInfo;
   import proto.ZhuanPanScoreMemer;
   import proto.ZhuanpanCrossRankRes.RankData;
   import proto.PlayerBaseInfo;
   import proto.ZhuanPanCommonRes;
   import proto.ZhuanpanCrossRotateRes;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.funnies.dials.model.DialModel;
   import nslm2.utils.WealthUtil;
   import proto.ZhuanPanSuperRes;
   
   public class DialUtil
   {
       
      
      public function DialUtil()
      {
         super();
      }
      
      public static function zhuanpanCrossBuyResToZhuanPanBuyItemInfo(param1:ZhuanpanCrossBuyRes) : ZhuanPanBuyItemInfo
      {
         var _loc2_:ZhuanPanBuyItemInfo = new ZhuanPanBuyItemInfo();
         _loc2_.count = param1.buyNum;
         _loc2_.itemid = param1.id;
         return _loc2_;
      }
      
      public static function mineSweepShopInfoArrToZhuanPanBuyItemInfoArr(param1:Array) : Array
      {
         var _loc3_:int = 0;
         var _loc4_:Array = [];
         var _loc2_:int = param1.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_.push(mineSweepShopInfoToZhuanPanBuyItemInfo(param1[_loc3_]));
            _loc3_++;
         }
         return _loc4_;
      }
      
      public static function mineSweepShopInfoToZhuanPanBuyItemInfo(param1:MineSweepShopInfo) : ZhuanPanBuyItemInfo
      {
         var _loc2_:ZhuanPanBuyItemInfo = new ZhuanPanBuyItemInfo();
         _loc2_.count = param1.buyNum;
         _loc2_.itemid = param1.itemId;
         return _loc2_;
      }
      
      public static function zhuanpanCrossInfoResTozhuanpanInfoRes(param1:ZhuanpanCrossInfoRes) : ZhuanPanInfoRes
      {
         var _loc2_:ZhuanPanInfoRes = new ZhuanPanInfoRes();
         var _loc3_:ZhuanPanMemberInfo = new ZhuanPanMemberInfo();
         _loc3_.score = param1.score;
         _loc2_.member = _loc3_;
         return _loc2_;
      }
      
      public static function rankDataArrToZhuanPanScoreMemerArr(param1:Array) : Array
      {
         var _loc3_:int = 0;
         var _loc4_:Array = [];
         var _loc2_:int = param1.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_.push(rankDataToZhuanPanScoreMemer(param1[_loc3_],_loc3_));
            _loc3_++;
         }
         return _loc4_;
      }
      
      public static function rankDataToZhuanPanScoreMemer(param1:RankData, param2:int) : ZhuanPanScoreMemer
      {
         var _loc4_:ZhuanPanScoreMemer = new ZhuanPanScoreMemer();
         var _loc3_:PlayerBaseInfo = new PlayerBaseInfo();
         _loc3_.militaryRank = param1.militaryRank;
         _loc3_.dist = param1.dist;
         _loc3_.name = param1.name;
         _loc3_.opName = param1.opname;
         _loc3_.id = param1.id;
         _loc4_.baseinfo = _loc3_;
         _loc4_.rank = param2 + 1;
         _loc4_.score = param1.score;
         return _loc4_;
      }
      
      public static function zhuanpanCrossRotateResToZhuanPanCommonRes(param1:ZhuanpanCrossRotateRes, param2:Array, param3:int) : ZhuanPanCommonRes
      {
         var _loc8_:int = 0;
         var _loc7_:* = null;
         var _loc6_:ZhuanPanCommonRes = new ZhuanPanCommonRes();
         var _loc5_:int = 0;
         var _loc4_:* = 0;
         _loc8_ = 0;
         while(_loc8_ < param2.length)
         {
            _loc7_ = param2[_loc8_];
            if(_loc7_.kind != 43)
            {
               _loc5_++;
               _loc4_ = _loc8_;
            }
            _loc8_++;
         }
         if(_loc5_ == 1)
         {
            _loc6_.itemid = DialModel.ins.getItemIdByWealthVo(param2[_loc4_],param3);
         }
         else
         {
            _loc6_.itemids = [1,2];
         }
         _loc6_.rewards = WealthUtil.wealthVoArrToRewardArr(param2);
         _loc6_.score = param1.score;
         return _loc6_;
      }
      
      public static function zhuanpanCrossRotateResToZhuanPanSuperRes(param1:ZhuanpanCrossRotateRes, param2:Array, param3:int) : ZhuanPanSuperRes
      {
         var _loc8_:int = 0;
         var _loc7_:* = null;
         var _loc6_:ZhuanPanSuperRes = new ZhuanPanSuperRes();
         var _loc5_:int = 0;
         var _loc4_:* = 0;
         _loc8_ = 0;
         while(_loc8_ < param2.length)
         {
            _loc7_ = param2[_loc8_];
            if(_loc7_.kind != 43)
            {
               _loc5_++;
               _loc4_ = _loc8_;
            }
            _loc8_++;
         }
         if(_loc5_ == 1)
         {
            _loc6_.itemid = DialModel.ins.getItemIdByWealthVo(param2[_loc4_],param3);
         }
         else
         {
            _loc6_.itemids = [1,2];
         }
         _loc6_.rewards = WealthUtil.wealthVoArrToRewardArr(param2);
         _loc6_.score = param1.score;
         return _loc6_;
      }
   }
}
