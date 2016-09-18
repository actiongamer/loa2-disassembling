package nslm2.modules.funnies.busyActivity.towers.services
{
   import nslm2.nets.sockets.ServerEngine;
   import morn.core.handlers.Handler;
   import proto.TowerInfoRes;
   import nslm2.nets.sockets.ServerEvent;
   import proto.TowerRankRes;
   import proto.PlayerDataNotify;
   import proto.Item;
   import proto.TowerJumpReq;
   import proto.TowerJumpRes;
   import nslm2.modules.funnies.busyActivity.towers.services.stcVos.TowerStcVo_Tower;
   import proto.TowerScoreRewardReq;
   import proto.TowerBuyReq;
   import proto.TowerBuyRes;
   import proto.MineSweepShopInfo;
   import proto.StaticLuckTreeShopModel;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import flash.events.Event;
   
   public class TowerProto
   {
       
      
      public var service:nslm2.modules.funnies.busyActivity.towers.services.TowerService;
      
      public function TowerProto()
      {
         super();
      }
      
      public function server_TOWER_INFO(param1:*) : void
      {
         ServerEngine.ins.send(2190,null,new Handler(server_TOWER_INFO_cpl,[param1]));
      }
      
      private function server_TOWER_INFO_cpl(param1:*, param2:TowerInfoRes, param3:ServerEvent) : void
      {
         this.service.infoRes = param2;
         this.service.shop.initShopBuyInfo(param2.info);
         ServerEngine.ins.addAlwayHandler(8004,serverCpl_playerDataNotify);
         if(param1)
         {
            Handler.execute(param1,[param2,param3]);
         }
      }
      
      public function server_TOWER_RANK(param1:*) : void
      {
         ServerEngine.ins.send(2191,null,new Handler(server_TOWER_RANK_cpl,[param1]));
      }
      
      private function server_TOWER_RANK_cpl(param1:*, param2:TowerRankRes, param3:ServerEvent) : void
      {
         if(param2 == null)
         {
            param2 = new TowerRankRes();
            param2.infos = [];
         }
         this.service.rankPanelRes = param2;
         if(param1)
         {
            Handler.execute(param1,[param2,param3]);
         }
      }
      
      private function serverCpl_playerDataNotify(param1:PlayerDataNotify) : void
      {
         var _loc3_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:* = null;
         var _loc4_:Boolean = false;
         if(this.service.stcModel.towerCostBase)
         {
            if(param1.addItems)
            {
               _loc3_ = param1.addItems.length;
               _loc5_ = 0;
               while(_loc5_ < _loc3_)
               {
                  _loc2_ = param1.addItems[_loc5_];
                  if(_loc2_.itemId == this.service.stcModel.towerCostBase.sid)
                  {
                     _loc4_ = true;
                  }
                  _loc5_++;
               }
            }
         }
         if(_loc4_)
         {
            this.service.checkRedPoint();
         }
      }
      
      public function server_TOWER_JUMP(param1:int, param2:int, param3:*, param4:*) : void
      {
         var _loc5_:TowerJumpReq = new TowerJumpReq();
         _loc5_.kind = param1;
         _loc5_.count = param2;
         ServerEngine.ins.send(2192,_loc5_,new Handler(server_TOWER_JUMP_cpl,[param1,param2,param3]),param4);
      }
      
      private function server_TOWER_JUMP_cpl(param1:int, param2:int, param3:*, param4:TowerJumpRes, param5:ServerEvent) : void
      {
         var _loc8_:Array = param5.dataNotifyCacheVo.change.toAddWealthArr();
         this.service.infoRes.score = param4.score;
         var _loc7_:int = param4.currlv;
         var _loc6_:TowerStcVo_Tower = this.service.stcModel.towerModelKindDict[param1][_loc7_];
         if(param4.pos == _loc6_.rewardArr.length - 1)
         {
            if(_loc7_ > this.service.stcModel.minLayer)
            {
               if(_loc7_ == this.service.stcModel.maxLayer)
               {
                  _loc7_ = 0;
               }
               else if(this.service.needDown)
               {
                  _loc7_--;
               }
            }
         }
         else if(param4.pos == 0)
         {
            if(_loc7_ < this.service.stcModel.maxLayer)
            {
               _loc7_++;
            }
         }
         this.service.infoRes.lvs[param1] = _loc7_;
         service.checkRedPoint();
         if(param3)
         {
            Handler.execute(param3,[param2,param4.currlv,param4.pos,_loc8_,param4,param5]);
         }
      }
      
      public function server_TOWER_SCORE_REWARD(param1:int, param2:*) : void
      {
         var _loc3_:TowerScoreRewardReq = new TowerScoreRewardReq();
         _loc3_.score = param1;
         ServerEngine.ins.send(2193,_loc3_,new Handler(server_TOWER_SCORE_REWARD_cpl,[param1,param2]));
      }
      
      private function server_TOWER_SCORE_REWARD_cpl(param1:int, param2:*, param3:*, param4:ServerEvent) : void
      {
         this.service.infoRes.scored.push(param1);
         service.checkRedPoint();
         if(param2)
         {
            Handler.execute(param2,[param3,param4]);
         }
      }
      
      public function server_TOWER_BUY(param1:int, param2:int, param3:*) : void
      {
         var _loc4_:TowerBuyReq = new TowerBuyReq();
         _loc4_.pos = param1;
         _loc4_.count = param2;
         ServerEngine.ins.send(2195,_loc4_,new Handler(server_TOWER_BUY_cpl,[param1,param2,param3]));
      }
      
      private function server_TOWER_BUY_cpl(param1:int, param2:int, param3:*, param4:TowerBuyRes, param5:ServerEvent) : void
      {
         var _loc11_:int = 0;
         var _loc8_:* = null;
         if(param4 == null)
         {
            param4 = new TowerBuyRes();
            param4.id = param1;
            param4.buyNum = this.service.shop.getBuyedTimes(param1) + param2;
         }
         var _loc6_:MineSweepShopInfo = new MineSweepShopInfo();
         _loc6_.itemId = param4.id;
         _loc6_.buyNum = param4.buyNum;
         this.service.shop.shopBuyInfoDict.put(param4.id,_loc6_);
         var _loc10_:StaticLuckTreeShopModel = service.shop.shopDict.getValue(param4.id) as StaticLuckTreeShopModel;
         var _loc7_:Array = WealthUtil.costStrToArr(_loc10_.item);
         var _loc9_:int = _loc7_.length;
         _loc11_ = 0;
         while(_loc11_ < _loc9_)
         {
            _loc8_ = _loc7_[_loc11_];
            _loc8_.count = _loc8_.count * param2;
            _loc11_++;
         }
         FloatUtil.showGetItemsDisplayPanel(_loc7_);
         this.service.checkRedPoint();
         this.service.shop.dispatchEvent(new Event("EVT_SHOP_BUY_CPL"));
         if(param3)
         {
            Handler.execute(param3,[param4,param5]);
         }
      }
   }
}
