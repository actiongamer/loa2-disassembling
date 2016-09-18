package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcItemVo extends StcVoBase
   {
      
      public static const KIND:String = "kind";
      
      public static const QUALITY:String = "quality";
      
      public static const EXTEND_1:String = "extend_1";
      
      public static const EXTEND_2:String = "extend_2";
      
      public static const EXTEND_3:String = "extend_3";
      
      public static const EXTEND_4:String = "extend_4";
      
      public static const NAME:String = "name";
      
      public static const GET_POINT:String = "get_point";
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_item";
       
      
      private var _sellPriceArr:Array;
      
      public var id:int;
      
      public var name:String;
      
      public var kind:int;
      
      public var quality:int;
      
      public var icon:int;
      
      public var show_id:int;
      
      public var desc:String;
      
      public var need_level:int;
      
      public var max_have:int;
      
      public var max_num:int;
      
      public var extend_1:String;
      
      public var extend_2:String;
      
      public var extend_3:String;
      
      public var extend_4:String;
      
      public var extend_5:String;
      
      public var hp:Number;
      
      public var attack:Number;
      
      public var physical_defence:Number;
      
      public var magic_defence:Number;
      
      public var agility:Number;
      
      public var hit_rating:Number;
      
      public var dodge_rating:Number;
      
      public var block_rating:Number;
      
      public var crit_rating:Number;
      
      public var crit_damage_rating:Number;
      
      public var resilience_rating:Number;
      
      public var rage_recovery:Number;
      
      public var damage_increase_ratio:Number;
      
      public var treatment_increase_ratio:Number;
      
      public var sell_price:String;
      
      public var use_cost:String;
      
      public var drop:int;
      
      public var get_point:String;
      
      public var strength_id:int;
      
      public var jinglian_id:int;
      
      public var get_point_des:String;
      
      public var special_des:String;
      
      public var display_type:int;
      
      public var consume_activity:int;
      
      public function StcItemVo()
      {
         super();
      }
      
      private function get sellPriceArr() : Array
      {
         if(_sellPriceArr == null)
         {
            _sellPriceArr = this.sell_price.split(":");
         }
         return _sellPriceArr;
      }
      
      public function get sellType() : int
      {
         return sellPriceArr[0];
      }
      
      public function get sellSId() : int
      {
         return sellPriceArr[1];
      }
      
      public function get sellCount() : int
      {
         return sellPriceArr[2];
      }
      
      public function get heroPieceNeed() : int
      {
         return int(this.extend_1);
      }
      
      public function get heroPiece_stcNpcId() : int
      {
         return int(this.extend_2);
      }
      
      public function get lotteryGetRewardHeroIdArr() : Array
      {
         return this.extend_1.split("|");
      }
      
      public function get equipPieceComposeCount() : int
      {
         return int(this.extend_1);
      }
      
      public function get equipPieceComposeEquipId() : int
      {
         return int(this.extend_2);
      }
      
      public function get godHoodEquipNeed() : int
      {
         return int(this.extend_1);
      }
      
      public function get treasurePieceNeed() : int
      {
         return int(this.extend_1);
      }
      
      public function get times() : int
      {
         return int(this.extend_3);
      }
      
      public function get combineFashionSynId() : int
      {
         return int(this.extend_5);
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         name = param1[1];
         kind = param1[2];
         quality = param1[3];
         icon = param1[4];
         show_id = param1[5];
         desc = param1[6];
         need_level = param1[7];
         max_have = param1[8];
         max_num = param1[9];
         extend_1 = param1[10];
         extend_2 = param1[11];
         extend_3 = param1[12];
         extend_4 = param1[13];
         extend_5 = param1[14];
         hp = param1[15];
         attack = param1[16];
         physical_defence = param1[17];
         magic_defence = param1[18];
         agility = param1[19];
         hit_rating = param1[20];
         dodge_rating = param1[21];
         block_rating = param1[22];
         crit_rating = param1[23];
         crit_damage_rating = param1[24];
         resilience_rating = param1[25];
         rage_recovery = param1[26];
         damage_increase_ratio = param1[27];
         treatment_increase_ratio = param1[28];
         sell_price = param1[29];
         use_cost = param1[30];
         drop = param1[31];
         get_point = param1[32];
         strength_id = param1[33];
         jinglian_id = param1[34];
         get_point_des = param1[35];
         special_des = param1[36];
         display_type = param1[37];
         consume_activity = param1[38];
      }
   }
}
