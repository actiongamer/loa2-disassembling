package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_FLOAT;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class BattlePlayer extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.BattlePlayer.id","id",8 | 0);
      
      public static const NPC_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.BattlePlayer.npc_id","npcId",16 | 0);
      
      public static const SEX:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.BattlePlayer.sex","sex",24 | 0);
      
      public static const KIND:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.BattlePlayer.kind","kind",32 | 0);
      
      public static const LEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.BattlePlayer.level","level",40 | 0);
      
      public static const STAR_LEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.BattlePlayer.star_level","starLevel",48 | 0);
      
      public static const QUALITY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.BattlePlayer.quality","quality",56 | 0);
      
      public static const CAREER_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.BattlePlayer.career_id","careerId",64 | 0);
      
      public static const NORMAL_ATTACK_TYPE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.BattlePlayer.normal_attack_type","normalAttackType",72 | 0);
      
      public static const NORMAL_ATTACK_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.BattlePlayer.normal_attack_id","normalAttackId",80 | 0);
      
      public static const RAGE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.BattlePlayer.rage","rage",88 | 0);
      
      public static const MAX_RAGE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.BattlePlayer.max_rage","maxRage",96 | 0);
      
      public static const PROP:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.BattlePlayer.prop","prop",104 | 2,proto.FightProp);
      
      public static const SKILLID1:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.BattlePlayer.skillId1","skillId1",112 | 0);
      
      public static const SKILLID2:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.BattlePlayer.skillId2","skillId2",120 | 0);
      
      public static const SKILLID3:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.BattlePlayer.skillId3","skillId3",128 | 0);
      
      public static const SKILLID4:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.BattlePlayer.skillId4","skillId4",136 | 0);
      
      public static const SKILL_SORT:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.BattlePlayer.skill_sort","skillSort",144 | 2);
      
      public static const COMBAT_POWER:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.BattlePlayer.combat_power","combatPower",152 | 0);
      
      public static const HP_MAX:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.BattlePlayer.hp_max","hpMax",160 | 0);
      
      public static const POSID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.BattlePlayer.posId","posId",168 | 0);
      
      public static const ISATTACK:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.BattlePlayer.isAttack","isAttack",176 | 0);
      
      public static const X:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.BattlePlayer.x","x",184 | 0);
      
      public static const Y:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.BattlePlayer.y","y",192 | 0);
      
      public static const BUFF:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.BattlePlayer.buff","buff",200 | 2);
      
      public static const AVATAR:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("proto.BattlePlayer.avatar","avatar",208 | 0);
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.BattlePlayer.name","name",216 | 2);
      
      public static const SKILLS:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.BattlePlayer.skills","skills",224 | 2);
      
      public static const LEADER_ATTACK:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("proto.BattlePlayer.leader_attack","leaderAttack",232 | 5);
      
      public static const SKILLPS:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.BattlePlayer.skillps","skillps",240 | 2);
       
      
      private var id$field:int;
      
      private var hasField$0:uint = 0;
      
      private var npc_id$field:int;
      
      private var sex$field:int;
      
      private var kind$field:int;
      
      private var level$field:int;
      
      private var star_level$field:int;
      
      private var quality$field:int;
      
      private var career_id$field:int;
      
      private var normal_attack_type$field:int;
      
      private var normal_attack_id$field:int;
      
      private var rage$field:int;
      
      private var max_rage$field:int;
      
      private var prop$field:proto.FightProp;
      
      private var skillId1$field:int;
      
      private var skillId2$field:int;
      
      private var skillId3$field:int;
      
      private var skillId4$field:int;
      
      private var skill_sort$field:String;
      
      private var combat_power$field:int;
      
      private var hp_max$field:int;
      
      private var posId$field:int;
      
      private var isAttack$field:int;
      
      private var x$field:int;
      
      private var y$field:int;
      
      private var buff$field:String;
      
      public var avatar:Array;
      
      private var name$field:String;
      
      private var skills$field:String;
      
      private var leader_attack$field:Number;
      
      private var skillps$field:String;
      
      public function BattlePlayer()
      {
         avatar = [];
         super();
      }
      
      public function clearId() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         id$field = new int();
      }
      
      public function get hasId() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set id(param1:int) : void
      {
         hasField$0 = hasField$0 | 1;
         id$field = param1;
      }
      
      public function get id() : int
      {
         return id$field;
      }
      
      public function clearNpcId() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         npc_id$field = new int();
      }
      
      public function get hasNpcId() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set npcId(param1:int) : void
      {
         hasField$0 = hasField$0 | 2;
         npc_id$field = param1;
      }
      
      public function get npcId() : int
      {
         return npc_id$field;
      }
      
      public function clearSex() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         sex$field = new int();
      }
      
      public function get hasSex() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set sex(param1:int) : void
      {
         hasField$0 = hasField$0 | 4;
         sex$field = param1;
      }
      
      public function get sex() : int
      {
         return sex$field;
      }
      
      public function clearKind() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         kind$field = new int();
      }
      
      public function get hasKind() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set kind(param1:int) : void
      {
         hasField$0 = hasField$0 | 8;
         kind$field = param1;
      }
      
      public function get kind() : int
      {
         return kind$field;
      }
      
      public function clearLevel() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         level$field = new int();
      }
      
      public function get hasLevel() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set level(param1:int) : void
      {
         hasField$0 = hasField$0 | 16;
         level$field = param1;
      }
      
      public function get level() : int
      {
         return level$field;
      }
      
      public function clearStarLevel() : void
      {
         hasField$0 = hasField$0 & 4294967263;
         star_level$field = new int();
      }
      
      public function get hasStarLevel() : Boolean
      {
         return (hasField$0 & 32) != 0;
      }
      
      public function set starLevel(param1:int) : void
      {
         hasField$0 = hasField$0 | 32;
         star_level$field = param1;
      }
      
      public function get starLevel() : int
      {
         return star_level$field;
      }
      
      public function clearQuality() : void
      {
         hasField$0 = hasField$0 & 4294967231;
         quality$field = new int();
      }
      
      public function get hasQuality() : Boolean
      {
         return (hasField$0 & 64) != 0;
      }
      
      public function set quality(param1:int) : void
      {
         hasField$0 = hasField$0 | 64;
         quality$field = param1;
      }
      
      public function get quality() : int
      {
         return quality$field;
      }
      
      public function clearCareerId() : void
      {
         hasField$0 = hasField$0 & 4294967167;
         career_id$field = new int();
      }
      
      public function get hasCareerId() : Boolean
      {
         return (hasField$0 & 128) != 0;
      }
      
      public function set careerId(param1:int) : void
      {
         hasField$0 = hasField$0 | 128;
         career_id$field = param1;
      }
      
      public function get careerId() : int
      {
         return career_id$field;
      }
      
      public function clearNormalAttackType() : void
      {
         hasField$0 = hasField$0 & 4294967039;
         normal_attack_type$field = new int();
      }
      
      public function get hasNormalAttackType() : Boolean
      {
         return (hasField$0 & 256) != 0;
      }
      
      public function set normalAttackType(param1:int) : void
      {
         hasField$0 = hasField$0 | 256;
         normal_attack_type$field = param1;
      }
      
      public function get normalAttackType() : int
      {
         return normal_attack_type$field;
      }
      
      public function clearNormalAttackId() : void
      {
         hasField$0 = hasField$0 & 4294966783;
         normal_attack_id$field = new int();
      }
      
      public function get hasNormalAttackId() : Boolean
      {
         return (hasField$0 & 512) != 0;
      }
      
      public function set normalAttackId(param1:int) : void
      {
         hasField$0 = hasField$0 | 512;
         normal_attack_id$field = param1;
      }
      
      public function get normalAttackId() : int
      {
         return normal_attack_id$field;
      }
      
      public function clearRage() : void
      {
         hasField$0 = hasField$0 & 4294966271;
         rage$field = new int();
      }
      
      public function get hasRage() : Boolean
      {
         return (hasField$0 & 1024) != 0;
      }
      
      public function set rage(param1:int) : void
      {
         hasField$0 = hasField$0 | 1024;
         rage$field = param1;
      }
      
      public function get rage() : int
      {
         return rage$field;
      }
      
      public function clearMaxRage() : void
      {
         hasField$0 = hasField$0 & 4294965247;
         max_rage$field = new int();
      }
      
      public function get hasMaxRage() : Boolean
      {
         return (hasField$0 & 2048) != 0;
      }
      
      public function set maxRage(param1:int) : void
      {
         hasField$0 = hasField$0 | 2048;
         max_rage$field = param1;
      }
      
      public function get maxRage() : int
      {
         return max_rage$field;
      }
      
      public function clearProp() : void
      {
         prop$field = null;
      }
      
      public function get hasProp() : Boolean
      {
         return prop$field != null;
      }
      
      public function set prop(param1:proto.FightProp) : void
      {
         prop$field = param1;
      }
      
      public function get prop() : proto.FightProp
      {
         return prop$field;
      }
      
      public function clearSkillId1() : void
      {
         hasField$0 = hasField$0 & 4294963199;
         skillId1$field = new int();
      }
      
      public function get hasSkillId1() : Boolean
      {
         return (hasField$0 & 4096) != 0;
      }
      
      public function set skillId1(param1:int) : void
      {
         hasField$0 = hasField$0 | 4096;
         skillId1$field = param1;
      }
      
      public function get skillId1() : int
      {
         return skillId1$field;
      }
      
      public function clearSkillId2() : void
      {
         hasField$0 = hasField$0 & 4294959103;
         skillId2$field = new int();
      }
      
      public function get hasSkillId2() : Boolean
      {
         return (hasField$0 & 8192) != 0;
      }
      
      public function set skillId2(param1:int) : void
      {
         hasField$0 = hasField$0 | 8192;
         skillId2$field = param1;
      }
      
      public function get skillId2() : int
      {
         return skillId2$field;
      }
      
      public function clearSkillId3() : void
      {
         hasField$0 = hasField$0 & 4294950911;
         skillId3$field = new int();
      }
      
      public function get hasSkillId3() : Boolean
      {
         return (hasField$0 & 16384) != 0;
      }
      
      public function set skillId3(param1:int) : void
      {
         hasField$0 = hasField$0 | 16384;
         skillId3$field = param1;
      }
      
      public function get skillId3() : int
      {
         return skillId3$field;
      }
      
      public function clearSkillId4() : void
      {
         hasField$0 = hasField$0 & 4294934527;
         skillId4$field = new int();
      }
      
      public function get hasSkillId4() : Boolean
      {
         return (hasField$0 & 32768) != 0;
      }
      
      public function set skillId4(param1:int) : void
      {
         hasField$0 = hasField$0 | 32768;
         skillId4$field = param1;
      }
      
      public function get skillId4() : int
      {
         return skillId4$field;
      }
      
      public function clearSkillSort() : void
      {
         skill_sort$field = null;
      }
      
      public function get hasSkillSort() : Boolean
      {
         return skill_sort$field != null;
      }
      
      public function set skillSort(param1:String) : void
      {
         skill_sort$field = param1;
      }
      
      public function get skillSort() : String
      {
         return skill_sort$field;
      }
      
      public function clearCombatPower() : void
      {
         hasField$0 = hasField$0 & 4294901759;
         combat_power$field = new int();
      }
      
      public function get hasCombatPower() : Boolean
      {
         return (hasField$0 & 65536) != 0;
      }
      
      public function set combatPower(param1:int) : void
      {
         hasField$0 = hasField$0 | 65536;
         combat_power$field = param1;
      }
      
      public function get combatPower() : int
      {
         return combat_power$field;
      }
      
      public function clearHpMax() : void
      {
         hasField$0 = hasField$0 & 4294836223;
         hp_max$field = new int();
      }
      
      public function get hasHpMax() : Boolean
      {
         return (hasField$0 & 131072) != 0;
      }
      
      public function set hpMax(param1:int) : void
      {
         hasField$0 = hasField$0 | 131072;
         hp_max$field = param1;
      }
      
      public function get hpMax() : int
      {
         return hp_max$field;
      }
      
      public function clearPosId() : void
      {
         hasField$0 = hasField$0 & 4294705151;
         posId$field = new int();
      }
      
      public function get hasPosId() : Boolean
      {
         return (hasField$0 & 262144) != 0;
      }
      
      public function set posId(param1:int) : void
      {
         hasField$0 = hasField$0 | 262144;
         posId$field = param1;
      }
      
      public function get posId() : int
      {
         return posId$field;
      }
      
      public function clearIsAttack() : void
      {
         hasField$0 = hasField$0 & 4294443007;
         isAttack$field = new int();
      }
      
      public function get hasIsAttack() : Boolean
      {
         return (hasField$0 & 524288) != 0;
      }
      
      public function set isAttack(param1:int) : void
      {
         hasField$0 = hasField$0 | 524288;
         isAttack$field = param1;
      }
      
      public function get isAttack() : int
      {
         return isAttack$field;
      }
      
      public function clearX() : void
      {
         hasField$0 = hasField$0 & 4293918719;
         x$field = new int();
      }
      
      public function get hasX() : Boolean
      {
         return (hasField$0 & 1048576) != 0;
      }
      
      public function set x(param1:int) : void
      {
         hasField$0 = hasField$0 | 1048576;
         x$field = param1;
      }
      
      public function get x() : int
      {
         return x$field;
      }
      
      public function clearY() : void
      {
         hasField$0 = hasField$0 & 4292870143;
         y$field = new int();
      }
      
      public function get hasY() : Boolean
      {
         return (hasField$0 & 2097152) != 0;
      }
      
      public function set y(param1:int) : void
      {
         hasField$0 = hasField$0 | 2097152;
         y$field = param1;
      }
      
      public function get y() : int
      {
         return y$field;
      }
      
      public function clearBuff() : void
      {
         buff$field = null;
      }
      
      public function get hasBuff() : Boolean
      {
         return buff$field != null;
      }
      
      public function set buff(param1:String) : void
      {
         buff$field = param1;
      }
      
      public function get buff() : String
      {
         return buff$field;
      }
      
      public function clearName() : void
      {
         name$field = null;
      }
      
      public function get hasName() : Boolean
      {
         return name$field != null;
      }
      
      public function set name(param1:String) : void
      {
         name$field = param1;
      }
      
      public function get name() : String
      {
         return name$field;
      }
      
      public function clearSkills() : void
      {
         skills$field = null;
      }
      
      public function get hasSkills() : Boolean
      {
         return skills$field != null;
      }
      
      public function set skills(param1:String) : void
      {
         skills$field = param1;
      }
      
      public function get skills() : String
      {
         return skills$field;
      }
      
      public function clearLeaderAttack() : void
      {
         hasField$0 = hasField$0 & 4290772991;
         leader_attack$field = new Number();
      }
      
      public function get hasLeaderAttack() : Boolean
      {
         return (hasField$0 & 4194304) != 0;
      }
      
      public function set leaderAttack(param1:Number) : void
      {
         hasField$0 = hasField$0 | 4194304;
         leader_attack$field = param1;
      }
      
      public function get leaderAttack() : Number
      {
         return leader_attack$field;
      }
      
      public function clearSkillps() : void
      {
         skillps$field = null;
      }
      
      public function get hasSkillps() : Boolean
      {
         return skillps$field != null;
      }
      
      public function set skillps(param1:String) : void
      {
         skillps$field = param1;
      }
      
      public function get skillps() : String
      {
         return skillps$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         if(hasId)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_INT32(param1,id$field);
         }
         if(hasNpcId)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_INT32(param1,npc_id$field);
         }
         if(hasSex)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_INT32(param1,sex$field);
         }
         if(hasKind)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_INT32(param1,kind$field);
         }
         if(hasLevel)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_INT32(param1,level$field);
         }
         if(hasStarLevel)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_INT32(param1,star_level$field);
         }
         if(hasQuality)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_INT32(param1,quality$field);
         }
         if(hasCareerId)
         {
            WriteUtils.writeTag(param1,0,8);
            WriteUtils.write$TYPE_INT32(param1,career_id$field);
         }
         if(hasNormalAttackType)
         {
            WriteUtils.writeTag(param1,0,9);
            WriteUtils.write$TYPE_INT32(param1,normal_attack_type$field);
         }
         if(hasNormalAttackId)
         {
            WriteUtils.writeTag(param1,0,10);
            WriteUtils.write$TYPE_INT32(param1,normal_attack_id$field);
         }
         if(hasRage)
         {
            WriteUtils.writeTag(param1,0,11);
            WriteUtils.write$TYPE_INT32(param1,rage$field);
         }
         if(hasMaxRage)
         {
            WriteUtils.writeTag(param1,0,12);
            WriteUtils.write$TYPE_INT32(param1,max_rage$field);
         }
         if(hasProp)
         {
            WriteUtils.writeTag(param1,2,13);
            WriteUtils.write$TYPE_MESSAGE(param1,prop$field);
         }
         if(hasSkillId1)
         {
            WriteUtils.writeTag(param1,0,14);
            WriteUtils.write$TYPE_INT32(param1,skillId1$field);
         }
         if(hasSkillId2)
         {
            WriteUtils.writeTag(param1,0,15);
            WriteUtils.write$TYPE_INT32(param1,skillId2$field);
         }
         if(hasSkillId3)
         {
            WriteUtils.writeTag(param1,0,16);
            WriteUtils.write$TYPE_INT32(param1,skillId3$field);
         }
         if(hasSkillId4)
         {
            WriteUtils.writeTag(param1,0,17);
            WriteUtils.write$TYPE_INT32(param1,skillId4$field);
         }
         if(hasSkillSort)
         {
            WriteUtils.writeTag(param1,2,18);
            WriteUtils.write$TYPE_STRING(param1,skill_sort$field);
         }
         if(hasCombatPower)
         {
            WriteUtils.writeTag(param1,0,19);
            WriteUtils.write$TYPE_INT32(param1,combat_power$field);
         }
         if(hasHpMax)
         {
            WriteUtils.writeTag(param1,0,20);
            WriteUtils.write$TYPE_INT32(param1,hp_max$field);
         }
         if(hasPosId)
         {
            WriteUtils.writeTag(param1,0,21);
            WriteUtils.write$TYPE_INT32(param1,posId$field);
         }
         if(hasIsAttack)
         {
            WriteUtils.writeTag(param1,0,22);
            WriteUtils.write$TYPE_INT32(param1,isAttack$field);
         }
         if(hasX)
         {
            WriteUtils.writeTag(param1,0,23);
            WriteUtils.write$TYPE_INT32(param1,x$field);
         }
         if(hasY)
         {
            WriteUtils.writeTag(param1,0,24);
            WriteUtils.write$TYPE_INT32(param1,y$field);
         }
         if(hasBuff)
         {
            WriteUtils.writeTag(param1,2,25);
            WriteUtils.write$TYPE_STRING(param1,buff$field);
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.avatar.length)
         {
            WriteUtils.writeTag(param1,0,26);
            WriteUtils.write$TYPE_UINT32(param1,this.avatar[_loc2_]);
            _loc2_++;
         }
         if(hasName)
         {
            WriteUtils.writeTag(param1,2,27);
            WriteUtils.write$TYPE_STRING(param1,name$field);
         }
         if(hasSkills)
         {
            WriteUtils.writeTag(param1,2,28);
            WriteUtils.write$TYPE_STRING(param1,skills$field);
         }
         if(hasLeaderAttack)
         {
            WriteUtils.writeTag(param1,5,29);
            WriteUtils.write$TYPE_FLOAT(param1,leader_attack$field);
         }
         if(hasSkillps)
         {
            WriteUtils.writeTag(param1,2,30);
            WriteUtils.write$TYPE_STRING(param1,skillps$field);
         }
         var _loc5_:int = 0;
         var _loc4_:* = this;
         for(var _loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc4_:* = 0;
         var _loc16_:uint = 0;
         var _loc9_:uint = 0;
         var _loc29_:uint = 0;
         var _loc17_:uint = 0;
         var _loc25_:uint = 0;
         var _loc31_:uint = 0;
         var _loc14_:uint = 0;
         var _loc27_:uint = 0;
         var _loc3_:uint = 0;
         var _loc13_:uint = 0;
         var _loc8_:uint = 0;
         var _loc22_:uint = 0;
         var _loc11_:uint = 0;
         var _loc26_:uint = 0;
         var _loc5_:uint = 0;
         var _loc10_:uint = 0;
         var _loc12_:uint = 0;
         var _loc32_:uint = 0;
         var _loc7_:uint = 0;
         var _loc20_:uint = 0;
         var _loc6_:uint = 0;
         var _loc23_:uint = 0;
         var _loc18_:uint = 0;
         var _loc28_:uint = 0;
         var _loc19_:uint = 0;
         var _loc24_:uint = 0;
         var _loc15_:uint = 0;
         var _loc30_:uint = 0;
         var _loc21_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            var _loc33_:* = _loc4_ >> 3;
            if(1 !== _loc33_)
            {
               if(2 !== _loc33_)
               {
                  if(3 !== _loc33_)
                  {
                     if(4 !== _loc33_)
                     {
                        if(5 !== _loc33_)
                        {
                           if(6 !== _loc33_)
                           {
                              if(7 !== _loc33_)
                              {
                                 if(8 !== _loc33_)
                                 {
                                    if(9 !== _loc33_)
                                    {
                                       if(10 !== _loc33_)
                                       {
                                          if(11 !== _loc33_)
                                          {
                                             if(12 !== _loc33_)
                                             {
                                                if(13 !== _loc33_)
                                                {
                                                   if(14 !== _loc33_)
                                                   {
                                                      if(15 !== _loc33_)
                                                      {
                                                         if(16 !== _loc33_)
                                                         {
                                                            if(17 !== _loc33_)
                                                            {
                                                               if(18 !== _loc33_)
                                                               {
                                                                  if(19 !== _loc33_)
                                                                  {
                                                                     if(20 !== _loc33_)
                                                                     {
                                                                        if(21 !== _loc33_)
                                                                        {
                                                                           if(22 !== _loc33_)
                                                                           {
                                                                              if(23 !== _loc33_)
                                                                              {
                                                                                 if(24 !== _loc33_)
                                                                                 {
                                                                                    if(25 !== _loc33_)
                                                                                    {
                                                                                       if(26 !== _loc33_)
                                                                                       {
                                                                                          if(27 !== _loc33_)
                                                                                          {
                                                                                             if(28 !== _loc33_)
                                                                                             {
                                                                                                if(29 !== _loc33_)
                                                                                                {
                                                                                                   if(30 !== _loc33_)
                                                                                                   {
                                                                                                      super.readUnknown(param1,_loc4_);
                                                                                                   }
                                                                                                   else
                                                                                                   {
                                                                                                      if(_loc21_ != 0)
                                                                                                      {
                                                                                                         throw new IOError("Bad data format: BattlePlayer.skillps cannot be set twice.");
                                                                                                      }
                                                                                                      _loc21_++;
                                                                                                      this.skillps = ReadUtils.read$TYPE_STRING(param1);
                                                                                                   }
                                                                                                }
                                                                                                else
                                                                                                {
                                                                                                   if(_loc30_ != 0)
                                                                                                   {
                                                                                                      throw new IOError("Bad data format: BattlePlayer.leaderAttack cannot be set twice.");
                                                                                                   }
                                                                                                   _loc30_++;
                                                                                                   this.leaderAttack = ReadUtils.read$TYPE_FLOAT(param1);
                                                                                                }
                                                                                             }
                                                                                             else
                                                                                             {
                                                                                                if(_loc15_ != 0)
                                                                                                {
                                                                                                   throw new IOError("Bad data format: BattlePlayer.skills cannot be set twice.");
                                                                                                }
                                                                                                _loc15_++;
                                                                                                this.skills = ReadUtils.read$TYPE_STRING(param1);
                                                                                             }
                                                                                          }
                                                                                          else
                                                                                          {
                                                                                             if(_loc24_ != 0)
                                                                                             {
                                                                                                throw new IOError("Bad data format: BattlePlayer.name cannot be set twice.");
                                                                                             }
                                                                                             _loc24_++;
                                                                                             this.name = ReadUtils.read$TYPE_STRING(param1);
                                                                                          }
                                                                                       }
                                                                                       else if((_loc4_ & 7) == 2)
                                                                                       {
                                                                                          ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.avatar);
                                                                                       }
                                                                                       else
                                                                                       {
                                                                                          this.avatar.push(ReadUtils.read$TYPE_UINT32(param1));
                                                                                       }
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                       if(_loc19_ != 0)
                                                                                       {
                                                                                          throw new IOError("Bad data format: BattlePlayer.buff cannot be set twice.");
                                                                                       }
                                                                                       _loc19_++;
                                                                                       this.buff = ReadUtils.read$TYPE_STRING(param1);
                                                                                    }
                                                                                 }
                                                                                 else
                                                                                 {
                                                                                    if(_loc28_ != 0)
                                                                                    {
                                                                                       throw new IOError("Bad data format: BattlePlayer.y cannot be set twice.");
                                                                                    }
                                                                                    _loc28_++;
                                                                                    this.y = ReadUtils.read$TYPE_INT32(param1);
                                                                                 }
                                                                              }
                                                                              else
                                                                              {
                                                                                 if(_loc18_ != 0)
                                                                                 {
                                                                                    throw new IOError("Bad data format: BattlePlayer.x cannot be set twice.");
                                                                                 }
                                                                                 _loc18_++;
                                                                                 this.x = ReadUtils.read$TYPE_INT32(param1);
                                                                              }
                                                                           }
                                                                           else
                                                                           {
                                                                              if(_loc23_ != 0)
                                                                              {
                                                                                 throw new IOError("Bad data format: BattlePlayer.isAttack cannot be set twice.");
                                                                              }
                                                                              _loc23_++;
                                                                              this.isAttack = ReadUtils.read$TYPE_INT32(param1);
                                                                           }
                                                                        }
                                                                        else
                                                                        {
                                                                           if(_loc6_ != 0)
                                                                           {
                                                                              throw new IOError("Bad data format: BattlePlayer.posId cannot be set twice.");
                                                                           }
                                                                           _loc6_++;
                                                                           this.posId = ReadUtils.read$TYPE_INT32(param1);
                                                                        }
                                                                     }
                                                                     else
                                                                     {
                                                                        if(_loc20_ != 0)
                                                                        {
                                                                           throw new IOError("Bad data format: BattlePlayer.hpMax cannot be set twice.");
                                                                        }
                                                                        _loc20_++;
                                                                        this.hpMax = ReadUtils.read$TYPE_INT32(param1);
                                                                     }
                                                                  }
                                                                  else
                                                                  {
                                                                     if(_loc7_ != 0)
                                                                     {
                                                                        throw new IOError("Bad data format: BattlePlayer.combatPower cannot be set twice.");
                                                                     }
                                                                     _loc7_++;
                                                                     this.combatPower = ReadUtils.read$TYPE_INT32(param1);
                                                                  }
                                                               }
                                                               else
                                                               {
                                                                  if(_loc32_ != 0)
                                                                  {
                                                                     throw new IOError("Bad data format: BattlePlayer.skillSort cannot be set twice.");
                                                                  }
                                                                  _loc32_++;
                                                                  this.skillSort = ReadUtils.read$TYPE_STRING(param1);
                                                               }
                                                            }
                                                            else
                                                            {
                                                               if(_loc12_ != 0)
                                                               {
                                                                  throw new IOError("Bad data format: BattlePlayer.skillId4 cannot be set twice.");
                                                               }
                                                               _loc12_++;
                                                               this.skillId4 = ReadUtils.read$TYPE_INT32(param1);
                                                            }
                                                         }
                                                         else
                                                         {
                                                            if(_loc10_ != 0)
                                                            {
                                                               throw new IOError("Bad data format: BattlePlayer.skillId3 cannot be set twice.");
                                                            }
                                                            _loc10_++;
                                                            this.skillId3 = ReadUtils.read$TYPE_INT32(param1);
                                                         }
                                                      }
                                                      else
                                                      {
                                                         if(_loc5_ != 0)
                                                         {
                                                            throw new IOError("Bad data format: BattlePlayer.skillId2 cannot be set twice.");
                                                         }
                                                         _loc5_++;
                                                         this.skillId2 = ReadUtils.read$TYPE_INT32(param1);
                                                      }
                                                   }
                                                   else
                                                   {
                                                      if(_loc26_ != 0)
                                                      {
                                                         throw new IOError("Bad data format: BattlePlayer.skillId1 cannot be set twice.");
                                                      }
                                                      _loc26_++;
                                                      this.skillId1 = ReadUtils.read$TYPE_INT32(param1);
                                                   }
                                                }
                                                else
                                                {
                                                   if(_loc11_ != 0)
                                                   {
                                                      throw new IOError("Bad data format: BattlePlayer.prop cannot be set twice.");
                                                   }
                                                   _loc11_++;
                                                   this.prop = new proto.FightProp();
                                                   ReadUtils.read$TYPE_MESSAGE(param1,this.prop);
                                                }
                                             }
                                             else
                                             {
                                                if(_loc22_ != 0)
                                                {
                                                   throw new IOError("Bad data format: BattlePlayer.maxRage cannot be set twice.");
                                                }
                                                _loc22_++;
                                                this.maxRage = ReadUtils.read$TYPE_INT32(param1);
                                             }
                                          }
                                          else
                                          {
                                             if(_loc8_ != 0)
                                             {
                                                throw new IOError("Bad data format: BattlePlayer.rage cannot be set twice.");
                                             }
                                             _loc8_++;
                                             this.rage = ReadUtils.read$TYPE_INT32(param1);
                                          }
                                       }
                                       else
                                       {
                                          if(_loc13_ != 0)
                                          {
                                             throw new IOError("Bad data format: BattlePlayer.normalAttackId cannot be set twice.");
                                          }
                                          _loc13_++;
                                          this.normalAttackId = ReadUtils.read$TYPE_INT32(param1);
                                       }
                                    }
                                    else
                                    {
                                       if(_loc3_ != 0)
                                       {
                                          throw new IOError("Bad data format: BattlePlayer.normalAttackType cannot be set twice.");
                                       }
                                       _loc3_++;
                                       this.normalAttackType = ReadUtils.read$TYPE_INT32(param1);
                                    }
                                 }
                                 else
                                 {
                                    if(_loc27_ != 0)
                                    {
                                       throw new IOError("Bad data format: BattlePlayer.careerId cannot be set twice.");
                                    }
                                    _loc27_++;
                                    this.careerId = ReadUtils.read$TYPE_INT32(param1);
                                 }
                              }
                              else
                              {
                                 if(_loc14_ != 0)
                                 {
                                    throw new IOError("Bad data format: BattlePlayer.quality cannot be set twice.");
                                 }
                                 _loc14_++;
                                 this.quality = ReadUtils.read$TYPE_INT32(param1);
                              }
                           }
                           else
                           {
                              if(_loc31_ != 0)
                              {
                                 throw new IOError("Bad data format: BattlePlayer.starLevel cannot be set twice.");
                              }
                              _loc31_++;
                              this.starLevel = ReadUtils.read$TYPE_INT32(param1);
                           }
                        }
                        else
                        {
                           if(_loc25_ != 0)
                           {
                              throw new IOError("Bad data format: BattlePlayer.level cannot be set twice.");
                           }
                           _loc25_++;
                           this.level = ReadUtils.read$TYPE_INT32(param1);
                        }
                     }
                     else
                     {
                        if(_loc17_ != 0)
                        {
                           throw new IOError("Bad data format: BattlePlayer.kind cannot be set twice.");
                        }
                        _loc17_++;
                        this.kind = ReadUtils.read$TYPE_INT32(param1);
                     }
                  }
                  else
                  {
                     if(_loc29_ != 0)
                     {
                        throw new IOError("Bad data format: BattlePlayer.sex cannot be set twice.");
                     }
                     _loc29_++;
                     this.sex = ReadUtils.read$TYPE_INT32(param1);
                  }
               }
               else
               {
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: BattlePlayer.npcId cannot be set twice.");
                  }
                  _loc9_++;
                  this.npcId = ReadUtils.read$TYPE_INT32(param1);
               }
            }
            else
            {
               if(_loc16_ != 0)
               {
                  throw new IOError("Bad data format: BattlePlayer.id cannot be set twice.");
               }
               _loc16_++;
               this.id = ReadUtils.read$TYPE_INT32(param1);
            }
         }
      }
   }
}
