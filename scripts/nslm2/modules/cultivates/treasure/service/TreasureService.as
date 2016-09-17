package nslm2.modules.cultivates.treasure.service
{
   import nslm2.modules.cultivates.treasure.model.TreasureModel;
   import com.netease.protobuf.UInt64;
   import proto.BaoWuEquipReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.BaoWuStrengthReq;
   import proto.ProtocolStatusRes;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.BaoWuStrengthRes;
   import nslm2.modules.foundations.FloatBubbleUtil;
   import nslm2.utils.Uint64Util;
   import proto.BaoWuFumoReq;
   import proto.BaoWuFumoRes;
   import proto.BaoWuGoldCombineReq;
   import proto.BaoWuGoldCombineRes;
   import proto.BaoWuFumoOpenReq;
   import proto.BaoWuFumoOpenRes;
   import proto.BaoWuFumoAllReq;
   import proto.BaoWuFumoAllRes;
   import proto.BaoWuMoShiCombineReq;
   import proto.BaoWuMoShiTransferReq;
   import proto.BaoWuMoshiAllReq;
   import proto.BaoWuKeyinReq;
   import proto.BaoWuKeyinRes;
   import proto.MoShiCombineRecordRes;
   
   public class TreasureService
   {
      
      private static var _ins:nslm2.modules.cultivates.treasure.service.TreasureService;
       
      
      private var tsModel:TreasureModel;
      
      private var isRemove:Boolean;
      
      private var oneKeyOpType:int;
      
      public function TreasureService()
      {
         super();
         tsModel = TreasureModel.ins;
      }
      
      public static function get ins() : nslm2.modules.cultivates.treasure.service.TreasureService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.cultivates.treasure.service.TreasureService();
         }
         return _ins;
      }
      
      public function baoWuEquip(param1:UInt64, param2:UInt64, param3:uint, param4:Function) : void
      {
         var _loc5_:BaoWuEquipReq = new BaoWuEquipReq();
         _loc5_.hero = param1;
         _loc5_.item = param2;
         _loc5_.place = param3;
         ServerEngine.ins.send(5101,_loc5_,param4);
      }
      
      public function strengthen(param1:UInt64, param2:UInt64, param3:Array, param4:int = 0) : void
      {
         tsModel.blockHeroNotifyTips = true;
         var _loc5_:BaoWuStrengthReq = new BaoWuStrengthReq();
         _loc5_.hero = param1;
         _loc5_.item = param2;
         _loc5_.cost = param3;
         _loc5_.flag = param4;
         ServerEngine.ins.send(5102,_loc5_,strenthenSuccessHandler,errHandler);
      }
      
      private function errHandler(param1:ProtocolStatusRes) : void
      {
         tsModel.blockHeroNotifyTips = false;
         ServerEngine.ins.doDefaultErr(param1);
         ObserverMgr.ins.sendNotice("treasure_notice_stren_fail");
      }
      
      private function strenthenSuccessHandler(param1:BaoWuStrengthRes) : void
      {
         tsModel.blockHeroNotifyTips = false;
         FloatBubbleUtil.checkTreasureNotStrengthed();
         ObserverMgr.ins.sendNotice("treasure_notice_stren_success",param1.info);
      }
      
      public function requestInlayRune(param1:UInt64, param2:UInt64, param3:UInt64, param4:uint) : void
      {
         isRemove = false;
         if(!Uint64Util.toInt(param3))
         {
            isRemove = true;
         }
         var _loc5_:BaoWuFumoReq = new BaoWuFumoReq();
         _loc5_.hero = param1;
         _loc5_.item = param2;
         _loc5_.baoshi = param3;
         _loc5_.place = param4;
         TreasureModel.ins.targetPlace = param4;
         ServerEngine.ins.send(5104,_loc5_,server_wuFumo,inlayErrorHdnler);
      }
      
      private function server_wuFumo(param1:BaoWuFumoRes) : void
      {
         TreasureModel.ins.updateTreasureInfo(param1.info);
         if(isRemove)
         {
            ObserverMgr.ins.sendNotice("treasure_remove_rune_success",param1.info);
         }
         else
         {
            ObserverMgr.ins.sendNotice("treasure_inlay_success",param1.info);
         }
         isRemove = false;
      }
      
      public function phaseUp(param1:BaoWuGoldCombineReq) : void
      {
         ServerEngine.ins.send(5112,param1,onServerCpl_baowuGoldCombine);
      }
      
      private function onServerCpl_baowuGoldCombine(param1:BaoWuGoldCombineRes) : void
      {
         TreasureModel.ins.selectedTreasure = param1.info;
         TreasureModel.ins.updateTreasureData(param1.info,2);
         ObserverMgr.ins.sendNotice("treasure_phase_up");
         TreasureModel.ins.checkSceneTreasure3D();
      }
      
      private function inlayErrorHdnler(param1:ProtocolStatusRes) : void
      {
         ServerEngine.ins.doDefaultErr(param1);
         ObserverMgr.ins.sendNotice("treasure_inlay_fail");
      }
      
      public function requestOpenHole(param1:UInt64, param2:UInt64, param3:uint, param4:int) : void
      {
         TreasureModel.ins.targetPlace = param3;
         var _loc5_:BaoWuFumoOpenReq = new BaoWuFumoOpenReq();
         _loc5_.hero = param1;
         _loc5_.item = param2;
         _loc5_.place = param3;
         _loc5_.kind = param4;
         ServerEngine.ins.send(5105,_loc5_,server_fumoOpen);
      }
      
      private function server_fumoOpen(param1:BaoWuFumoOpenRes) : void
      {
         TreasureModel.ins.updateTreasureInfo(param1.info);
         ObserverMgr.ins.sendNotice("treasure_open_hole_success",param1.info);
      }
      
      public function oneKeyOperation(param1:UInt64, param2:UInt64, param3:uint, param4:int) : void
      {
         oneKeyOpType = param3;
         var _loc5_:BaoWuFumoAllReq = new BaoWuFumoAllReq();
         _loc5_.hero = param1;
         _loc5_.item = param2;
         _loc5_.kind = param3;
         _loc5_.cost = param4;
         ServerEngine.ins.send(5108,_loc5_,server_fumoAll);
      }
      
      private function server_fumoAll(param1:BaoWuFumoAllRes) : void
      {
         if(oneKeyOpType == 1)
         {
            ObserverMgr.ins.sendNotice("treasure_open_all_hole_success",param1.info);
         }
         else
         {
            ObserverMgr.ins.sendNotice("treasure_remove_all_rune_success",param1.info);
         }
      }
      
      public function runeComBine(param1:uint, param2:UInt64, param3:uint, param4:Function) : void
      {
         var _loc5_:BaoWuMoShiCombineReq = new BaoWuMoShiCombineReq();
         _loc5_.id = param1;
         _loc5_.material = param2;
         _loc5_.num = param3;
         ServerEngine.ins.send(5106,_loc5_,param4);
      }
      
      public function baoWuMoShiTransfer(param1:UInt64, param2:uint, param3:uint, param4:Function) : void
      {
         var _loc5_:BaoWuMoShiTransferReq = new BaoWuMoShiTransferReq();
         _loc5_.from = param1;
         _loc5_.num = param3;
         ServerEngine.ins.send(5107,_loc5_,param4);
      }
      
      public function runeBatchCompose(param1:Array, param2:uint, param3:Boolean, param4:Function) : void
      {
         var _loc5_:BaoWuMoshiAllReq = new BaoWuMoshiAllReq();
         _loc5_.kind = param1;
         _loc5_.level = param2;
         _loc5_.confirm = param3;
         ServerEngine.ins.send(5109,_loc5_,param4);
      }
      
      public function baoWuKeyin(param1:UInt64, param2:UInt64, param3:Function, param4:uint = 1) : void
      {
         tsModel.blockHeroNotifyTips = true;
         var _loc5_:BaoWuKeyinReq = new BaoWuKeyinReq();
         _loc5_.hero = param1;
         _loc5_.flag = param4;
         _loc5_.item = param2;
         ServerEngine.ins.send(5103,_loc5_,param3);
      }
      
      public function baoWuFuwenKeyin(param1:UInt64, param2:UInt64, param3:Function, param4:uint = 1) : void
      {
         tsModel.blockHeroNotifyTips = true;
         var _loc5_:BaoWuKeyinReq = new BaoWuKeyinReq();
         _loc5_.hero = param1;
         _loc5_.flag = param4;
         _loc5_.item = param2;
         ServerEngine.ins.send(5115,_loc5_,param3);
      }
      
      private function server_wuKeyin(param1:BaoWuKeyinRes) : void
      {
      }
      
      public function getCombineNotice() : void
      {
         ServerEngine.ins.send(5110,null,getNoticeHandler);
      }
      
      private function getNoticeHandler(param1:MoShiCombineRecordRes) : void
      {
         if(param1)
         {
            TreasureModel.ins.runeComposeNotice = param1.record;
         }
      }
   }
}
