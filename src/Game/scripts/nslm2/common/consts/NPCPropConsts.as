package nslm2.common.consts
{
   import com.mz.core.utils.DictHash;
   import proto.BaseProp;
   import proto.FightProp;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.utils.NumberUtil;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   
   public class NPCPropConsts
   {
      
      public static const MSG_PLAYER_HERO_PROP_CHANGE:String = "msg_player_hero_prop_change";
      
      public static const HP:int = 1;
      
      public static const ATTACK:int = 2;
      
      public static const PHYSICAL_DEFENCE:int = 3;
      
      public static const MAGIC_DEFENSE:int = 4;
      
      public static const AGILITY:int = 5;
      
      public static const HIT_LV:int = 6;
      
      public static const DODGE_LV:int = 7;
      
      public static const CRIT_LV:int = 8;
      
      public static const TENACITY_LV:int = 9;
      
      public static const BLOCK_LV:int = 10;
      
      public static const HP_PERCENT:int = 11;
      
      public static const ATTACK_PERCENT:int = 12;
      
      public static const PHYSICAL_DEFENSE_PERCENT:int = 13;
      
      public static const MAGIC_DEFENSE_PERCENT:int = 14;
      
      public static const AGILITY_PERCENT:int = 15;
      
      public static const DEFENSE_PERCENT:int = 16;
      
      public static const DEFENSE_ALL:int = 17;
      
      public static const ANGRY_INIT:int = 20;
      
      public static const HURT_PERCENT:int = 21;
      
      public static const BE_HURT_PERCENT:int = 22;
      
      public static const BE_AD_HURT_PERCENT:int = 23;
      
      public static const BE_MAGIC_HURT_PERCENT:int = 24;
      
      public static const HEAL_PERCENT:int = 25;
      
      public static const BE_HEAL_PERCENT:int = 26;
      
      public static const PET_GLORY_PRECENT:int = 99;
      
      public static const HIT_PERCENT:int = 30;
      
      public static const DODGE_PERCENT:int = 31;
      
      public static const CRIT_PERCENT:int = 32;
      
      public static const TENACITY_PERCENT:int = 33;
      
      public static const BLOCK_PERCENT:int = 34;
      
      public static const PERCENT_PROP_ID:Array = [11,12,13,15,16,14,30,31,32,33,34];
      
      public static const SHOW_PERCENT_PROP_ID:Array = [11,12,13,14,15,16,21,22,23,24,25,26,30,31,32,33,34,99];
      
      public static const INIT_IS_ONE_PROP:Array = [22,23,24];
      
      private static var _ins:nslm2.common.consts.NPCPropConsts;
       
      
      public var baseProp4List:Array;
      
      public var baseProp5List:Array;
      
      public var fightPropList:Array;
      
      public var fightPropPercentList:Array;
      
      public var allPorpList:Array;
      
      private var basePropStcNpcFieldNameLib:Object;
      
      private var equipFightValueWeightLib:Object;
      
      private var propbufVoNameLib:DictHash;
      
      public function NPCPropConsts()
      {
         baseProp4List = [];
         baseProp5List = [];
         fightPropList = [];
         fightPropPercentList = [];
         allPorpList = [];
         basePropStcNpcFieldNameLib = {};
         equipFightValueWeightLib = {};
         super();
         this.initLib();
      }
      
      public static function get ins() : nslm2.common.consts.NPCPropConsts
      {
         if(_ins == null)
         {
            _ins = new nslm2.common.consts.NPCPropConsts();
         }
         return _ins;
      }
      
      private function initLib() : void
      {
         propbufVoNameLib = new DictHash();
         propbufVoNameLib.put(1,BaseProp.HP.name);
         propbufVoNameLib.put(2,BaseProp.ATTACK.name);
         propbufVoNameLib.put(3,BaseProp.PHYSICAL_DEFENCE.name);
         propbufVoNameLib.put(4,BaseProp.MAGIC_DEFENCE.name);
         propbufVoNameLib.put(5,BaseProp.AGILITY.name);
         propbufVoNameLib.put(6,FightProp.HIT_RATING.name);
         propbufVoNameLib.put(7,FightProp.DODGE_RATING.name);
         propbufVoNameLib.put(8,FightProp.CRIT_RATING.name);
         propbufVoNameLib.put(9,FightProp.RESILIENCE_RATING.name);
         propbufVoNameLib.put(10,FightProp.BLOCK_RATING.name);
         propbufVoNameLib.put(11,FightProp.HP_ADD.name);
         propbufVoNameLib.put(12,FightProp.ATTACK_ADD.name);
         propbufVoNameLib.put(13,FightProp.PHYSICAL_DEFENCE_ADD.name);
         propbufVoNameLib.put(14,FightProp.MAGIC_DEFENCE_ADD.name);
         propbufVoNameLib.put(15,FightProp.AGILITY_ADD.name);
         propbufVoNameLib.put(16,FightProp.DEFENCE_ADD.name);
         propbufVoNameLib.put(17,FightProp.DEFENCE_ADD_EXTRA.name);
         propbufVoNameLib.put(20,FightProp.RAGE_ADD.name);
         propbufVoNameLib.put(21,FightProp.DEMAGE_ADD.name);
         propbufVoNameLib.put(22,FightProp.HURT_ADD.name);
         propbufVoNameLib.put(23,FightProp.PHYSICAL_HURT_ADD.name);
         propbufVoNameLib.put(24,FightProp.MAGIC_HURT_ADD.name);
         propbufVoNameLib.put(25,FightProp.TREATMENT_INCREASE_RATIO.name);
         propbufVoNameLib.put(26,FightProp.BE_TREAMENT_INCREASE_RATIO.name);
         propbufVoNameLib.put(30,FightProp.HIT_RATIO.name);
         propbufVoNameLib.put(31,FightProp.DODGE_RATIO.name);
         propbufVoNameLib.put(32,FightProp.CRIT_RATIO.name);
         propbufVoNameLib.put(33,FightProp.RESILIENCE_RATIO.name);
         propbufVoNameLib.put(34,FightProp.BLOCK_RATIO.name);
         baseProp4List = [2,1,3,4];
         baseProp5List = [1,2,3,4,5];
         fightPropList = [6,7,8,9,10];
         fightPropPercentList = [30,31,32,33,34];
         allPorpList = baseProp5List.concat(fightPropList).concat([30,31,32,33,34]);
         basePropStcNpcFieldNameLib[1] = "hp";
         basePropStcNpcFieldNameLib[2] = "attack";
         basePropStcNpcFieldNameLib[3] = "physical_defence";
         basePropStcNpcFieldNameLib[4] = "magic_defence";
         basePropStcNpcFieldNameLib[5] = "agility";
         basePropStcNpcFieldNameLib[6] = "hit_rating";
         basePropStcNpcFieldNameLib[7] = "dodge_rating";
         basePropStcNpcFieldNameLib[8] = "crit_rating";
         basePropStcNpcFieldNameLib[10] = "block_rating";
         basePropStcNpcFieldNameLib[9] = "resilience_rating";
         basePropStcNpcFieldNameLib[32] = "crit_ratio";
         basePropStcNpcFieldNameLib[30] = "hit_ratio";
         basePropStcNpcFieldNameLib[31] = "dodge_ratio";
         basePropStcNpcFieldNameLib[34] = "block_ratio";
         basePropStcNpcFieldNameLib[33] = "resilience_ratio";
         equipFightValueWeightLib[1] = 1;
         equipFightValueWeightLib[2] = 5;
         equipFightValueWeightLib[3] = 5;
         equipFightValueWeightLib[4] = 5;
         equipFightValueWeightLib[5] = 10;
         equipFightValueWeightLib[7] = 20;
         equipFightValueWeightLib[9] = 20;
         equipFightValueWeightLib[10] = 20;
         equipFightValueWeightLib[6] = 20;
         equipFightValueWeightLib[8] = 20;
         equipFightValueWeightLib[17] = 10;
      }
      
      public function getIdByProtobufName(param1:String) : int
      {
         return this.propbufVoNameLib.getKey(param1);
      }
      
      public function getProtobufPropertyName(param1:int) : String
      {
         return this.propbufVoNameLib.getValue(param1);
      }
      
      public function getStcVoPropertyName(param1:int) : String
      {
         return this.basePropStcNpcFieldNameLib[param1];
      }
      
      public function getLocaleName(param1:int) : String
      {
         return LocaleMgr.ins.getStr(1000 + param1);
      }
      
      public function getLocaleNameShort(param1:int) : String
      {
         return LocaleMgr.ins.getStr(1100 + param1);
      }
      
      public function getLocaleNameShort2(param1:int) : String
      {
         return LocaleMgr.ins.getStr(1200 + param1);
      }
      
      public function getLocaleNameNormal(param1:int) : String
      {
         return LocaleMgr.ins.getStr(2000 + param1);
      }
      
      public function showValue(param1:Number, param2:String = "", param3:int = 0, param4:Boolean = false) : String
      {
         if(param1 < 0)
         {
            if(param2)
            {
               param2 = "";
            }
         }
         if(!NumberUtil.isFloatNumber(param1) && !param4)
         {
            return param2 + param1.toFixed();
         }
         if(param3)
         {
            return param2 + LocaleConsts.percentStrFixed(param1,param3);
         }
         return param2 + LocaleConsts.percentStr(param1);
      }
      
      public function countFightValue_propArr(param1:Array) : Number
      {
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc2_:* = 0;
         var _loc4_:int = param1.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = param1[_loc5_];
            _loc2_ = Number(_loc2_ + _loc3_.value * equipFightValueWeightLib[_loc3_.propId]);
            _loc5_++;
         }
         return _loc2_;
      }
      
      public function countFightValue_prop5(param1:Number = 0, param2:Number = 0, param3:Number = 0, param4:Number = 0, param5:Number = 0) : Number
      {
         return param1 * equipFightValueWeightLib[1] + param2 * equipFightValueWeightLib[2] + param3 * equipFightValueWeightLib[3] + param4 * equipFightValueWeightLib[4] + param5 * equipFightValueWeightLib[5];
      }
      
      public function countFightValue_equip(param1:StcItemVo) : int
      {
         var _loc2_:* = 0;
         var _loc5_:int = 0;
         var _loc4_:* = equipFightValueWeightLib;
         for(var _loc3_ in equipFightValueWeightLib)
         {
            if(basePropStcNpcFieldNameLib.hasOwnProperty(_loc3_))
            {
               _loc2_ = Number(_loc2_ + param1[basePropStcNpcFieldNameLib[_loc3_]] * equipFightValueWeightLib[_loc3_]);
            }
         }
         return _loc2_;
      }
      
      public function getEquipProp(param1:int) : NpcPropVo
      {
         var _loc6_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:* = null;
         var _loc2_:StcItemVo = StcMgr.ins.getItemVo(param1);
         var _loc5_:int = baseProp5List.length;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc4_ = baseProp5List[_loc6_];
            _loc3_ = this.getStcVoPropertyName(_loc4_);
            if(_loc2_[_loc3_])
            {
               return new NpcPropVo(_loc4_,_loc2_[_loc3_]);
            }
            _loc6_++;
         }
         return null;
      }
   }
}
