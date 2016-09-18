package nslm2.modules.foundations.miniNotice
{
   import proto.FunctionActionNotify;
   import nslm2.nets.sockets.ServerEngine;
   
   public class MiniNoticeService
   {
      
      private static var _ins:nslm2.modules.foundations.miniNotice.MiniNoticeService;
       
      
      public function MiniNoticeService()
      {
         super();
         ServerEngine.ins.addAlwayHandler(7425,onServerCpl_functionActionNotify);
      }
      
      public static function get ins() : nslm2.modules.foundations.miniNotice.MiniNoticeService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.foundations.miniNotice.MiniNoticeService();
         }
         return _ins;
      }
      
      public function onServerCpl_functionActionNotify(param1:FunctionActionNotify) : void
      {
         if(param1)
         {
            MiniNoticeTimerManager.parseFuncActionNotify(param1);
            MiniNoticeModel.ins.parseNotify(param1);
         }
      }
   }
}
