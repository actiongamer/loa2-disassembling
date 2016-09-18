package nslm2.common.service
{
   import nslm2.common.model.OpActivityStaticDataModel;
   import proto.GetOpActivityStaticReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.GetOpActivityStaticRes;
   import morn.core.handlers.Handler;
   import nslm2.modules.funnies.newYears.luckTrees.services.LuckTreeService;
   import nslm2.modules.funnies.newYears.day51s.services.Day51Service;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.OpActivityStaticNotify;
   
   public class OpActivityStaticServiceHandler
   {
      
      private static var _ins:nslm2.common.service.OpActivityStaticServiceHandler;
       
      
      private var model:OpActivityStaticDataModel;
      
      private var _getDataCallBack;
      
      public function OpActivityStaticServiceHandler()
      {
         model = OpActivityStaticDataModel.ins;
         super();
         ServerEngine.ins.addAlwayHandler(8531,staticNotifyHandler);
      }
      
      public static function get ins() : nslm2.common.service.OpActivityStaticServiceHandler
      {
         if(_ins == null)
         {
            _ins = new nslm2.common.service.OpActivityStaticServiceHandler();
         }
         return _ins;
      }
      
      public function requestStaticData(param1:Array, param2:* = null) : void
      {
         _getDataCallBack = param2;
         var _loc3_:GetOpActivityStaticReq = new GetOpActivityStaticReq();
         _loc3_.kind = param1;
         ServerEngine.ins.send(8530,_loc3_,initStaticData);
      }
      
      private function initStaticData(param1:GetOpActivityStaticRes) : void
      {
         model.updateStaticData(param1.oas);
         if(_getDataCallBack != null)
         {
            Handler.execute(_getDataCallBack);
            _getDataCallBack = null;
         }
         LuckTreeService.ins.checkRedPoint();
         Day51Service.ins.checkRedPoint();
         ObserverMgr.ins.sendNotice("op_activity_static_update");
      }
      
      private function staticNotifyHandler(param1:OpActivityStaticNotify) : void
      {
         model.updateStaticData(param1.oas);
         LuckTreeService.ins.checkRedPoint();
         ObserverMgr.ins.sendNotice("op_activity_static_update");
      }
   }
}
