package nslm2.modules.footstones.alerts
{
   import proto.EventNotify;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import morn.core.handlers.Handler;
   import nslm2.nets.sockets.ServerEngine;
   
   public class EventNoticeService
   {
      
      private static var _ins:nslm2.modules.footstones.alerts.EventNoticeService;
       
      
      public var handler;
      
      public var cache:Vector.<EventNotify>;
      
      public function EventNoticeService()
      {
         cache = new Vector.<EventNotify>();
         super();
         ServerEngine.ins.addAlwayHandler(6003,server_eventNotify);
      }
      
      public static function get ins() : nslm2.modules.footstones.alerts.EventNoticeService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.footstones.alerts.EventNoticeService();
         }
         return _ins;
      }
      
      private function server_eventNotify(param1:EventNotify) : void
      {
         if(ArrayUtil.indexOf([541,542,556,557],param1.kind) >= 0 && StcMgr.ins.getFunctionVo(40740).isopen != 1)
         {
            return;
         }
         if(handler == null)
         {
            cache.push(param1);
         }
         else
         {
            Handler.execute(handler,[param1]);
         }
      }
   }
}
