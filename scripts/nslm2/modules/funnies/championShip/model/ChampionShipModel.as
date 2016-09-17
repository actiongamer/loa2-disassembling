package nslm2.modules.funnies.championShip.model
{
   import com.mz.core.interFace.IDispose;
   import com.mz.core.utils.DictHash;
   import org.specter3d.display.Specter3D;
   import proto.CompeteStageInfoRes;
   import proto.CompeteInfoRes;
   import proto.CompeteStatusTimeNotify;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.CompetePlayerDisplayInfo;
   import proto.CompeteGroupStageInfoRes;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.common.vo.WealthVo;
   import nslm2.mgrs.stcMgrs.vos.StcGambleVo;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.funnies.championShip.consts.ChampionshipConsts;
   
   public class ChampionShipModel implements IDispose
   {
      
      private static var _ins:nslm2.modules.funnies.championShip.model.ChampionShipModel;
       
      
      public var playerDataDic:DictHash;
      
      public var groupDataDic:DictHash;
      
      public var crtStatus:int;
      
      public var gambleAvailableStatus:int;
      
      public var nextRoundTime:uint;
      
      public var cdType:int;
      
      public var myGroupIndex:int;
      
      public var myRoundIndex:int;
      
      public var selectedGroupIndex:int;
      
      public var selectedNodeIndex:int;
      
      public var layer3D:Specter3D;
      
      private var _rewardList:Array;
      
      public var myRank:int;
      
      public var hasGotReward:Boolean;
      
      private var gambleCostDic:DictHash;
      
      private var _canGetGambleReward:Boolean;
      
      public var crtCompeteStageInfoRes:CompeteStageInfoRes;
      
      public var funcOpenTime:uint;
      
      public function ChampionShipModel()
      {
         super();
         playerDataDic = new DictHash();
         groupDataDic = new DictHash();
      }
      
      public static function get ins() : nslm2.modules.funnies.championShip.model.ChampionShipModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.funnies.championShip.model.ChampionShipModel();
         }
         return _ins;
      }
      
      public function updateChampionShipBaseInfo(param1:CompeteInfoRes) : void
      {
         canGetGambleReward = param1.canGetGambleReward;
         if(crtStatus == 0 && param1.curStatus != crtStatus)
         {
            clearOldData();
         }
         crtStatus = param1.curStatus;
         gambleAvailableStatus = param1.nextAvaiStatus;
         nextRoundTime = param1.nextStartTime;
         myRank = param1.playerRank;
         hasGotReward = param1.rankRewardStatus == 2;
         cdType = param1.timeKind;
         if(param1.isPlayerIn)
         {
            myGroupIndex = param1.playerGStageIndex;
         }
      }
      
      private function clearOldData() : void
      {
         playerDataDic.clear();
         groupDataDic.clear();
      }
      
      public function updateStatus(param1:CompeteStatusTimeNotify) : void
      {
         if(crtStatus == 0 && param1.curStatus != crtStatus)
         {
            clearOldData();
         }
         crtStatus = param1.curStatus;
         gambleAvailableStatus = param1.nextAvaiStatus;
         nextRoundTime = param1.nextStartTime;
         cdType = param1.timeKind;
         ObserverMgr.ins.sendNotice("notice_update_status");
      }
      
      public function updatePlayerData(param1:int, param2:Array) : void
      {
         param2.sortOn(CompetePlayerDisplayInfo.DISPLAYINDEX.name,16);
         playerDataDic.put(param1,param2);
         ObserverMgr.ins.sendNotice("notice_update_playres");
      }
      
      public function updateGroupData(param1:int, param2:CompeteGroupStageInfoRes) : void
      {
         groupDataDic.put(param1,param2);
         ObserverMgr.ins.sendNotice("notice_update_nodes");
      }
      
      public function getGroupPlayersData() : Array
      {
         return playerDataDic.getValue(selectedGroupIndex);
      }
      
      public function getGroupCompeData() : CompeteGroupStageInfoRes
      {
         return groupDataDic.getValue(selectedGroupIndex);
      }
      
      public function get rewardList() : Array
      {
         if(!_rewardList)
         {
            initRewardList();
         }
         return _rewardList;
      }
      
      private function initRewardList() : void
      {
         _rewardList = [];
         var _loc1_:Array = StcMgr.ins.getVoArrByColumnValue("static_rank","kind",4);
         _loc1_.sortOn("id",16);
         _rewardList = _loc1_;
      }
      
      public function get gamleCost() : WealthVo
      {
         var _loc1_:* = null;
         if(!gambleCostDic)
         {
            gambleCostDic = new DictHash();
            _loc1_ = StcMgr.ins.getVoArrByColumnValue("static_gamble","kind",1);
            var _loc4_:int = 0;
            var _loc3_:* = _loc1_;
            for each(var _loc2_ in _loc1_)
            {
               gambleCostDic.put(_loc2_.round,WealthUtil.costStrToArr(_loc2_.gamble_source_1)[0]);
            }
         }
         return gambleCostDic.getValue(getRoundIndex(selectedNodeIndex));
      }
      
      public function getRoundIndex(param1:int) : int
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = ChampionshipConsts.GROUP_ROUND_MIN.length;
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            _loc2_ = ChampionshipConsts.GROUP_ROUND_MIN[_loc5_];
            if(param1 >= _loc2_)
            {
               _loc4_ = _loc5_ + 1;
               break;
            }
            _loc5_++;
         }
         if(selectedGroupIndex == 4)
         {
            if(param1 > 0)
            {
               _loc4_ = 5;
            }
            else
            {
               _loc4_ = 6;
            }
         }
         return _loc4_;
      }
      
      public function get canGetReward() : Boolean
      {
         return !hasGotReward && myRank > 0 && myRank <= 64 && cdType == 5;
      }
      
      public function get canGetGambleReward() : Boolean
      {
         return _canGetGambleReward;
      }
      
      public function set canGetGambleReward(param1:Boolean) : void
      {
         if(_canGetGambleReward != param1)
         {
            _canGetGambleReward = param1;
            ObserverMgr.ins.sendNotice("notice_update_gamble_reward_status");
         }
      }
      
      public function dispose() : void
      {
         groupDataDic.clear();
      }
   }
}
