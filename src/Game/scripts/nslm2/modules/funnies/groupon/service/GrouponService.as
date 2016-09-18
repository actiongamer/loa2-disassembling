package nslm2.modules.funnies.groupon.service
{
   import nslm2.modules.funnies.groupon.model.GrouponModel;
   import proto.TuanGouInfoReq;
   import nslm2.nets.sockets.ServerEngine;
   import morn.core.handlers.Handler;
   import proto.TuanGouInfoRes;
   import proto.TuanGouInfoNotify;
   import proto.GetTuanGouScoreRewardReq;
   import proto.BuyTuanGouReq;
   import nslm2.common.model.PlayerModel;
   
   public class GrouponService
   {
      
      private static var _ins:nslm2.modules.funnies.groupon.service.GrouponService;
       
      
      private var model:GrouponModel;
      
      public function GrouponService()
      {
         model = GrouponModel.ins;
         super();
      }
      
      public static function get ins() : nslm2.modules.funnies.groupon.service.GrouponService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.funnies.groupon.service.GrouponService();
         }
         return _ins;
      }
      
      public function getGrouponInfo(param1:*, param2:Function = null) : void
      {
         var _loc3_:TuanGouInfoReq = new TuanGouInfoReq();
         _loc3_.id = param1;
         ServerEngine.ins.send(8532,_loc3_,new Handler(getInfoHandler,[param2]));
      }
      
      private function getInfoHandler(param1:Function, param2:TuanGouInfoRes) : void
      {
         if(param1 != null)
         {
            param1.apply();
         }
         if(!param2)
         {
            return;
         }
         model.updateGroupnInfo(param2.tg);
      }
      
      private function grouponInfoNotifyHandler(param1:TuanGouInfoNotify) : void
      {
         model.updateTotalBuyCnt(param1.id,param1.totalBuyCount);
      }
      
      public function getScoreInfo(param1:Function) : void
      {
         ServerEngine.ins.send(8537,null,param1);
      }
      
      public function getScoreReward(param1:int, param2:Function) : void
      {
         var _loc3_:GetTuanGouScoreRewardReq = new GetTuanGouScoreRewardReq();
         _loc3_.id = param1;
         ServerEngine.ins.send(8536,_loc3_,param2);
      }
      
      public function requestBuyItem(param1:int, param2:int, param3:int, param4:Function) : void
      {
         var _loc5_:BuyTuanGouReq = new BuyTuanGouReq();
         _loc5_.id = param1;
         _loc5_.ticketNum = param2;
         _loc5_.count = param3;
         ServerEngine.ins.send(8535,_loc5_,param4);
      }
      
      private function errorHandler() : void
      {
      }
      
      private function playerDataNotifyHandler() : void
      {
         GrouponModel.ins.myGrouponScore = PlayerModel.ins.getWealthValue(28);
      }
      
      public function activateListener(param1:Boolean) : void
      {
         if(param1)
         {
            ServerEngine.ins.addAlwayHandler(8533,grouponInfoNotifyHandler);
            ServerEngine.ins.addAlwayHandler(8004,playerDataNotifyHandler);
         }
         else
         {
            ServerEngine.ins.removeAlwayHandler(8533,grouponInfoNotifyHandler);
            ServerEngine.ins.removeAlwayHandler(8004,playerDataNotifyHandler);
         }
      }
   }
}
