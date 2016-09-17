package nslm2.utils
{
   import com.netease.protobuf.Message;
   import morn.core.utils.ObjectUtils;
   import com.netease.protobuf.FieldDescriptor;
   import morn.core.utils.StringUtils;
   import com.netease.protobuf.RepeatedFieldDescriptor;
   import proto.Para;
   import proto.MineSweepShopInfo;
   import proto.DragonBoatShopInfo;
   import proto.StaticMineSweepRankRewardModel;
   import proto.StaticLuckTreeShopModel;
   import proto.StaticZhuanPanCostModel;
   import proto.StaticZhuanPanRewardModel;
   import proto.StaticZhuanPanShopModel;
   import proto.StaticZhuanPanItemModel;
   
   public class ProtoUtils
   {
       
      
      public function ProtoUtils()
      {
         super();
      }
      
      public static function copyParams(param1:Message, param2:Message, param3:Vector.<String> = null) : void
      {
         var _loc10_:int = 0;
         var _loc5_:* = undefined;
         var _loc4_:* = null;
         var _loc6_:* = null;
         var _loc9_:Class = ObjectUtils.classOf(param1);
         var _loc7_:Array = ObjectUtils.constListOfClass(_loc9_);
         var _loc8_:int = _loc7_.length;
         _loc10_ = 0;
         while(_loc10_ < _loc8_)
         {
            _loc5_ = _loc9_[_loc7_[_loc10_]];
            if(_loc5_ is FieldDescriptor)
            {
               _loc4_ = (_loc5_ as FieldDescriptor).name;
               _loc6_ = "has" + StringUtils.upperFirstLetter(_loc4_);
               if(param1.hasOwnProperty(_loc6_) == false || param1[_loc6_] == true)
               {
                  if(param3 == null || param3.indexOf(_loc5_.name) > -1)
                  {
                     param2[_loc4_] = param1[_loc4_];
                  }
               }
            }
            else if(_loc5_ is RepeatedFieldDescriptor)
            {
               _loc4_ = (_loc5_ as RepeatedFieldDescriptor).name;
               if(param1[_loc4_] != null)
               {
                  param2[_loc4_] = param1[_loc4_];
               }
            }
            _loc10_++;
         }
      }
      
      public static function parseParaArr(param1:Array) : Array
      {
         var _loc4_:int = 0;
         var _loc2_:Array = [];
         var _loc3_:int = param1.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_.push(paraArrValue(param1[_loc4_]));
            _loc4_++;
         }
         return _loc2_;
      }
      
      public static function paraArrValue(param1:Para) : *
      {
         var _loc8_:int = 0;
         var _loc3_:* = undefined;
         var _loc4_:* = null;
         var _loc2_:* = null;
         var _loc5_:* = null;
         if(param1.paras && param1.paras.length > 0)
         {
            return parseParaArr(param1.paras);
         }
         var _loc6_:Array = ObjectUtils.constListOfClass(Para);
         var _loc7_:int = _loc6_.length;
         _loc8_ = 0;
         while(_loc8_ < _loc7_)
         {
            _loc3_ = Para[_loc6_[_loc8_]];
            if(_loc3_ is FieldDescriptor)
            {
               _loc4_ = _loc3_ as FieldDescriptor;
               _loc2_ = (_loc4_ as FieldDescriptor).name;
               _loc5_ = "has" + StringUtils.upperFirstLetter(_loc2_);
               if(param1[_loc5_] == true)
               {
                  return param1[_loc2_];
               }
            }
            _loc8_++;
         }
         return null;
      }
      
      public static function toMineSweepShopInfo(param1:*) : MineSweepShopInfo
      {
         var _loc3_:* = null;
         var _loc2_:MineSweepShopInfo = new MineSweepShopInfo();
         if(param1 is DragonBoatShopInfo)
         {
            _loc3_ = param1 as DragonBoatShopInfo;
            _loc2_.buyNum = _loc3_.buyNum;
            _loc2_.itemId = _loc3_.itemId;
         }
         else
         {
            _loc2_ = param1;
         }
         return _loc2_;
      }
      
      public static function obToStaticMineSweepRankRewardModel_rank(param1:Object) : StaticMineSweepRankRewardModel
      {
         var _loc2_:StaticMineSweepRankRewardModel = new StaticMineSweepRankRewardModel();
         _loc2_.id = param1.id;
         _loc2_.rank = param1.from;
         _loc2_.rank2 = param1.to;
         _loc2_.reward = param1.reward;
         _loc2_.superReward = param1.cost;
         return _loc2_;
      }
      
      public static function obToStaticMineSweepRankRewardModel_score(param1:Object) : StaticMineSweepRankRewardModel
      {
         var _loc2_:StaticMineSweepRankRewardModel = new StaticMineSweepRankRewardModel();
         _loc2_.id = param1.id;
         _loc2_.rank = param1.score;
         _loc2_.reward = param1.reward;
         _loc2_.superReward = param1.cost;
         return _loc2_;
      }
      
      public static function obToStaticLuckTreeShopModel(param1:Object) : StaticLuckTreeShopModel
      {
         var _loc2_:StaticLuckTreeShopModel = new StaticLuckTreeShopModel();
         _loc2_.id = param1.pos;
         _loc2_.item = param1.reward;
         _loc2_.cost = param1.cost;
         _loc2_.limit = param1.limit;
         _loc2_.kind = param1.kind;
         return _loc2_;
      }
      
      public static function obToStaticZhuanPanCostModel(param1:Object) : StaticZhuanPanCostModel
      {
         var _loc2_:StaticZhuanPanCostModel = new StaticZhuanPanCostModel();
         _loc2_.kind = int(param1.kind) + 1;
         _loc2_.cost = param1.cost2;
         _loc2_.costsup = param1.cost;
         return _loc2_;
      }
      
      public static function obToStaticZhuanPanRewardModel(param1:Object) : StaticZhuanPanRewardModel
      {
         var _loc2_:StaticZhuanPanRewardModel = new StaticZhuanPanRewardModel();
         _loc2_.kind = int(param1.kind) + 1;
         _loc2_.rewards = param1.reward;
         _loc2_.suprewards = param1.cost;
         _loc2_.rank = param1.from + ":" + param1.to;
         return _loc2_;
      }
      
      public static function obToStaticZhuanPanShopModel(param1:Object) : StaticZhuanPanShopModel
      {
         var _loc2_:StaticZhuanPanShopModel = new StaticZhuanPanShopModel();
         _loc2_.kind = int(param1.kind) + 1;
         _loc2_.limitnum = param1.limit;
         _loc2_.limittype = 1;
         _loc2_.currres = param1.cost;
         _loc2_.orires = param1.cost;
         _loc2_.item = param1.reward;
         _loc2_.id = param1.pos;
         return _loc2_;
      }
      
      public static function obToStaticZhuanPanItemModel(param1:Object) : StaticZhuanPanItemModel
      {
         var _loc2_:StaticZhuanPanItemModel = new StaticZhuanPanItemModel();
         _loc2_.kind = int(param1.kind) + 1;
         _loc2_.id = param1.d_id;
         _loc2_.item = param1.drop_type + ":" + param1.drop_id + ":" + param1.number;
         _loc2_.supweight = param1.issuper;
         return _loc2_;
      }
   }
}
