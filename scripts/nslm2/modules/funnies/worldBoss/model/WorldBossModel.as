package nslm2.modules.funnies.worldBoss.model
{
   import nslm2.modules.funnies.worldBoss.vo.WorldBossRankVo;
   import nslm2.mgrs.stcMgrs.vos.StcRankVo;
   import nslm2.utils.WealthUtil;
   import proto.WorldBossInfoRes;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.WorldBossInfo;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.utils.ProtoUtils;
   import proto.WorldBossRankData;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleRedPointMsg;
   import nslm2.mgrs.stcMgrs.StcMgr;
   
   public class WorldBossModel
   {
      
      private static var _ins:nslm2.modules.funnies.worldBoss.model.WorldBossModel;
      
      public static const MAX_RANK:int = 51;
       
      
      private var rankRewardArr:Array;
      
      public var myRank:int;
      
      public var canGetReward:Boolean;
      
      public var hasGotReward:Boolean;
      
      private var _status:int;
      
      public var isAutoFight:Boolean;
      
      public var simpleReport:Boolean;
      
      public var stimulateCnt:int;
      
      public var normalGwCnt:int;
      
      public var premierGwCnt:int;
      
      public var stimulateCD:int;
      
      public var activityStartTime:uint;
      
      public var nextActivityStartTime:uint;
      
      public var nextRoundStartTime:uint;
      
      public var statusCD:int;
      
      public var wave:int;
      
      private var _myTotalDamage:Number = 0;
      
      private var _damageRankList:Array;
      
      private var _simpleDamageRankList:Array;
      
      private var _bossInfoArr:Array;
      
      private var _reviveCD:int;
      
      private var _dmgRewardData:Array;
      
      public var hasGotRwdIDArr:Array;
      
      public var rwdCnt:int;
      
      public var crtAttackBossID:int;
      
      private var _hornorRank:Array;
      
      public var isImmFight:Boolean;
      
      public var crtWave:int;
      
      public var selectedNextActTime:Boolean;
      
      public function WorldBossModel()
      {
         _damageRankList = [];
         _simpleDamageRankList = [];
         _bossInfoArr = [];
         hasGotRwdIDArr = [];
         super();
         rankRewardArr = StcMgr.ins.getVoArrByColumnValue("static_rank","kind",13);
         initRankListData();
      }
      
      public static function get ins() : nslm2.modules.funnies.worldBoss.model.WorldBossModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.funnies.worldBoss.model.WorldBossModel();
         }
         return _ins;
      }
      
      private function initRankListData() : void
      {
         var _loc2_:* = null;
         var _loc1_:int = 0;
         _damageRankList = [];
         _loc1_ = 1;
         while(_loc1_ <= 51)
         {
            _loc2_ = new WorldBossRankVo();
            _loc2_.rank = _loc1_;
            initRewardByRank(_loc2_);
            _damageRankList.push(_loc2_);
            _loc1_++;
         }
      }
      
      private function initRewardByRank(param1:WorldBossRankVo) : void
      {
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc4_:int = rankRewardArr.length;
         var _loc2_:Array = [];
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = rankRewardArr[_loc5_];
            if(_loc3_.checkRank(param1.rank))
            {
               param1.reward = WealthUtil.costStrToArr(_loc3_.jibenjiangli);
               param1.superReward = WealthUtil.costStrToArr(_loc3_.chaojijiangli);
               break;
            }
            _loc5_++;
         }
      }
      
      public function updateBaseInfo(param1:WorldBossInfoRes) : void
      {
         activityStartTime = param1.currstarttime;
         nextRoundStartTime = param1.nextresettime;
         nextActivityStartTime = param1.nextstarttime;
         hasGotReward = param1.hasgetreward;
         wave = param1.rank;
         isAutoFight = param1.autofight;
         simpleReport = param1.simplereport;
         _reviveCD = param1.lastdeadtime;
         crtWave = param1.rank;
         hasGotRwdIDArr = param1.rewardids;
         updateStatus(param1.state,param1.nextstatetimelong);
         myTotalDamage = param1.totalhurt;
         myRank = param1.ranknum;
         updateBossInfo(param1.bossinfo,true);
         updateDmgRank(param1.hurtranks);
         ObserverMgr.ins.sendNotice("world_boss_update_base_info");
      }
      
      public function updateBossInfo(param1:Array, param2:Boolean) : void
      {
         var _loc4_:* = null;
         if(param2)
         {
            _bossInfoArr = [];
         }
         if(!_bossInfoArr.length)
         {
            _bossInfoArr = param1;
         }
         else
         {
            var _loc6_:int = 0;
            var _loc5_:* = param1;
            for each(var _loc3_ in param1)
            {
               _loc4_ = ArrayUtil.findByAttr(_bossInfoArr,WorldBossInfo.BOSSID.name,_loc3_.bossid);
               if(_loc4_)
               {
                  ProtoUtils.copyParams(_loc3_,_loc4_);
               }
               else
               {
                  _bossInfoArr.push(_loc3_);
               }
            }
         }
         _bossInfoArr.sortOn(WorldBossInfo.BOSSID.name,16);
         ObserverMgr.ins.sendNotice("world_boss_update_boss_info",_bossInfoArr);
      }
      
      public function updateDmgRank(param1:Array) : void
      {
         param1.sortOn(WorldBossRankData.RANK.name,16);
         _simpleDamageRankList = param1;
         ObserverMgr.ins.sendNotice("world_boss_update_damage_rank");
      }
      
      public function updateRewardDamagRank(param1:Array) : void
      {
         var _loc5_:* = null;
         var _loc4_:int = 0;
         var _loc2_:* = null;
         param1.sortOn(WorldBossRankData.RANK.name,16);
         var _loc3_:int = param1.length;
         var _loc7_:int = 0;
         var _loc6_:* = _damageRankList;
         for each(_loc5_ in _damageRankList)
         {
            _loc5_.rankData = null;
         }
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = param1[_loc4_];
            _loc5_ = _damageRankList[_loc4_];
            if(_loc5_)
            {
               _loc5_.rankData = _loc2_;
            }
            _loc4_++;
         }
         ObserverMgr.ins.sendNotice("world_boss_update_damage_rank");
      }
      
      public function updateStatus(param1:int, param2:uint) : void
      {
         if(_status != param1 || param2 != statusCD)
         {
            _status = param1;
            statusCD = param2;
            if(param1 == 7)
            {
               nextActivityStartTime = param2;
               updateDmgReward();
            }
            ObserverMgr.ins.sendNotice("world_boss_update_status");
         }
      }
      
      public function get status() : int
      {
         return _status;
      }
      
      public function get reviveCD() : int
      {
         return _reviveCD;
      }
      
      public function set reviveCD(param1:int) : void
      {
         _reviveCD = param1;
      }
      
      public function get bossInfoArr() : Array
      {
         return _bossInfoArr;
      }
      
      public function get damageRankList() : Array
      {
         return _damageRankList;
      }
      
      public function get myTotalDamage() : Number
      {
         return _myTotalDamage;
      }
      
      public function set myTotalDamage(param1:Number) : void
      {
         if(_myTotalDamage != param1)
         {
            _myTotalDamage = param1;
            updateDmgReward();
            ObserverMgr.ins.sendNotice("world_boss_update_my_damage");
         }
      }
      
      public function updateDmgReward() : void
      {
         canGetReward = false;
         if(!hasGotReward && myTotalDamage >= DefindConsts.WORLD_BOSS_SHANGBANG && status >= 7)
         {
            canGetReward = true;
         }
         if(canGetReward)
         {
            ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(41701,true));
         }
         else
         {
            ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(41701,false));
         }
      }
      
      public function get autoAttackBossId() : int
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         var _loc2_:int = bossInfoArr.length;
         if(crtAttackBossID)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc1_ = bossInfoArr[_loc3_];
               if(_loc1_.bossid == crtAttackBossID && _loc1_.hp > 0)
               {
                  return _loc1_.bossid;
               }
               _loc3_++;
            }
         }
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = bossInfoArr[_loc3_];
            if(_loc1_.hp > 0)
            {
               return _loc1_.bossid;
            }
            _loc3_++;
         }
         return 0;
      }
      
      public function dispose() : void
      {
         _myTotalDamage = 0;
         _bossInfoArr = [];
         canGetReward = false;
         hasGotReward = false;
         ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(41701,false));
      }
      
      public function get simpleDamageRankList() : Array
      {
         return _simpleDamageRankList;
      }
   }
}
