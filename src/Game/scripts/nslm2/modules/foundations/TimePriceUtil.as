package nslm2.modules.foundations
{
   import nslm2.modules.foundations.vip.model.VipModel;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcTimePriceVo;
   import nslm2.common.model.PlayerModel;
   import nslm2.common.vo.WealthVo;
   import nslm2.utils.WealthUtil;
   import proto.TimesBuyReq;
   import nslm2.nets.sockets.ServerEngine;
   import morn.core.handlers.Handler;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.ProtocolStatusRes;
   import nslm2.common.globals.GlobalRef;
   import morn.customs.components.WealthRender;
   
   public class TimePriceUtil
   {
      
      private static var _buyKind:int;
      
      private static var _overHandler;
      
      private static var _vipLimitId:int;
      
      private static var _buyCnt:int;
       
      
      public function TimePriceUtil()
      {
         super();
      }
      
      public static function getMaxTimes(param1:int) : int
      {
         var _loc3_:* = null;
         var _loc2_:int = TimePriceConsts.idDict.getValue(param1);
         if(_loc2_ != 0)
         {
            return int(VipModel.ins.getVipValue(_loc2_));
         }
         _loc3_ = StcMgr.ins.getVoArrByColumnValue("static_time_price","kind",param1);
         _loc3_.sortOn("times",16 | 2);
         return (_loc3_[0] as StcTimePriceVo).times;
      }
      
      public static function curTimes(param1:int) : int
      {
         var _loc2_:int = PlayerModel.ins.buyTimesLib[param1];
         return _loc2_;
      }
      
      public static function curTimePriceVo(param1:int) : WealthVo
      {
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc4_:int = 0;
         var _loc2_:StcTimePriceVo = StcMgr.ins.getVoByMultiColumnValue("static_time_price",["kind","times"],[param1,curTimes(param1) + 1]);
         if(_loc2_)
         {
            return WealthUtil.parseCostStr(_loc2_.price);
         }
         _loc3_ = StcMgr.ins.getVoArrByColumnValue("static_time_price","kind",param1);
         _loc3_.sortOn("times",16);
         _loc5_ = _loc3_.pop();
         _loc4_ = _loc5_.times;
         _loc4_ = Math.min(_loc4_,curTimes(param1) + 1);
         return WealthUtil.parseCostStr(StcMgr.ins.getVoByMultiColumnValue("static_time_price",["kind","times"],[param1,_loc4_]).price);
      }
      
      public static function getCost(param1:int, param2:int) : WealthVo
      {
         var _loc4_:* = null;
         var _loc6_:* = null;
         var _loc5_:int = 0;
         var _loc3_:StcTimePriceVo = StcMgr.ins.getVoByMultiColumnValue("static_time_price",["kind","times"],[param1,param2]);
         if(_loc3_)
         {
            return WealthUtil.parseCostStr(_loc3_.price);
         }
         _loc4_ = StcMgr.ins.getVoArrByColumnValue("static_time_price","kind",param1);
         _loc4_.sortOn("times",16);
         _loc6_ = _loc4_.pop();
         _loc5_ = _loc6_.times;
         _loc5_ = Math.min(_loc5_,param2);
         return WealthUtil.parseCostStr(StcMgr.ins.getVoByMultiColumnValue("static_time_price",["kind","times"],[param1,_loc5_]).price);
      }
      
      public static function buyTimes(param1:int, param2:int, param3:* = null, param4:int = 0) : void
      {
         var _loc5_:TimesBuyReq = new TimesBuyReq();
         _loc5_.kind = param1;
         _loc5_.time = param2;
         _buyKind = param1;
         _overHandler = param3;
         _vipLimitId = param4;
         _buyCnt = param2;
         ServerEngine.ins.send(5335,_loc5_,server_buyAddStaminaCpl,server_buyAddStaminaErr);
      }
      
      private static function server_buyAddStaminaCpl() : void
      {
         addBuyTimes(_buyKind,_buyCnt);
         if(_overHandler)
         {
            Handler.execute(_overHandler);
            _overHandler = null;
         }
         ObserverMgr.ins.sendNotice("changeContent",{
            "buyKind":_buyKind,
            "vipLimitId":_vipLimitId
         });
      }
      
      private static function server_buyAddStaminaErr(param1:ProtocolStatusRes) : void
      {
         ObserverMgr.ins.regObserver(GlobalRef.playerHeader_icon_stamina as WealthRender);
         ServerEngine.ins.doDefaultErr(param1);
      }
      
      private static function addBuyTimes(param1:int, param2:int = 1) : void
      {
         if(PlayerModel.ins.buyTimesLib[_buyKind])
         {
            var _loc3_:* = _buyKind;
            var _loc4_:* = PlayerModel.ins.buyTimesLib[_loc3_] + param2;
            PlayerModel.ins.buyTimesLib[_loc3_] = _loc4_;
         }
         else
         {
            PlayerModel.ins.buyTimesLib[_buyKind] = param2;
         }
      }
   }
}
