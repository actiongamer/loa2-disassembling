package nslm2.modules.funnies.newYears.luckTrees.services
{
   import flash.events.EventDispatcher;
   import nslm2.common.service.OpActivityStaticServiceHandler;
   import com.mz.core.event.MzEvent;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.common.model.OpActivityStaticDataModel;
   import proto.StaticOpActivityTmModel;
   import nslm2.utils.ServerTimer;
   import nslm2.modules.bag.itemModuels.BagModel;
   import proto.StaticLuckTreeWorldRewardModel;
   import morn.core.utils.StringUtils;
   import proto.StaticLuckTreeScoreRewardModel;
   import proto.StaticLuckTreeShopModel;
   import proto.StaticLuckTreeLevelModel;
   import com.mz.core.utils.ArrayUtil;
   import proto.StaticLuckTreeRewardModel;
   import com.mz.core.utils.DictHash;
   import proto.LuckTreeBuyItemInfo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.WealthUtil;
   import nslm2.common.model.PlayerModel;
   import proto.MapKey32Value32;
   import proto.LuckTreeWorldExpNotify;
   import nslm2.nets.sockets.ServerEvent;
   import proto.LuckTreeDajiangNotify;
   import proto.LuckTreeDajiangRecord;
   import proto.LuckTreeInfoRes;
   import proto.LuckTreeInfoReq;
   import nslm2.nets.sockets.ServerEngine;
   import morn.core.handlers.Handler;
   import proto.LuckTreeInfoRes.getReward;
   import proto.LuckTreeCheerReq;
   import proto.LuckTreeCheerRes;
   import proto.LuckTreeBuyReq;
   import proto.LuckTreeBuyRes;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import flash.events.Event;
   import proto.LuckTreeGetRewardReq;
   import proto.LuckTreeGetRewardRes;
   import flash.events.IEventDispatcher;
   
   public class LuckTreeService extends EventDispatcher
   {
      
      public static const EVT_SHOP_BUY_CPL:String = "EVT_SHOP_BUY_CPL";
      
      public static const L50_LV:int = 4;
      
      public static const funcIdArr:Array = [13351,13352,13353,13354];
      
      public static const MSG_SWITCH_TIME_OVER:String = "MSG_SWITCH_TIME_OVER";
      
      public static const MSG_TAB_TO_WORLD_TREE:String = "MSG_TAB_TO_WORLD_TREE";
      
      public static const MSG_TAB_TO_PERSON_TREE:String = "MSG_TAB_TO_PERSON_TREE";
      
      public static const MSG_NEW_BIG_REWARD:String = "MSG_NEW_BIG_REWARD";
      
      public static const STATIC_DATA_CPL:String = "STATIC_DATA_CPL";
      
      public static const ITEM_1:int = 83210;
      
      private static var _ins:nslm2.modules.funnies.newYears.luckTrees.services.LuckTreeService;
      
      public static const DA_JIANG_KIND_GET_REWARD:int = 1;
      
      public static const DA_JIANG_KIND_PERSON_TREE_LVUP:int = 2;
      
      public static const DA_JIANG_KIND_WORLD_TREE_LVUP:int = 3;
       
      
      public var bagWealthVoList:Array;
      
      public var levelModelGetted:Boolean;
      
      public var levelModelArr:Array;
      
      public var rewardModelGetted:Boolean;
      
      public var rewardModelArr:Array;
      
      public var personRewardModelGetted:Boolean;
      
      public var personRewardArr:Array;
      
      public var worldRewardModelGetted:Boolean;
      
      public var worldRewardArr:Array;
      
      public var shopBuyInfoDict:DictHash;
      
      public var shopModelGetted:Boolean;
      
      public var shopDict:DictHash;
      
      public var spShopItem:StaticLuckTreeShopModel;
      
      public var shopKindList:Array;
      
      public var shopKindNameList:Array;
      
      public var daJiangRecords:Array;
      
      public var infoRes:LuckTreeInfoRes;
      
      public const kind_luckTreeCheer1:int = 1;
      
      public const kind_luckTreeCheer10:int = 2;
      
      public const kind_luckTreeCheer50:int = 3;
      
      public const KIND_REWARD_PERSON:int = 1;
      
      public const KIND_REWARD_WORD:int = 2;
      
      public function LuckTreeService(param1:IEventDispatcher = null)
      {
         bagWealthVoList = [];
         shopBuyInfoDict = new DictHash();
         shopDict = new DictHash();
         super(param1);
         ServerEngine.ins.addAlwayHandler(7461,server_worldExp_cpl);
         ServerEngine.ins.addAlwayHandler(7462,server_treeDajiang_cpl);
      }
      
      public static function get ins() : nslm2.modules.funnies.newYears.luckTrees.services.LuckTreeService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.funnies.newYears.luckTrees.services.LuckTreeService();
         }
         return _ins;
      }
      
      public function get isModelAllGetted() : Boolean
      {
         return this.levelModelGetted && this.rewardModelGetted && this.personRewardModelGetted && this.worldRewardModelGetted && this.shopModelGetted;
      }
      
      public function requestStaticData() : void
      {
         var _loc1_:Array = [];
         if(this.levelModelGetted == false)
         {
            _loc1_.push(9);
         }
         if(this.rewardModelGetted == false)
         {
            _loc1_.push(10);
         }
         if(this.worldRewardModelGetted == false)
         {
            _loc1_.push(11);
         }
         if(this.personRewardModelGetted == false)
         {
            _loc1_.push(12);
         }
         if(this.shopModelGetted == false)
         {
            _loc1_.push(13);
         }
         OpActivityStaticServiceHandler.ins.requestStaticData(_loc1_,getStaticDataCpl);
      }
      
      private function getStaticDataCpl() : void
      {
         this.dispatchEvent(new MzEvent("STATIC_DATA_CPL"));
         this.checkRedPoint();
      }
      
      public function addBagWealthVo(param1:WealthVo) : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = null;
         _loc3_ = 0;
         while(_loc3_ < bagWealthVoList.length)
         {
            _loc2_ = bagWealthVoList[_loc3_];
            if(_loc2_.kind == param1.kind && _loc2_.itemId == param1.itemId)
            {
               _loc2_.count = _loc2_.count + param1.count;
               return;
            }
            _loc3_++;
         }
         _loc2_ = param1.clone();
         bagWealthVoList.push(_loc2_);
      }
      
      public function checkRedPoint() : void
      {
         var _loc1_:Boolean = false;
         if(infoRes)
         {
            if(this.isModelAllGetted)
            {
               _loc1_ = checkRedPoi_personTree();
               _loc1_ = checkRedPoi_worldTree() || _loc1_;
               checkRedPoi_shopTree();
               _loc1_ = checkRedPoi_scoreTree() || _loc1_;
               NpcFuncService.ins.changeCount(13350,!!_loc1_?1:0);
            }
            else
            {
               NpcFuncService.ins.changeCount(13350,0);
            }
         }
      }
      
      private function checkRedPoi_personTree() : Boolean
      {
         var _loc1_:StaticOpActivityTmModel = OpActivityStaticDataModel.ins.getActivityOpenTime(10);
         if(ServerTimer.ins.second > _loc1_.endTm)
         {
            return false;
         }
         if(BagModel.ins.getStcCount(83210) > 0)
         {
            NpcFuncService.ins.changeCount(13351,1);
            return true;
         }
         NpcFuncService.ins.changeCount(13351,0);
         return false;
      }
      
      private function checkRedPoi_worldTree() : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc1_:* = null;
         if(this.worldRewardArr)
         {
            _loc2_ = this.worldRewardArr.length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc1_ = this.worldRewardArr[_loc3_];
               if(StringUtils.isNull(_loc1_.item) == false && infoRes.currentlevel >= _loc1_.level && infoRes.member.levelw.indexOf(_loc1_.level) == -1)
               {
                  NpcFuncService.ins.changeCount(13352,1);
                  return true;
               }
               _loc3_++;
            }
         }
         NpcFuncService.ins.changeCount(13352,0);
         return false;
      }
      
      private function checkRedPoi_shopTree() : Boolean
      {
         if(shopDict && hasItemCanBuy())
         {
            NpcFuncService.ins.changeCount(13353,1);
            return true;
         }
         NpcFuncService.ins.changeCount(13353,0);
         return false;
      }
      
      private function checkRedPoi_scoreTree() : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc1_:* = null;
         if(this.personRewardArr)
         {
            _loc2_ = this.personRewardArr.length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc1_ = this.personRewardArr[_loc3_];
               if(infoRes.member.score >= _loc1_.score && infoRes.member.levelp.indexOf(_loc1_.score) == -1)
               {
                  NpcFuncService.ins.changeCount(13354,1);
                  return true;
               }
               _loc3_++;
            }
         }
         NpcFuncService.ins.changeCount(13354,0);
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
            if(getCanBuyMaxCount((_loc2_[_loc3_] as StaticLuckTreeShopModel).id) > 0)
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public function isEventOpen() : Boolean
      {
         var _loc1_:StaticOpActivityTmModel = OpActivityStaticDataModel.ins.getActivityOpenTime(13);
         if(_loc1_)
         {
            return ServerTimer.ins.second >= _loc1_.startTm && ServerTimer.ins.second <= _loc1_.endTm;
         }
         return false;
      }
      
      public function initLevelModel(param1:Array) : void
      {
         this.levelModelArr = param1.concat();
         this.levelModelArr.sortOn(StaticLuckTreeLevelModel.LEVEL.name,16);
         this.levelModelGetted = this.levelModelArr.length > 0;
      }
      
      public function getPersonTreeLevelMax() : int
      {
         if(this.levelModelArr)
         {
            return (this.levelModelArr[this.levelModelArr.length - 1] as StaticLuckTreeLevelModel).level;
         }
         return 0;
      }
      
      public function getLevelModelByLv(param1:int) : StaticLuckTreeLevelModel
      {
         return ArrayUtil.findByAttr(this.levelModelArr,StaticLuckTreeLevelModel.LEVEL.name,param1);
      }
      
      public function initRewardModel(param1:Array) : void
      {
         this.rewardModelArr = param1.concat();
         this.levelModelArr.sortOn(StaticLuckTreeRewardModel.ID.name,16);
         this.rewardModelGetted = this.rewardModelArr.length > 0;
      }
      
      public function getRewardById(param1:uint) : StaticLuckTreeRewardModel
      {
         return ArrayUtil.findByAttr(this.rewardModelArr,StaticLuckTreeRewardModel.ID.name,param1);
      }
      
      public function getRewardArrByLv(param1:int) : Array
      {
         var _loc2_:Array = ArrayUtil.findArrByAttr(this.rewardModelArr,StaticLuckTreeRewardModel.LEVEL.name,param1);
         return _loc2_;
      }
      
      public function initPersonReward(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         personRewardModelGetted = false;
         personRewardArr = [];
         var _loc2_:int = param1.length;
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = param1[_loc4_];
            personRewardArr.push(_loc3_);
            _loc4_++;
         }
         personRewardModelGetted = _loc2_ > 0;
         personRewardArr.sortOn(StaticLuckTreeScoreRewardModel.SCORE.name,16);
      }
      
      public function initWorldReward(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         worldRewardModelGetted = false;
         worldRewardArr = [];
         var _loc2_:int = param1.length;
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = param1[_loc4_];
            worldRewardArr.push(_loc3_);
            _loc4_++;
         }
         worldRewardModelGetted = _loc2_ > 0;
         worldRewardArr.sortOn(StaticLuckTreeWorldRewardModel.LEVEL.name,16);
      }
      
      public function getWorldTreeLevelMax() : int
      {
         if(this.worldRewardArr)
         {
            return (this.worldRewardArr[this.worldRewardArr.length - 1] as StaticLuckTreeWorldRewardModel).level;
         }
         return 0;
      }
      
      public function getWorldRewardByLv(param1:int) : StaticLuckTreeWorldRewardModel
      {
         return ArrayUtil.findByAttr(this.worldRewardArr,StaticLuckTreeWorldRewardModel.LEVEL.name,param1);
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
         var _loc4_:int = 0;
         var _loc3_:* = null;
         shopDict = new DictHash();
         shopKindList = [];
         shopKindNameList = [];
         var _loc2_:int = param1.length;
         param1 = param1.sortOn("id",16);
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = param1[_loc4_];
            if(_loc3_.kind == 99)
            {
               spShopItem = _loc3_;
            }
            else
            {
               shopDict.put(_loc3_.id,_loc3_);
               if(shopKindList.indexOf(_loc3_.kind) < 0)
               {
                  shopKindList.push(_loc3_.kind);
                  if(_loc3_.kind == 0)
                  {
                     shopKindNameList.push(LocaleMgr.ins.getStr(11200200));
                  }
                  else
                  {
                     shopKindNameList.push(LocaleMgr.ins.getStr(_loc3_.kindName));
                  }
               }
            }
            _loc4_++;
         }
         shopModelGetted = _loc2_ > 0;
      }
      
      public function getShopItemByKind(param1:int) : Array
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         var _loc2_:Array = [];
         var _loc5_:Array = shopDict.array;
         _loc4_ = 0;
         while(_loc4_ < _loc5_.length)
         {
            _loc3_ = _loc5_[_loc4_] as StaticLuckTreeShopModel;
            if(_loc3_.kind == param1)
            {
               _loc2_.push(_loc3_);
            }
            _loc4_++;
         }
         return _loc2_;
      }
      
      public function getShopModel(param1:int) : StaticLuckTreeShopModel
      {
         if(shopDict)
         {
            return shopDict.getValue(param1);
         }
         return null;
      }
      
      public function getBuyedTimes(param1:int) : int
      {
         var _loc2_:LuckTreeBuyItemInfo = shopBuyInfoDict.getValue(param1);
         if(_loc2_)
         {
            return _loc2_.count;
         }
         return 0;
      }
      
      public function hasLeftToBuy(param1:int) : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:StaticLuckTreeShopModel = shopDict.getValue(param1);
         if(_loc3_.limit == 0)
         {
            return true;
         }
         _loc2_ = shopBuyInfoDict.getValue(param1);
         if(_loc2_ && _loc2_.count >= _loc3_.limit)
         {
            return false;
         }
         return true;
      }
      
      public function getCanBuyMaxCount(param1:int) : int
      {
         var _loc3_:int = 0;
         var _loc6_:int = 0;
         var _loc4_:StaticLuckTreeShopModel = shopDict.getValue(param1);
         var _loc5_:Array = WealthUtil.costStrToArr(_loc4_.cost);
         var _loc2_:int = 999;
         _loc6_ = 0;
         while(_loc6_ < _loc5_.length)
         {
            _loc2_ = Math.min(_loc2_,PlayerModel.ins.getCountByWealthVo(_loc5_[_loc6_]) / _loc5_[_loc6_].count);
            _loc6_++;
         }
         if(_loc4_.limit != 0)
         {
            _loc3_ = _loc4_.limit - this.getBuyedTimes(param1);
            return Math.min(_loc2_,_loc3_);
         }
         return _loc2_;
      }
      
      public function getSpItemResBuyCount(param1:Boolean = true) : int
      {
         var _loc3_:int = 0;
         var _loc6_:int = 0;
         var _loc5_:Array = WealthUtil.costStrToArr(spShopItem.cost);
         var _loc2_:int = 999;
         if(param1)
         {
            _loc6_ = 0;
            while(_loc6_ < _loc5_.length)
            {
               _loc2_ = Math.min(_loc2_,PlayerModel.ins.getCountByWealthVo(_loc5_[_loc6_]) / _loc5_[_loc6_].count);
               _loc6_++;
            }
         }
         var _loc4_:int = getSpItemMaxBuyCount();
         if(_loc4_ != 0)
         {
            _loc3_ = _loc4_ - this.getBuyedTimes(spShopItem.id);
            return Math.min(_loc2_,_loc3_);
         }
         return _loc2_;
      }
      
      public function getSpItemMaxBuyCount() : int
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = spShopItem.vipLimit.length;
         var _loc1_:int = 0;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = spShopItem.vipLimit[_loc4_];
            if(_loc2_.key <= PlayerModel.ins.vip)
            {
               _loc1_ = _loc2_.value;
               _loc4_++;
               continue;
            }
            break;
         }
         return _loc1_;
      }
      
      private function server_worldExp_cpl(param1:LuckTreeWorldExpNotify, param2:ServerEvent) : void
      {
         if(infoRes)
         {
            infoRes.currentlevel = param1.level;
            infoRes.currentexp = param1.exp;
            this.checkRedPoint();
         }
      }
      
      public function worldRewardState(param1:int) : int
      {
         if(infoRes.member.levelw.indexOf(param1) == -1)
         {
            if(infoRes.currentlevel >= param1)
            {
               return 2;
            }
            return 1;
         }
         return 3;
      }
      
      public function personRewardState(param1:int) : int
      {
         if(infoRes.member.levelp.indexOf(param1) == -1)
         {
            if(infoRes.member.score >= param1)
            {
               return 2;
            }
            return 1;
         }
         return 3;
      }
      
      private function server_treeDajiang_cpl(param1:LuckTreeDajiangNotify, param2:ServerEvent) : void
      {
         if(param1.records && param1.records.length > 0)
         {
            daJiangRecords = param1.records;
         }
         this.checkMaxLv();
         if(param1.newadd && param1.newadd.length > 0)
         {
            if(daJiangRecords != null)
            {
               daJiangRecords = daJiangRecords.concat(param1.newadd);
            }
            this.dispatchEvent(new MzEvent("MSG_NEW_BIG_REWARD",param1.newadd));
         }
      }
      
      private function checkMaxLv() : void
      {
         var _loc1_:* = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:* = null;
         if(this.daJiangRecords)
         {
            _loc3_ = this.daJiangRecords.length;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc2_ = this.daJiangRecords[_loc4_];
               if(_loc2_.kind == 3 && (_loc1_ == null || _loc1_.level < _loc2_.level))
               {
                  _loc1_ = _loc2_;
               }
               _loc4_++;
            }
            if(_loc1_ == null)
            {
               return;
            }
            _loc4_ = _loc3_ - 1;
            while(_loc4_ >= 0)
            {
               _loc2_ = this.daJiangRecords[_loc4_];
               if(_loc2_.kind == 3 && _loc1_ != _loc2_)
               {
                  this.daJiangRecords.splice(_loc4_,1);
               }
               _loc4_--;
            }
         }
      }
      
      public function initServerOnLine(param1:LuckTreeInfoRes) : void
      {
         this.infoRes = param1;
         if(this.isModelAllGetted)
         {
            this.checkRedPoint();
         }
      }
      
      public function server_luckTreeInfo(param1:Function) : void
      {
         daJiangRecords = null;
         var _loc2_:LuckTreeInfoReq = new LuckTreeInfoReq();
         ServerEngine.ins.send(7457,_loc2_,new Handler(server_treeInfo_cpl,[param1]));
      }
      
      private function server_treeInfo_cpl(param1:*, param2:LuckTreeInfoRes, param3:ServerEvent) : void
      {
         var _loc6_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         this.infoRes = param2;
         this.initShopBuyInfo(param2.member.buyinfo);
         bagWealthVoList = [];
         _loc6_ = 0;
         while(_loc6_ < param2.rewards.length)
         {
            _loc4_ = param2.rewards[_loc6_];
            _loc5_ = WealthUtil.createWealthVo(_loc4_.kind,_loc4_.id,_loc4_.count);
            addBagWealthVo(_loc5_);
            _loc6_++;
         }
         this.checkRedPoint();
         if(param1)
         {
            Handler.execute(param1,[param2,param3]);
         }
      }
      
      public function server_luckTreeCheer(param1:uint, param2:Function) : void
      {
         var _loc3_:LuckTreeCheerReq = new LuckTreeCheerReq();
         _loc3_.kind = param1;
         ServerEngine.ins.send(7458,_loc3_,new Handler(server_treeCheer_cpl,[param2]));
      }
      
      private function server_treeCheer_cpl(param1:*, param2:LuckTreeCheerRes, param3:ServerEvent) : void
      {
         this.infoRes.member.curexp = param2.newexp;
         this.infoRes.member.curlevel = param2.newlevel;
         this.infoRes.member.score = param2.score;
         this.checkRedPoint();
         if(param1)
         {
            Handler.execute(param1,[param2,param3]);
         }
      }
      
      public function server_luckTreeBuy(param1:uint, param2:uint, param3:Function = null) : void
      {
         var _loc4_:LuckTreeBuyReq = new LuckTreeBuyReq();
         _loc4_.itemid = param1;
         _loc4_.count = param2;
         ServerEngine.ins.send(7459,_loc4_,new Handler(server_treeBuy_cpl,[param3]));
      }
      
      private function server_treeBuy_cpl(param1:*, param2:LuckTreeBuyRes, param3:ServerEvent) : void
      {
         this.shopBuyInfoDict.put(param2.buyinfo.itemid,param2.buyinfo);
         FloatUtil.showGetItemsDisplayPanel(WealthUtil.rewardArrToWealthVoArr(param2.rewards));
         this.checkRedPoint();
         if(param1)
         {
            Handler.execute(param1,[param2,param3]);
         }
         this.dispatchEvent(new Event("EVT_SHOP_BUY_CPL"));
      }
      
      public function server_luckTreeGetReward(param1:uint, param2:uint, param3:Function) : void
      {
         var _loc4_:LuckTreeGetRewardReq = new LuckTreeGetRewardReq();
         _loc4_.kind = param1;
         _loc4_.level = param2;
         ServerEngine.ins.send(7460,_loc4_,new Handler(server_getReward_cpl,[param3]));
      }
      
      private function server_getReward_cpl(param1:*, param2:LuckTreeGetRewardRes, param3:ServerEvent) : void
      {
         FloatUtil.showGetItemsDisplayPanel(WealthUtil.rewardArrToWealthVoArr(param2.rewards));
         if(param2.kind == 1)
         {
            this.infoRes.member.levelp.push(param2.level);
         }
         else
         {
            this.infoRes.member.levelw.push(param2.level);
         }
         this.checkRedPoint();
         if(param1)
         {
            Handler.execute(param1,[param2,param3]);
         }
      }
   }
}
