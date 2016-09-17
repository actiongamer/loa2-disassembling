package nslm2.modules.funnies.dials.service
{
   import nslm2.modules.funnies.dials.model.DialModel;
   import nslm2.common.service.OpActivityStaticServiceHandler;
   import nslm2.modules.funnies.dials.msgs.DialMsgs;
   import com.mz.core.event.MzEvent;
   import proto.ZhuanPanInfoReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.ZhuanPanInfoRes;
   import proto.ZhuanPanCommonReq;
   import proto.ZhuanPanCommonRes;
   import proto.ZhuanPanSuperReq;
   import proto.ZhuanPanSuperRes;
   import proto.ZhuanPanBuyReq;
   import proto.ZhuanPanBuyRes;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import nslm2.utils.WealthUtil;
   import proto.ZhuanPanRankDataReq;
   import proto.ZhuanPanRankDataRes;
   import proto.ZhuanPanDajiangReq;
   import proto.ZhuanPanDajiangRes;
   import proto.ZhuanPanDajiangRecord;
   import proto.StaticZhuanPanItemModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class DialService
   {
      
      private static var _insLib:Object = {};
       
      
      public function DialService(param1:int)
      {
         super();
      }
      
      public static function getIns(param1:int = 60800) : DialService
      {
         if(_insLib.hasOwnProperty(param1) == false)
         {
            if(param1 == 60800)
            {
               _insLib[param1] = new DialService(param1);
            }
            else
            {
               _insLib[param1] = new DialCrossService(param1);
            }
         }
         return _insLib[param1];
      }
      
      public static function get ins() : DialService
      {
         if(getIns(DialModel.TYPE) == null)
         {
            if(DialModel.TYPE == 60800)
            {
               _insLib[DialModel.TYPE] = new DialService(DialModel.TYPE);
            }
            else
            {
               _insLib[DialModel.TYPE] = new DialCrossService(DialModel.TYPE);
            }
         }
         return getIns(DialModel.TYPE);
      }
      
      public function requestStaticData() : void
      {
         var _loc1_:Array = [];
         if(DialModel.ins.itemModelGetted == false)
         {
            _loc1_.push(4);
         }
         if(DialModel.ins.rewardModelGetted == false)
         {
            _loc1_.push(6);
         }
         if(DialModel.ins.shopModelGetted == false)
         {
            _loc1_.push(7);
         }
         OpActivityStaticServiceHandler.ins.requestStaticData(_loc1_,getStaticDataCpl);
      }
      
      protected function getStaticDataCpl() : void
      {
         DialMsgs.ins.dispatchEvent(new MzEvent("static_data_cpl"));
         DialModel.ins.checkRedPoint();
      }
      
      public function requestModuleData() : void
      {
         var _loc1_:ZhuanPanInfoReq = new ZhuanPanInfoReq();
         ServerEngine.ins.send(7450,_loc1_,onServerInfoCpl);
      }
      
      private function onServerInfoCpl(param1:ZhuanPanInfoRes) : void
      {
         DialModel.ins.zhuanPanInfoRes = param1;
         DialModel.ins.initRankDict(param1.ranks);
         DialModel.ins.initShopBuyInfo(param1.member.buyinfo);
         DialMsgs.ins.dispatchEvent(new MzEvent("module_data_cpl"));
      }
      
      public function doCommonDial(param1:Boolean) : void
      {
         var _loc2_:ZhuanPanCommonReq = new ZhuanPanCommonReq();
         _loc2_.kind = !!param1?2:1;
         ServerEngine.ins.send(7451,_loc2_,onCommonDialCpl);
      }
      
      private function onCommonDialCpl(param1:ZhuanPanCommonRes) : void
      {
         DialMsgs.ins.dispatchEvent(new MzEvent("switch_mouse_event",false));
         DialModel.ins.zhuanPanInfoRes.member.score = param1.score;
         DialModel.ins.addToTempBag(param1.rewards,false);
         DialMsgs.ins.dispatchEvent(new MzEvent("common_dial_cpl",param1));
         requestRecord();
      }
      
      public function doSuperDial(param1:Boolean) : void
      {
         var _loc2_:ZhuanPanSuperReq = new ZhuanPanSuperReq();
         _loc2_.kind = !!param1?2:1;
         ServerEngine.ins.send(7452,_loc2_,onSuperDialCpl);
      }
      
      private function onSuperDialCpl(param1:ZhuanPanSuperRes) : void
      {
         DialMsgs.ins.dispatchEvent(new MzEvent("switch_mouse_event",false));
         DialModel.ins.zhuanPanInfoRes.member.score = param1.score;
         DialModel.ins.addToTempBag(param1.rewards,true);
         DialMsgs.ins.dispatchEvent(new MzEvent("super_dial_cpl",param1));
         requestRecord();
      }
      
      public function buyItem(param1:int, param2:int) : void
      {
         var _loc3_:ZhuanPanBuyReq = new ZhuanPanBuyReq();
         _loc3_.itemid = param1;
         _loc3_.count = param2;
         ServerEngine.ins.send(7453,_loc3_,onBuyItemCpl);
      }
      
      private function onBuyItemCpl(param1:ZhuanPanBuyRes) : void
      {
         DialModel.ins.shopBuyInfoDict.put(param1.buyinfo.itemid,param1.buyinfo);
         FloatUtil.showGetItemsDisplayPanel(WealthUtil.rewardArrToWealthVoArr(param1.rewards));
         DialMsgs.ins.dispatchEvent(new MzEvent("shop_buy_cpl"));
      }
      
      public function getRankData() : void
      {
         var _loc1_:ZhuanPanRankDataReq = new ZhuanPanRankDataReq();
         ServerEngine.ins.send(7455,_loc1_,onRankCpl);
      }
      
      private function onRankCpl(param1:ZhuanPanRankDataRes) : void
      {
         DialModel.ins.initRankDict(param1.ranks);
         DialModel.ins.zhuanPanInfoRes.rank = param1.rank;
         DialModel.ins.zhuanPanInfoRes.member.score = param1.score;
         DialMsgs.ins.dispatchEvent(new MzEvent("rank_data_cpl"));
      }
      
      public function requestRecord() : void
      {
         var _loc1_:ZhuanPanDajiangReq = new ZhuanPanDajiangReq();
         ServerEngine.ins.send(7456,_loc1_,onRecordCpl);
      }
      
      private function onRecordCpl(param1:ZhuanPanDajiangRes) : void
      {
         var _loc3_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:* = null;
         var _loc2_:* = null;
         if(param1)
         {
            DialModel.ins.superRecord = [];
            DialModel.ins.record = [];
            _loc3_ = param1.records.length;
            _loc5_ = 0;
            while(_loc5_ < _loc3_)
            {
               _loc4_ = param1.records[_loc5_];
               _loc2_ = DialModel.ins.getItemModel(_loc4_.itemid);
               DialModel.ins.record.push(LocaleMgr.ins.getStr(60800023,[_loc4_.baseinfo,_loc2_.item]));
               _loc5_++;
            }
            _loc3_ = param1.suprecords.length;
            _loc5_ = 0;
            while(_loc5_ < _loc3_)
            {
               _loc4_ = param1.suprecords[_loc5_];
               _loc2_ = DialModel.ins.getItemModel(_loc4_.itemid);
               DialModel.ins.superRecord.push(LocaleMgr.ins.getStr(60800023,[_loc4_.baseinfo,_loc2_.item]));
               _loc5_++;
            }
         }
         DialMsgs.ins.dispatchEvent(new MzEvent("record_cpl"));
      }
   }
}
