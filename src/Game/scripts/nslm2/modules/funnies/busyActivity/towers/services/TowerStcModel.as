package nslm2.modules.funnies.busyActivity.towers.services
{
   import nslm2.common.service.OpActivityStaticServiceHandler;
   import com.mz.core.event.MzEvent;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.funnies.busyActivity.towers.services.stcVos.TowerStcVo_TowerCost;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.funnies.busyActivity.towers.services.stcVos.TowerStcVo_Tower;
   import proto.StaticMineSweepRankRewardModel;
   import com.mz.core.utils.ArrayUtil;
   
   public class TowerStcModel
   {
       
      
      public var service:nslm2.modules.funnies.busyActivity.towers.services.TowerService;
      
      public var funnyModelGetted:Boolean;
      
      public var towerModelArr:Array;
      
      public var towerModelKindDict:Object;
      
      public var towerCostModelArr:Array;
      
      public var towerCostKindOnceDict:Object;
      
      public var towerCostKind50Dict:Object;
      
      public var towerCostBase:WealthVo;
      
      public var maxLayer:int;
      
      public var minLayer:int;
      
      public var rankModelArr:Array;
      
      public var scoreModelArr:Array;
      
      public function TowerStcModel()
      {
         super();
      }
      
      public function get isModelAllGetted() : Boolean
      {
         if(service.isTest)
         {
            return true;
         }
         return this.funnyModelGetted && service.shop.shopModelGetted;
      }
      
      public function requestStaticData() : void
      {
         if(service.isTest)
         {
            getStaticDataCpl();
            return;
         }
         var _loc1_:Array = [];
         if(this.funnyModelGetted == false)
         {
            _loc1_.push(29);
         }
         OpActivityStaticServiceHandler.ins.requestStaticData(_loc1_,getStaticDataCpl);
      }
      
      private function getStaticDataCpl() : void
      {
         service.dispatchEvent(new MzEvent("TowerService.STATIC_DATA_CPL"));
      }
      
      public function initTowerModel(param1:Array) : void
      {
         towerModelArr = param1;
         this.funnyModelGetted = param1.length > 0;
         towerModelKindDict = {};
         towerModelKindDict[0] = this.getTowerArrByKind(0);
         towerModelKindDict[1] = this.getTowerArrByKind(1);
      }
      
      public function initTowerCostModel(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         towerCostModelArr = param1;
         towerCostKindOnceDict = {};
         towerCostKind50Dict = {};
         towerCostBase = null;
         var _loc3_:int = param1.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = param1[_loc4_];
            if(_loc2_.count == 1)
            {
               towerCostKindOnceDict[_loc2_.kind] = _loc2_;
            }
            else
            {
               towerCostKind50Dict[_loc2_.kind] = _loc2_;
            }
            if(towerCostBase == null)
            {
               towerCostBase = WealthUtil.parseCostStr(_loc2_.cost);
            }
            _loc4_++;
         }
      }
      
      private function getTowerArrByKind(param1:int) : Array
      {
         var _loc5_:int = 0;
         var _loc3_:* = null;
         maxLayer = 0;
         minLayer = 2147483647;
         var _loc2_:Array = [];
         var _loc4_:int = this.towerModelArr.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = this.towerModelArr[_loc5_];
            if(_loc3_.kind == param1)
            {
               _loc2_.push(_loc3_);
               maxLayer = Math.max(maxLayer,_loc3_.layer);
               minLayer = Math.min(minLayer,_loc3_.layer);
            }
            _loc5_++;
         }
         _loc2_.sortOn("layer",16);
         return _loc2_;
      }
      
      public function initRankModel(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         rankModelArr = [];
         var _loc2_:int = param1.length;
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = param1[_loc4_];
            rankModelArr.push(_loc3_);
            _loc4_++;
         }
         rankModelArr.sortOn(StaticMineSweepRankRewardModel.RANK.name,16);
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
         if(this.service.infoRes.scored == null || this.service.infoRes.scored.indexOf(param1) == -1)
         {
            _loc2_ = this.getRankScoreModelById(param1);
            if(_loc2_)
            {
               if(this.service.myScore >= _loc2_.rank)
               {
                  return 2;
               }
               return 1;
            }
            return 1;
         }
         return 3;
      }
   }
}
