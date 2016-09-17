package nslm2.modules.foundations.angelFund.service
{
   import nslm2.modules.foundations.angelFund.model.AngelFundModel;
   import nslm2.common.service.OpActivityStaticServiceHandler;
   import nslm2.nets.sockets.ServerEngine;
   import proto.FundInfoRes;
   import nslm2.modules.funnies.dials.msgs.DialMsgs;
   import com.mz.core.event.MzEvent;
   import proto.GetFundRewardReq;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.BuyFundReq;
   
   public class AngelFundService
   {
      
      private static var _ins:nslm2.modules.foundations.angelFund.service.AngelFundService;
       
      
      private var model:AngelFundModel;
      
      private var _curPos:uint;
      
      public function AngelFundService()
      {
         model = AngelFundModel.ins;
         super();
      }
      
      public static function get ins() : nslm2.modules.foundations.angelFund.service.AngelFundService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.foundations.angelFund.service.AngelFundService();
         }
         return _ins;
      }
      
      public function requestStaticData() : void
      {
         var _loc1_:Array = [];
         if(model.haveGotFundStaticInfo == false)
         {
            _loc1_.push(19);
         }
         OpActivityStaticServiceHandler.ins.requestStaticData(_loc1_,getStaticDataCpl);
      }
      
      private function getStaticDataCpl() : void
      {
         ServerEngine.ins.send(8620,null,onServerInfoCpl);
      }
      
      public function requestModuleData() : void
      {
         ServerEngine.ins.send(8620,null,onServerInfoCpl);
      }
      
      private function onServerInfoCpl(param1:FundInfoRes) : void
      {
         model.haveGotFundStaticInfo = true;
         model.fundInfoRes = param1;
         if(param1 && param1.fund)
         {
            model.initFundDict(param1.fund);
         }
         model.refreshRedPoint();
         DialMsgs.ins.dispatchEvent(new MzEvent("module_data_cpl"));
      }
      
      public function getReward(param1:int) : void
      {
         var _loc2_:GetFundRewardReq = new GetFundRewardReq();
         _loc2_.id = model.curId;
         var _loc3_:* = param1;
         _loc2_.pos = _loc3_;
         _curPos = _loc3_;
         ServerEngine.ins.send(8622,_loc2_,getRewardCpl);
      }
      
      private function getRewardCpl() : void
      {
         model.getFundInfo(model.curId).isGet[_curPos] = true;
         ObserverMgr.ins.sendNotice("fund_get_reward_cpl");
         model.refreshRedPoint();
      }
      
      public function buyFund() : void
      {
         var _loc1_:BuyFundReq = new BuyFundReq();
         _loc1_.id = model.curId;
         ServerEngine.ins.send(8621,_loc1_,buyFundCpl);
      }
      
      private function buyFundCpl() : void
      {
         model.getFundInfo(model.curId).isBuy = true;
         ObserverMgr.ins.sendNotice("fund_buy_cpl");
         model.refreshRedPoint();
      }
      
      public function initFundInfo() : void
      {
         requestModuleData();
      }
   }
}
