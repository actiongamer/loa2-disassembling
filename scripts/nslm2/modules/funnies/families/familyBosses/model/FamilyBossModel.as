package nslm2.modules.funnies.families.familyBosses.model
{
   import proto.FamilyBossInfoRes;
   import nslm2.utils.Uint64Util;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.FamilyBossInfo;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.utils.ProtoUtils;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcBuffVo;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.modules.funnies.families.familyBosses.vo.DamageRewardVo;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleRedPointMsg;
   import nslm2.common.model.PlayerModel;
   
   public class FamilyBossModel
   {
      
      private static var _ins:nslm2.modules.funnies.families.familyBosses.model.FamilyBossModel;
       
      
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
      
      private var _myTotalDamage:Number;
      
      private var _damageRankList:Array;
      
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
      
      public function FamilyBossModel()
      {
         _damageRankList = [];
         _bossInfoArr = [];
         hasGotRwdIDArr = [];
         super();
      }
      
      public static function get ins() : nslm2.modules.funnies.families.familyBosses.model.FamilyBossModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.funnies.families.familyBosses.model.FamilyBossModel();
         }
         return _ins;
      }
      
      public function updateBaseInfo(param1:FamilyBossInfoRes) : void
      {
         activityStartTime = param1.currstarttime;
         nextActivityStartTime = param1.nextstarttime;
         nextRoundStartTime = param1.nextresettime;
         wave = param1.rank;
         isAutoFight = param1.autofight;
         simpleReport = param1.simplereport;
         _reviveCD = param1.lastdeadtime;
         stimulateCD = param1.guwucdovertime;
         normalGwCnt = param1.normalguwucount;
         premierGwCnt = param1.superguwucount;
         crtWave = param1.rank;
         selectedNextActTime = param1.isnextselect;
         hasGotRwdIDArr = param1.rewardids;
         myTotalDamage = Uint64Util.toNumber(param1.totalhurt);
         updateStatus(param1.state,param1.nextstatetimelong);
         updateBossInfo(param1.bossinfo,true);
         updateDmgRank(param1.hurtranks);
         ObserverMgr.ins.sendNotice("family_boss_update_base_info");
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
               _loc4_ = ArrayUtil.findByAttr(_bossInfoArr,"bossid",_loc3_.bossid);
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
         _bossInfoArr.sortOn("bossid",16);
         ObserverMgr.ins.sendNotice("family_boss_update_boss_info",_bossInfoArr);
      }
      
      public function updateDmgRank(param1:Array) : void
      {
         _damageRankList = param1;
         ObserverMgr.ins.sendNotice("family_boss_update_damage_rank");
      }
      
      public function updateStatus(param1:int, param2:uint) : void
      {
         if(_status != param1 || param2 != statusCD)
         {
            _status = param1;
            statusCD = param2;
            ObserverMgr.ins.sendNotice("family_boss_update_status");
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
      
      public function get leftGwCnt() : int
      {
         return DefindConsts.gonghuiboss_guwu_total - normalGwCnt - premierGwCnt;
      }
      
      public function get gwAddtion() : Array
      {
         if(normalGwCnt + premierGwCnt < 1)
         {
            return [];
         }
         var _loc3_:Array = [];
         var _loc6_:Array = String(DefindConsts.gonghuiboss_guwu_normal).split("|");
         var _loc5_:StcBuffVo = StcMgr.ins.getBuffVo(_loc6_[0]);
         var _loc9_:StcBuffVo = StcMgr.ins.getBuffVo(_loc6_[1]);
         var _loc2_:NpcPropVo = new NpcPropVo(int(_loc5_.param1),_loc5_.init_effect_value1,"+");
         var _loc8_:NpcPropVo = new NpcPropVo(int(_loc9_.param1),_loc9_.init_effect_value1,"+");
         var _loc7_:Array = String(DefindConsts.gonghuiboss_guwu_high).split("|");
         var _loc11_:StcBuffVo = StcMgr.ins.getBuffVo(_loc7_[0]);
         var _loc1_:StcBuffVo = StcMgr.ins.getBuffVo(_loc7_[1]);
         var _loc10_:NpcPropVo = new NpcPropVo(int(_loc11_.param1),_loc11_.init_effect_value1);
         var _loc4_:NpcPropVo = new NpcPropVo(int(_loc1_.param1),_loc1_.init_effect_value1);
         _loc2_.value = _loc2_.value * normalGwCnt;
         _loc8_.value = _loc8_.value * normalGwCnt;
         _loc10_.value = _loc10_.value * premierGwCnt;
         _loc4_.value = _loc4_.value * premierGwCnt;
         _loc2_.value = _loc2_.value + _loc10_.value;
         _loc8_.value = _loc8_.value + _loc4_.value;
         return [_loc2_,_loc8_];
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
            ObserverMgr.ins.sendNotice("family_boss_update_my_damage");
            updateDmgReward();
         }
      }
      
      public function updateDmgReward(param1:Boolean = true) : void
      {
         if(!_dmgRewardData)
         {
            initDmgReward();
         }
         rwdCnt = 0;
         var _loc4_:int = 0;
         var _loc3_:* = _dmgRewardData;
         for each(var _loc2_ in _dmgRewardData)
         {
            _loc2_.crtDmg = _myTotalDamage;
            if(hasGotRwdIDArr.indexOf(_loc2_.id) >= 0)
            {
               _loc2_.status = 2;
            }
            if(_loc2_.crtDmg >= _loc2_.needDmg && _loc2_.status < 2)
            {
               _loc2_.status = 1;
               rwdCnt = Number(rwdCnt) + 1;
            }
         }
         _dmgRewardData.sort(sortReward);
         if(rwdCnt > 0)
         {
            ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(40743,true));
         }
         else
         {
            ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(40743,false));
         }
         if(param1)
         {
            ObserverMgr.ins.sendNotice("family_boss_update_dmg_rwd");
         }
      }
      
      private function initDmgReward() : void
      {
         var _loc1_:* = null;
         var _loc4_:int = 0;
         _dmgRewardData = [];
         var _loc2_:Array = StcMgr.ins.getTabelArr("static_family_boss_reward");
         _loc2_.sortOn("id",16);
         var _loc3_:int = _loc2_.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc1_ = new DamageRewardVo();
            _loc1_.stcVo = _loc2_[_loc4_];
            if(_loc1_.stcVo.level <= PlayerModel.ins.level)
            {
               _dmgRewardData.push(_loc1_);
            }
            _loc4_++;
         }
      }
      
      private function sortReward(param1:DamageRewardVo, param2:DamageRewardVo) : int
      {
         if(param1.status == 1 && param2.status != 1)
         {
            return -1;
         }
         if(param1.status != 1 && param2.status == 1)
         {
            return 1;
         }
         if(param1.status != 2 && param2.status == 2)
         {
            return -1;
         }
         if(param1.status == 2 && param2.status != 2)
         {
            return 1;
         }
         if(param1.id > param2.id)
         {
            return 1;
         }
         return -1;
      }
      
      public function get dmgRewardData() : Array
      {
         if(!_dmgRewardData)
         {
            initDmgReward();
         }
         return _dmgRewardData;
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
         _damageRankList = [];
         _dmgRewardData = null;
      }
      
      public function get hornorRank() : Array
      {
         return _hornorRank;
      }
      
      public function set hornorRank(param1:Array) : void
      {
         _hornorRank = param1;
         ObserverMgr.ins.sendNotice("family_boss_update_hornor_rank");
      }
   }
}
