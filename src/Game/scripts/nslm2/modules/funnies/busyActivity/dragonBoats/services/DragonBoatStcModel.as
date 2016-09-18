package nslm2.modules.funnies.busyActivity.dragonBoats.services
{
   import nslm2.common.service.OpActivityStaticServiceHandler;
   import com.mz.core.event.MzEvent;
   import proto.StaticDragonBoatPriceModel;
   import proto.StaticDragonBoatMakeModel;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import proto.StaticDragonBoatGetMaterialModel;
   import proto.StaticMineSweepRewardItemModel;
   import com.mz.core.utils.ArrayUtil;
   import proto.StaticMineSweepRankRewardModel;
   
   public class DragonBoatStcModel
   {
       
      
      public var service:nslm2.modules.funnies.busyActivity.dragonBoats.services.DragonBoatService;
      
      public var priceModelGetted:Boolean;
      
      public var priceMode:StaticDragonBoatPriceModel;
      
      public var makeModelGetted:Boolean;
      
      public var makeModeArr:Array;
      
      public var productIdArr:Array;
      
      public var materialIdArr:Array;
      
      public var materialModelGetted:Boolean;
      
      public var materialModeArr:Array;
      
      public var getMaterialModel:StaticDragonBoatGetMaterialModel;
      
      public var rankScoreModelGetted:Boolean;
      
      public var rankScoreModleArr:Array;
      
      public var rankModelArr:Array;
      
      public var scoreModelArr:Array;
      
      public function DragonBoatStcModel()
      {
         super();
      }
      
      public function get isModelAllGetted() : Boolean
      {
         if(service.isTest)
         {
            return true;
         }
         return this.priceModelGetted && this.makeModelGetted && this.materialModelGetted && this.rankScoreModelGetted && service.shop.shopModelGetted;
      }
      
      public function requestStaticData() : void
      {
         if(service.isTest)
         {
            getStaticDataCpl();
            return;
         }
         var _loc1_:Array = [];
         if(this.priceModelGetted == false)
         {
            _loc1_.push(23);
         }
         if(this.makeModelGetted == false)
         {
            _loc1_.push(27);
         }
         if(this.materialModelGetted == false)
         {
            _loc1_.push(24);
         }
         if(this.rankScoreModelGetted == false)
         {
            _loc1_.push(25);
         }
         if(service.shop.shopModelGetted == false)
         {
            _loc1_.push(26);
         }
         OpActivityStaticServiceHandler.ins.requestStaticData(_loc1_,getStaticDataCpl);
      }
      
      private function getStaticDataCpl() : void
      {
         service.dispatchEvent(new MzEvent("DragonBoatService.STATIC_DATA_CPL"));
      }
      
      public function initPriceModel(param1:Array) : void
      {
         priceMode = param1[0];
         this.priceModelGetted = param1.length > 0;
      }
      
      public function initRewardModel(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         this.makeModeArr = param1.concat();
         this.makeModelGetted = this.makeModeArr.length > 0;
         productIdArr = [];
         materialIdArr = [];
         var _loc2_:int = param1.length;
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = param1[_loc4_];
            productIdArr.push(_loc3_.id);
            _loc3_.cookMaterialVoArr = WealthUtil.parseCostStrToArr(_loc3_.cookMaterial);
            countMaterialIdArr(_loc3_.cookMaterialVoArr);
            _loc4_++;
         }
      }
      
      private function countMaterialIdArr(param1:Array) : void
      {
         var _loc5_:int = 0;
         var _loc2_:* = null;
         var _loc4_:int = 0;
         var _loc3_:int = param1.length;
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            _loc2_ = param1[_loc5_];
            _loc4_ = _loc2_.sid;
            _loc2_.useStcCount = true;
            if(materialIdArr.indexOf(_loc4_) == -1)
            {
               materialIdArr.push(_loc4_);
            }
            _loc5_++;
         }
      }
      
      public function initGetMaterialModel(param1:Array) : void
      {
         this.materialModeArr = param1.concat();
         this.getMaterialModel = param1[0];
         this.materialModelGetted = this.materialModeArr.length > 0;
      }
      
      public function getRewardById(param1:uint) : StaticMineSweepRewardItemModel
      {
         return ArrayUtil.findByAttr(this.makeModeArr,StaticMineSweepRewardItemModel.ID.name,param1);
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
         if(this.service.infoRes.singleReward.haveGetId == null || this.service.infoRes.singleReward.haveGetId.indexOf(param1) == -1)
         {
            _loc2_ = this.getRankScoreModelById(param1);
            if(this.service.myScore >= _loc2_.rank)
            {
               return 2;
            }
            return 1;
         }
         return 3;
      }
   }
}
