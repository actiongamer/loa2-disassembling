package nslm2.modules.funnies.dials.model
{
   import proto.ZhuanPanInfoRes;
   import com.mz.core.utils.DictHash;
   import proto.StaticZhuanPanCostModel;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import com.mz.core.utils.ArrayUtil;
   import proto.StaticZhuanPanItemModel;
   import nslm2.common.vo.WealthVo;
   import nslm2.utils.WealthUtil;
   import proto.StaticZhuanPanRewardModel;
   import nslm2.modules.funnies.dials.vos.DialRewardVo;
   import proto.StaticMineSweepRankRewardModel;
   import proto.ZhuanPanBuyItemInfo;
   import proto.StaticZhuanPanShopModel;
   import nslm2.common.model.PlayerModel;
   import nslm2.common.model.OpActivityStaticDataModel;
   import nslm2.modules.funnies.dials.consts.DialConsts;
   import proto.StaticOpActivityTmModel;
   import nslm2.utils.ServerTimer;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.TimeUtils;
   import nslm2.utils.RTools;
   import proto.Reward;
   import nslm2.utils.Uint64Util;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleRedPointMsg;
   import proto.ZhuanPanScoreMemer;
   
   public class DialModel
   {
      
      public static var TYPE:int = 60800;
      
      private static var _insLib:Object = {};
       
      
      public var multiCount:int = 10;
      
      private var _type:int;
      
      public var zhuanPanInfoRes:ZhuanPanInfoRes;
      
      public var record:Array;
      
      public var superRecord:Array;
      
      public var costDict:DictHash;
      
      public var costMultiDict:DictHash;
      
      public var itemModelGetted:Boolean;
      
      public var itemDict:DictHash;
      
      public var rewardModelGetted:Boolean;
      
      public var rewardDict:DictHash;
      
      public var scoregets:Array;
      
      public var scoreModelArr:Array;
      
      public var shopBuyInfoDict:DictHash;
      
      public var shopModelGetted:Boolean;
      
      public var shopDict:DictHash;
      
      public var shopCostDict:DictHash;
      
      public var tempBagDict:DictHash;
      
      public var tempSuperBagDict:DictHash;
      
      public var rankMemberInfoDict:DictHash;
      
      public var shangbangMin:int;
      
      public var chaojiMin:int;
      
      public var msg_0_0:String;
      
      public var msg_0_1:String;
      
      public var msg_1_0:String;
      
      public var msg_1_1:String;
      
      public function DialModel(param1:int)
      {
         record = [];
         superRecord = [];
         costDict = new DictHash();
         costMultiDict = new DictHash();
         shopBuyInfoDict = new DictHash();
         shopDict = new DictHash();
         shopCostDict = new DictHash();
         tempBagDict = new DictHash();
         tempSuperBagDict = new DictHash();
         shangbangMin = DefindConsts.DIAL_CONDITION;
         chaojiMin = DefindConsts.DIAL_SUPER;
         super();
         _type = param1;
         initCost([]);
      }
      
      public static function getIns(param1:int = 60800) : DialModel
      {
         if(_insLib.hasOwnProperty(param1) == false)
         {
            _insLib[param1] = new DialModel(param1);
         }
         return _insLib[param1];
      }
      
      public static function get ins() : DialModel
      {
         if(getIns(TYPE) == null)
         {
            _insLib[TYPE] = new DialModel(TYPE);
         }
         return getIns(TYPE);
      }
      
      public function get isModelAllGetted() : Boolean
      {
         return itemModelGetted && rewardModelGetted && shopModelGetted;
      }
      
      public function initCost(param1:Array) : void
      {
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc4_:int = 0;
         var _loc7_:* = null;
         var _loc6_:* = null;
         costDict = new DictHash();
         costMultiDict = new DictHash();
         var _loc2_:StaticZhuanPanCostModel = getSModelByKind(param1,1);
         if(_loc2_)
         {
            _loc4_ = getRealCostKind(1,_loc2_.costKind);
            _loc3_ = initCostModel(_loc2_.cost,DefindConsts.DIAL_NOR_COST_DIAMOND,_loc2_.costsup,DefindConsts.DIAL_NOR_COST_ITEM,_loc4_);
            _loc5_ = initCostModel(_loc2_.cost,DefindConsts.DIAL_NOR_COST_DIAMOND,_loc2_.costsup,DefindConsts.DIAL_NOR_COST_ITEM,_loc4_);
         }
         else
         {
            _loc4_ = getRealCostKind(1,0);
            _loc3_ = initCostModel("",DefindConsts.DIAL_NOR_COST_DIAMOND,"",DefindConsts.DIAL_NOR_COST_ITEM,_loc4_);
            _loc5_ = initCostModel("",DefindConsts.DIAL_NOR_COST_DIAMOND,"",DefindConsts.DIAL_NOR_COST_ITEM,_loc4_);
         }
         var _loc8_:* = getRealCostKind(1,_loc3_.costKind);
         _loc3_.costKind = _loc8_;
         _loc5_.costKind = _loc8_;
         _loc8_ = 1;
         _loc3_.kind = _loc8_;
         _loc5_.kind = _loc8_;
         costDict.put(1,_loc3_);
         changeCostToTen(_loc5_);
         costMultiDict.put(1,_loc5_);
         _loc2_ = getSModelByKind(param1,2);
         if(_loc2_)
         {
            _loc4_ = getRealCostKind(2,_loc2_.costKind);
            _loc7_ = initCostModel(_loc2_.cost,DefindConsts.DIAL_SUP_COST_DIAMOND,_loc2_.costsup,DefindConsts.DIAL_SUP_COST_ITEM,_loc4_);
            _loc6_ = initCostModel(_loc2_.cost,DefindConsts.DIAL_SUP_COST_DIAMOND,_loc2_.costsup,DefindConsts.DIAL_SUP_COST_ITEM,_loc4_);
         }
         else
         {
            _loc4_ = getRealCostKind(2,0);
            _loc7_ = initCostModel("",DefindConsts.DIAL_SUP_COST_DIAMOND,"",DefindConsts.DIAL_SUP_COST_ITEM,_loc4_);
            _loc6_ = initCostModel("",DefindConsts.DIAL_SUP_COST_DIAMOND,"",DefindConsts.DIAL_SUP_COST_ITEM,_loc4_);
         }
         _loc8_ = 2;
         _loc7_.kind = _loc8_;
         _loc6_.kind = _loc8_;
         costDict.put(2,_loc7_);
         changeCostToTen(_loc6_);
         costMultiDict.put(2,_loc6_);
      }
      
      private function changeCostToTen(param1:StaticZhuanPanCostModel) : void
      {
         var _loc2_:* = null;
         if(param1.cost)
         {
            _loc2_ = param1.cost.split(":");
            _loc2_[2] = _loc2_[2] * multiCount;
            param1.cost = _loc2_.join(":");
         }
         if(param1.costsup)
         {
            _loc2_ = param1.costsup.split(":");
            _loc2_[2] = _loc2_[2] * multiCount;
            param1.costsup = _loc2_.join(":");
         }
      }
      
      private function getRealCostKind(param1:int, param2:int) : int
      {
         if(param1 == 2)
         {
            return param2;
         }
         if(param2 == 0)
         {
            return 2;
         }
         if(param2 == 2)
         {
            return 0;
         }
         return param2;
      }
      
      private function getSModelByKind(param1:Array, param2:int) : StaticZhuanPanCostModel
      {
         var _loc3_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < param1.length)
         {
            if(param1[_loc3_].kind == param2)
            {
               return param1[_loc3_];
            }
            _loc3_++;
         }
         return null;
      }
      
      private function initCostModel(param1:String, param2:String, param3:String, param4:String, param5:int) : StaticZhuanPanCostModel
      {
         var _loc6_:StaticZhuanPanCostModel = new StaticZhuanPanCostModel();
         _loc6_.cost = "";
         _loc6_.costsup = "";
         if(param5 == 0 || param5 == 2)
         {
            if(isCostNull(param1))
            {
               _loc6_.cost = param2;
            }
            else
            {
               _loc6_.cost = param1;
            }
         }
         if(param5 == 1)
         {
            if(isCostNull(param3))
            {
               _loc6_.cost = param4;
            }
            else
            {
               _loc6_.cost = param3;
            }
         }
         else if(param5 == 2)
         {
            if(isCostNull(param3))
            {
               _loc6_.costsup = param4;
            }
            else
            {
               _loc6_.costsup = param3;
            }
         }
         return _loc6_;
      }
      
      private function isCostNull(param1:String) : Boolean
      {
         if(param1 == null || param1 == "" || param1 == "0")
         {
            return true;
         }
         var _loc2_:Array = param1.split(":");
         if(_loc2_[_loc2_.length - 1] == "0")
         {
            return true;
         }
         return false;
      }
      
      public function getCostByKind(param1:int, param2:Boolean) : StaticZhuanPanCostModel
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(!param2)
         {
            _loc5_ = costDict.array;
            _loc6_ = ArrayUtil.findByAttr(_loc5_,StaticZhuanPanCostModel.KIND.name,param1);
            return _loc6_;
         }
         _loc3_ = costMultiDict.array;
         _loc4_ = ArrayUtil.findByAttr(_loc3_,StaticZhuanPanCostModel.KIND.name,param1);
         return _loc4_;
      }
      
      public function initItem(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         itemDict = new DictHash();
         var _loc3_:int = param1.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = param1[_loc4_];
            itemDict.put(_loc2_.id,_loc2_);
            _loc4_++;
         }
         itemModelGetted = _loc3_ > 0;
      }
      
      public function getItemModel(param1:int) : StaticZhuanPanItemModel
      {
         if(itemDict)
         {
            return itemDict.getValue(param1);
         }
         return null;
      }
      
      public function getItemIdByWealthVo(param1:WealthVo, param2:int) : int
      {
         var _loc7_:int = 0;
         var _loc6_:* = null;
         var _loc3_:* = null;
         var _loc5_:Array = itemDict.array;
         var _loc4_:int = _loc5_.length;
         _loc7_ = 0;
         while(_loc7_ < _loc4_)
         {
            _loc6_ = _loc5_[_loc7_];
            _loc3_ = WealthUtil.parseCostStr(_loc6_.item);
            if(param1.kind == _loc3_.kind && param1.count == _loc3_.count && param1.sid == _loc3_.sid && _loc6_.kind == param2)
            {
               return _loc6_.id;
            }
            _loc7_++;
         }
         return -1;
      }
      
      public function getItemArrByKind(param1:int) : Array
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         if(itemDict)
         {
            _loc3_ = itemDict.array;
            _loc2_ = ArrayUtil.findArrByAttr(_loc3_,StaticZhuanPanItemModel.KIND.name,param1);
            return _loc2_.sortOn(StaticZhuanPanItemModel.ID.name,16);
         }
         return [];
      }
      
      public function initReward(param1:Array) : void
      {
         var _loc6_:int = 0;
         var _loc4_:* = null;
         var _loc2_:* = null;
         var _loc5_:int = 0;
         rewardDict = new DictHash();
         var _loc3_:int = param1.length;
         _loc6_ = 0;
         while(_loc6_ < _loc3_)
         {
            _loc4_ = param1[_loc6_];
            _loc2_ = _loc4_.rank.split(":");
            _loc5_ = _loc2_[0];
            while(_loc5_ <= _loc2_[1])
            {
               rewardDict.put(_loc5_,new DialRewardVo(_loc5_,_loc4_));
               _loc5_++;
            }
            _loc6_++;
         }
         rewardModelGetted = _loc3_ > 0;
      }
      
      public function initScoreModel(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         scoreModelArr = [];
         var _loc2_:int = param1.length;
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = param1[_loc4_];
            scoreModelArr.push(_loc3_);
            _loc4_++;
         }
         scoreModelArr.sortOn(StaticMineSweepRankRewardModel.RANK.name,16);
      }
      
      public function getRankScoreModelById(param1:uint) : StaticMineSweepRankRewardModel
      {
         return ArrayUtil.findByAttr(this.scoreModelArr,StaticMineSweepRankRewardModel.RANK.name,param1);
      }
      
      public function scoreRewardState(param1:int) : int
      {
         var _loc2_:* = null;
         if(scoregets == null || scoregets.indexOf(param1) == -1)
         {
            _loc2_ = this.getRankScoreModelById(param1);
            if(_loc2_)
            {
               if(this.getMyScore() >= _loc2_.rank)
               {
                  return 2;
               }
               return 1;
            }
            return 1;
         }
         return 3;
      }
      
      public function get rewardArr() : Array
      {
         var _loc1_:Array = rewardDict.array;
         return _loc1_.sortOn("rank",16);
      }
      
      public function initShopBuyInfo(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         shopBuyInfoDict = new DictHash();
         var _loc2_:int = param1.length;
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = param1[_loc4_];
            shopBuyInfoDict.put(_loc3_.itemid,_loc3_);
            _loc4_++;
         }
      }
      
      public function initShop(param1:Array) : void
      {
         var _loc5_:int = 0;
         var _loc4_:* = null;
         var _loc3_:* = null;
         shopDict = new DictHash();
         var _loc2_:int = param1.length;
         _loc5_ = 0;
         while(_loc5_ < _loc2_)
         {
            _loc4_ = param1[_loc5_];
            shopDict.put(_loc4_.id,_loc4_);
            _loc3_ = WealthUtil.parseCostStr(_loc4_.currres);
            _loc3_.useStcCount = true;
            if(!checkExist(_loc3_))
            {
               shopCostDict.put(_loc4_.kind,_loc3_);
            }
            _loc5_++;
         }
         shopModelGetted = _loc2_ > 0;
      }
      
      private function checkExist(param1:WealthVo) : Boolean
      {
         var _loc4_:int = 0;
         var _loc3_:* = shopCostDict.array;
         for each(var _loc2_ in shopCostDict.array)
         {
            if(_loc2_.itemId == param1.itemId && _loc2_.kind == param1.kind)
            {
               return true;
            }
         }
         return false;
      }
      
      public function getCostWealthVoArr() : Array
      {
         return shopCostDict.array;
      }
      
      public function isShopCostWealthVo(param1:int) : Boolean
      {
         var _loc5_:int = 0;
         var _loc4_:* = null;
         var _loc3_:Array = getCostWealthVoArr();
         var _loc2_:int = _loc3_.length;
         _loc5_ = 0;
         while(_loc5_ < _loc2_)
         {
            _loc4_ = _loc3_[_loc5_];
            if(_loc4_.kind == param1)
            {
               return true;
            }
            _loc5_++;
         }
         return false;
      }
      
      public function getShopModel(param1:int) : StaticZhuanPanShopModel
      {
         if(shopDict)
         {
            return shopDict.getValue(param1);
         }
         return null;
      }
      
      public function getBuyedTimes(param1:int) : int
      {
         var _loc2_:ZhuanPanBuyItemInfo = shopBuyInfoDict.getValue(param1);
         if(_loc2_)
         {
            return _loc2_.count;
         }
         return 0;
      }
      
      public function hasLeftToBuy(param1:int) : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:StaticZhuanPanShopModel = shopDict.getValue(param1);
         if(_loc3_.limitnum == 0)
         {
            return true;
         }
         _loc2_ = shopBuyInfoDict.getValue(param1);
         if(_loc2_ && _loc2_.count >= _loc3_.limitnum)
         {
            return false;
         }
         return true;
      }
      
      public function getCanBuyMaxCount(param1:int) : int
      {
         var _loc3_:int = 0;
         var _loc6_:int = 0;
         var _loc4_:StaticZhuanPanShopModel = shopDict.getValue(param1);
         var _loc5_:Array = WealthUtil.costStrToArr(_loc4_.currres);
         var _loc2_:int = 999;
         _loc6_ = 0;
         while(_loc6_ < _loc5_.length)
         {
            _loc2_ = Math.min(_loc2_,PlayerModel.ins.getCountByWealthVo(_loc5_[_loc6_]) / _loc5_[_loc6_].count);
            _loc6_++;
         }
         if(_loc4_.limitnum != 0)
         {
            _loc3_ = _loc4_.limitnum - this.getBuyedTimes(param1);
            return Math.min(_loc2_,_loc3_);
         }
         return _loc2_;
      }
      
      public function isDialOpen() : Boolean
      {
         var _loc1_:* = null;
         if(_type == 60810)
         {
            _loc1_ = OpActivityStaticDataModel.ins.getActivityOpenTime(DialConsts.timeKind_funny);
         }
         else
         {
            _loc1_ = OpActivityStaticDataModel.ins.getActivityOpenTime(4);
         }
         if(_loc1_)
         {
            return ServerTimer.ins.second >= _loc1_.startTm && ServerTimer.ins.second <= _loc1_.endTm;
         }
         return false;
      }
      
      public function getDialTimeStr() : String
      {
         var _loc1_:* = null;
         if(_type == 60810)
         {
            _loc1_ = OpActivityStaticDataModel.ins.getActivityOpenTime(DialConsts.timeKind_funny);
         }
         else
         {
            _loc1_ = OpActivityStaticDataModel.ins.getActivityOpenTime(4);
         }
         if(_loc1_)
         {
            return LocaleMgr.ins.getStr(60800013,[TimeUtils.getFullTimeStrCN(_loc1_.startTm,false,false,RTools.cl(false,true),false),TimeUtils.getFullTimeStrCN(_loc1_.endTm,false,false,RTools.cl(false,true),false)]);
         }
         return "";
      }
      
      public function isEventOpen() : Boolean
      {
         var _loc1_:* = null;
         if(_type == 60810)
         {
            _loc1_ = OpActivityStaticDataModel.ins.getActivityOpenTime(DialConsts.timeKind_all);
         }
         else
         {
            _loc1_ = OpActivityStaticDataModel.ins.getActivityOpenTime(7);
         }
         if(_loc1_)
         {
            return ServerTimer.ins.second >= _loc1_.startTm && ServerTimer.ins.second <= _loc1_.endTm;
         }
         return false;
      }
      
      public function getEventTimeStr() : String
      {
         var _loc1_:* = null;
         if(_type == 60810)
         {
            _loc1_ = OpActivityStaticDataModel.ins.getActivityOpenTime(DialConsts.timeKind_all);
         }
         else
         {
            _loc1_ = OpActivityStaticDataModel.ins.getActivityOpenTime(7);
         }
         if(_loc1_)
         {
            return LocaleMgr.ins.getStr(60800013,[TimeUtils.getFullTimeStrCN(_loc1_.startTm,false,false,RTools.cl(false,true),false),TimeUtils.getFullTimeStrCN(_loc1_.endTm,false,false,RTools.cl(false,true),false)]);
         }
         return "";
      }
      
      public function getMyScore() : int
      {
         if(this.zhuanPanInfoRes && this.zhuanPanInfoRes.member)
         {
            return this.zhuanPanInfoRes.member.score;
         }
         return 0;
      }
      
      public function addToTempBag(param1:Array, param2:Boolean) : void
      {
         var _loc7_:int = 0;
         var _loc5_:* = null;
         var _loc4_:* = null;
         var _loc6_:DictHash = !!param2?tempSuperBagDict:tempBagDict;
         var _loc3_:int = param1.length;
         _loc7_ = 0;
         while(_loc7_ < _loc3_)
         {
            _loc5_ = param1[_loc7_];
            if(_loc5_.dropId != 0)
            {
               _loc4_ = _loc6_.getValue(_loc5_.dropId);
               if(_loc4_)
               {
                  _loc4_.count = _loc4_.count + Uint64Util.toInt(_loc5_.count);
               }
               else
               {
                  _loc6_.put(_loc5_.dropId,WealthUtil.rewardToVo(_loc5_));
               }
            }
            else
            {
               _loc4_ = _loc6_.getValue(_loc5_.dropType);
               if(_loc4_)
               {
                  _loc4_.count = _loc4_.count + Uint64Util.toInt(_loc5_.count);
               }
               else
               {
                  _loc6_.put(_loc5_.dropType,WealthUtil.rewardToVo(_loc5_));
               }
            }
            _loc7_++;
         }
      }
      
      public function getTempBagData(param1:Boolean) : Array
      {
         var _loc5_:int = 0;
         var _loc4_:DictHash = !!param1?tempSuperBagDict:tempBagDict;
         var _loc3_:Array = _loc4_.array;
         var _loc2_:int = _loc3_.length;
         _loc5_ = 0;
         while(_loc5_ < _loc3_.length)
         {
            _loc3_.sort(sortFunc);
            _loc5_++;
         }
         return _loc3_;
      }
      
      public function sortFunc(param1:WealthVo, param2:WealthVo) : int
      {
         if(param1.kind == 20 && param2.kind != 20)
         {
            return 1;
         }
         if(param1.kind != 20 && param2.kind == 20)
         {
            return -1;
         }
         if(param1.quality > param2.quality)
         {
            return -1;
         }
         if(param1.quality < param2.quality)
         {
            return 1;
         }
         return 0;
      }
      
      public function checkRedPoint() : Boolean
      {
         var _loc1_:Boolean = false;
         if(_type == 60810)
         {
            _loc1_ = canUseItemDial(1,false) || canUseItemDial(2,false) || hasItemCanBuy() || hasScoreCanGet();
         }
         else
         {
            _loc1_ = canUseItemDial(1,false) || canUseItemDial(2,false) || hasItemCanBuy();
         }
         if(_loc1_)
         {
            ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(_type,true));
            return true;
         }
         ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(_type,false));
         return false;
      }
      
      public function hasItemCanBuy() : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:Array = shopDict.array;
         var _loc1_:int = _loc2_.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_.length)
         {
            if(getCanBuyMaxCount((_loc2_[_loc3_] as StaticZhuanPanShopModel).id) > 0)
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public function hasScoreCanGet() : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc1_:* = null;
         if(this.scoreModelArr)
         {
            _loc2_ = this.scoreModelArr.length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc1_ = this.scoreModelArr[_loc3_];
               if(this.getMyScore() >= _loc1_.rank && scoreRewardState(_loc1_.rank) == 2)
               {
                  return true;
               }
               _loc3_++;
            }
         }
         return false;
      }
      
      public function getCurCostItemId(param1:int = 1) : int
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc4_:StaticZhuanPanCostModel = getCostByKind(param1,false);
         if(_loc4_)
         {
            _loc3_ = WealthUtil.parseCostStr(_loc4_.costsup);
         }
         if(_loc3_ == null || _loc3_.count == 0)
         {
            _loc2_ = WealthUtil.parseCostStr(_loc4_.cost);
            if(_loc2_.kind == 20)
            {
               _loc3_ = _loc2_;
            }
         }
         if(_loc3_)
         {
            return _loc3_.sid;
         }
         return 0;
      }
      
      public function canUseItemDial(param1:int, param2:Boolean) : Boolean
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         if(isDialOpen() == false)
         {
            return false;
         }
         var _loc5_:StaticZhuanPanCostModel = getCostByKind(param1,false);
         var _loc6_:StaticZhuanPanCostModel = getCostByKind(param1,true);
         if(_loc5_)
         {
            _loc4_ = WealthUtil.parseCostStr(_loc5_.costsup);
         }
         if(_loc6_)
         {
            _loc3_ = WealthUtil.parseCostStr(_loc6_.costsup);
         }
         if(param2 == false)
         {
            if(_loc4_)
            {
               return PlayerModel.ins.getCountByWealthVo(_loc4_) >= _loc4_.count;
            }
         }
         else if(_loc3_ == false)
         {
            return PlayerModel.ins.getCountByWealthVo(_loc3_) >= _loc3_.count;
         }
         return false;
      }
      
      public function initRankDict(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         rankMemberInfoDict = new DictHash();
         var _loc3_:int = param1.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = param1[_loc4_];
            rankMemberInfoDict.put(_loc2_.rank,_loc2_);
            _loc4_++;
         }
      }
   }
}
