package nslm2.modules.funnies.busyActivity.towers.services
{
   import flash.events.EventDispatcher;
   import nslm2.common.model.OpActivityStaticDataModel;
   import proto.StaticOpActivityTmModel;
   import nslm2.utils.ServerTimer;
   import nslm2.modules.bag.itemModuels.BagModel;
   import proto.TowerRankRes.Info;
   import proto.MapKey32Value32;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import proto.StaticMineSweepRankRewardModel;
   import proto.TowerInfoRes;
   import proto.TowerRankRes;
   import nslm2.modules.funnies.funnyCommons.FunnyServiceShopPart;
   
   public class TowerService extends EventDispatcher
   {
      
      public static const FUNNY_KIND_GOLD:int = 0;
      
      public static const FUNNY_KIND_SILVER:int = 1;
      
      public static const skin_avatar:String = "png.uiTower.img_avatar";
      
      public static const STATIC_DATA_CPL:String = "TowerService.STATIC_DATA_CPL";
      
      public static const MSG_SWITCH_TIME_OVER:String = "TowerService.MSG_SWITCH_TIME_OVER";
      
      public static const MSG_SWITCH_MOUSE_FORBIT:String = "TowerService.MSG_SWITCH_MOUSE_FORBIT";
      
      public static const MSG_SCORE_CHANGE:String = "TowerService.MSG_SCORE_CHANGE";
      
      public static const funcIdArr:Array = [13388,13387,13389,13391];
      
      private static var _ins:nslm2.modules.funnies.busyActivity.towers.services.TowerService;
       
      
      public var needDown:Boolean = false;
      
      public var isTest:Boolean = false;
      
      public var staticKindArr:Array;
      
      private var isFirstInit:Boolean = false;
      
      public var makeNum:Object;
      
      public var productRedDict:Object;
      
      public var infoRes:TowerInfoRes;
      
      public var rankPanelRes:TowerRankRes;
      
      public var stcModel:nslm2.modules.funnies.busyActivity.towers.services.TowerStcModel;
      
      public var shop:FunnyServiceShopPart;
      
      public var protos:nslm2.modules.funnies.busyActivity.towers.services.TowerProto;
      
      public function TowerService()
      {
         staticKindArr = [timeKind_funny,timeKind_funny,timeKind_all,timeKind_all];
         makeNum = {};
         productRedDict = {};
         stcModel = new nslm2.modules.funnies.busyActivity.towers.services.TowerStcModel();
         shop = new FunnyServiceShopPart();
         protos = new nslm2.modules.funnies.busyActivity.towers.services.TowerProto();
         super();
         this.stcModel.service = this;
         this.protos.service = this;
      }
      
      public static function get ins() : nslm2.modules.funnies.busyActivity.towers.services.TowerService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.funnies.busyActivity.towers.services.TowerService();
         }
         return _ins;
      }
      
      public function get timeKind_funny() : int
      {
         return 300000 + 29;
      }
      
      public function get timeKind_all() : int
      {
         return 29;
      }
      
      public function isOpenTime_Funny() : Boolean
      {
         if(this.isTest)
         {
            return true;
         }
         var _loc1_:StaticOpActivityTmModel = OpActivityStaticDataModel.ins.getActivityOpenTime(timeKind_funny);
         if(_loc1_)
         {
            return ServerTimer.ins.second >= _loc1_.startTm && ServerTimer.ins.second <= _loc1_.endTm;
         }
         return false;
      }
      
      public function isOpenTime_all() : Boolean
      {
         var _loc1_:Boolean = false;
         if(this.isTest)
         {
            return true;
         }
         var _loc2_:StaticOpActivityTmModel = OpActivityStaticDataModel.ins.getActivityOpenTime(timeKind_all);
         if(_loc2_)
         {
            _loc1_ = ServerTimer.ins.second >= _loc2_.startTm && ServerTimer.ins.second <= _loc2_.endTm;
            if(_loc1_ == true && infoRes && isFirstInit == false && BagModel.ins.itemArr.length > 0)
            {
               isFirstInit = true;
               checkRedPoint();
            }
            return _loc1_;
         }
         return false;
      }
      
      public function getRankInfoByScore(param1:int) : Info
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = this.rankPanelRes.infos.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this.rankPanelRes.infos[_loc4_];
            if(_loc4_ == param1 - 1)
            {
               return _loc2_;
            }
            _loc4_++;
         }
         return null;
      }
      
      public function initMakeNum(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         makeNum = {};
         var _loc2_:int = param1.length;
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = param1[_loc4_];
            makeNum[_loc3_.key] = _loc3_.value;
            _loc4_++;
         }
      }
      
      public function getNumByMakeId(param1:int) : int
      {
         return makeNum[param1];
      }
      
      public function set myScore(param1:int) : void
      {
         this.infoRes.score = param1;
      }
      
      public function get myScore() : int
      {
         return this.infoRes.score;
      }
      
      public function checkRedPoint() : void
      {
         var _loc1_:Boolean = false;
         if(infoRes)
         {
            if(this.stcModel.isModelAllGetted)
            {
               _loc1_ = checkRedPoi_funny();
               _loc1_ = checkRedPoi_scoreTree() || _loc1_;
               _loc1_ = checkRedPoi_shopTree() || _loc1_;
               NpcFuncService.ins.changeCount(13386,!!_loc1_?1:0);
            }
            else
            {
               NpcFuncService.ins.changeCount(13386,0);
            }
         }
      }
      
      public function checkRedPoi_funny() : Boolean
      {
         var _loc1_:Boolean = true;
         if(this.stcModel.towerCostBase)
         {
            if(BagModel.ins.getStcCount(this.stcModel.towerCostBase.sid) >= this.stcModel.towerCostBase.count)
            {
               _loc1_ = true;
            }
            else
            {
               _loc1_ = false;
            }
         }
         else
         {
            _loc1_ = false;
         }
         NpcFuncService.ins.changeCount(13388,!!_loc1_?1:0);
         return _loc1_;
      }
      
      private function checkRedPoi_shopTree() : Boolean
      {
         if(shop.shopDict && shop.hasItemCanBuy())
         {
            NpcFuncService.ins.changeCount(13391,1);
            return true;
         }
         NpcFuncService.ins.changeCount(13391,0);
         return false;
      }
      
      private function checkRedPoi_scoreTree() : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc1_:* = null;
         if(this.stcModel.scoreModelArr)
         {
            _loc2_ = this.stcModel.scoreModelArr.length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc1_ = this.stcModel.scoreModelArr[_loc3_];
               if(myScore >= _loc1_.rank && stcModel.scoreRewardState(_loc1_.rank) == 2)
               {
                  NpcFuncService.ins.changeCount(13389,1);
                  return true;
               }
               _loc3_++;
            }
         }
         NpcFuncService.ins.changeCount(13389,0);
         return false;
      }
   }
}
