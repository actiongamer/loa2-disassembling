package nslm2.modules.battles.battlefields.service
{
   import nslm2.nets.sockets.ServerEngine;
   import proto.BgGatherNotify;
   import proto.BgGatherPlayerInfo;
   import nslm2.modules.battles.battlefields.model.BattlefieldModel;
   import nslm2.utils.Uint64Util;
   import proto.BgStagePlayerInfo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcStageNpcRelationVo;
   import nslm2.modules.battles.battlefields.msgs.BattlefieldMsgs;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.battles.battlefields.model.BattlefieldCrystalModel;
   import nslm2.modules.battles.battlefields.vos.BattlefieldGatherVo;
   import proto.BgGatherTeamInfo;
   import proto.BgResStatusNotify;
   import proto.BgCryStageInfoNotify;
   import proto.BgGatherStatusNotify;
   import proto.BgGatherReq;
   import proto.BgSceneMoveReq;
   import proto.ProtocolStatusRes;
   
   public class BattlefieldCrystalService
   {
      
      private static var _ins:nslm2.modules.battles.battlefields.service.BattlefieldCrystalService;
       
      
      private var _gatheredId:int;
      
      public function BattlefieldCrystalService()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.battles.battlefields.service.BattlefieldCrystalService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.battles.battlefields.service.BattlefieldCrystalService();
         }
         return _ins;
      }
      
      public function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            ServerEngine.ins.addAlwayHandler(4219,serverCpl_bgGatherNotify);
            ServerEngine.ins.addAlwayHandler(4227,serverCpl_bgResStatusNotify);
            ServerEngine.ins.addAlwayHandler(4229,serverCpl_bgCryStageInfoNotify);
            ServerEngine.ins.addAlwayHandler(4233,serverCpl_bgGatherStatusNotify);
         }
         else
         {
            ServerEngine.ins.removeAlwayHandler(4219,serverCpl_bgGatherNotify);
            ServerEngine.ins.removeAlwayHandler(4227,serverCpl_bgResStatusNotify);
            ServerEngine.ins.removeAlwayHandler(4229,serverCpl_bgCryStageInfoNotify);
            ServerEngine.ins.removeAlwayHandler(4233,serverCpl_bgGatherStatusNotify);
         }
      }
      
      private function serverCpl_bgGatherNotify(param1:BgGatherNotify) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc7_:int = 0;
         var _loc6_:* = param1.gatherInfo;
         for each(var _loc4_ in param1.gatherInfo)
         {
            _loc2_ = BattlefieldModel.ins.bgStagePlayers.getValue(Uint64Util.toString(_loc4_.playerId));
            _loc3_ = StcMgr.ins.getStageNpcRelationVo(param1.id);
            if(_loc2_)
            {
               BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgFightNewHorseLamp",LocaleMgr.ins.getStr(50500113,[LocaleMgr.ins.getStr(50500900 + _loc2_.side),PlayerModel.ins.getFullNameWithDistName(_loc2_.playerInfo.baseInfo),LocaleMgr.ins.getStr(_loc3_.name),_loc4_.yield])));
            }
            if(param1.resStatus == 0)
            {
               BattlefieldCrystalModel.ins.changeStageResInfo(param1.id,param1.resStatus);
               BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgCryMineDryUp",param1.id));
            }
            if(PlayerModel.ins.isCurPlayer(_loc4_.playerId))
            {
               BattlefieldCrystalModel.ins.addMyGathered(_loc4_.yield);
               BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgCrySelfGathered",_loc4_.yield));
            }
            BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgCryStopGather",new BattlefieldGatherVo(param1.id,_loc4_.playerId)));
         }
         var _loc9_:int = 0;
         var _loc8_:* = param1.teamInfo;
         for each(var _loc5_ in param1.teamInfo)
         {
            BattlefieldCrystalModel.ins.gatherAllChanged(_loc5_.side,_loc5_.totalNum);
         }
      }
      
      private function serverCpl_bgResStatusNotify(param1:BgResStatusNotify) : void
      {
         if(param1.resStatus == 1)
         {
            BattlefieldCrystalModel.ins.changeStageResInfo(param1.id,param1.resStatus);
            BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgCryMineReset",param1.id));
         }
      }
      
      private function serverCpl_bgCryStageInfoNotify(param1:BgCryStageInfoNotify) : void
      {
         BattlefieldCrystalModel.ins.bgCryStageInfoNotify = param1;
      }
      
      private function serverCpl_bgGatherStatusNotify(param1:BgGatherStatusNotify) : void
      {
         BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgCryBeginGather",new BattlefieldGatherVo(param1.resId,param1.id)));
      }
      
      public function gather(param1:BgGatherReq) : void
      {
         _gatheredId = param1.id;
         var _loc2_:BgSceneMoveReq = new BgSceneMoveReq();
         _loc2_.x = BattlefieldModel.ins.curScene.playerHero.pos2d.x;
         _loc2_.y = BattlefieldModel.ins.curScene.playerHero.pos2d.y;
         BattlefieldBattleService.ins.sendSelfPos(_loc2_);
         ServerEngine.ins.send(4218,param1,null,serverErr_bgGather);
      }
      
      private function serverErr_bgGather(param1:ProtocolStatusRes) : void
      {
         BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgError"));
         if(param1.errCode != 1)
         {
            ServerEngine.ins.doDefaultErr(param1);
         }
      }
   }
}
