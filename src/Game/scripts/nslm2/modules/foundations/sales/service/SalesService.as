package nslm2.modules.foundations.sales.service
{
   import nslm2.modules.foundations.sales.model.SalesModel;
   import proto.SuperSaleResetNotify;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.SuperSaleAllCountNotify;
   import proto.SuperSaleInfoData;
   import proto.SuperSaleRechargeExtraRewardNotify;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcRechargeVo;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import nslm2.utils.WealthUtil;
   import nslm2.nets.sockets.ServerEngine;
   import proto.SuperSaleInfoRes;
   import proto.SuperSaleBuyItemReq;
   import proto.SuperSaleGetRewardReq;
   import proto.generalWalfareInfo;
   
   public class SalesService
   {
      
      private static var _ins:nslm2.modules.foundations.sales.service.SalesService;
       
      
      private var model:SalesModel;
      
      public function SalesService()
      {
         model = SalesModel.ins;
         super();
         ServerEngine.ins.addAlwayHandler(7410,infoCplHandler);
         ServerEngine.ins.addAlwayHandler(7414,getSalesNotify);
         ServerEngine.ins.addAlwayHandler(7413,getPeopleNotify);
         ServerEngine.ins.addAlwayHandler(7421,getResetNotify);
      }
      
      public static function get ins() : nslm2.modules.foundations.sales.service.SalesService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.foundations.sales.service.SalesService();
         }
         return _ins;
      }
      
      private function getResetNotify(param1:SuperSaleResetNotify) : void
      {
         model.showHint = param1.qipao;
         ObserverMgr.ins.sendNotice("SalesReset");
      }
      
      public function getPeopleNotify(param1:SuperSaleAllCountNotify) : void
      {
         model.allcount = param1.allcount;
         ObserverMgr.ins.sendNotice("RefreshAllCount");
         ObserverMgr.ins.sendNotice("ShowRedPoint",model.showOrHideRedPoint1());
      }
      
      public function getInitNotify(param1:SuperSaleInfoData) : void
      {
         model.alreadyget = param1.alreadyget;
         model.cangetBenefit = param1.canget;
         model.showHint = param1.qipao;
      }
      
      public function getSalesNotify(param1:SuperSaleRechargeExtraRewardNotify) : void
      {
         model.currentvalue = param1.youhuizhi;
         model.limittime = param1.youhuilimit;
         var _loc2_:StcRechargeVo = StcMgr.ins.getRechargeVo(param1.rechargeid);
         FloatUtil.showGetItemsDisplayPanel([WealthUtil.parseCostStr("3:0:" + _loc2_.present)]);
         ObserverMgr.ins.sendNotice("AddSalesValue");
      }
      
      public function getSalesInfo(param1:* = null) : void
      {
         ServerEngine.ins.send(7410,null,param1);
      }
      
      public function infoCplHandler(param1:SuperSaleInfoRes) : void
      {
         model.currentvalue = param1.currentvalue;
         model.maxvalue = param1.maxvalue;
         model.itemsArr = param1.items;
         model.lastresettime = param1.lastresettime;
         model.nextresettime = param1.nextresettime;
         model.alreadybuy = param1.alreadybuy;
         model.allcount = param1.allcount;
         model.alreadyget = param1.alreadyget;
         model.canrecharge = param1.canrecharge;
         model.limittime = param1.limittime;
         model.recharge = param1.recharge;
         model.getList = param1.getList;
      }
      
      public function buyItem(param1:int, param2:*) : void
      {
         var _loc3_:SuperSaleBuyItemReq = new SuperSaleBuyItemReq();
         _loc3_.itemid = param1;
         ServerEngine.ins.send(7412,_loc3_,param2);
      }
      
      public function getReward(param1:int, param2:*) : void
      {
         var _loc3_:SuperSaleGetRewardReq = new SuperSaleGetRewardReq();
         _loc3_.rewardid = param1;
         ServerEngine.ins.send(7411,_loc3_,param2);
      }
      
      public function getStatus(param1:uint) : uint
      {
         var _loc4_:* = null;
         var _loc3_:int = 0;
         var _loc2_:Array = model.getList;
         _loc3_ = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc4_ = _loc2_[_loc3_] as generalWalfareInfo;
            if(_loc4_.id == param1)
            {
               return _loc4_.status;
            }
            _loc3_++;
         }
         return 0;
      }
      
      public function setStatus(param1:uint, param2:uint) : void
      {
         var _loc5_:* = null;
         var _loc4_:int = 0;
         var _loc3_:Array = model.getList;
         _loc4_ = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc5_ = _loc3_[_loc4_] as generalWalfareInfo;
            if(_loc5_.id == param1)
            {
               _loc5_.status = param2;
               return;
            }
            _loc4_++;
         }
      }
   }
}
