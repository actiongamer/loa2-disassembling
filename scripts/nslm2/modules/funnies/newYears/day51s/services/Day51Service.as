package nslm2.modules.funnies.newYears.day51s.services
{
   import flash.events.EventDispatcher;
   import nslm2.common.service.OpActivityStaticServiceHandler;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.modules.bag.itemModuels.BagModel;
   import proto.StaticMineSweepRankRewardModel;
   import nslm2.common.model.OpActivityStaticDataModel;
   import proto.StaticOpActivityTmModel;
   import nslm2.utils.ServerTimer;
   import nslm2.common.vo.WealthVo;
   import proto.StaticMineSweepPriceModel;
   import nslm2.utils.WealthUtil;
   import proto.StaticMineSweepRewardItemModel;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.modules.funnies.funnyCommons.FunnyServiceShopPart;
   import proto.MineSweepAllInfoRes;
   import nslm2.nets.sockets.ServerEngine;
   import morn.core.handlers.Handler;
   import nslm2.nets.sockets.ServerEvent;
   import proto.MineSweepInfo;
   import proto.MineSweepRankTableRes;
   import proto.MineSweepRankInfo;
   import proto.MineSweepDigReq;
   import proto.MineSweepDigRes;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.MineSweepOneKeyRes;
   import proto.MineSweepResetRes;
   import proto.MineSweepBuyReq;
   import proto.MineSweepBuyRes;
   import proto.MineSweepShopInfo;
   import proto.StaticLuckTreeShopModel;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import flash.events.Event;
   import proto.MineSweepSingleRewardReq;
   import proto.MineSweepSingleRewardRes;
   import flash.events.IEventDispatcher;
   
   public class Day51Service extends EventDispatcher
   {
      
      public static const skin_avatar:String = "png.uiDay51.img_avatar";
      
      public static const DIG_ITEM_MAX:int = 20;
      
      public static const DIG_X_LEN:int = 8;
      
      public static const DIG_Y_LEN:int = 8;
      
      public static const DIG_TOTAL_LEN:int = 64;
      
      public static const STATIC_DATA_CPL:String = "STATIC_DATA_CPL";
      
      public static const MSG_DAY51_SWITCH_TIME_OVER:String = "MSG_DAY51_SWITCH_TIME_OVER";
      
      public static const MSG_DAY51_SCORE_CHANGE:String = "MSG_DAY51_SCORE_CHANGE";
      
      public static const MSG_DAY51_DIG:String = "MSG_DAY51_DIG";
      
      public static const MSG_DAY51_ALL_ITEM_CPL:String = "MSG_DAY51_ALL_ITEM_CPL";
      
      public static const funcIdArr:Array = [13356,13359,13358,13357];
      
      public static const ITEM_1:int = 83230;
      
      private static var _ins:nslm2.modules.funnies.newYears.day51s.services.Day51Service;
       
      
      public var priceModelGetted:Boolean;
      
      public var priceCostWealthVo:WealthVo;
      
      public var priceMode:StaticMineSweepPriceModel;
      
      public var rewardModelGetted:Boolean;
      
      public var rewardModelArr:Array;
      
      public var rankScoreModelGetted:Boolean;
      
      public var rankScoreModleArr:Array;
      
      public var rankModelArr:Array;
      
      public var scoreModelArr:Array;
      
      public var shop:FunnyServiceShopPart;
      
      public var infoRes:MineSweepAllInfoRes;
      
      public var oneKeyPrice:int;
      
      private var rankPanelRes:MineSweepRankTableRes;
      
      private var buyCount:int;
      
      private var getScoreId:int;
      
      public function Day51Service(param1:IEventDispatcher = null)
      {
         shop = new FunnyServiceShopPart();
         super(param1);
         ServerEngine.ins.addAlwayHandler(6277,server_sweepDig_cpl);
      }
      
      public static function get ins() : nslm2.modules.funnies.newYears.day51s.services.Day51Service
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.funnies.newYears.day51s.services.Day51Service();
         }
         return _ins;
      }
      
      public function get isModelAllGetted() : Boolean
      {
         return this.priceModelGetted && this.rewardModelGetted && this.rankScoreModelGetted && this.shop.shopModelGetted;
      }
      
      public function requestStaticData() : void
      {
         var _loc1_:Array = [];
         if(this.priceModelGetted == false)
         {
            _loc1_.push(17);
         }
         if(this.rewardModelGetted == false)
         {
            _loc1_.push(15);
         }
         if(this.rankScoreModelGetted == false)
         {
            _loc1_.push(16);
         }
         if(this.shop.shopModelGetted == false)
         {
            _loc1_.push(20);
         }
         OpActivityStaticServiceHandler.ins.requestStaticData(_loc1_,getStaticDataCpl);
      }
      
      private function getStaticDataCpl() : void
      {
         this.dispatchEvent(new MzEvent("STATIC_DATA_CPL"));
         this.checkRedPoint();
      }
      
      public function checkRedPoint() : void
      {
         var _loc1_:Boolean = false;
         if(infoRes)
         {
            if(this.isModelAllGetted)
            {
               _loc1_ = checkRedPoi_first();
               _loc1_ = checkRedPoi_scoreTree() || _loc1_;
               _loc1_ = checkRedPoi_shopTree() || _loc1_;
               NpcFuncService.ins.changeCount(13355,!!_loc1_?1:0);
            }
            else
            {
               NpcFuncService.ins.changeCount(13355,0);
            }
         }
      }
      
      private function checkRedPoi_first() : Boolean
      {
         if(BagModel.ins.getStcCount(83230) > 0)
         {
            NpcFuncService.ins.changeCount(13356,1);
            return true;
         }
         NpcFuncService.ins.changeCount(13356,0);
         return false;
      }
      
      private function checkRedPoi_shopTree() : Boolean
      {
         if(shop.shopDict && shop.hasItemCanBuy())
         {
            NpcFuncService.ins.changeCount(13358,1);
            return true;
         }
         NpcFuncService.ins.changeCount(13358,0);
         return false;
      }
      
      private function checkRedPoi_scoreTree() : Boolean
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
               if(curScore >= _loc1_.rank && scoreRewardState(_loc1_.id) == 2)
               {
                  NpcFuncService.ins.changeCount(13359,1);
                  return true;
               }
               _loc3_++;
            }
         }
         NpcFuncService.ins.changeCount(13359,0);
         return false;
      }
      
      public function isEventOpen() : Boolean
      {
         var _loc1_:StaticOpActivityTmModel = OpActivityStaticDataModel.ins.getActivityOpenTime(20);
         if(_loc1_)
         {
            return ServerTimer.ins.second >= _loc1_.startTm && ServerTimer.ins.second <= _loc1_.endTm;
         }
         return false;
      }
      
      public function initPriceModel(param1:Array) : void
      {
         priceMode = param1[0];
         if(priceMode)
         {
            priceCostWealthVo = WealthUtil.parseCostStr(priceMode.cost,false);
         }
         this.priceModelGetted = param1.length > 0;
      }
      
      public function initRewardModel(param1:Array) : void
      {
         this.rewardModelArr = param1.concat();
         this.rewardModelGetted = this.rewardModelArr.length > 0;
      }
      
      public function getRewardById(param1:uint) : StaticMineSweepRewardItemModel
      {
         return ArrayUtil.findByAttr(this.rewardModelArr,StaticMineSweepRewardItemModel.ID.name,param1);
      }
      
      public function initRankScoreModle(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         rankScoreModelGetted = false;
         rankScoreModleArr = param1;
         rankModelArr = [];
         scoreModelArr = [];
         var _loc2_:int = param1.length;
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = param1[_loc4_];
            if(_loc3_.kind == 1)
            {
               rankModelArr.push(_loc3_);
            }
            else
            {
               scoreModelArr.push(_loc3_);
            }
            _loc4_++;
         }
         rankScoreModelGetted = _loc2_ > 0;
         rankModelArr.sortOn(StaticMineSweepRankRewardModel.RANK.name,16);
         scoreModelArr.sortOn(StaticMineSweepRankRewardModel.RANK.name,16);
      }
      
      public function getRankScoreModelById(param1:uint) : StaticMineSweepRankRewardModel
      {
         return ArrayUtil.findByAttr(this.rankScoreModleArr,StaticMineSweepRankRewardModel.ID.name,param1);
      }
      
      public function scoreRewardState(param1:int) : int
      {
         var _loc2_:* = null;
         if(infoRes.singleReward.haveGetId == null || infoRes.singleReward.haveGetId.indexOf(param1) == -1)
         {
            _loc2_ = this.getRankScoreModelById(param1);
            if(curScore >= _loc2_.rank)
            {
               return 2;
            }
            return 1;
         }
         return 3;
      }
      
      public function get curScore() : int
      {
         if(infoRes != null)
         {
            if(infoRes.panel == null)
            {
               return infoRes.singleReward.myScore;
            }
            return infoRes.panel.myScore;
         }
         return 0;
      }
      
      public function initServerOnLine(param1:MineSweepAllInfoRes) : void
      {
         this.infoRes = param1;
         if(this.isModelAllGetted)
         {
            this.checkRedPoint();
         }
      }
      
      public function server_allInfo(param1:Function) : void
      {
         ServerEngine.ins.send(6281,null,new Handler(server_allInfo_cpl,[param1]));
      }
      
      private function server_allInfo_cpl(param1:*, param2:MineSweepAllInfoRes, param3:ServerEvent) : void
      {
         this.infoRes = param2;
         priceCostWealthVo = WealthUtil.parseCostStr(infoRes.price,false);
         trace(this.infoRes.resetInfo.item,this.infoRes.resetInfo.diamond,this.infoRes.resetInfo.maxTimes);
         if(infoRes.panel.info == null)
         {
            infoRes.panel.info = [];
         }
         this.shop.initShopBuyInfo(param2.shop.info);
         this.checkRedPoint();
         if(param1)
         {
            Handler.execute(param1,[param2,param3]);
         }
      }
      
      public function getNullDigCount() : int
      {
         var _loc1_:int = 64;
         var _loc4_:int = 0;
         var _loc3_:* = infoRes.panel.info;
         for each(var _loc2_ in infoRes.panel.info)
         {
            if(_loc2_ != null)
            {
               _loc1_--;
            }
         }
         trace(infoRes.panel.info.length,_loc1_);
         return _loc1_;
      }
      
      public function getDigById(param1:int) : MineSweepInfo
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = this.infoRes.panel.info.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this.infoRes.panel.info[_loc4_];
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
            _loc4_++;
         }
         return null;
      }
      
      public function getDigByXY(param1:int, param2:int) : MineSweepInfo
      {
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc4_:int = this.infoRes.panel.info.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = this.infoRes.panel.info[_loc5_];
            if(_loc3_.x == param1 && _loc3_.y == param2)
            {
               return _loc3_;
            }
            _loc5_++;
         }
         return null;
      }
      
      public function get remainDigCount() : int
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc1_:int = 0;
         var _loc3_:int = this.infoRes.panel.info.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this.infoRes.panel.info[_loc4_];
            if(_loc2_.isNumber == false)
            {
               _loc1_++;
            }
            _loc4_++;
         }
         return 20 - _loc1_;
      }
      
      public function server_getRankTable(param1:Function) : void
      {
         ServerEngine.ins.send(6278,null,new Handler(server_rankTable_cpl,[param1]));
      }
      
      private function server_rankTable_cpl(param1:*, param2:MineSweepRankTableRes, param3:ServerEvent) : void
      {
         if(param2 == null)
         {
            param2 = new MineSweepRankTableRes();
            param2.info = [];
         }
         rankPanelRes = param2;
         if(param1)
         {
            Handler.execute(param1,[param2,param3]);
         }
      }
      
      public function getRankInfoByScore(param1:int) : MineSweepRankInfo
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = this.rankPanelRes.info.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this.rankPanelRes.info[_loc4_];
            if(_loc4_ == param1 - 1)
            {
               return _loc2_;
            }
            _loc4_++;
         }
         return null;
      }
      
      public function server_mineSweepDig(param1:uint, param2:uint) : void
      {
         var _loc3_:MineSweepDigReq = new MineSweepDigReq();
         _loc3_.x = param1;
         _loc3_.y = param2;
         ServerEngine.ins.send(6277,_loc3_);
      }
      
      private function server_sweepDig_cpl(param1:MineSweepDigRes, param2:ServerEvent) : void
      {
         this.infoRes.panel.info.push(param1.info);
         this.infoRes.panel.myScore = param1.myScore;
         ObserverMgr.ins.sendNotice("MSG_DAY51_SCORE_CHANGE");
         ObserverMgr.ins.sendNotice("MSG_DAY51_DIG",param1.info);
         if(param1.hasPanel)
         {
            infoRes.panel = param1.panel;
            if(infoRes.panel.info == null)
            {
               infoRes.panel.info = [];
            }
            ObserverMgr.ins.sendNotice("MSG_DAY51_ALL_ITEM_CPL");
         }
      }
      
      public function server_mineSweepOneKey_cpl(param1:Function) : void
      {
         ServerEngine.ins.send(6276,null,new Handler(server_oneKey_cpl,[param1]));
      }
      
      private function server_oneKey_cpl(param1:*, param2:MineSweepOneKeyRes, param3:ServerEvent) : void
      {
         this.infoRes.panel = param2.panel;
         if(infoRes.panel.info == null)
         {
            infoRes.panel.info = [];
         }
         this.checkRedPoint();
         if(param1)
         {
            Handler.execute(param1,[param2.oldPanel,param2,param3]);
         }
      }
      
      public function server_mineSweepReset(param1:Function) : void
      {
         ServerEngine.ins.send(6275,null,new Handler(server_sweepReset_cpl,[param1]));
      }
      
      private function server_sweepReset_cpl(param1:*, param2:MineSweepResetRes, param3:ServerEvent) : void
      {
         this.infoRes.panel = param2.panel;
         if(infoRes.panel.info == null)
         {
            infoRes.panel.info = [];
         }
         this.checkRedPoint();
         if(param1)
         {
            Handler.execute(param1,[param2,param3]);
         }
      }
      
      public function server_mineSweepBuy(param1:uint, param2:int, param3:Function = null) : void
      {
         var _loc4_:MineSweepBuyReq = new MineSweepBuyReq();
         _loc4_.id = param1;
         buyCount = param2;
         _loc4_.num = param2;
         ServerEngine.ins.send(6280,_loc4_,new Handler(server_sweepBuy_cpl,[param3]));
      }
      
      private function server_sweepBuy_cpl(param1:*, param2:MineSweepBuyRes, param3:ServerEvent) : void
      {
         var _loc9_:int = 0;
         var _loc6_:* = null;
         var _loc4_:MineSweepShopInfo = new MineSweepShopInfo();
         _loc4_.itemId = param2.id;
         _loc4_.buyNum = param2.buyNum;
         this.shop.shopBuyInfoDict.put(param2.id,_loc4_);
         var _loc8_:StaticLuckTreeShopModel = shop.shopDict.getValue(param2.id) as StaticLuckTreeShopModel;
         var _loc5_:Array = WealthUtil.costStrToArr(_loc8_.item);
         var _loc7_:int = _loc5_.length;
         _loc9_ = 0;
         while(_loc9_ < _loc7_)
         {
            _loc6_ = _loc5_[_loc9_];
            _loc6_.count = _loc6_.count * buyCount;
            _loc9_++;
         }
         FloatUtil.showGetItemsDisplayPanel(_loc5_);
         this.checkRedPoint();
         this.shop.dispatchEvent(new Event("EVT_SHOP_BUY_CPL"));
         if(param1)
         {
            Handler.execute(param1,[param2,param3]);
         }
      }
      
      public function server_getScoreReward(param1:int, param2:Function) : void
      {
         var _loc3_:MineSweepSingleRewardReq = new MineSweepSingleRewardReq();
         var _loc4_:* = param1;
         _loc3_.id = _loc4_;
         getScoreId = _loc4_;
         ServerEngine.ins.send(6279,_loc3_,new Handler(server_singleReward_cpl,[param2]));
      }
      
      private function server_singleReward_cpl(param1:*, param2:MineSweepSingleRewardRes, param3:ServerEvent) : void
      {
         var _loc4_:StaticMineSweepRankRewardModel = this.getRankScoreModelById(getScoreId);
         if(_loc4_)
         {
            FloatUtil.showGetItemsDisplayPanel(WealthUtil.costStrToArr(_loc4_.reward));
         }
         this.infoRes.singleReward.haveGetId = param2.haveGetId;
         this.infoRes.panel.myScore = param2.myScore;
         this.checkRedPoint();
         if(param1)
         {
            Handler.execute(param1,[param2,param3]);
         }
      }
   }
}
