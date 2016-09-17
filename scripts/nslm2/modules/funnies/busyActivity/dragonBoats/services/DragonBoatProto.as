package nslm2.modules.funnies.busyActivity.dragonBoats.services
{
   import nslm2.nets.sockets.ServerEngine;
   import morn.core.handlers.Handler;
   import proto.DragonBoatAllInfoRes;
   import nslm2.nets.sockets.ServerEvent;
   import proto.DragonBoatDonatePanelRes;
   import proto.DragonBoatDonatePanelRes.DonateInfo;
   import proto.DragonBoatDonatePanelRes.DonateLog;
   import proto.DragonBoatShopInfoRes;
   import proto.DragonBoatBuyReq;
   import proto.DragonBoatBuyRes;
   import proto.MineSweepShopInfo;
   import proto.StaticLuckTreeShopModel;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import flash.events.Event;
   import proto.DragonBoatMakeItemReq;
   import proto.DragonBoatMakeItemRes;
   import proto.DragonBoatOneKeyMakeReq;
   import proto.DragonBoatOneKeyMakeRes;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.DragonBoatRankTableRes;
   import proto.DragonBoatSingleRewardReq;
   import proto.DragonBoatSingleRewardRes;
   import proto.PlayerBaseInfo;
   import proto.DragonBoatDonateReq;
   import proto.DragonBoatDonateRes;
   import nslm2.utils.Uint64Util;
   import proto.DragonBoatReqDonateReq;
   
   public class DragonBoatProto
   {
       
      
      public var service:nslm2.modules.funnies.busyActivity.dragonBoats.services.DragonBoatService;
      
      public function DragonBoatProto()
      {
         super();
      }
      
      public function server_DRAGON_BOAT_ALL_INFO(param1:*) : void
      {
         if(service.isTest)
         {
            this.server_DRAGON_BOAT_ALL_INFO_cpl(param1,null,null);
            return;
         }
         ServerEngine.ins.send(6350,null,new Handler(server_DRAGON_BOAT_ALL_INFO_cpl,[param1]));
      }
      
      private function server_DRAGON_BOAT_ALL_INFO_cpl(param1:*, param2:DragonBoatAllInfoRes, param3:ServerEvent) : void
      {
         service.infoRes = param2;
         service.initMakeNum(param2.panel.num);
         this.service.shop.initShopBuyInfo(param2.shop.info);
         service.checkRedPoint();
         if(param1)
         {
            Handler.execute(param1,[param2,param3]);
         }
      }
      
      public function server_DRAGON_BOAT_DONATE_PANEL(param1:*) : void
      {
         ServerEngine.ins.send(6359,null,new Handler(server_DRAGON_BOAT_DONATE_PANEL_cpl,[param1]));
      }
      
      private function server_DRAGON_BOAT_DONATE_PANEL_cpl(param1:*, param2:DragonBoatDonatePanelRes, param3:ServerEvent) : void
      {
         this.service.donatePanelRes = param2;
         if(param2.info)
         {
            param2.info.sortOn(DonateInfo.STAMP,16 | 2);
         }
         if(param2.log)
         {
            param2.log.sortOn(DonateLog.STAMP,16 | 2);
         }
         if(param1)
         {
            Handler.execute(param1,[param2,param3]);
         }
      }
      
      public function server_DRAGON_BOAT_SHOP_INFO(param1:*) : void
      {
         ServerEngine.ins.send(6352,null,new Handler(server_DRAGON_BOAT_SHOP_INFO_cpl,[param1]));
      }
      
      private function server_DRAGON_BOAT_SHOP_INFO_cpl(param1:*, param2:DragonBoatShopInfoRes, param3:ServerEvent) : void
      {
         if(param1)
         {
            Handler.execute(param1,[param2,param3]);
         }
      }
      
      public function server_DRAGON_BOAT_BUY(param1:uint, param2:uint, param3:*) : void
      {
         var _loc4_:DragonBoatBuyReq = new DragonBoatBuyReq();
         _loc4_.id = param1;
         _loc4_.num = param2;
         ServerEngine.ins.send(6353,_loc4_,new Handler(server_DRAGON_BOAT_BUY_cpl,[param2,param3]));
      }
      
      private function server_DRAGON_BOAT_BUY_cpl(param1:int, param2:*, param3:DragonBoatBuyRes, param4:ServerEvent) : void
      {
         var _loc10_:int = 0;
         var _loc7_:* = null;
         var _loc5_:MineSweepShopInfo = new MineSweepShopInfo();
         _loc5_.itemId = param3.id;
         _loc5_.buyNum = param3.buyNum;
         this.service.shop.shopBuyInfoDict.put(param3.id,_loc5_);
         var _loc9_:StaticLuckTreeShopModel = service.shop.shopDict.getValue(param3.id) as StaticLuckTreeShopModel;
         var _loc6_:Array = WealthUtil.costStrToArr(_loc9_.item);
         var _loc8_:int = _loc6_.length;
         _loc10_ = 0;
         while(_loc10_ < _loc8_)
         {
            _loc7_ = _loc6_[_loc10_];
            _loc7_.count = _loc7_.count * param1;
            _loc10_++;
         }
         FloatUtil.showGetItemsDisplayPanel(_loc6_);
         this.service.checkRedPoint();
         this.service.shop.dispatchEvent(new Event("EVT_SHOP_BUY_CPL"));
         if(param2)
         {
            Handler.execute(param2,[param3,param4]);
         }
      }
      
      public function server_DRAGON_BOAT_MAKE_ITEM(param1:uint, param2:Boolean, param3:*) : void
      {
         var _loc4_:DragonBoatMakeItemReq = new DragonBoatMakeItemReq();
         _loc4_.id = param1;
         _loc4_.autoBuy = param2;
         ServerEngine.ins.send(6354,_loc4_,new Handler(server_DRAGON_BOAT_MAKE_ITEM_cpl,[param3]));
      }
      
      private function server_DRAGON_BOAT_MAKE_ITEM_cpl(param1:*, param2:DragonBoatMakeItemRes, param3:ServerEvent) : void
      {
         service.checkRedPoint();
         if(param1)
         {
            Handler.execute(param1,[param2,param3]);
         }
      }
      
      public function server_DRAGON_BOAT_ONE_KEY_MAKE(param1:uint, param2:Boolean, param3:uint, param4:*) : void
      {
         var _loc5_:DragonBoatOneKeyMakeReq = new DragonBoatOneKeyMakeReq();
         _loc5_.id = param1;
         _loc5_.autoBuy = param2;
         _loc5_.num = param3;
         ServerEngine.ins.send(6355,_loc5_,new Handler(server_DRAGON_BOAT_ONE_KEY_MAKE_cpl,[param1,param2,param3,param4]));
      }
      
      private function server_DRAGON_BOAT_ONE_KEY_MAKE_cpl(param1:uint, param2:Boolean, param3:uint, param4:*, param5:DragonBoatOneKeyMakeRes, param6:ServerEvent) : void
      {
         this.service.initMakeNum(param5.num);
         this.service.myScore = param5.myScore;
         ObserverMgr.ins.sendNotice("DragonBoatService.MSG_CHANGE_COOK_COUNT");
         service.checkRedPoint();
         if(param4)
         {
            Handler.execute(param4,[param1,param2,param3,param5,param6]);
         }
      }
      
      public function server_DRAGON_BOAT_RANK_TABLE(param1:*) : void
      {
         ServerEngine.ins.send(6356,null,new Handler(server_DRAGON_BOAT_RANK_TABLE_cpl,[param1]));
      }
      
      private function server_DRAGON_BOAT_RANK_TABLE_cpl(param1:*, param2:DragonBoatRankTableRes, param3:ServerEvent) : void
      {
         if(param2 == null)
         {
            this.service.rankPanelRes = new DragonBoatRankTableRes();
            this.service.rankPanelRes.info = [];
         }
         else
         {
            this.service.rankPanelRes = param2;
         }
         if(param1)
         {
            Handler.execute(param1,[param2,param3]);
         }
      }
      
      public function server_DRAGON_BOAT_SINGLE_REWARD(param1:uint, param2:*) : void
      {
         var _loc3_:DragonBoatSingleRewardReq = new DragonBoatSingleRewardReq();
         _loc3_.id = param1;
         ServerEngine.ins.send(6357,_loc3_,new Handler(server_DRAGON_BOAT_SINGLE_REWARD_cpl,[param1,param2]));
      }
      
      private function server_DRAGON_BOAT_SINGLE_REWARD_cpl(param1:uint, param2:*, param3:DragonBoatSingleRewardRes, param4:ServerEvent) : void
      {
         this.service.infoRes.singleReward.haveGetId.push(param1);
         service.checkRedPoint();
         if(param2)
         {
            Handler.execute(param2,[param3,param4]);
         }
      }
      
      public function server_DRAGON_BOAT_DONATE(param1:PlayerBaseInfo, param2:uint, param3:uint, param4:uint, param5:*) : void
      {
         var _loc6_:DragonBoatDonateReq = new DragonBoatDonateReq();
         _loc6_.id = param1.id;
         _loc6_.itemId = param2;
         _loc6_.count = param3;
         _loc6_.stamp = param4;
         ServerEngine.ins.send(6360,_loc6_,new Handler(server_DRAGON_BOAT_DONATE_cpl,[param1,param5]));
      }
      
      private function server_DRAGON_BOAT_DONATE_cpl(param1:PlayerBaseInfo, param2:*, param3:DragonBoatDonateRes, param4:ServerEvent) : void
      {
         var _loc8_:int = 0;
         var _loc5_:* = null;
         var _loc7_:int = this.service.donatePanelRes.info.length;
         _loc8_ = 0;
         while(_loc8_ < _loc7_)
         {
            _loc5_ = this.service.donatePanelRes.info[_loc8_];
            if(_loc5_.stamp == param3.stamp && Uint64Util.equal(_loc5_.id.id,param3.id))
            {
               _loc5_.donatedNum = param3.count;
               if(_loc5_.donatedNum > 10)
               {
                  this.service.donatePanelRes.info.splice(_loc8_,1);
               }
               break;
            }
            _loc8_++;
         }
         var _loc6_:DonateLog = new DonateLog();
         _loc6_.donatedId = param1;
         _loc6_.stamp = param3.stamp;
         _loc6_.count = param3.count;
         this.service.donatePanelRes.log.unshift(_loc6_);
         ObserverMgr.ins.sendNotice("DragonBoatService.MSG_DONOTE_NEW",param3);
         if(param2)
         {
            Handler.execute(param2,[param3,param4]);
         }
      }
      
      public function server_DRAGON_BOAT_REQ_DONATE(param1:uint, param2:uint, param3:*) : void
      {
         var _loc4_:DragonBoatReqDonateReq = new DragonBoatReqDonateReq();
         _loc4_.itemId = param1;
         _loc4_.itemNum = param2;
         ServerEngine.ins.send(6361,_loc4_,new Handler(server_DRAGON_BOAT_REQ_DONATE_cpl,[param3]));
      }
      
      private function server_DRAGON_BOAT_REQ_DONATE_cpl(param1:*, param2:*, param3:ServerEvent) : void
      {
         if(param1)
         {
            Handler.execute(param1,[param2,param3]);
         }
      }
      
      public function server_DRAGON_BOAT_GET_MATERIALS(param1:*) : void
      {
         ServerEngine.ins.send(6358,null,new Handler(server_DRAGON_BOAT_GET_MATERIALS_cpl,[param1]));
      }
      
      private function server_DRAGON_BOAT_GET_MATERIALS_cpl(param1:*) : void
      {
         this.service.infoRes.panel.canGet = 2;
         service.checkRedPoint();
         if(param1)
         {
            Handler.execute(param1,[]);
         }
      }
   }
}
