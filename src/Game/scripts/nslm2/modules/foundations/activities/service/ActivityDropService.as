package nslm2.modules.foundations.activities.service
{
   import nslm2.nets.sockets.ServerEngine;
   import proto.ActivityDropStaticNotify;
   import nslm2.modules.foundations.activities.model.ActivityDropModel;
   
   public class ActivityDropService
   {
      
      private static var _ins:nslm2.modules.foundations.activities.service.ActivityDropService;
       
      
      public function ActivityDropService()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.foundations.activities.service.ActivityDropService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.foundations.activities.service.ActivityDropService();
         }
         return _ins;
      }
      
      public function init() : void
      {
         ServerEngine.ins.addAlwayHandler(8520,onServerCpl_activityDropCpl);
      }
      
      public function onServerCpl_activityDropCpl(param1:ActivityDropStaticNotify) : void
      {
         ActivityDropModel.ins.parseDropStaticNotify(param1);
      }
   }
}
