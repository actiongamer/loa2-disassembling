package nslm2.modules.foundations.fund.service
{
   import nslm2.modules.foundations.fund.model.FundModel;
   import proto.OpenFundWelfareNotify;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.fund.consts.FundConsts;
   import proto.OpenFundInfoRes;
   import proto.OpenFundBuyFundReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.OpenFundGetFundRewardReq;
   import proto.OpenFundGetWelfareReq;
   
   public class FundService
   {
      
      private static var _ins:nslm2.modules.foundations.fund.service.FundService;
       
      
      private var model:FundModel;
      
      public function FundService()
      {
         model = FundModel.ins;
         super();
         ServerEngine.ins.addAlwayHandler(7419,getPeopleNotify);
      }
      
      public static function get ins() : nslm2.modules.foundations.fund.service.FundService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.foundations.fund.service.FundService();
         }
         return _ins;
      }
      
      public function getPeopleNotify(param1:OpenFundWelfareNotify) : void
      {
         model.allcount = param1.allcount;
         ObserverMgr.ins.sendNotice(FundConsts.REFRESH_WELFARE_VIEW);
      }
      
      public function infoCplHandler(param1:OpenFundInfoRes) : void
      {
         model.hasfund = param1.hasfund;
         model.allcount = param1.allcount;
         model.getrewards = param1.getrewards;
         model.getwelfare = param1.getwelfare;
      }
      
      public function buyFund(param1:*) : void
      {
         var _loc2_:OpenFundBuyFundReq = new OpenFundBuyFundReq();
         ServerEngine.ins.send(7416,_loc2_,param1);
      }
      
      public function getFundReward(param1:int, param2:*) : void
      {
         var _loc3_:OpenFundGetFundRewardReq = new OpenFundGetFundRewardReq();
         _loc3_.rewardid = param1;
         ServerEngine.ins.send(7417,_loc3_,param2);
      }
      
      public function getWelfare(param1:int, param2:*) : void
      {
         var _loc3_:OpenFundGetWelfareReq = new OpenFundGetWelfareReq();
         _loc3_.rewardid = param1;
         ServerEngine.ins.send(7418,_loc3_,param2);
      }
   }
}
