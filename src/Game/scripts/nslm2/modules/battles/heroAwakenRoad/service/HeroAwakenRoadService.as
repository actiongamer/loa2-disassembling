package nslm2.modules.battles.heroAwakenRoad.service
{
   import proto.JueRoadInfoReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.JueRoadFightStartReq;
   import proto.JueRoadSaoDangReq;
   import proto.JueRoadSaoDangRes;
   import nslm2.nets.sockets.ServerEvent;
   import proto.JueRoadFightEndRes;
   import proto.JueRoadGetRewardReq;
   import proto.JueRoadGetRewardRes;
   import proto.JueRoadRecordReq;
   import proto.JueRoadRecordRes;
   
   public class HeroAwakenRoadService
   {
      
      private static var _ins:nslm2.modules.battles.heroAwakenRoad.service.HeroAwakenRoadService;
       
      
      public function HeroAwakenRoadService()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.battles.heroAwakenRoad.service.HeroAwakenRoadService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.battles.heroAwakenRoad.service.HeroAwakenRoadService();
         }
         return _ins;
      }
      
      public function getjueRoadInfo(param1:Function) : void
      {
         var _loc2_:JueRoadInfoReq = new JueRoadInfoReq();
         ServerEngine.ins.send(7429,_loc2_,param1);
      }
      
      public function server_jueRoadFightStart(param1:uint, param2:uint, param3:Function) : void
      {
         var _loc4_:JueRoadFightStartReq = new JueRoadFightStartReq();
         _loc4_.nodeid = param1;
         _loc4_.chapterid = param2;
         ServerEngine.ins.send(7430,_loc4_,param3);
      }
      
      public function server_jueRoadSaoDang(param1:uint, param2:uint, param3:Function) : void
      {
         var _loc4_:JueRoadSaoDangReq = new JueRoadSaoDangReq();
         _loc4_.nodeid = param1;
         _loc4_.chapterid = param2;
         ServerEngine.ins.send(7432,_loc4_,server_saoDang_cpl);
      }
      
      private function server_saoDang_cpl(param1:JueRoadSaoDangRes, param2:ServerEvent) : void
      {
      }
      
      public function server_jueRoadFightEnd(param1:uint, param2:uint, param3:uint, param4:Array, param5:int, param6:Boolean, param7:Function) : void
      {
      }
      
      private function server_fightEnd_cpl(param1:JueRoadFightEndRes, param2:ServerEvent) : void
      {
      }
      
      public function server_jueRoadGetReward(param1:uint, param2:uint, param3:Function) : void
      {
         var _loc4_:JueRoadGetRewardReq = new JueRoadGetRewardReq();
         _loc4_.chapterid = param1;
         _loc4_.boxnum = param2;
         ServerEngine.ins.send(7433,_loc4_,server_getReward_cpl);
      }
      
      private function server_getReward_cpl(param1:JueRoadGetRewardRes, param2:ServerEvent) : void
      {
      }
      
      public function server_jueRoadRecord(param1:uint, param2:Function) : void
      {
         var _loc3_:JueRoadRecordReq = new JueRoadRecordReq();
         _loc3_.nodeid = param1;
         ServerEngine.ins.send(7438,_loc3_,param2);
      }
      
      private function server_roadRecord_cpl(param1:JueRoadRecordRes, param2:ServerEvent) : void
      {
      }
   }
}
