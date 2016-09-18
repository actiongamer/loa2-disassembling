package nslm2.modules.funnies.teamGuajiScenes.model
{
   import com.mz.core.interFace.IDispose;
   import com.mz.core.interFace.IObserver;
   import proto.PlayerBaseInfo;
   import nslm2.modules.funnies.teamGuajiScenes.TeamGuajiService;
   import nslm2.modules.funnies.teamGuajiScenes.vo.GuajiRankVo;
   import proto.GuajiReport;
   import nslm2.mgrs.stcMgrs.vos.StcRankVo;
   import nslm2.utils.WealthUtil;
   import proto.GuajiRankPlayer;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcSwapActionVo;
   import nslm2.modules.funnies.teamGuajiScenes.vo.TeamGuajiPvPScoreRewardVo;
   import proto.GJPvpInfo;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleRedPointMsg;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.common.vo.WealthVo;
   
   public class TeamGuajiModel implements IDispose, IObserver
   {
      
      private static var _ins:nslm2.modules.funnies.teamGuajiScenes.model.TeamGuajiModel;
       
      
      private var _pvpRankYesterDay:Array;
      
      private var _pvpRankToday:Array;
      
      public var pvpScoreReward:Array;
      
      public var scoreRwdIds:Array;
      
      public var rankRewardData:Array;
      
      public var crtPvPPlayers:Array;
      
      public var guajiLogArr:Array;
      
      public var isGuaji:Boolean;
      
      private var _pvpCount:int;
      
      private var _protectCD:int;
      
      public var pvpCntAddCD:int;
      
      public var buyPvPCnt:int;
      
      public var crtAttackTarget:PlayerBaseInfo;
      
      public var rankYesterDay:int;
      
      private var _rankToday:int;
      
      public var hasGotYestoDayReward:Boolean;
      
      public var hasGotSocreRewardIDArr:Array;
      
      private var _robPieceCountToday:int;
      
      private var _hasScoreRwd:Boolean;
      
      private var _hasYestoDayRankRwd:Boolean;
      
      public var showRobPanel:Boolean;
      
      public var showLogPanel:Boolean;
      
      public var allTreasurePieceArr:Array;
      
      public var needGetYesterDayRankData:Boolean = true;
      
      public function TeamGuajiModel()
      {
         var _loc1_:* = null;
         var _loc5_:* = null;
         var _loc4_:int = 0;
         _pvpRankYesterDay = [];
         _pvpRankToday = [];
         scoreRwdIds = [];
         crtPvPPlayers = [];
         guajiLogArr = [];
         hasGotSocreRewardIDArr = [];
         super();
         rankRewardData = StcMgr.ins.getVoArrByColumnValue("static_rank","kind",5);
         initScoreRewardData();
         allTreasurePieceArr = [];
         var _loc3_:Array = StcMgr.ins.getVoArrByColumnValue("static_item","kind",72);
         var _loc2_:int = _loc3_.length;
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc1_ = _loc3_[_loc4_];
            _loc5_ = WealthUtil.stcItemIdToHadWealthVoArr(_loc1_.id);
            allTreasurePieceArr.push(_loc5_);
            _loc4_++;
         }
         clearRankData();
         ObserverMgr.ins.regObserver(this);
      }
      
      public static function get ins() : nslm2.modules.funnies.teamGuajiScenes.model.TeamGuajiModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.funnies.teamGuajiScenes.model.TeamGuajiModel();
         }
         return _ins;
      }
      
      public function getFocusNotices() : Array
      {
         return ["server_time_notice_5"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         if(param1 == "server_time_notice_5")
         {
            TeamGuajiService.ins.server_get_guajiInfo(null);
            clearRankData();
            hasGotSocreRewardIDArr = [];
            hasGotYestoDayReward = false;
            TeamGuajiService.ins.getTodayRank();
            TeamGuajiService.ins.getYesterDayRank();
         }
      }
      
      private function clearRankData() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:int = 0;
         _pvpRankToday = [];
         _pvpRankYesterDay = [];
         _loc3_ = 0;
         while(_loc3_ < 50)
         {
            _loc1_ = new GuajiRankVo();
            _loc2_ = new GuajiRankVo();
            _loc1_.rank = _loc3_ + 1;
            _loc2_.rank = _loc3_ + 1;
            _pvpRankToday.push(_loc1_);
            _pvpRankYesterDay.push(_loc2_);
            _loc3_++;
         }
      }
      
      public function addGuajiLog(param1:GuajiReport) : void
      {
         guajiLogArr.push(param1);
         while(guajiLogArr.length > 3)
         {
            guajiLogArr.splice(0,1);
         }
      }
      
      public function getRewardByRank(param1:int) : Array
      {
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc4_:int = rankRewardData.length;
         var _loc2_:Array = [];
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = rankRewardData[_loc5_];
            if(_loc3_.rankMin <= param1 && _loc3_.rankMax >= param1)
            {
               _loc2_ = WealthUtil.costStrToArr(_loc3_.jibenjiangli);
               return _loc2_;
            }
            _loc5_++;
         }
         return _loc2_;
      }
      
      public function get yesterdayRank() : Array
      {
         return _pvpRankYesterDay;
      }
      
      public function dispose() : void
      {
      }
      
      public function set pvpRankYesterDay(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = param1.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = param1[_loc4_];
            (_pvpRankYesterDay[_loc4_] as GuajiRankVo).rankPlayer = _loc2_;
            _loc4_++;
         }
         ObserverMgr.ins.sendNotice("guaji_rank_update");
      }
      
      public function get pvpRankToday() : Array
      {
         return _pvpRankToday;
      }
      
      public function set pvpRankToday(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = param1.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = param1[_loc4_];
            (_pvpRankToday[_loc4_] as GuajiRankVo).rankPlayer = _loc2_;
            _loc4_++;
         }
         ObserverMgr.ins.sendNotice("guaji_rank_update");
      }
      
      private function initScoreRewardData() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc5_:int = 0;
         pvpScoreReward = [];
         var _loc1_:Array = StcMgr.ins.getVoArrByColumnValue("static_swap_action","kind","3");
         _loc1_.sortOn("id",16);
         var _loc4_:int = _loc1_.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = _loc1_[_loc5_];
            _loc3_ = new TeamGuajiPvPScoreRewardVo();
            _loc3_.stcVo = _loc2_;
            pvpScoreReward.push(_loc3_);
            scoreRwdIds.push(_loc2_.id);
            _loc5_++;
         }
      }
      
      public function get pvpCount() : int
      {
         return _pvpCount;
      }
      
      public function set pvpCount(param1:int) : void
      {
         if(param1 != _pvpCount)
         {
            _pvpCount = param1;
            ObserverMgr.ins.sendNotice("guaji_update_pvp_count");
         }
      }
      
      public function get protectCD() : int
      {
         return _protectCD;
      }
      
      public function set protectCD(param1:int) : void
      {
         if(_protectCD != param1)
         {
            _protectCD = param1;
            ObserverMgr.ins.sendNotice("guaji_update_protect_cd");
         }
      }
      
      public function updateKilledPlayer() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = crtPvPPlayers;
         for each(var _loc1_ in crtPvPPlayers)
         {
            if(crtAttackTarget && _loc1_ && Uint64Util.equal(_loc1_.info.id,crtAttackTarget.id))
            {
               _loc1_.isDead = true;
            }
         }
         ObserverMgr.ins.sendNotice("guaji_rob_success");
      }
      
      public function updateScoreRewardStatus() : void
      {
         hasScoreRwd = false;
         var _loc3_:int = 0;
         var _loc2_:* = pvpScoreReward;
         for each(var _loc1_ in pvpScoreReward)
         {
            if(hasGotSocreRewardIDArr.indexOf(_loc1_.stcVo.id) >= 0)
            {
               _loc1_.status = 2;
            }
            else if(robPieceCountToday >= _loc1_.stcVo.condition1count)
            {
               _loc1_.status = 1;
               hasScoreRwd = true;
            }
            else
            {
               _loc1_.status = 0;
            }
         }
         updateRedPointStatus();
      }
      
      public function get robPieceCountToday() : int
      {
         return _robPieceCountToday;
      }
      
      public function set robPieceCountToday(param1:int) : void
      {
         if(_robPieceCountToday != param1)
         {
            _robPieceCountToday = param1;
            updateScoreRewardStatus();
         }
      }
      
      public function updateYesterDayRewardStatus() : void
      {
         if(rankYesterDay > 0 && rankYesterDay <= 50 && !hasGotYestoDayReward)
         {
            hasYestoDayRankRwd = true;
         }
         else
         {
            hasYestoDayRankRwd = false;
         }
         updateRedPointStatus();
      }
      
      private function updateRedPointStatus() : void
      {
         if(hasYestoDayRankRwd || hasScoreRwd)
         {
            ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(41221,true));
         }
         else
         {
            ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(41221,false));
         }
      }
      
      public function get hasYestoDayRankRwd() : Boolean
      {
         return _hasYestoDayRankRwd;
      }
      
      public function set hasYestoDayRankRwd(param1:Boolean) : void
      {
         if(_hasYestoDayRankRwd != param1)
         {
            _hasYestoDayRankRwd = param1;
            ObserverMgr.ins.sendNotice("update_rank_rwd_stagtus");
         }
      }
      
      public function get hasScoreRwd() : Boolean
      {
         return _hasScoreRwd;
      }
      
      public function set hasScoreRwd(param1:Boolean) : void
      {
         if(_hasScoreRwd != param1)
         {
            _hasScoreRwd = param1;
            ObserverMgr.ins.sendNotice("update_rank_rwd_stagtus");
         }
      }
      
      public function get rankToday() : int
      {
         return _rankToday;
      }
      
      public function set rankToday(param1:int) : void
      {
         if(_rankToday != param1)
         {
            _rankToday = param1;
            ObserverMgr.ins.sendNotice("update_my_rank");
         }
      }
   }
}
