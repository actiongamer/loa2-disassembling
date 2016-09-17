package nslm2.modules.funnies.arenas
{
   import flash.events.EventDispatcher;
   import proto.ArenaInfoRes;
   import com.mz.core.utils.DictHash;
   import proto.ArenaReportNotify;
   import nslm2.nets.sockets.ServerEvent;
   import com.mz.core.event.MzEvent;
   import proto.ArenaPlayer;
   import nslm2.nets.sockets.ServerEngine;
   import proto.ArenaChangeEnemyRes;
   import flash.events.Event;
   import nslm2.modules.funnies.arenas.scores.ArenaScoreVo;
   import proto.GetSwapActionsReq;
   import proto.GetSwapActionsRes;
   import proto.SwapActionInfo;
   import com.netease.protobuf.UInt64;
   import proto.ArenaMultiChallengeReq;
   import proto.ArenaMultiChallengeRes;
   import flash.events.IEventDispatcher;
   
   public class ArenaService extends EventDispatcher
   {
      
      public static const EVT_CHANGE_ENEMY:String = "EVT_CHANGE_ENEMY";
      
      public static const EVT_CHANGE_CD:String = "EVT_CHANGE_CD";
      
      public static const EVT_BE_CHANGE_RANK:String = "EVT_BE_CHANGE_RANK";
      
      public static const EVT_CHANGE_SCORE_CAN_GET_REWARD:String = "EVT_CHANGE_SCORE_CAN_GET_REWARD";
      
      public static const EVT_MULTI_CHALLENGE_SUCCESS:String = "evt_multi_challenge_success";
      
      public static const EVT_NEW_REPORTS:String = "EVT_NEW_REPORTS";
      
      public static const EVT_SWAPACTION_INFO_CPL:String = "EVT_SWAPACTION_INFO_CPL";
      
      public static const EVT_UPDATE_ONE_CLICK:String = "ArenaService.EVT_UPDATE_ONE_CLICK";
      
      public static const UPDATA_INFO_RES:String = "updataInfoRes";
      
      private static var _ins:nslm2.modules.funnies.arenas.ArenaService;
       
      
      public var infoRes:ArenaInfoRes;
      
      public var swapActionInfos:DictHash;
      
      public function ArenaService(param1:IEventDispatcher = null)
      {
         swapActionInfos = new DictHash();
         super(param1);
         infoRes = new ArenaInfoRes();
         ServerEngine.ins.addAlwayHandler(4042,server_arenaReport_cpl);
      }
      
      public static function get ins() : nslm2.modules.funnies.arenas.ArenaService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.funnies.arenas.ArenaService();
         }
         return _ins;
      }
      
      private function server_arenaReport_cpl(param1:ArenaReportNotify, param2:ServerEvent) : void
      {
         this.infoRes.reports.unshift(param1.report);
         this.dispatchEvent(new MzEvent("EVT_NEW_REPORTS",param1.report));
      }
      
      public function server_info_cpl(param1:ArenaInfoRes) : void
      {
         this.infoRes = param1;
      }
      
      public function init(param1:uint, param2:uint) : void
      {
         if(param1 == 0)
         {
            param1 = 2147483647 - 1000;
         }
         if(param2 == 0)
         {
            param2 = 2147483647 - 1000;
         }
         infoRes.rank = param1;
         infoRes.histTopRank = param2;
      }
      
      public function get histTopRank() : uint
      {
         return infoRes.histTopRank;
      }
      
      public function sortArenaPlayers() : void
      {
         infoRes.arenaPlayers.sortOn(ArenaPlayer.RANK.name,16);
      }
      
      public function changeArenaPlayer() : void
      {
         ServerEngine.ins.send(4036,null,server_changeEnemy_cpl);
      }
      
      private function server_changeEnemy_cpl(param1:ArenaChangeEnemyRes) : void
      {
         infoRes.arenaPlayers = param1.arenaPlayers;
         sortArenaPlayers();
         this.dispatchEvent(new Event("EVT_CHANGE_ENEMY"));
      }
      
      public function changeCD(param1:uint) : void
      {
         infoRes.cdStamp = param1;
         this.dispatchEvent(new Event("EVT_CHANGE_CD"));
      }
      
      public function checkScoreCanGet() : void
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         infoRes.canGetScoreReward = false;
         var _loc2_:int = this.swapActionInfos.array.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = this.swapActionInfos.array[_loc3_];
            if(_loc1_.canGetReward)
            {
               infoRes.canGetScoreReward = true;
            }
            _loc3_++;
         }
         this.dispatchEvent(new Event("EVT_CHANGE_SCORE_CAN_GET_REWARD"));
      }
      
      public function beChangeRank(param1:int) : void
      {
         infoRes.rank = param1;
         this.dispatchEvent(new Event("EVT_BE_CHANGE_RANK"));
      }
      
      public function server_getSwapActions(param1:Array) : void
      {
         var _loc2_:GetSwapActionsReq = new GetSwapActionsReq();
         _loc2_.ids = param1;
         ServerEngine.ins.send(8007,_loc2_,server_swapActions_cpl);
      }
      
      private function server_swapActions_cpl(param1:GetSwapActionsRes) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = param1.info.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = param1.info[_loc4_];
            this.swapActionInfos.put(_loc2_.id,new ArenaScoreVo(_loc2_.id,_loc2_));
            _loc4_++;
         }
         this.swapActionInfos.array.sortOn("sid",16);
         checkScoreCanGet();
         this.dispatchEvent(new MzEvent("EVT_SWAPACTION_INFO_CPL"));
      }
      
      public function requestMultiChallenge(param1:UInt64, param2:int, param3:int) : void
      {
         var _loc4_:ArenaMultiChallengeReq = new ArenaMultiChallengeReq();
         _loc4_.id = param1;
         _loc4_.rank = param2;
         _loc4_.times = param3;
         ServerEngine.ins.send(4040,_loc4_,server_MultiChallenge);
      }
      
      private function server_MultiChallenge(param1:ArenaMultiChallengeRes) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         infoRes.isCdRed = param1.isCdRed;
         infoRes.cdStamp = param1.cdStamp;
         infoRes.scores = param1.scores;
         infoRes.residualTimes = param1.residualTimes;
         infoRes.results = [];
         _loc3_ = 0;
         while(_loc3_ < param1.results.length)
         {
            _loc2_ = new ArenaMultiChallengeResultVo(_loc3_,param1.results[_loc3_].isWin,param1.results[_loc3_].drops);
            infoRes.results.push(_loc2_);
            _loc3_++;
         }
         this.dispatchEvent(new Event("evt_multi_challenge_success"));
      }
   }
}
