package nslm2.modules.funnies.busyActivity.dragonBoats.services
{
   import flash.events.EventDispatcher;
   import nslm2.common.model.OpActivityStaticDataModel;
   import proto.StaticOpActivityTmModel;
   import nslm2.utils.ServerTimer;
   import proto.DragonBoatRankInfo;
   import proto.MapKey32Value32;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import proto.StaticDragonBoatMakeModel;
   import nslm2.common.vo.WealthVo;
   import nslm2.common.model.PlayerModel;
   import proto.StaticMineSweepRankRewardModel;
   import proto.DragonBoatAllInfoRes;
   import proto.DragonBoatRankTableRes;
   import proto.DragonBoatDonatePanelRes;
   import nslm2.modules.funnies.funnyCommons.FunnyServiceShopPart;
   
   public class DragonBoatService extends EventDispatcher
   {
      
      public static const skin_avatar:String = "png.uiDragonBoat.img_avatar";
      
      public static const KEY_AUTO_BUY:String = "DragonBoatService.KEY_AUTO_BUY";
      
      public static const MSG_SWITCH_CB_AUTO_BUY:String = "DragonBoatService.MSG_SWITCH_CB_AUTO_BUY";
      
      public static const STATIC_DATA_CPL:String = "DragonBoatService.STATIC_DATA_CPL";
      
      public static const MSG_SWITCH_TIME_OVER:String = "DragonBoatService.MSG_SWITCH_TIME_OVER";
      
      public static const MSG_SCORE_CHANGE:String = "DragonBoatService.MSG_SCORE_CHANGE";
      
      public static const MSG_DONOTE_NEW:String = "DragonBoatService.MSG_DONOTE_NEW";
      
      public static const MSG_CHANGE_COOK_COUNT:String = "DragonBoatService.MSG_CHANGE_COOK_COUNT";
      
      public static const funcIdArr:Array = [13377,13381,13380,13379];
      
      private static var _ins:nslm2.modules.funnies.busyActivity.dragonBoats.services.DragonBoatService;
       
      
      public var isTest:Boolean = false;
      
      public var staticKindArr:Array;
      
      public var makeNum:Object;
      
      public var productRedDict:Object;
      
      public var infoRes:DragonBoatAllInfoRes;
      
      public var rankPanelRes:DragonBoatRankTableRes;
      
      public var donatePanelRes:DragonBoatDonatePanelRes;
      
      public var stcModel:nslm2.modules.funnies.busyActivity.dragonBoats.services.DragonBoatStcModel;
      
      public var shop:FunnyServiceShopPart;
      
      public var protos:nslm2.modules.funnies.busyActivity.dragonBoats.services.DragonBoatProto;
      
      public function DragonBoatService()
      {
         staticKindArr = [timeKind_funny,timeKind_all,timeKind_all,timeKind_all];
         makeNum = {};
         productRedDict = {};
         stcModel = new nslm2.modules.funnies.busyActivity.dragonBoats.services.DragonBoatStcModel();
         shop = new FunnyServiceShopPart();
         protos = new nslm2.modules.funnies.busyActivity.dragonBoats.services.DragonBoatProto();
         super();
         this.stcModel.service = this;
         this.protos.service = this;
      }
      
      public static function get ins() : nslm2.modules.funnies.busyActivity.dragonBoats.services.DragonBoatService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.funnies.busyActivity.dragonBoats.services.DragonBoatService();
         }
         return _ins;
      }
      
      public function get timeKind_funny() : int
      {
         return 27;
      }
      
      public function get timeKind_all() : int
      {
         return 22;
      }
      
      public function isFunnyOpenTime() : Boolean
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
      
      public function isOpenTime() : Boolean
      {
         if(this.isTest)
         {
            return true;
         }
         var _loc1_:StaticOpActivityTmModel = OpActivityStaticDataModel.ins.getActivityOpenTime(timeKind_all);
         if(_loc1_)
         {
            return ServerTimer.ins.second >= _loc1_.startTm && ServerTimer.ins.second <= _loc1_.endTm;
         }
         return false;
      }
      
      public function getRankInfoByScore(param1:int) : DragonBoatRankInfo
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
      
      public function getFreeRewardState() : int
      {
         if(this.infoRes.panel.canGet)
         {
            return 2;
         }
         return 3;
      }
      
      public function set myScore(param1:int) : void
      {
         this.infoRes.panel.myScore = param1;
      }
      
      public function get myScore() : int
      {
         return this.infoRes.panel.myScore;
      }
      
      public function getNextReqTime() : uint
      {
         return donatePanelRes == null?0:Number(this.donatePanelRes.lastReqStamp + 3600);
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
               NpcFuncService.ins.changeCount(13376,!!_loc1_?1:0);
            }
            else
            {
               NpcFuncService.ins.changeCount(13376,0);
            }
         }
      }
      
      public function checkRedPoi_funny() : Boolean
      {
         var _loc5_:int = 0;
         var _loc4_:* = null;
         var _loc1_:Boolean = false;
         var _loc3_:Boolean = true;
         var _loc2_:int = this.stcModel.makeModeArr.length;
         _loc5_ = 0;
         while(_loc5_ < _loc2_)
         {
            _loc4_ = this.stcModel.makeModeArr[_loc5_];
            _loc1_ = checkRedPoi_makeProduct(_loc4_.cookMaterialVoArr);
            productRedDict[_loc4_.id] = _loc1_;
            if(_loc1_ == false)
            {
               _loc3_ = false;
            }
            _loc5_++;
         }
         NpcFuncService.ins.changeCount(13377,!!_loc3_?1:0);
         return _loc3_;
      }
      
      private function checkRedPoi_makeProduct(param1:Array) : Boolean
      {
         var _loc5_:int = 0;
         var _loc2_:* = null;
         var _loc4_:Boolean = true;
         var _loc3_:int = param1.length;
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            _loc2_ = param1[_loc5_];
            if(PlayerModel.ins.getCountByWealthVo(_loc2_) < _loc2_.count)
            {
               _loc4_ = false;
               return _loc4_;
            }
            _loc5_++;
         }
         return _loc4_;
      }
      
      private function checkRedPoi_shopTree() : Boolean
      {
         if(shop.shopDict && shop.hasItemCanBuy())
         {
            NpcFuncService.ins.changeCount(13380,1);
            return true;
         }
         NpcFuncService.ins.changeCount(13380,0);
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
               if(myScore >= _loc1_.rank && stcModel.scoreRewardState(_loc1_.id) == 2)
               {
                  NpcFuncService.ins.changeCount(13381,1);
                  return true;
               }
               _loc3_++;
            }
         }
         NpcFuncService.ins.changeCount(13381,0);
         return false;
      }
   }
}
