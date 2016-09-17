package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_FLOAT;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FightProp extends Message
   {
      
      public static const HP:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("proto.FightProp.hp","hp",8 | 5);
      
      public static const ATTACK:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("proto.FightProp.attack","attack",16 | 5);
      
      public static const PHYSICAL_DEFENCE:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("proto.FightProp.physical_defence","physicalDefence",24 | 5);
      
      public static const MAGIC_DEFENCE:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("proto.FightProp.magic_defence","magicDefence",32 | 5);
      
      public static const AGILITY:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("proto.FightProp.agility","agility",40 | 5);
      
      public static const HIT_RATING:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("proto.FightProp.hit_rating","hitRating",48 | 5);
      
      public static const DODGE_RATING:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("proto.FightProp.dodge_rating","dodgeRating",56 | 5);
      
      public static const CRIT_RATING:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("proto.FightProp.crit_rating","critRating",64 | 5);
      
      public static const RESILIENCE_RATING:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("proto.FightProp.resilience_rating","resilienceRating",72 | 5);
      
      public static const BLOCK_RATING:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("proto.FightProp.block_rating","blockRating",80 | 5);
      
      public static const HP_ADD:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("proto.FightProp.hp_add","hpAdd",88 | 5);
      
      public static const ATTACK_ADD:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("proto.FightProp.attack_add","attackAdd",96 | 5);
      
      public static const PHYSICAL_DEFENCE_ADD:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("proto.FightProp.physical_defence_add","physicalDefenceAdd",104 | 5);
      
      public static const MAGIC_DEFENCE_ADD:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("proto.FightProp.magic_defence_add","magicDefenceAdd",112 | 5);
      
      public static const AGILITY_ADD:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("proto.FightProp.agility_add","agilityAdd",120 | 5);
      
      public static const DEFENCE_ADD:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("proto.FightProp.defence_add","defenceAdd",128 | 5);
      
      public static const RAGE_ADD:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("proto.FightProp.rage_add","rageAdd",136 | 5);
      
      public static const DEMAGE_ADD:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("proto.FightProp.demage_add","demageAdd",144 | 5);
      
      public static const HURT_ADD:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("proto.FightProp.hurt_add","hurtAdd",152 | 5);
      
      public static const PHYSICAL_HURT_ADD:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("proto.FightProp.physical_hurt_add","physicalHurtAdd",160 | 5);
      
      public static const MAGIC_HURT_ADD:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("proto.FightProp.magic_hurt_add","magicHurtAdd",168 | 5);
      
      public static const BE_TREAMENT_INCREASE_RATIO:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("proto.FightProp.be_treament_increase_ratio","beTreamentIncreaseRatio",176 | 5);
      
      public static const TREAMENT:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("proto.FightProp.treament","treament",184 | 5);
      
      public static const HIT_RATIO:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("proto.FightProp.hit_ratio","hitRatio",192 | 5);
      
      public static const DODGE_RATIO:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("proto.FightProp.dodge_ratio","dodgeRatio",200 | 5);
      
      public static const CRIT_RATIO:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("proto.FightProp.crit_ratio","critRatio",208 | 5);
      
      public static const RESILIENCE_RATIO:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("proto.FightProp.resilience_ratio","resilienceRatio",216 | 5);
      
      public static const BLOCK_RATIO:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("proto.FightProp.block_ratio","blockRatio",224 | 5);
      
      public static const CRIT_DAMAGE_RATING:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("proto.FightProp.crit_damage_rating","critDamageRating",232 | 5);
      
      public static const CRIT_DAMAGE_RATIO:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("proto.FightProp.crit_damage_ratio","critDamageRatio",240 | 5);
      
      public static const DAMAGE_INCREASE_RATIO:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("proto.FightProp.damage_increase_ratio","damageIncreaseRatio",248 | 5);
      
      public static const TREATMENT_INCREASE_RATIO:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("proto.FightProp.treatment_increase_ratio","treatmentIncreaseRatio",256 | 5);
      
      public static const RAGE_RECOVERY:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("proto.FightProp.rage_recovery","rageRecovery",264 | 5);
      
      public static const HP_RECOVERY:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("proto.FightProp.hp_recovery","hpRecovery",272 | 5);
      
      public static const DEFENCE_ADD_EXTRA:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("proto.FightProp.defence_add_extra","defenceAddExtra",280 | 5);
       
      
      private var hp$field:Number;
      
      private var hasField$0:uint = 0;
      
      private var attack$field:Number;
      
      private var physical_defence$field:Number;
      
      private var magic_defence$field:Number;
      
      private var agility$field:Number;
      
      private var hit_rating$field:Number;
      
      private var dodge_rating$field:Number;
      
      private var crit_rating$field:Number;
      
      private var resilience_rating$field:Number;
      
      private var block_rating$field:Number;
      
      private var hp_add$field:Number;
      
      private var attack_add$field:Number;
      
      private var physical_defence_add$field:Number;
      
      private var magic_defence_add$field:Number;
      
      private var agility_add$field:Number;
      
      private var defence_add$field:Number;
      
      private var rage_add$field:Number;
      
      private var demage_add$field:Number;
      
      private var hurt_add$field:Number;
      
      private var physical_hurt_add$field:Number;
      
      private var magic_hurt_add$field:Number;
      
      private var be_treament_increase_ratio$field:Number;
      
      private var treament$field:Number;
      
      private var hit_ratio$field:Number;
      
      private var dodge_ratio$field:Number;
      
      private var crit_ratio$field:Number;
      
      private var resilience_ratio$field:Number;
      
      private var block_ratio$field:Number;
      
      private var crit_damage_rating$field:Number;
      
      private var crit_damage_ratio$field:Number;
      
      private var damage_increase_ratio$field:Number;
      
      private var treatment_increase_ratio$field:Number;
      
      private var rage_recovery$field:Number;
      
      private var hasField$1:uint = 0;
      
      private var hp_recovery$field:Number;
      
      private var defence_add_extra$field:Number;
      
      public function FightProp()
      {
         super();
      }
      
      public function clearHp() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         hp$field = new Number();
      }
      
      public function get hasHp() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set hp(param1:Number) : void
      {
         hasField$0 = hasField$0 | 1;
         hp$field = param1;
      }
      
      public function get hp() : Number
      {
         return hp$field;
      }
      
      public function clearAttack() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         attack$field = new Number();
      }
      
      public function get hasAttack() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set attack(param1:Number) : void
      {
         hasField$0 = hasField$0 | 2;
         attack$field = param1;
      }
      
      public function get attack() : Number
      {
         return attack$field;
      }
      
      public function clearPhysicalDefence() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         physical_defence$field = new Number();
      }
      
      public function get hasPhysicalDefence() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set physicalDefence(param1:Number) : void
      {
         hasField$0 = hasField$0 | 4;
         physical_defence$field = param1;
      }
      
      public function get physicalDefence() : Number
      {
         return physical_defence$field;
      }
      
      public function clearMagicDefence() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         magic_defence$field = new Number();
      }
      
      public function get hasMagicDefence() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set magicDefence(param1:Number) : void
      {
         hasField$0 = hasField$0 | 8;
         magic_defence$field = param1;
      }
      
      public function get magicDefence() : Number
      {
         return magic_defence$field;
      }
      
      public function clearAgility() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         agility$field = new Number();
      }
      
      public function get hasAgility() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set agility(param1:Number) : void
      {
         hasField$0 = hasField$0 | 16;
         agility$field = param1;
      }
      
      public function get agility() : Number
      {
         return agility$field;
      }
      
      public function clearHitRating() : void
      {
         hasField$0 = hasField$0 & 4294967263;
         hit_rating$field = new Number();
      }
      
      public function get hasHitRating() : Boolean
      {
         return (hasField$0 & 32) != 0;
      }
      
      public function set hitRating(param1:Number) : void
      {
         hasField$0 = hasField$0 | 32;
         hit_rating$field = param1;
      }
      
      public function get hitRating() : Number
      {
         return hit_rating$field;
      }
      
      public function clearDodgeRating() : void
      {
         hasField$0 = hasField$0 & 4294967231;
         dodge_rating$field = new Number();
      }
      
      public function get hasDodgeRating() : Boolean
      {
         return (hasField$0 & 64) != 0;
      }
      
      public function set dodgeRating(param1:Number) : void
      {
         hasField$0 = hasField$0 | 64;
         dodge_rating$field = param1;
      }
      
      public function get dodgeRating() : Number
      {
         return dodge_rating$field;
      }
      
      public function clearCritRating() : void
      {
         hasField$0 = hasField$0 & 4294967167;
         crit_rating$field = new Number();
      }
      
      public function get hasCritRating() : Boolean
      {
         return (hasField$0 & 128) != 0;
      }
      
      public function set critRating(param1:Number) : void
      {
         hasField$0 = hasField$0 | 128;
         crit_rating$field = param1;
      }
      
      public function get critRating() : Number
      {
         return crit_rating$field;
      }
      
      public function clearResilienceRating() : void
      {
         hasField$0 = hasField$0 & 4294967039;
         resilience_rating$field = new Number();
      }
      
      public function get hasResilienceRating() : Boolean
      {
         return (hasField$0 & 256) != 0;
      }
      
      public function set resilienceRating(param1:Number) : void
      {
         hasField$0 = hasField$0 | 256;
         resilience_rating$field = param1;
      }
      
      public function get resilienceRating() : Number
      {
         return resilience_rating$field;
      }
      
      public function clearBlockRating() : void
      {
         hasField$0 = hasField$0 & 4294966783;
         block_rating$field = new Number();
      }
      
      public function get hasBlockRating() : Boolean
      {
         return (hasField$0 & 512) != 0;
      }
      
      public function set blockRating(param1:Number) : void
      {
         hasField$0 = hasField$0 | 512;
         block_rating$field = param1;
      }
      
      public function get blockRating() : Number
      {
         return block_rating$field;
      }
      
      public function clearHpAdd() : void
      {
         hasField$0 = hasField$0 & 4294966271;
         hp_add$field = new Number();
      }
      
      public function get hasHpAdd() : Boolean
      {
         return (hasField$0 & 1024) != 0;
      }
      
      public function set hpAdd(param1:Number) : void
      {
         hasField$0 = hasField$0 | 1024;
         hp_add$field = param1;
      }
      
      public function get hpAdd() : Number
      {
         return hp_add$field;
      }
      
      public function clearAttackAdd() : void
      {
         hasField$0 = hasField$0 & 4294965247;
         attack_add$field = new Number();
      }
      
      public function get hasAttackAdd() : Boolean
      {
         return (hasField$0 & 2048) != 0;
      }
      
      public function set attackAdd(param1:Number) : void
      {
         hasField$0 = hasField$0 | 2048;
         attack_add$field = param1;
      }
      
      public function get attackAdd() : Number
      {
         return attack_add$field;
      }
      
      public function clearPhysicalDefenceAdd() : void
      {
         hasField$0 = hasField$0 & 4294963199;
         physical_defence_add$field = new Number();
      }
      
      public function get hasPhysicalDefenceAdd() : Boolean
      {
         return (hasField$0 & 4096) != 0;
      }
      
      public function set physicalDefenceAdd(param1:Number) : void
      {
         hasField$0 = hasField$0 | 4096;
         physical_defence_add$field = param1;
      }
      
      public function get physicalDefenceAdd() : Number
      {
         return physical_defence_add$field;
      }
      
      public function clearMagicDefenceAdd() : void
      {
         hasField$0 = hasField$0 & 4294959103;
         magic_defence_add$field = new Number();
      }
      
      public function get hasMagicDefenceAdd() : Boolean
      {
         return (hasField$0 & 8192) != 0;
      }
      
      public function set magicDefenceAdd(param1:Number) : void
      {
         hasField$0 = hasField$0 | 8192;
         magic_defence_add$field = param1;
      }
      
      public function get magicDefenceAdd() : Number
      {
         return magic_defence_add$field;
      }
      
      public function clearAgilityAdd() : void
      {
         hasField$0 = hasField$0 & 4294950911;
         agility_add$field = new Number();
      }
      
      public function get hasAgilityAdd() : Boolean
      {
         return (hasField$0 & 16384) != 0;
      }
      
      public function set agilityAdd(param1:Number) : void
      {
         hasField$0 = hasField$0 | 16384;
         agility_add$field = param1;
      }
      
      public function get agilityAdd() : Number
      {
         return agility_add$field;
      }
      
      public function clearDefenceAdd() : void
      {
         hasField$0 = hasField$0 & 4294934527;
         defence_add$field = new Number();
      }
      
      public function get hasDefenceAdd() : Boolean
      {
         return (hasField$0 & 32768) != 0;
      }
      
      public function set defenceAdd(param1:Number) : void
      {
         hasField$0 = hasField$0 | 32768;
         defence_add$field = param1;
      }
      
      public function get defenceAdd() : Number
      {
         return defence_add$field;
      }
      
      public function clearRageAdd() : void
      {
         hasField$0 = hasField$0 & 4294901759;
         rage_add$field = new Number();
      }
      
      public function get hasRageAdd() : Boolean
      {
         return (hasField$0 & 65536) != 0;
      }
      
      public function set rageAdd(param1:Number) : void
      {
         hasField$0 = hasField$0 | 65536;
         rage_add$field = param1;
      }
      
      public function get rageAdd() : Number
      {
         return rage_add$field;
      }
      
      public function clearDemageAdd() : void
      {
         hasField$0 = hasField$0 & 4294836223;
         demage_add$field = new Number();
      }
      
      public function get hasDemageAdd() : Boolean
      {
         return (hasField$0 & 131072) != 0;
      }
      
      public function set demageAdd(param1:Number) : void
      {
         hasField$0 = hasField$0 | 131072;
         demage_add$field = param1;
      }
      
      public function get demageAdd() : Number
      {
         return demage_add$field;
      }
      
      public function clearHurtAdd() : void
      {
         hasField$0 = hasField$0 & 4294705151;
         hurt_add$field = new Number();
      }
      
      public function get hasHurtAdd() : Boolean
      {
         return (hasField$0 & 262144) != 0;
      }
      
      public function set hurtAdd(param1:Number) : void
      {
         hasField$0 = hasField$0 | 262144;
         hurt_add$field = param1;
      }
      
      public function get hurtAdd() : Number
      {
         return hurt_add$field;
      }
      
      public function clearPhysicalHurtAdd() : void
      {
         hasField$0 = hasField$0 & 4294443007;
         physical_hurt_add$field = new Number();
      }
      
      public function get hasPhysicalHurtAdd() : Boolean
      {
         return (hasField$0 & 524288) != 0;
      }
      
      public function set physicalHurtAdd(param1:Number) : void
      {
         hasField$0 = hasField$0 | 524288;
         physical_hurt_add$field = param1;
      }
      
      public function get physicalHurtAdd() : Number
      {
         return physical_hurt_add$field;
      }
      
      public function clearMagicHurtAdd() : void
      {
         hasField$0 = hasField$0 & 4293918719;
         magic_hurt_add$field = new Number();
      }
      
      public function get hasMagicHurtAdd() : Boolean
      {
         return (hasField$0 & 1048576) != 0;
      }
      
      public function set magicHurtAdd(param1:Number) : void
      {
         hasField$0 = hasField$0 | 1048576;
         magic_hurt_add$field = param1;
      }
      
      public function get magicHurtAdd() : Number
      {
         return magic_hurt_add$field;
      }
      
      public function clearBeTreamentIncreaseRatio() : void
      {
         hasField$0 = hasField$0 & 4292870143;
         be_treament_increase_ratio$field = new Number();
      }
      
      public function get hasBeTreamentIncreaseRatio() : Boolean
      {
         return (hasField$0 & 2097152) != 0;
      }
      
      public function set beTreamentIncreaseRatio(param1:Number) : void
      {
         hasField$0 = hasField$0 | 2097152;
         be_treament_increase_ratio$field = param1;
      }
      
      public function get beTreamentIncreaseRatio() : Number
      {
         return be_treament_increase_ratio$field;
      }
      
      public function clearTreament() : void
      {
         hasField$0 = hasField$0 & 4290772991;
         treament$field = new Number();
      }
      
      public function get hasTreament() : Boolean
      {
         return (hasField$0 & 4194304) != 0;
      }
      
      public function set treament(param1:Number) : void
      {
         hasField$0 = hasField$0 | 4194304;
         treament$field = param1;
      }
      
      public function get treament() : Number
      {
         return treament$field;
      }
      
      public function clearHitRatio() : void
      {
         hasField$0 = hasField$0 & 4286578687;
         hit_ratio$field = new Number();
      }
      
      public function get hasHitRatio() : Boolean
      {
         return (hasField$0 & 8388608) != 0;
      }
      
      public function set hitRatio(param1:Number) : void
      {
         hasField$0 = hasField$0 | 8388608;
         hit_ratio$field = param1;
      }
      
      public function get hitRatio() : Number
      {
         return hit_ratio$field;
      }
      
      public function clearDodgeRatio() : void
      {
         hasField$0 = hasField$0 & 4278190079;
         dodge_ratio$field = new Number();
      }
      
      public function get hasDodgeRatio() : Boolean
      {
         return (hasField$0 & 16777216) != 0;
      }
      
      public function set dodgeRatio(param1:Number) : void
      {
         hasField$0 = hasField$0 | 16777216;
         dodge_ratio$field = param1;
      }
      
      public function get dodgeRatio() : Number
      {
         return dodge_ratio$field;
      }
      
      public function clearCritRatio() : void
      {
         hasField$0 = hasField$0 & 4261412863;
         crit_ratio$field = new Number();
      }
      
      public function get hasCritRatio() : Boolean
      {
         return (hasField$0 & 33554432) != 0;
      }
      
      public function set critRatio(param1:Number) : void
      {
         hasField$0 = hasField$0 | 33554432;
         crit_ratio$field = param1;
      }
      
      public function get critRatio() : Number
      {
         return crit_ratio$field;
      }
      
      public function clearResilienceRatio() : void
      {
         hasField$0 = hasField$0 & 4227858431;
         resilience_ratio$field = new Number();
      }
      
      public function get hasResilienceRatio() : Boolean
      {
         return (hasField$0 & 67108864) != 0;
      }
      
      public function set resilienceRatio(param1:Number) : void
      {
         hasField$0 = hasField$0 | 67108864;
         resilience_ratio$field = param1;
      }
      
      public function get resilienceRatio() : Number
      {
         return resilience_ratio$field;
      }
      
      public function clearBlockRatio() : void
      {
         hasField$0 = hasField$0 & 4160749567;
         block_ratio$field = new Number();
      }
      
      public function get hasBlockRatio() : Boolean
      {
         return (hasField$0 & 134217728) != 0;
      }
      
      public function set blockRatio(param1:Number) : void
      {
         hasField$0 = hasField$0 | 134217728;
         block_ratio$field = param1;
      }
      
      public function get blockRatio() : Number
      {
         return block_ratio$field;
      }
      
      public function clearCritDamageRating() : void
      {
         hasField$0 = hasField$0 & 4026531839;
         crit_damage_rating$field = new Number();
      }
      
      public function get hasCritDamageRating() : Boolean
      {
         return (hasField$0 & 268435456) != 0;
      }
      
      public function set critDamageRating(param1:Number) : void
      {
         hasField$0 = hasField$0 | 268435456;
         crit_damage_rating$field = param1;
      }
      
      public function get critDamageRating() : Number
      {
         return crit_damage_rating$field;
      }
      
      public function clearCritDamageRatio() : void
      {
         hasField$0 = hasField$0 & 3758096383;
         crit_damage_ratio$field = new Number();
      }
      
      public function get hasCritDamageRatio() : Boolean
      {
         return (hasField$0 & 536870912) != 0;
      }
      
      public function set critDamageRatio(param1:Number) : void
      {
         hasField$0 = hasField$0 | 536870912;
         crit_damage_ratio$field = param1;
      }
      
      public function get critDamageRatio() : Number
      {
         return crit_damage_ratio$field;
      }
      
      public function clearDamageIncreaseRatio() : void
      {
         hasField$0 = hasField$0 & 3221225471;
         damage_increase_ratio$field = new Number();
      }
      
      public function get hasDamageIncreaseRatio() : Boolean
      {
         return (hasField$0 & 1073741824) != 0;
      }
      
      public function set damageIncreaseRatio(param1:Number) : void
      {
         hasField$0 = hasField$0 | 1073741824;
         damage_increase_ratio$field = param1;
      }
      
      public function get damageIncreaseRatio() : Number
      {
         return damage_increase_ratio$field;
      }
      
      public function clearTreatmentIncreaseRatio() : void
      {
         hasField$0 = hasField$0 & 2147483647;
         treatment_increase_ratio$field = new Number();
      }
      
      public function get hasTreatmentIncreaseRatio() : Boolean
      {
         return (hasField$0 & 2147483648) != 0;
      }
      
      public function set treatmentIncreaseRatio(param1:Number) : void
      {
         hasField$0 = hasField$0 | 2147483648;
         treatment_increase_ratio$field = param1;
      }
      
      public function get treatmentIncreaseRatio() : Number
      {
         return treatment_increase_ratio$field;
      }
      
      public function clearRageRecovery() : void
      {
         hasField$1 = hasField$1 & 4294967294;
         rage_recovery$field = new Number();
      }
      
      public function get hasRageRecovery() : Boolean
      {
         return (hasField$1 & 1) != 0;
      }
      
      public function set rageRecovery(param1:Number) : void
      {
         hasField$1 = hasField$1 | 1;
         rage_recovery$field = param1;
      }
      
      public function get rageRecovery() : Number
      {
         return rage_recovery$field;
      }
      
      public function clearHpRecovery() : void
      {
         hasField$1 = hasField$1 & 4294967293;
         hp_recovery$field = new Number();
      }
      
      public function get hasHpRecovery() : Boolean
      {
         return (hasField$1 & 2) != 0;
      }
      
      public function set hpRecovery(param1:Number) : void
      {
         hasField$1 = hasField$1 | 2;
         hp_recovery$field = param1;
      }
      
      public function get hpRecovery() : Number
      {
         return hp_recovery$field;
      }
      
      public function clearDefenceAddExtra() : void
      {
         hasField$1 = hasField$1 & 4294967291;
         defence_add_extra$field = new Number();
      }
      
      public function get hasDefenceAddExtra() : Boolean
      {
         return (hasField$1 & 4) != 0;
      }
      
      public function set defenceAddExtra(param1:Number) : void
      {
         hasField$1 = hasField$1 | 4;
         defence_add_extra$field = param1;
      }
      
      public function get defenceAddExtra() : Number
      {
         return defence_add_extra$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasHp)
         {
            WriteUtils.writeTag(param1,5,1);
            WriteUtils.write$TYPE_FLOAT(param1,hp$field);
         }
         if(hasAttack)
         {
            WriteUtils.writeTag(param1,5,2);
            WriteUtils.write$TYPE_FLOAT(param1,attack$field);
         }
         if(hasPhysicalDefence)
         {
            WriteUtils.writeTag(param1,5,3);
            WriteUtils.write$TYPE_FLOAT(param1,physical_defence$field);
         }
         if(hasMagicDefence)
         {
            WriteUtils.writeTag(param1,5,4);
            WriteUtils.write$TYPE_FLOAT(param1,magic_defence$field);
         }
         if(hasAgility)
         {
            WriteUtils.writeTag(param1,5,5);
            WriteUtils.write$TYPE_FLOAT(param1,agility$field);
         }
         if(hasHitRating)
         {
            WriteUtils.writeTag(param1,5,6);
            WriteUtils.write$TYPE_FLOAT(param1,hit_rating$field);
         }
         if(hasDodgeRating)
         {
            WriteUtils.writeTag(param1,5,7);
            WriteUtils.write$TYPE_FLOAT(param1,dodge_rating$field);
         }
         if(hasCritRating)
         {
            WriteUtils.writeTag(param1,5,8);
            WriteUtils.write$TYPE_FLOAT(param1,crit_rating$field);
         }
         if(hasResilienceRating)
         {
            WriteUtils.writeTag(param1,5,9);
            WriteUtils.write$TYPE_FLOAT(param1,resilience_rating$field);
         }
         if(hasBlockRating)
         {
            WriteUtils.writeTag(param1,5,10);
            WriteUtils.write$TYPE_FLOAT(param1,block_rating$field);
         }
         if(hasHpAdd)
         {
            WriteUtils.writeTag(param1,5,11);
            WriteUtils.write$TYPE_FLOAT(param1,hp_add$field);
         }
         if(hasAttackAdd)
         {
            WriteUtils.writeTag(param1,5,12);
            WriteUtils.write$TYPE_FLOAT(param1,attack_add$field);
         }
         if(hasPhysicalDefenceAdd)
         {
            WriteUtils.writeTag(param1,5,13);
            WriteUtils.write$TYPE_FLOAT(param1,physical_defence_add$field);
         }
         if(hasMagicDefenceAdd)
         {
            WriteUtils.writeTag(param1,5,14);
            WriteUtils.write$TYPE_FLOAT(param1,magic_defence_add$field);
         }
         if(hasAgilityAdd)
         {
            WriteUtils.writeTag(param1,5,15);
            WriteUtils.write$TYPE_FLOAT(param1,agility_add$field);
         }
         if(hasDefenceAdd)
         {
            WriteUtils.writeTag(param1,5,16);
            WriteUtils.write$TYPE_FLOAT(param1,defence_add$field);
         }
         if(hasRageAdd)
         {
            WriteUtils.writeTag(param1,5,17);
            WriteUtils.write$TYPE_FLOAT(param1,rage_add$field);
         }
         if(hasDemageAdd)
         {
            WriteUtils.writeTag(param1,5,18);
            WriteUtils.write$TYPE_FLOAT(param1,demage_add$field);
         }
         if(hasHurtAdd)
         {
            WriteUtils.writeTag(param1,5,19);
            WriteUtils.write$TYPE_FLOAT(param1,hurt_add$field);
         }
         if(hasPhysicalHurtAdd)
         {
            WriteUtils.writeTag(param1,5,20);
            WriteUtils.write$TYPE_FLOAT(param1,physical_hurt_add$field);
         }
         if(hasMagicHurtAdd)
         {
            WriteUtils.writeTag(param1,5,21);
            WriteUtils.write$TYPE_FLOAT(param1,magic_hurt_add$field);
         }
         if(hasBeTreamentIncreaseRatio)
         {
            WriteUtils.writeTag(param1,5,22);
            WriteUtils.write$TYPE_FLOAT(param1,be_treament_increase_ratio$field);
         }
         if(hasTreament)
         {
            WriteUtils.writeTag(param1,5,23);
            WriteUtils.write$TYPE_FLOAT(param1,treament$field);
         }
         if(hasHitRatio)
         {
            WriteUtils.writeTag(param1,5,24);
            WriteUtils.write$TYPE_FLOAT(param1,hit_ratio$field);
         }
         if(hasDodgeRatio)
         {
            WriteUtils.writeTag(param1,5,25);
            WriteUtils.write$TYPE_FLOAT(param1,dodge_ratio$field);
         }
         if(hasCritRatio)
         {
            WriteUtils.writeTag(param1,5,26);
            WriteUtils.write$TYPE_FLOAT(param1,crit_ratio$field);
         }
         if(hasResilienceRatio)
         {
            WriteUtils.writeTag(param1,5,27);
            WriteUtils.write$TYPE_FLOAT(param1,resilience_ratio$field);
         }
         if(hasBlockRatio)
         {
            WriteUtils.writeTag(param1,5,28);
            WriteUtils.write$TYPE_FLOAT(param1,block_ratio$field);
         }
         if(hasCritDamageRating)
         {
            WriteUtils.writeTag(param1,5,29);
            WriteUtils.write$TYPE_FLOAT(param1,crit_damage_rating$field);
         }
         if(hasCritDamageRatio)
         {
            WriteUtils.writeTag(param1,5,30);
            WriteUtils.write$TYPE_FLOAT(param1,crit_damage_ratio$field);
         }
         if(hasDamageIncreaseRatio)
         {
            WriteUtils.writeTag(param1,5,31);
            WriteUtils.write$TYPE_FLOAT(param1,damage_increase_ratio$field);
         }
         if(hasTreatmentIncreaseRatio)
         {
            WriteUtils.writeTag(param1,5,32);
            WriteUtils.write$TYPE_FLOAT(param1,treatment_increase_ratio$field);
         }
         if(hasRageRecovery)
         {
            WriteUtils.writeTag(param1,5,33);
            WriteUtils.write$TYPE_FLOAT(param1,rage_recovery$field);
         }
         if(hasHpRecovery)
         {
            WriteUtils.writeTag(param1,5,34);
            WriteUtils.write$TYPE_FLOAT(param1,hp_recovery$field);
         }
         if(hasDefenceAddExtra)
         {
            WriteUtils.writeTag(param1,5,35);
            WriteUtils.write$TYPE_FLOAT(param1,defence_add_extra$field);
         }
         var _loc4_:int = 0;
         var _loc3_:* = this;
         for(var _loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc6_:* = 0;
         var _loc9_:uint = 0;
         var _loc15_:uint = 0;
         var _loc18_:uint = 0;
         var _loc16_:uint = 0;
         var _loc30_:uint = 0;
         var _loc31_:uint = 0;
         var _loc38_:uint = 0;
         var _loc37_:uint = 0;
         var _loc20_:uint = 0;
         var _loc11_:uint = 0;
         var _loc28_:uint = 0;
         var _loc21_:uint = 0;
         var _loc34_:uint = 0;
         var _loc10_:uint = 0;
         var _loc32_:uint = 0;
         var _loc19_:uint = 0;
         var _loc36_:uint = 0;
         var _loc35_:uint = 0;
         var _loc33_:uint = 0;
         var _loc25_:uint = 0;
         var _loc17_:uint = 0;
         var _loc13_:uint = 0;
         var _loc23_:uint = 0;
         var _loc22_:uint = 0;
         var _loc29_:uint = 0;
         var _loc5_:uint = 0;
         var _loc14_:uint = 0;
         var _loc24_:uint = 0;
         var _loc3_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc27_:uint = 0;
         var _loc4_:uint = 0;
         var _loc26_:uint = 0;
         var _loc12_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            var _loc39_:* = _loc6_ >> 3;
            if(1 !== _loc39_)
            {
               if(2 !== _loc39_)
               {
                  if(3 !== _loc39_)
                  {
                     if(4 !== _loc39_)
                     {
                        if(5 !== _loc39_)
                        {
                           if(6 !== _loc39_)
                           {
                              if(7 !== _loc39_)
                              {
                                 if(8 !== _loc39_)
                                 {
                                    if(9 !== _loc39_)
                                    {
                                       if(10 !== _loc39_)
                                       {
                                          if(11 !== _loc39_)
                                          {
                                             if(12 !== _loc39_)
                                             {
                                                if(13 !== _loc39_)
                                                {
                                                   if(14 !== _loc39_)
                                                   {
                                                      if(15 !== _loc39_)
                                                      {
                                                         if(16 !== _loc39_)
                                                         {
                                                            if(17 !== _loc39_)
                                                            {
                                                               if(18 !== _loc39_)
                                                               {
                                                                  if(19 !== _loc39_)
                                                                  {
                                                                     if(20 !== _loc39_)
                                                                     {
                                                                        if(21 !== _loc39_)
                                                                        {
                                                                           if(22 !== _loc39_)
                                                                           {
                                                                              if(23 !== _loc39_)
                                                                              {
                                                                                 if(24 !== _loc39_)
                                                                                 {
                                                                                    if(25 !== _loc39_)
                                                                                    {
                                                                                       if(26 !== _loc39_)
                                                                                       {
                                                                                          if(27 !== _loc39_)
                                                                                          {
                                                                                             if(28 !== _loc39_)
                                                                                             {
                                                                                                if(29 !== _loc39_)
                                                                                                {
                                                                                                   if(30 !== _loc39_)
                                                                                                   {
                                                                                                      if(31 !== _loc39_)
                                                                                                      {
                                                                                                         if(32 !== _loc39_)
                                                                                                         {
                                                                                                            if(33 !== _loc39_)
                                                                                                            {
                                                                                                               if(34 !== _loc39_)
                                                                                                               {
                                                                                                                  if(35 !== _loc39_)
                                                                                                                  {
                                                                                                                     super.readUnknown(param1,_loc6_);
                                                                                                                  }
                                                                                                                  else
                                                                                                                  {
                                                                                                                     if(_loc12_ != 0)
                                                                                                                     {
                                                                                                                        throw new IOError("Bad data format: FightProp.defenceAddExtra cannot be set twice.");
                                                                                                                     }
                                                                                                                     _loc12_++;
                                                                                                                     this.defenceAddExtra = ReadUtils.read$TYPE_FLOAT(param1);
                                                                                                                  }
                                                                                                               }
                                                                                                               else
                                                                                                               {
                                                                                                                  if(_loc26_ != 0)
                                                                                                                  {
                                                                                                                     throw new IOError("Bad data format: FightProp.hpRecovery cannot be set twice.");
                                                                                                                  }
                                                                                                                  _loc26_++;
                                                                                                                  this.hpRecovery = ReadUtils.read$TYPE_FLOAT(param1);
                                                                                                               }
                                                                                                            }
                                                                                                            else
                                                                                                            {
                                                                                                               if(_loc4_ != 0)
                                                                                                               {
                                                                                                                  throw new IOError("Bad data format: FightProp.rageRecovery cannot be set twice.");
                                                                                                               }
                                                                                                               _loc4_++;
                                                                                                               this.rageRecovery = ReadUtils.read$TYPE_FLOAT(param1);
                                                                                                            }
                                                                                                         }
                                                                                                         else
                                                                                                         {
                                                                                                            if(_loc27_ != 0)
                                                                                                            {
                                                                                                               throw new IOError("Bad data format: FightProp.treatmentIncreaseRatio cannot be set twice.");
                                                                                                            }
                                                                                                            _loc27_++;
                                                                                                            this.treatmentIncreaseRatio = ReadUtils.read$TYPE_FLOAT(param1);
                                                                                                         }
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                         if(_loc8_ != 0)
                                                                                                         {
                                                                                                            throw new IOError("Bad data format: FightProp.damageIncreaseRatio cannot be set twice.");
                                                                                                         }
                                                                                                         _loc8_++;
                                                                                                         this.damageIncreaseRatio = ReadUtils.read$TYPE_FLOAT(param1);
                                                                                                      }
                                                                                                   }
                                                                                                   else
                                                                                                   {
                                                                                                      if(_loc7_ != 0)
                                                                                                      {
                                                                                                         throw new IOError("Bad data format: FightProp.critDamageRatio cannot be set twice.");
                                                                                                      }
                                                                                                      _loc7_++;
                                                                                                      this.critDamageRatio = ReadUtils.read$TYPE_FLOAT(param1);
                                                                                                   }
                                                                                                }
                                                                                                else
                                                                                                {
                                                                                                   if(_loc3_ != 0)
                                                                                                   {
                                                                                                      throw new IOError("Bad data format: FightProp.critDamageRating cannot be set twice.");
                                                                                                   }
                                                                                                   _loc3_++;
                                                                                                   this.critDamageRating = ReadUtils.read$TYPE_FLOAT(param1);
                                                                                                }
                                                                                             }
                                                                                             else
                                                                                             {
                                                                                                if(_loc24_ != 0)
                                                                                                {
                                                                                                   throw new IOError("Bad data format: FightProp.blockRatio cannot be set twice.");
                                                                                                }
                                                                                                _loc24_++;
                                                                                                this.blockRatio = ReadUtils.read$TYPE_FLOAT(param1);
                                                                                             }
                                                                                          }
                                                                                          else
                                                                                          {
                                                                                             if(_loc14_ != 0)
                                                                                             {
                                                                                                throw new IOError("Bad data format: FightProp.resilienceRatio cannot be set twice.");
                                                                                             }
                                                                                             _loc14_++;
                                                                                             this.resilienceRatio = ReadUtils.read$TYPE_FLOAT(param1);
                                                                                          }
                                                                                       }
                                                                                       else
                                                                                       {
                                                                                          if(_loc5_ != 0)
                                                                                          {
                                                                                             throw new IOError("Bad data format: FightProp.critRatio cannot be set twice.");
                                                                                          }
                                                                                          _loc5_++;
                                                                                          this.critRatio = ReadUtils.read$TYPE_FLOAT(param1);
                                                                                       }
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                       if(_loc29_ != 0)
                                                                                       {
                                                                                          throw new IOError("Bad data format: FightProp.dodgeRatio cannot be set twice.");
                                                                                       }
                                                                                       _loc29_++;
                                                                                       this.dodgeRatio = ReadUtils.read$TYPE_FLOAT(param1);
                                                                                    }
                                                                                 }
                                                                                 else
                                                                                 {
                                                                                    if(_loc22_ != 0)
                                                                                    {
                                                                                       throw new IOError("Bad data format: FightProp.hitRatio cannot be set twice.");
                                                                                    }
                                                                                    _loc22_++;
                                                                                    this.hitRatio = ReadUtils.read$TYPE_FLOAT(param1);
                                                                                 }
                                                                              }
                                                                              else
                                                                              {
                                                                                 if(_loc23_ != 0)
                                                                                 {
                                                                                    throw new IOError("Bad data format: FightProp.treament cannot be set twice.");
                                                                                 }
                                                                                 _loc23_++;
                                                                                 this.treament = ReadUtils.read$TYPE_FLOAT(param1);
                                                                              }
                                                                           }
                                                                           else
                                                                           {
                                                                              if(_loc13_ != 0)
                                                                              {
                                                                                 throw new IOError("Bad data format: FightProp.beTreamentIncreaseRatio cannot be set twice.");
                                                                              }
                                                                              _loc13_++;
                                                                              this.beTreamentIncreaseRatio = ReadUtils.read$TYPE_FLOAT(param1);
                                                                           }
                                                                        }
                                                                        else
                                                                        {
                                                                           if(_loc17_ != 0)
                                                                           {
                                                                              throw new IOError("Bad data format: FightProp.magicHurtAdd cannot be set twice.");
                                                                           }
                                                                           _loc17_++;
                                                                           this.magicHurtAdd = ReadUtils.read$TYPE_FLOAT(param1);
                                                                        }
                                                                     }
                                                                     else
                                                                     {
                                                                        if(_loc25_ != 0)
                                                                        {
                                                                           throw new IOError("Bad data format: FightProp.physicalHurtAdd cannot be set twice.");
                                                                        }
                                                                        _loc25_++;
                                                                        this.physicalHurtAdd = ReadUtils.read$TYPE_FLOAT(param1);
                                                                     }
                                                                  }
                                                                  else
                                                                  {
                                                                     if(_loc33_ != 0)
                                                                     {
                                                                        throw new IOError("Bad data format: FightProp.hurtAdd cannot be set twice.");
                                                                     }
                                                                     _loc33_++;
                                                                     this.hurtAdd = ReadUtils.read$TYPE_FLOAT(param1);
                                                                  }
                                                               }
                                                               else
                                                               {
                                                                  if(_loc35_ != 0)
                                                                  {
                                                                     throw new IOError("Bad data format: FightProp.demageAdd cannot be set twice.");
                                                                  }
                                                                  _loc35_++;
                                                                  this.demageAdd = ReadUtils.read$TYPE_FLOAT(param1);
                                                               }
                                                            }
                                                            else
                                                            {
                                                               if(_loc36_ != 0)
                                                               {
                                                                  throw new IOError("Bad data format: FightProp.rageAdd cannot be set twice.");
                                                               }
                                                               _loc36_++;
                                                               this.rageAdd = ReadUtils.read$TYPE_FLOAT(param1);
                                                            }
                                                         }
                                                         else
                                                         {
                                                            if(_loc19_ != 0)
                                                            {
                                                               throw new IOError("Bad data format: FightProp.defenceAdd cannot be set twice.");
                                                            }
                                                            _loc19_++;
                                                            this.defenceAdd = ReadUtils.read$TYPE_FLOAT(param1);
                                                         }
                                                      }
                                                      else
                                                      {
                                                         if(_loc32_ != 0)
                                                         {
                                                            throw new IOError("Bad data format: FightProp.agilityAdd cannot be set twice.");
                                                         }
                                                         _loc32_++;
                                                         this.agilityAdd = ReadUtils.read$TYPE_FLOAT(param1);
                                                      }
                                                   }
                                                   else
                                                   {
                                                      if(_loc10_ != 0)
                                                      {
                                                         throw new IOError("Bad data format: FightProp.magicDefenceAdd cannot be set twice.");
                                                      }
                                                      _loc10_++;
                                                      this.magicDefenceAdd = ReadUtils.read$TYPE_FLOAT(param1);
                                                   }
                                                }
                                                else
                                                {
                                                   if(_loc34_ != 0)
                                                   {
                                                      throw new IOError("Bad data format: FightProp.physicalDefenceAdd cannot be set twice.");
                                                   }
                                                   _loc34_++;
                                                   this.physicalDefenceAdd = ReadUtils.read$TYPE_FLOAT(param1);
                                                }
                                             }
                                             else
                                             {
                                                if(_loc21_ != 0)
                                                {
                                                   throw new IOError("Bad data format: FightProp.attackAdd cannot be set twice.");
                                                }
                                                _loc21_++;
                                                this.attackAdd = ReadUtils.read$TYPE_FLOAT(param1);
                                             }
                                          }
                                          else
                                          {
                                             if(_loc28_ != 0)
                                             {
                                                throw new IOError("Bad data format: FightProp.hpAdd cannot be set twice.");
                                             }
                                             _loc28_++;
                                             this.hpAdd = ReadUtils.read$TYPE_FLOAT(param1);
                                          }
                                       }
                                       else
                                       {
                                          if(_loc11_ != 0)
                                          {
                                             throw new IOError("Bad data format: FightProp.blockRating cannot be set twice.");
                                          }
                                          _loc11_++;
                                          this.blockRating = ReadUtils.read$TYPE_FLOAT(param1);
                                       }
                                    }
                                    else
                                    {
                                       if(_loc20_ != 0)
                                       {
                                          throw new IOError("Bad data format: FightProp.resilienceRating cannot be set twice.");
                                       }
                                       _loc20_++;
                                       this.resilienceRating = ReadUtils.read$TYPE_FLOAT(param1);
                                    }
                                 }
                                 else
                                 {
                                    if(_loc37_ != 0)
                                    {
                                       throw new IOError("Bad data format: FightProp.critRating cannot be set twice.");
                                    }
                                    _loc37_++;
                                    this.critRating = ReadUtils.read$TYPE_FLOAT(param1);
                                 }
                              }
                              else
                              {
                                 if(_loc38_ != 0)
                                 {
                                    throw new IOError("Bad data format: FightProp.dodgeRating cannot be set twice.");
                                 }
                                 _loc38_++;
                                 this.dodgeRating = ReadUtils.read$TYPE_FLOAT(param1);
                              }
                           }
                           else
                           {
                              if(_loc31_ != 0)
                              {
                                 throw new IOError("Bad data format: FightProp.hitRating cannot be set twice.");
                              }
                              _loc31_++;
                              this.hitRating = ReadUtils.read$TYPE_FLOAT(param1);
                           }
                        }
                        else
                        {
                           if(_loc30_ != 0)
                           {
                              throw new IOError("Bad data format: FightProp.agility cannot be set twice.");
                           }
                           _loc30_++;
                           this.agility = ReadUtils.read$TYPE_FLOAT(param1);
                        }
                     }
                     else
                     {
                        if(_loc16_ != 0)
                        {
                           throw new IOError("Bad data format: FightProp.magicDefence cannot be set twice.");
                        }
                        _loc16_++;
                        this.magicDefence = ReadUtils.read$TYPE_FLOAT(param1);
                     }
                  }
                  else
                  {
                     if(_loc18_ != 0)
                     {
                        throw new IOError("Bad data format: FightProp.physicalDefence cannot be set twice.");
                     }
                     _loc18_++;
                     this.physicalDefence = ReadUtils.read$TYPE_FLOAT(param1);
                  }
               }
               else
               {
                  if(_loc15_ != 0)
                  {
                     throw new IOError("Bad data format: FightProp.attack cannot be set twice.");
                  }
                  _loc15_++;
                  this.attack = ReadUtils.read$TYPE_FLOAT(param1);
               }
            }
            else
            {
               if(_loc9_ != 0)
               {
                  throw new IOError("Bad data format: FightProp.hp cannot be set twice.");
               }
               _loc9_++;
               this.hp = ReadUtils.read$TYPE_FLOAT(param1);
            }
         }
      }
   }
}
