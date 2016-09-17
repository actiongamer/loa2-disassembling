package nslm2.common.service
{
   import proto.CrossSceneWatchReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.CrossSceneWatchCloseReq;
   import proto.CrossSceneEnterReq;
   import proto.CrossSceneLeaveReq;
   
   public class CrossSeverScenceService
   {
       
      
      public function CrossSeverScenceService()
      {
         super();
      }
      
      public static function requestSceneWatch(param1:int, param2:*) : void
      {
         var _loc3_:CrossSceneWatchReq = new CrossSceneWatchReq();
         _loc3_.sceneId = param1;
         ServerEngine.ins.send(3033,_loc3_,param2);
      }
      
      public static function requestSceneUnWatch(param1:int) : void
      {
         var _loc2_:CrossSceneWatchCloseReq = new CrossSceneWatchCloseReq();
         _loc2_.sceneId = param1;
         ServerEngine.ins.send(3038,_loc2_);
      }
      
      public static function requestSceneEnter(param1:int) : void
      {
         var _loc2_:CrossSceneEnterReq = new CrossSceneEnterReq();
         _loc2_.sceneId = param1;
         ServerEngine.ins.send(3034,_loc2_);
      }
      
      public static function requestSceneLeave(param1:int) : void
      {
         var _loc2_:CrossSceneLeaveReq = new CrossSceneLeaveReq();
         _loc2_.sceneId = param1;
         ServerEngine.ins.send(3035,_loc2_);
      }
   }
}
