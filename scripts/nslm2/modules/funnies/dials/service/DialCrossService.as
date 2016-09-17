package nslm2.modules.funnies.dials.service
{
   import nslm2.common.service.OpActivityStaticServiceHandler;
   import nslm2.modules.funnies.dials.msgs.DialMsgs;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.funnies.dials.model.DialModel;
   import nslm2.nets.sockets.ServerEngine;
   import proto.ZhuanpanCrossInfoRes;
   import nslm2.modules.funnies.dials.utils.DialUtil;
   import proto.ZhuanpanCrossScoreRwdReq;
   import morn.core.handlers.Handler;
   import nslm2.nets.sockets.ServerEvent;
   import proto.ZhuanpanCrossRotateReq;
   import proto.ZhuanpanCrossRotateRes;
   import nslm2.utils.WealthUtil;
   import proto.ZhuanpanCrossBuyReq;
   import proto.ZhuanpanCrossBuyRes;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import proto.ZhuanpanCrossRankRes;
   import proto.ZhuanpanCrossRankRes.RankData;
   import nslm2.common.model.PlayerModel;
   import proto.ZhuanpanCrossSuperReq;
   import proto.ZhuanpanCrossSuperRes;
   import proto.ZhuanpanCrossSuperRes.SuperData;
   import proto.StaticZhuanPanItemModel;
   import proto.PlayerBaseInfo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class DialCrossService extends DialService
   {
       
      
      public function DialCrossService(param1:int)
      {
         super(param1);
      }
      
      override public function requestStaticData() : void
      {
         OpActivityStaticServiceHandler.ins.requestStaticData([30],getStaticDataCpl);
      }
      
      override protected function getStaticDataCpl() : void
      {
         DialMsgs.ins.dispatchEvent(new MzEvent("static_data_cpl"));
         DialModel.getIns(60810).checkRedPoint();
      }
      
      override public function requestModuleData() : void
      {
         ServerEngine.ins.send(6290,null,onServerInfoCpl);
      }
      
      private function onServerInfoCpl(param1:ZhuanpanCrossInfoRes) : void
      {
         DialModel.getIns(60810).zhuanPanInfoRes = DialUtil.zhuanpanCrossInfoResTozhuanpanInfoRes(param1);
         DialModel.getIns(60810).initRankDict([]);
         DialModel.getIns(60810).scoregets = param1.scoregets == null?[]:param1.scoregets;
         DialModel.getIns(60810).initShopBuyInfo(DialUtil.mineSweepShopInfoArrToZhuanPanBuyItemInfoArr(param1.info));
         DialMsgs.ins.dispatchEvent(new MzEvent("module_data_cpl"));
      }
      
      public function server_ZHUANPAN_CROSS_SCORE_RWD(param1:uint, param2:*) : void
      {
         var _loc3_:ZhuanpanCrossScoreRwdReq = new ZhuanpanCrossScoreRwdReq();
         _loc3_.score = param1;
         ServerEngine.ins.send(6295,_loc3_,new Handler(server_ZHUANPAN_CROSS_SCORE_RWD_cpl,[param1,param2]));
      }
      
      private function server_ZHUANPAN_CROSS_SCORE_RWD_cpl(param1:int, param2:*, param3:*, param4:ServerEvent) : void
      {
         DialModel.getIns(60810).scoregets.push(param1);
         DialModel.getIns(60810).checkRedPoint();
         if(param2)
         {
            Handler.execute(param2,[param3,param4]);
         }
      }
      
      override public function doCommonDial(param1:Boolean) : void
      {
         var _loc2_:ZhuanpanCrossRotateReq = new ZhuanpanCrossRotateReq();
         _loc2_.kind = 1 - 1;
         _loc2_.count = !!param1?DialModel.getIns(60810).multiCount:1;
         ServerEngine.ins.send(6292,_loc2_,onCommonDialCpl);
      }
      
      private function onCommonDialCpl(param1:ZhuanpanCrossRotateRes, param2:ServerEvent) : void
      {
         DialMsgs.ins.dispatchEvent(new MzEvent("switch_mouse_event",false));
         DialModel.getIns(60810).zhuanPanInfoRes.member.score = param1.score;
         var _loc3_:Array = param2.dataNotifyCacheVo.change.toAddWealthArr();
         DialModel.getIns(60810).addToTempBag(WealthUtil.wealthVoArrToRewardArr(_loc3_),false);
         DialMsgs.ins.dispatchEvent(new MzEvent("common_dial_cpl",DialUtil.zhuanpanCrossRotateResToZhuanPanCommonRes(param1,_loc3_,1)));
         DialModel.getIns(60810).checkRedPoint();
      }
      
      override public function doSuperDial(param1:Boolean) : void
      {
         var _loc2_:ZhuanpanCrossRotateReq = new ZhuanpanCrossRotateReq();
         _loc2_.kind = 2 - 1;
         _loc2_.count = !!param1?DialModel.getIns(60810).multiCount:1;
         ServerEngine.ins.send(6292,_loc2_,onSuperDialCpl);
      }
      
      private function onSuperDialCpl(param1:ZhuanpanCrossRotateRes, param2:ServerEvent) : void
      {
         DialMsgs.ins.dispatchEvent(new MzEvent("switch_mouse_event",false));
         DialModel.getIns(60810).zhuanPanInfoRes.member.score = param1.score;
         var _loc3_:Array = param2.dataNotifyCacheVo.change.toAddWealthArr();
         DialModel.getIns(60810).addToTempBag(WealthUtil.wealthVoArrToRewardArr(_loc3_),true);
         DialMsgs.ins.dispatchEvent(new MzEvent("super_dial_cpl",DialUtil.zhuanpanCrossRotateResToZhuanPanSuperRes(param1,_loc3_,2)));
         DialModel.getIns(60810).checkRedPoint();
      }
      
      override public function buyItem(param1:int, param2:int) : void
      {
         var _loc3_:ZhuanpanCrossBuyReq = new ZhuanpanCrossBuyReq();
         _loc3_.pos = param1;
         _loc3_.count = param2;
         ServerEngine.ins.send(6294,_loc3_,onBuyItemCpl);
      }
      
      private function onBuyItemCpl(param1:ZhuanpanCrossBuyRes, param2:ServerEvent) : void
      {
         DialModel.getIns(60810).shopBuyInfoDict.put(param1.id,DialUtil.zhuanpanCrossBuyResToZhuanPanBuyItemInfo(param1));
         FloatUtil.showGetItemsDisplayPanel(param2.dataNotifyCacheVo.change.toAddWealthArr());
         DialMsgs.ins.dispatchEvent(new MzEvent("shop_buy_cpl"));
      }
      
      override public function getRankData() : void
      {
         ServerEngine.ins.send(6291,null,onRankCpl);
      }
      
      private function onRankCpl(param1:ZhuanpanCrossRankRes) : void
      {
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:* = null;
         if(param1)
         {
            DialModel.getIns(60810).initRankDict(DialUtil.rankDataArrToZhuanPanScoreMemerArr(param1.ranks));
            DialModel.getIns(60810).zhuanPanInfoRes.rank = 0;
            _loc2_ = param1.ranks.length;
            _loc4_ = 0;
            while(_loc4_ < _loc2_)
            {
               _loc3_ = param1.ranks[_loc4_];
               if(PlayerModel.ins.isCurPlayer(_loc3_.id))
               {
                  DialModel.getIns(60810).zhuanPanInfoRes.rank = _loc4_ + 1;
                  DialModel.getIns(60810).zhuanPanInfoRes.member.score = _loc3_.score;
               }
               _loc4_++;
            }
         }
         DialMsgs.ins.dispatchEvent(new MzEvent("rank_data_cpl"));
      }
      
      override public function requestRecord() : void
      {
         DialModel.getIns(60810).superRecord = [];
         DialModel.getIns(60810).record = [];
         var _loc1_:ZhuanpanCrossSuperReq = new ZhuanpanCrossSuperReq();
         _loc1_.kind = 1 - 1;
         ServerEngine.ins.send(6293,_loc1_,onRecordCpl);
      }
      
      private function onRecordCpl(param1:ZhuanpanCrossSuperRes) : void
      {
         var _loc4_:int = 0;
         var _loc7_:int = 0;
         var _loc5_:* = null;
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc6_:* = null;
         if(param1)
         {
            _loc4_ = param1.supers.length;
            _loc7_ = 0;
            while(_loc7_ < _loc4_)
            {
               _loc5_ = param1.supers[_loc7_];
               _loc3_ = DialModel.getIns(60810).getItemModel(_loc5_.dropid);
               _loc2_ = new PlayerBaseInfo();
               _loc2_.name = _loc5_.name;
               _loc2_.id = _loc5_.id;
               DialModel.getIns(60810).record.push(LocaleMgr.ins.getStr(60800023,[_loc2_,_loc3_.item]));
               _loc7_++;
            }
            _loc6_ = new ZhuanpanCrossSuperReq();
            _loc6_.kind = 2 - 1;
            ServerEngine.ins.send(6293,_loc6_,onSuperRecordCpl);
         }
      }
      
      private function onSuperRecordCpl(param1:ZhuanpanCrossSuperRes) : void
      {
         var _loc6_:int = 0;
         var _loc5_:* = null;
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc4_:int = param1.supers.length;
         _loc6_ = 0;
         while(_loc6_ < _loc4_)
         {
            _loc5_ = param1.supers[_loc6_];
            _loc3_ = DialModel.getIns(60810).getItemModel(_loc5_.dropid);
            if(_loc3_)
            {
               _loc2_ = new PlayerBaseInfo();
               _loc2_.name = _loc5_.name;
               _loc2_.id = _loc5_.id;
               DialModel.getIns(60810).superRecord.push(LocaleMgr.ins.getStr(60800023,[_loc2_,_loc3_.item]));
            }
            _loc6_++;
         }
         DialMsgs.ins.dispatchEvent(new MzEvent("record_cpl"));
      }
   }
}
