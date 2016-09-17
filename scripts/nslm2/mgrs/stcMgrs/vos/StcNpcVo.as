package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcNpcVo extends StcVoBase
   {
      
      public static const SEX_MALE:int = 1;
      
      public static const SEX_FEMALE:int = 2;
      
      public static const NODE:String = "node";
      
      public static const TUPO:String = "tupo";
      
      public static const COMBAT_POWER:String = "combat_power";
      
      public static const KIND:String = "kind";
      
      public static const HP:String = "hp";
      
      public static const ATTACK:String = "attack";
      
      public static const PHYSICAL_DEFENCE:String = "physical_defence";
      
      public static const MAGIC_DEFENCE:String = "magic_defence";
      
      public static const AGILITY:String = "agility";
      
      public static const HIT_RATING:String = "hit_rating";
      
      public static const DODGE_RATING:String = "dodge_rating";
      
      public static const CRIT_RATING:String = "crit_rating";
      
      public static const CRIT_DAMAGE_RATING:String = "crit_damage_rating";
      
      public static const BLOCK_RATING:String = "block_rating";
      
      public static const RESILIENCE_RATING:String = "resilience_rating";
      
      public static const HIT_PERCENT:String = "hit_ratio";
      
      public static const CRIT_PERCENT:String = "crit_ratio";
      
      public static const BLOCK_PERCENT:String = "block_ratio";
      
      public static const DODGE_PERCENT:String = "dodge_ratio";
      
      public static const RESILIENCE_PERCENT:String = "resilience_ratio";
      
      public static const GROUP:String = "group";
      
      public static const GROUP_FENGBAO:int = 1;
      
      public static const GROUP_SHENSHENG:int = 2;
      
      public static const GROUP_ZHENBAO:int = 3;
      
      public static const NODE_MALE:int = 100;
      
      public static const NODE_FEMALE:int = 200;
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_npc";
       
      
      public var id:int;
      
      public var node:int;
      
      public var tupo:int;
      
      public var grow_id:int;
      
      public var name:String;
      
      public var sex:int;
      
      public var kind:int;
      
      public var level:int;
      
      public var star_level:int;
      
      public var quality:int;
      
      public var head_id:String;
      
      public var model_id:String;
      
      public var weapon_id:String;
      
      public var wing_id:int;
      
      public var model_scaling:Number;
      
      public var career_id:int;
      
      public var normal_attack_type:int;
      
      public var hp_layer:int;
      
      public var init_rage:int;
      
      public var max_rage:int;
      
      public var hp:Number;
      
      public var attack:Number;
      
      public var physical_defence:Number;
      
      public var magic_defence:Number;
      
      public var agility:Number;
      
      public var hit_rating:Number;
      
      public var dodge_rating:Number;
      
      public var crit_rating:Number;
      
      public var crit_damage_rating:Number;
      
      public var block_rating:Number;
      
      public var resilience_rating:Number;
      
      public var damage_increase_ratio:Number;
      
      public var treatment_increase_ratio:Number;
      
      public var hit_ratio:Number;
      
      public var dodge_ratio:Number;
      
      public var crit_ratio:Number;
      
      public var crit_damage_ratio:Number;
      
      public var block_ratio:Number;
      
      public var resilience_ratio:Number;
      
      public var hp_recovery:Number;
      
      public var rage_recovery:int;
      
      public var normal_attack_id:int;
      
      public var skill_id1:int;
      
      public var skill_id2:int;
      
      public var skill_id3:int;
      
      public var skill_id4:int;
      
      public var skill_sort:String;
      
      public var combat_power:int;
      
      public var offset:int;
      
      public var description1:String;
      
      public var description2:String;
      
      public var description3:String;
      
      public var get_in_lottery:int;
      
      public var effect_id:String;
      
      public var group:int;
      
      public var resource:String;
      
      public var get_point:int;
      
      public var speak:int;
      
      public function StcNpcVo()
      {
         super();
      }
      
      public function get skillIdArr() : Array
      {
         var _loc1_:Array = [];
         if(this.skill_id1 > 0)
         {
            _loc1_.push(this.skill_id1);
         }
         if(this.skill_id2 > 0)
         {
            _loc1_.push(this.skill_id2);
         }
         if(this.skill_id3 > 0)
         {
            _loc1_.push(this.skill_id3);
         }
         if(this.skill_id4 > 0)
         {
            _loc1_.push(this.skill_id4);
         }
         return _loc1_;
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         node = param1[1];
         tupo = param1[2];
         grow_id = param1[3];
         name = param1[4];
         sex = param1[5];
         kind = param1[6];
         level = param1[7];
         star_level = param1[8];
         quality = param1[9];
         head_id = param1[10];
         model_id = param1[11];
         weapon_id = param1[12];
         wing_id = param1[13];
         model_scaling = param1[14];
         career_id = param1[15];
         normal_attack_type = param1[16];
         hp_layer = param1[17];
         init_rage = param1[18];
         max_rage = param1[19];
         hp = param1[20];
         attack = param1[21];
         physical_defence = param1[22];
         magic_defence = param1[23];
         agility = param1[24];
         hit_rating = param1[25];
         dodge_rating = param1[26];
         crit_rating = param1[27];
         crit_damage_rating = param1[28];
         block_rating = param1[29];
         resilience_rating = param1[30];
         damage_increase_ratio = param1[31];
         treatment_increase_ratio = param1[32];
         hit_ratio = param1[33];
         dodge_ratio = param1[34];
         crit_ratio = param1[35];
         crit_damage_ratio = param1[36];
         block_ratio = param1[37];
         resilience_ratio = param1[38];
         hp_recovery = param1[39];
         rage_recovery = param1[40];
         normal_attack_id = param1[41];
         skill_id1 = param1[42];
         skill_id2 = param1[43];
         skill_id3 = param1[44];
         skill_id4 = param1[45];
         skill_sort = param1[46];
         combat_power = param1[47];
         offset = param1[48];
         description1 = param1[49];
         description2 = param1[50];
         description3 = param1[51];
         get_in_lottery = param1[52];
         effect_id = param1[53];
         group = param1[54];
         resource = param1[55];
         get_point = param1[56];
         speak = param1[57];
      }
   }
}
