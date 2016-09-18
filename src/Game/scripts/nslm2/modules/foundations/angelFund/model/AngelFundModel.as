package nslm2.modules.foundations.angelFund.model
{
   import proto.FundInfoRes;
   import com.mz.core.utils.DictHash;
   import proto.FundInfo;
   import proto.StaticFundModel;
   import nslm2.utils.ServerTimer;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleRedPointMsg;
   
   public class AngelFundModel
   {
      
      private static var _ins:nslm2.modules.foundations.angelFund.model.AngelFundModel;
       
      
      public const FUND_BUY_CPL:String = "fund_buy_cpl";
      
      public const FUND_GET_REWARD_CPL:String = "fund_get_reward_cpl";
      
      public const DEFAULT_REWARD_DAY:int = 5;
      
      public var haveGotFundStaticInfo:Boolean = false;
      
      public var fundInfoRes:FundInfoRes;
      
      private var _fund:Array;
      
      public var staticDataDict:DictHash;
      
      public var infoDataDict:DictHash;
      
      public var totalIdArr:Array;
      
      public var curId:int = 0;
      
      public function AngelFundModel()
      {
         totalIdArr = [];
         super();
      }
      
      public static function get ins() : nslm2.modules.foundations.angelFund.model.AngelFundModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.foundations.angelFund.model.AngelFundModel();
         }
         return _ins;
      }
      
      public function initFundDict(param1:Array) : void
      {
         if(!infoDataDict)
         {
            infoDataDict = new DictHash();
         }
         var _loc4_:int = 0;
         var _loc3_:* = param1;
         for each(var _loc2_ in param1)
         {
            infoDataDict.put(_loc2_.id,_loc2_);
         }
      }
      
      public function getFundInfo(param1:int) : FundInfo
      {
         if(!infoDataDict)
         {
            infoDataDict = new DictHash();
         }
         return infoDataDict.getValue(param1);
      }
      
      public function getFundData(param1:int) : StaticFundModel
      {
         if(!staticDataDict)
         {
            staticDataDict = new DictHash();
         }
         return staticDataDict.getValue(param1);
      }
      
      public function isEventOpen() : Boolean
      {
         var _loc3_:* = 0;
         var _loc1_:* = 0;
         var _loc6_:* = null;
         var _loc5_:* = 0;
         var _loc4_:* = 0;
         if(staticDataDict && staticDataDict.array)
         {
            _loc3_ = 4294967295;
            _loc1_ = uint(0);
            var _loc8_:int = 0;
            var _loc7_:* = staticDataDict.array;
            for each(var _loc2_ in staticDataDict.array)
            {
               _loc6_ = getFundInfo(_loc2_.id);
               if(_loc6_)
               {
                  _loc5_ = uint(_loc6_.buyStartTm);
                  if(_loc5_ < _loc3_)
                  {
                     _loc3_ = _loc5_;
                  }
                  _loc4_ = uint(_loc6_.rewardEndTm);
                  if(_loc4_ > _loc1_)
                  {
                     _loc1_ = _loc4_;
                  }
               }
            }
            return ServerTimer.ins.second >= _loc3_ && ServerTimer.ins.second <= _loc1_ && totalIdArr.length > 0;
         }
         return false;
      }
      
      public function onStaticChange(param1:StaticFundModel) : void
      {
         if(!staticDataDict)
         {
            staticDataDict = new DictHash();
         }
         if(totalIdArr.indexOf(param1.id) == -1)
         {
            totalIdArr.push(param1.id);
         }
         staticDataDict.put(param1.id,param1);
         haveGotFundStaticInfo = true;
      }
      
      public function refreshRedPoint() : void
      {
         var _loc2_:Boolean = false;
         var _loc4_:int = 0;
         var _loc3_:* = totalIdArr;
         for each(var _loc1_ in totalIdArr)
         {
            if(showTitleRedPoint(_loc1_))
            {
               _loc2_ = true;
            }
         }
         ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(900400,_loc2_));
      }
      
      public function showTitleRedPoint(param1:int) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:FundInfo = getFundInfo(param1);
         if(_loc3_ && _loc3_.charge >= getFundData(param1).chargeCondi)
         {
            if(_loc3_.isBuy)
            {
               _loc2_ = 0;
               while(_loc2_ < _loc3_.isGet.length)
               {
                  if(_loc3_.isGet[_loc2_] == false && canGetReward(param1,_loc2_))
                  {
                     return true;
                  }
                  _loc2_++;
               }
            }
            else
            {
               if(canBuyFund(param1))
               {
                  return true;
               }
               return false;
            }
         }
         return false;
      }
      
      public function canGetReward(param1:int, param2:int) : Boolean
      {
         return !!getFundData(param1)?ServerTimer.ins.second >= getFundInfo(param1).rewardStartTm + param2 * 3600 * 24 && ServerTimer.ins.second <= getFundInfo(param1).rewardEndTm:false;
      }
      
      public function canBuyFund(param1:int) : Boolean
      {
         return !!getFundData(param1)?ServerTimer.ins.second >= getFundInfo(param1).buyStartTm && ServerTimer.ins.second <= getFundInfo(param1).buyEndTm:false;
      }
   }
}
