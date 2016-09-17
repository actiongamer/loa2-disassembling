package nslm2.modules.battles.battle
{
   import flash.events.EventDispatcher;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import flash.utils.ByteArray;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import com.mz.core.utils.DictHash;
   import nslm2.mgrs.stcMgrs.StcVoBase;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import com.mz.core.logging.Log;
   import nslm2.modules.fightPlayer.UnitVo;
   import com.mz.core.configs.EnvConfig;
   import morn.core.utils.ObjectUtils;
   
   public class SocketEngine implements IBattleEngine
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
      
      public static const CMD_ADD_SKILL_DATA:int = 1000;
      
      public static const CMD_ADD_SKILL_EFFECT_DATA:int = 1001;
      
      public static const CMD_ADD_PLAYER_DATA:int = 1002;
      
      public static const CMD_START:int = 1003;
      
      public static const CMD_SHUTDOWN:int = 1004;
      
      public static const CMD_UPDATE:int = 1005;
      
      public static const CMD_ACTION_GO:int = 1006;
      
      public static const CMD_ADD_BATTLE_DEFINE:int = 1007;
      
      public static const CMD_MANUAL_SKILL_FIRE:int = 1008;
      
      public static const CMD_ADD_BUFF_DATA:int = 1009;
      
      public static const CMD_IMMEDIATELY_FINISH:int = 1010;
      
      public static const CMD_BATTLE_RESULT:int = 1011;
      
      public static const CMD_ADD_STP:int = 1012;
      
      public static const CMD_CREATE_BATTLE:int = 1013;
      
      public static const CMD_ADD_SNPC_DATA:int = 1014;
      
      public static const CMD_SKILL_TEST:int = 1015;
      
      public static var isInit:Boolean = false;
       
      
      protected var socket:nslm2.modules.battles.battle.BinarySocket;
      
      private var _dispatcher:EventDispatcher;
      
      private var _isReady:Boolean = false;
      
      private var _numCycles:int = 0;
      
      private var _waitForAction:Boolean = false;
      
      private var _playerDatas:Array;
      
      public function SocketEngine()
      {
         socket = new nslm2.modules.battles.battle.BinarySocket();
         super();
         if(!isInit)
         {
            socket.onConnect = onConnect;
            socket.onData = onData;
            socket.connect();
            isInit = true;
         }
         _dispatcher = new EventDispatcher();
      }
      
      public function isReady() : Boolean
      {
         return _isReady;
      }
      
      private function onConnect() : void
      {
         initStaticData();
         initBattleDefine();
         _isReady = true;
      }
      
      private function initBattleDefine() : void
      {
         var _loc3_:int = CModule.malloc(Battle_DefineValue.size);
         var _loc1_:* = new Battle_DefineValue(ram,_loc3_);
         _loc1_.attackRage = int(DefindConsts.FIGHT_ATTACK_RAGE);
         _loc1_.beAttackedRage = int(DefindConsts.FIGHT_BE_ATTACKED_RAGE);
         _loc1_.skillRage = int(DefindConsts.FIGHT_SKILL_RAGE);
         _loc1_.killRage = int(DefindConsts.FIGHT_DEFEAT_RAGE);
         _loc1_.petSkillRage = int(DefindConsts.PET_SKILL_RAGE);
         _loc1_.petAttRatio = Number(DefindConsts.PET_ATTACK_RATIO);
         _loc1_.leaderAttRatio = Number(DefindConsts.LEADER_ATTACK_RATIO);
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.endian = "littleEndian";
         _loc2_.writeBytes(ram,_loc3_,Battle_DefineValue.size);
         socket.send(1007,_loc2_);
      }
      
      public function serSkillFire(param1:int, param2:int) : void
      {
      }
      
      public function initStaticData() : void
      {
         var _loc5_:int = 0;
         var _loc1_:* = null;
         var _loc3_:* = null;
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
         var _loc7_:int = 0;
         var _loc5_:* = null;
         var _loc4_:* = null;
         var _loc6_:* = null;
         var _loc10_:int = 0;
         var _loc9_:* = param2.dict;
         for each(var _loc3_ in param2.dict)
         {
            var _loc8_:* = param1;
            if("static_npc" !== _loc8_)
            {
               if("static_skill" !== _loc8_)
               {
                  if("static_skill_effect" !== _loc8_)
                  {
                     if("static_buff" === _loc8_)
                     {
                        _loc7_ = CModule.malloc(Buff_DataValue.size);
                        _loc5_ = new Buff_DataValue(ram,_loc7_);
                        FPUtil.voToCC(_loc3_,_loc5_);
                        _loc4_ = new ByteArray();
                        _loc4_.endian = "littleEndian";
                        _loc4_.writeBytes(ram,_loc7_,Buff_DataValue.size);
                        _loc4_.writeUTF(_loc3_["param1"]);
                        _loc4_.writeUTF(_loc3_["param2"]);
                        _loc4_.writeUTF(_loc3_["param3"]);
                        socket.send(1009,_loc4_);
                     }
                  }
                  else
                  {
                     _loc7_ = CModule.malloc(Skill_Effect_DataValue.size);
                     _loc5_ = new Skill_Effect_DataValue(ram,_loc7_);
                     FPUtil.voToCC(_loc3_,_loc5_);
                     _loc4_ = new ByteArray();
                     _loc4_.endian = "littleEndian";
                     _loc4_.writeBytes(ram,_loc7_,Skill_Effect_DataValue.size);
                     _loc4_.writeUTF(_loc3_["param1"]);
                     _loc4_.writeUTF(_loc3_["param2"]);
                     _loc4_.writeUTF(_loc3_["param3"]);
                     _loc4_.writeUTF(_loc3_["param4"]);
                     _loc4_.writeUTF(_loc3_["special_effect"]);
                     socket.send(1001,_loc4_);
                  }
               }
               else
               {
                  _loc7_ = CModule.malloc(Skill_DataValue.size);
                  _loc5_ = new Skill_DataValue(ram,_loc7_);
                  FPUtil.voToCC(_loc3_,_loc5_);
                  _loc4_ = new ByteArray();
                  _loc4_.endian = "littleEndian";
                  _loc4_.writeBytes(ram,_loc7_,Skill_DataValue.size);
                  _loc4_.writeUTF(_loc3_["attack_time_point"]);
                  socket.send(1000,_loc4_);
               }
            }
            else
            {
               _loc6_ = _loc3_ as StcNpcVo;
               if(_loc6_.kind == 20)
               {
                  _loc7_ = CModule.malloc(Player_DataValue.size);
                  _loc5_ = new Player_DataValue(ram,_loc7_);
                  FPUtil.voToCC(_loc6_,_loc5_);
                  _loc5_.npc_id = _loc6_.id;
                  _loc4_ = new ByteArray();
                  _loc4_.endian = "littleEndian";
                  _loc4_.writeBytes(ram,_loc7_,Player_DataValue.size);
                  socket.send(1014,_loc4_);
               }
            }
         }
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
      
      public function onData(param1:int, param2:ByteArray) : void
      {
         var _loc3_:int = 0;
         var _loc6_:* = null;
         var _loc10_:int = 0;
         var _loc7_:* = undefined;
         var _loc9_:* = undefined;
         var _loc5_:* = null;
         var _loc4_:int = 0;
         var _loc8_:* = undefined;
         switch(int(param1) - 1006)
         {
            case 0:
               _loc3_ = param2.readUnsignedShort();
               _loc6_ = [];
               _waitForAction = false;
               _loc10_ = 0;
               while(_loc10_ < _loc3_)
               {
                  _loc7_ = new Action_DataValue();
                  _loc7_.id = param2.readInt();
                  _loc7_.data0 = param2.readInt();
                  _loc7_.data1 = param2.readInt();
                  _loc7_.data2 = param2.readInt();
                  _loc7_.data3 = param2.readInt();
                  _loc7_.numCycles = param2.readInt();
                  _loc6_.push(_loc7_);
                  _loc10_++;
               }
               _dispatcher.dispatchEvent(new BattleEvent("ACTION_READY",_loc6_));
               break;
            default:
               _loc3_ = param2.readUnsignedShort();
               _loc6_ = [];
               _waitForAction = false;
               _loc10_ = 0;
               while(_loc10_ < _loc3_)
               {
                  _loc7_ = new Action_DataValue();
                  _loc7_.id = param2.readInt();
                  _loc7_.data0 = param2.readInt();
                  _loc7_.data1 = param2.readInt();
                  _loc7_.data2 = param2.readInt();
                  _loc7_.data3 = param2.readInt();
                  _loc7_.numCycles = param2.readInt();
                  _loc6_.push(_loc7_);
                  _loc10_++;
               }
               _dispatcher.dispatchEvent(new BattleEvent("ACTION_READY",_loc6_));
               break;
            default:
               _loc3_ = param2.readUnsignedShort();
               _loc6_ = [];
               _waitForAction = false;
               _loc10_ = 0;
               while(_loc10_ < _loc3_)
               {
                  _loc7_ = new Action_DataValue();
                  _loc7_.id = param2.readInt();
                  _loc7_.data0 = param2.readInt();
                  _loc7_.data1 = param2.readInt();
                  _loc7_.data2 = param2.readInt();
                  _loc7_.data3 = param2.readInt();
                  _loc7_.numCycles = param2.readInt();
                  _loc6_.push(_loc7_);
                  _loc10_++;
               }
               _dispatcher.dispatchEvent(new BattleEvent("ACTION_READY",_loc6_));
               break;
            default:
               _loc3_ = param2.readUnsignedShort();
               _loc6_ = [];
               _waitForAction = false;
               _loc10_ = 0;
               while(_loc10_ < _loc3_)
               {
                  _loc7_ = new Action_DataValue();
                  _loc7_.id = param2.readInt();
                  _loc7_.data0 = param2.readInt();
                  _loc7_.data1 = param2.readInt();
                  _loc7_.data2 = param2.readInt();
                  _loc7_.data3 = param2.readInt();
                  _loc7_.numCycles = param2.readInt();
                  _loc6_.push(_loc7_);
                  _loc10_++;
               }
               _dispatcher.dispatchEvent(new BattleEvent("ACTION_READY",_loc6_));
               break;
            default:
               _loc3_ = param2.readUnsignedShort();
               _loc6_ = [];
               _waitForAction = false;
               _loc10_ = 0;
               while(_loc10_ < _loc3_)
               {
                  _loc7_ = new Action_DataValue();
                  _loc7_.id = param2.readInt();
                  _loc7_.data0 = param2.readInt();
                  _loc7_.data1 = param2.readInt();
                  _loc7_.data2 = param2.readInt();
                  _loc7_.data3 = param2.readInt();
                  _loc7_.numCycles = param2.readInt();
                  _loc6_.push(_loc7_);
                  _loc10_++;
               }
               _dispatcher.dispatchEvent(new BattleEvent("ACTION_READY",_loc6_));
               break;
            case 5:
               param2.readUnsignedShort();
               _loc9_ = new Battle_ResultValue();
               _loc9_.result = param2.readInt();
               _loc9_.turnNum = param2.readInt();
               _loc9_.damageSum = param2.readDouble();
               _loc9_.stpSize = param2.readInt();
               param2.readInt();
               _loc5_ = [];
               _loc4_ = 0;
               while(_loc4_ < _loc9_.stpSize)
               {
                  _loc8_ = new Skill_Time_PointValue();
                  _loc8_.timePoint = param2.readInt();
                  _loc8_.objId = param2.readInt();
                  _loc5_.push(_loc8_);
                  _loc4_++;
               }
               _dispatcher.dispatchEvent(new BattleEvent("FIGHT_IMMEDIATELY_FINISH",{
                  "re":_loc9_,
                  "stps":_loc5_,
                  "players":_playerDatas
               }));
         }
      }
      
      public function get numCycles() : int
      {
         return _numCycles;
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
         var _loc4_:* = new Player_DataValue(ram,_loc2_);
         _loc4_.hurt_add = 1;
         _loc4_.magic_hurt_add = 1;
         _loc4_.physical_hurt_add = 1;
         FPUtil.voArrToCC(param1,_loc4_);
         _playerDatas.push(_loc4_);
         _loc4_.id = int(param1.id);
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.endian = "littleEndian";
         _loc3_.writeBytes(ram,_loc2_,Player_DataValue.size);
         if(param1.serVo && param1.serVo.buff)
         {
            _loc3_.writeUTF(param1.serVo.buff);
         }
         else
         {
            _loc3_.writeUTF("");
         }
         if(param1.serVo && param1.serVo.skills)
         {
            _loc3_.writeUTF(param1.serVo.skills);
         }
         else
         {
            _loc3_.writeUTF("");
         }
         if(param1.serVo && param1.serVo.skillps)
         {
            _loc3_.writeUTF(param1.serVo.skillps);
         }
         else
         {
            _loc3_.writeUTF("");
         }
         socket.send(1002,_loc3_);
         if(EnvConfig.ins.showDevModule)
         {
            debugPlayer(_loc4_);
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
      
      public function createBattle() : void
      {
         socket.send(1013,null);
         _playerDatas = [];
      }
      
      public function start(param1:int, param2:Array = null, param3:Array = null) : void
      {
         var _loc7_:int = 0;
         var _loc6_:* = undefined;
         var _loc4_:* = null;
         _numCycles = 0;
         var _loc11_:int = CModule.malloc(Battle_ParamValue.size);
         var _loc10_:* = new Battle_ParamValue(ram,_loc11_);
         var _loc8_:ByteArray = new ByteArray();
         _loc8_.endian = "littleEndian";
         var _loc13_:int = 0;
         var _loc12_:* = param2;
         for each(var _loc5_ in param2)
         {
            _loc8_.writeInt(_loc5_);
         }
         _loc8_.position = 0;
         _loc10_.seeds = _loc8_;
         _loc10_.playMode = param1;
         if(param1 == 2)
         {
            var _loc15_:int = 0;
            var _loc14_:* = param3;
            for each(var _loc9_ in param3)
            {
               _loc7_ = CModule.malloc(Skill_Time_PointValue.size);
               _loc6_ = new Skill_Time_PointValue(ram,_loc7_);
               _loc6_.objId = _loc9_.objId;
               _loc6_.timePoint = _loc9_.timePoint;
               _loc4_ = new ByteArray();
               _loc4_.endian = "littleEndian";
               _loc4_.writeBytes(ram,_loc7_,Skill_Time_PointValue.size);
               socket.send(1012,_loc4_);
            }
         }
         _loc4_ = new ByteArray();
         _loc4_.endian = "littleEndian";
         _loc4_.writeBytes(ram,_loc11_,Battle_ParamValue.size);
         socket.send(1003,_loc4_);
         if(EnvConfig.ins.showDevModule)
         {
            debugSeed(param2,_loc10_.playMode);
         }
      }
      
      public function get dispatcher() : EventDispatcher
      {
         return _dispatcher;
      }
      
      public function update() : int
      {
         if(_waitForAction)
         {
            return 0;
         }
         _numCycles = Number(_numCycles) + 1;
         _waitForAction = true;
         socket.send(1005,null);
         return 0;
      }
      
      private function getActions() : Array
      {
         return null;
      }
      
      public function manualSkillFire(param1:int) : void
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.endian = "littleEndian";
         _loc2_.writeUnsignedInt(param1);
         socket.send(1008,_loc2_);
      }
      
      public function getResult() : void
      {
         socket.send(1010,null);
         socket.send(1004,null);
      }
      
      public function checkFireBtn(param1:int) : Boolean
      {
         return true;
      }
      
      public function skillTest(param1:int, param2:int) : void
      {
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.endian = "littleEndian";
         _loc3_.writeUnsignedInt(param1);
         _loc3_.writeUnsignedInt(param2);
         socket.send(1015,_loc3_);
      }
   }
}
