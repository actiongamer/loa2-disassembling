package nslm2.modules.scenes.shenYuans.service
{
   import proto.GetShenYuanInfoReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.GetShenYuanInfoRes;
   import nslm2.modules.scenes.shenYuans.model.ShenYuanModel;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNvshendianBuffVo;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.GameFriendData;
   import proto.FightShenYuanStartReq;
   import proto.StagePhaseCheckReq;
   import proto.FightShenYuanEndReq;
   
   public class ShenYuanService
   {
      
      private static var _ins:nslm2.modules.scenes.shenYuans.service.ShenYuanService;
       
      
      public function ShenYuanService()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.scenes.shenYuans.service.ShenYuanService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.scenes.shenYuans.service.ShenYuanService();
         }
         return _ins;
      }
      
      public function requestBaseInfo(param1:Function = null, param2:GetShenYuanInfoReq = null) : void
      {
         if(param1)
         {
            ServerEngine.ins.send(6073,param2,param1);
         }
         else
         {
            ServerEngine.ins.send(6073,param2,onServerCpl_getInfo);
         }
      }
      
      private function onServerCpl_getInfo(param1:GetShenYuanInfoRes) : void
      {
         ShenYuanModel.ins.canRevive = param1.canRevive;
         ShenYuanModel.ins.crtFloor = param1.currentlayer;
         ShenYuanModel.ins.crtStarCnt = param1.nowstar;
         ShenYuanModel.ins.maxStarCnt = param1.topStar;
         ShenYuanModel.ins.crtMonsterData = param1.monster;
         ShenYuanModel.ins.crtMonsterData.sortOn("position");
         ShenYuanModel.ins.buffArr = param1.buffid;
         ShenYuanModel.ins.selectedMonsterPos = 0;
         ShenYuanModel.ins.buffToBuyArr = param1.buff;
         ShenYuanModel.ins.isNormalReward = param1.box;
         ShenYuanModel.ins.canPass = param1.tongguan;
         ShenYuanModel.ins.daibi = param1.shenyuancoin;
         ShenYuanModel.ins.currRank = param1.rank;
         ShenYuanModel.ins.lastRank = param1.lastrank;
         ShenYuanModel.ins.canGetReward = param1.canGetReward;
         ShenYuanModel.ins.monstersForNextLayers = param1.monstersForNextLayers;
         ShenYuanModel.ins.helptimes = param1.helptime;
         ShenYuanModel.ins.canReachLayer = param1.canReachLayer;
         ShenYuanModel.ins.hisTopStar = param1.histTopStar;
         ShenYuanModel.ins.luckValue = param1.luckValue;
         ShenYuanModel.ins.boxOpenNum = param1.num;
         var _loc2_:StcNvshendianBuffVo = StcMgr.ins.getNvshendianBuffVo(param1.currentlayer);
         ShenYuanModel.ins.currFloorType = _loc2_.kind;
         ObserverMgr.ins.sendNotice("SHENYUAN_GET_INFO_CPL",param1);
      }
      
      public function requestBuffShopInfo(param1:Function) : void
      {
      }
      
      public function requestRevive(param1:Function) : void
      {
      }
      
      public function requestRewardBoxInfo(param1:Function) : void
      {
      }
      
      public function requestGetReward(param1:Function) : void
      {
      }
      
      public function requestAutoFight(param1:Function) : void
      {
      }
      
      public function requestFight(param1:Function, param2:GameFriendData) : void
      {
         var _loc3_:FightShenYuanStartReq = new FightShenYuanStartReq();
         _loc3_.positon = ShenYuanModel.ins.selectedMonsterPos;
         _loc3_.layer = ShenYuanModel.ins.crtFloor;
         if(param2)
         {
            _loc3_.friend = param2.id;
         }
         ServerEngine.ins.send(6078,_loc3_,param1);
      }
      
      public function requestFightEnd(param1:StagePhaseCheckReq, param2:Function) : void
      {
         var _loc3_:FightShenYuanEndReq = new FightShenYuanEndReq();
         _loc3_.playMode = param1.playMode;
         _loc3_.positon = ShenYuanModel.ins.selectedMonsterPos;
         _loc3_.layer = ShenYuanModel.ins.crtFloor;
         _loc3_.stp = param1.stp;
         _loc3_.cBtlDamage = param1.damage;
         _loc3_.cBtlRet = param1.clientRet;
         ServerEngine.ins.send(6079,_loc3_,param2);
      }
   }
}
