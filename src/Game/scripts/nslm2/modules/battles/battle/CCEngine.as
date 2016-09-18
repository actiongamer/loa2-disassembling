package nslm2.modules.battles.battle
{
   import flash.events.EventDispatcher;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import com.mz.core.utils.DictHash;
   import nslm2.mgrs.stcMgrs.StcVoBase;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.modules.fightPlayer.UnitVo;
   import com.mz.core.configs.EnvConfig;
   import morn.core.utils.ObjectUtils;
   import com.mz.core.logging.Log;
   import flash.utils.ByteArray;
   import com.mz.core.mgrs.UIMgr;
   
   public class CCEngine implements IBattleEngine
   {
      
      public static var CModule;
      
      public static var BattleMgr;
      
      public static var Battle_DefineValue;
      
      public static var Skill_DataValue;
      
      public static var Skill_Effect_DataValue;
      
      public static var Buff_DataValue;
      
      public static var Player_DataValue;
      
      public static var Battle_ParamValue;
      
      public static var Skill_Time_PointValue;
      
      public static var ram;
      
      public static var Action_DataValue;
      
      public static var Battle_ResultValue;
      
      public static var isInit:Boolean = false;
       
      
      private var _dispatcher:EventDispatcher;
      
      private var _numCycles:int = 0;
      
      private var _playerDatas:Array;
      
      public function CCEngine()
      {
         super();
         if(!isInit)
         {
            CModule.startAsync(UIMgr.root);
            initStaticData();
            Log.debug("battle engine ver:" + BattleMgr.version());
            isInit = true;
         }
         _dispatcher = new EventDispatcher();
      }
      
      private function initBattleDefine() : void
      {
         var _loc2_:int = CModule.malloc(Battle_DefineValue.size);
         var _loc1_:* = new Battle_DefineValue(ram,_loc2_);
         _loc1_.attackRage = int(DefindConsts.FIGHT_ATTACK_RAGE);
         _loc1_.beAttackedRage = int(DefindConsts.FIGHT_BE_ATTACKED_RAGE);
         _loc1_.skillRage = int(DefindConsts.FIGHT_SKILL_RAGE);
         _loc1_.killRage = int(DefindConsts.FIGHT_DEFEAT_RAGE);
         _loc1_.petSkillRage = DefindConsts.PET_SKILL_RAGE;
         _loc1_.petAttRatio = DefindConsts.PET_ATTACK_RATIO;
         _loc1_.leaderAttRatio = DefindConsts.LEADER_ATTACK_RATIO;
         BattleMgr.addBattleDefine(_loc2_);
      }
      
      public function initStaticData() : void
      {
         var _loc5_:int = 0;
         var _loc1_:* = null;
         var _loc3_:* = null;
         BattleMgr.clearStaticData();
         initBattleDefine();
         var _loc2_:Array = ["static_skill","static_skill_effect","static_buff","static_npc"];
         var _loc4_:int = _loc2_.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc1_ = _loc2_[_loc5_];
            _loc3_ = StcMgr.ins.getTabel(_loc1_);
            this.importStcTable(_loc1_,_loc3_);
            _loc5_++;
         }
      }
      
      private function importStcTable(param1:String, param2:DictHash) : void
      {
         var _loc6_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc9_:int = 0;
         var _loc8_:* = param2.dict;
         for each(var _loc3_ in param2.dict)
         {
            var _loc7_:* = param1;
            if("static_npc" !== _loc7_)
            {
               if("static_skill" !== _loc7_)
               {
                  if("static_skill_effect" !== _loc7_)
                  {
                     if("static_buff" === _loc7_)
                     {
                        _loc6_ = CModule.malloc(Buff_DataValue.size);
                        _loc4_ = new Buff_DataValue(ram,_loc6_);
                        FPUtil.voToCC(_loc3_,_loc4_);
                        BattleMgr.addBuffData(_loc6_);
                     }
                  }
                  else
                  {
                     _loc6_ = CModule.malloc(Skill_Effect_DataValue.size);
                     _loc4_ = new Skill_Effect_DataValue(ram,_loc6_);
                     FPUtil.voToCC(_loc3_,_loc4_);
                     BattleMgr.addSkillEffectData(_loc6_);
                  }
               }
               else
               {
                  _loc6_ = CModule.malloc(Skill_DataValue.size);
                  _loc4_ = new Skill_DataValue(ram,_loc6_);
                  FPUtil.voToCC(_loc3_,_loc4_);
                  BattleMgr.addSkillData(_loc6_);
               }
            }
            else
            {
               _loc5_ = _loc3_ as StcNpcVo;
               if(_loc5_.kind == 20)
               {
                  _loc6_ = CModule.malloc(Player_DataValue.size);
                  _loc4_ = new Player_DataValue(ram,_loc6_);
                  FPUtil.voToCC(_loc5_,_loc4_);
                  _loc4_.npc_id = _loc5_.id;
                  BattleMgr.addSummonNpc(_loc6_);
               }
            }
         }
      }
      
      public function addPlayer(param1:UnitVo) : void
      {
         param1.sumHurt = 0;
         param1.sumDamage = 0;
         param1.sumHeal = 0;
         if(param1.hp <= 0)
         {
            return;
         }
         var _loc2_:int = CModule.malloc(Player_DataValue.size);
         var _loc3_:* = new Player_DataValue(ram,_loc2_);
         _loc3_.hurt_add = 1;
         _loc3_.magic_hurt_add = 1;
         _loc3_.physical_hurt_add = 1;
         FPUtil.voArrToCC(param1,_loc3_);
         _playerDatas.push(_loc3_);
         BattleMgr.addPlayer(0,_loc2_);
         if(EnvConfig.ins.showDevModule)
         {
            debugPlayer(_loc3_);
         }
      }
      
      private function debugPlayer(param1:*) : void
      {
         var _loc5_:Array = ["skill_sort","buff","skills"];
         var _loc2_:String = "";
         var _loc4_:Array = ObjectUtils.varListOfOb(param1,true,true);
         var _loc7_:int = 0;
         var _loc6_:* = _loc4_;
         for each(var _loc3_ in _loc4_)
         {
            if(_loc5_.indexOf(_loc3_) != -1)
            {
               _loc2_ = _loc2_ + (_loc3_ + ":" + param1[_loc3_] + ",");
            }
            else
            {
               _loc2_ = _loc2_ + (_loc3_ + ":" + param1[_loc3_] + ",");
            }
         }
         Log.debug(_loc2_);
      }
      
      private function debugSeed(param1:Array, param2:*) : void
      {
         var _loc4_:int = 0;
         var _loc3_:String = "play_mode:" + param2 + " seeds:[";
         _loc4_ = 0;
         while(_loc4_ < param1.length)
         {
            _loc3_ = _loc3_ + (param1[_loc4_] + ",");
            _loc4_++;
         }
         _loc3_ = _loc3_ + "]";
         Log.debug(_loc3_);
      }
      
      public function createBattle() : void
      {
         _playerDatas = [];
         BattleMgr.createBattle(0,1);
      }
      
      public function start(param1:int, param2:Array = null, param3:Array = null) : void
      {
         var _loc6_:int = 0;
         var _loc5_:* = undefined;
         _numCycles = 0;
         var _loc10_:int = CModule.malloc(Battle_ParamValue.size);
         var _loc9_:* = new Battle_ParamValue(ram,_loc10_);
         var _loc7_:ByteArray = new ByteArray();
         _loc7_.endian = "littleEndian";
         var _loc12_:int = 0;
         var _loc11_:* = param2;
         for each(var _loc4_ in param2)
         {
            _loc7_.writeInt(_loc4_);
         }
         _loc7_.position = 0;
         _loc9_.seeds = _loc7_;
         _loc9_.playMode = param1;
         if(param1 == 2)
         {
            var _loc14_:int = 0;
            var _loc13_:* = param3;
            for each(var _loc8_ in param3)
            {
               _loc6_ = CModule.malloc(Skill_Time_PointValue.size);
               _loc5_ = new Skill_Time_PointValue(ram,_loc6_);
               _loc5_.objId = _loc8_.objId;
               _loc5_.timePoint = _loc8_.timePoint;
               BattleMgr.addStp(0,_loc6_);
            }
         }
         BattleMgr.start(0,_loc10_);
         if(EnvConfig.ins.showDevModule)
         {
            debugSeed(param2,_loc9_.playMode);
         }
      }
      
      public function get numCycles() : int
      {
         return _numCycles;
      }
      
      public function update() : int
      {
         _numCycles = Number(_numCycles) + 1;
         var _loc1_:int = BattleMgr.update(0);
         _dispatcher.dispatchEvent(new BattleEvent("ACTION_READY",getActions()));
         return _loc1_;
      }
      
      public function get dispatcher() : EventDispatcher
      {
         return _dispatcher;
      }
      
      public function isReady() : Boolean
      {
         return true;
      }
      
      private function getActions() : Array
      {
         var _loc3_:int = 0;
         var _loc2_:* = undefined;
         var _loc4_:int = 0;
         var _loc1_:Array = [];
         while(true)
         {
            _loc3_ = BattleMgr.fetch2(0,_loc4_);
            if(_loc3_ > 0)
            {
               _loc2_ = new Action_DataValue(ram,_loc3_);
               _loc1_.push(_loc2_);
               _loc4_++;
               continue;
            }
            break;
         }
         return _loc1_;
      }
      
      public function serSkillFire(param1:int, param2:int) : void
      {
      }
      
      public function manualSkillFire(param1:int) : void
      {
         BattleMgr.manualSkillFire(0,param1);
      }
      
      public function getResult() : void
      {
         var _loc2_:* = undefined;
         var _loc5_:int = BattleMgr.Cal(0);
         var _loc3_:* = new Battle_ResultValue(ram,_loc5_);
         var _loc4_:int = 0;
         var _loc1_:Array = [];
         _loc4_ = 0;
         while(_loc4_ < _loc3_.stpSize)
         {
            _loc2_ = new Skill_Time_PointValue(ram,_loc5_ + Battle_ResultValue.size + Skill_Time_PointValue.size * _loc4_);
            _loc1_.push(_loc2_);
            _loc4_++;
         }
         _dispatcher.dispatchEvent(new BattleEvent("FIGHT_IMMEDIATELY_FINISH",{
            "re":_loc3_,
            "stps":_loc1_,
            "players":_playerDatas
         }));
         BattleMgr.closeBattle(0);
      }
      
      public function checkFireBtn(param1:int) : Boolean
      {
         return BattleMgr.canBigSkill(0,param1);
      }
      
      public function skillTest(param1:int, param2:int) : void
      {
         BattleMgr.skillTest(0,param1,param2);
      }
   }
}
