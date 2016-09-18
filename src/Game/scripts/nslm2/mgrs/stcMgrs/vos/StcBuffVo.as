package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcBuffVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_buff";
       
      
      public var id:int;
      
      public var name:String;
      
      public var node_id:int;
      
      public var quality:int;
      
      public var level:int;
      
      public var icon_id:String;
      
      public var init_layer:int;
      
      public var add_layer:int;
      
      public var max_layer:int;
      
      public var last_turn:int;
      
      public var last_turn_type:int;
      
      public var is_debuff:int;
      
      public var controllable:int;
      
      public var dispellable:int;
      
      public var effect_type:int;
      
      public var init_effect_value1:Number;
      
      public var init_effect_value2:Number;
      
      public var init_effect_value3:Number;
      
      public var param1:String;
      
      public var param2:String;
      
      public var param3:String;
      
      public var display_effect_id:String;
      
      public var buff_show_id:int;
      
      public var desc:String;
      
      public function StcBuffVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         name = param1[1];
         node_id = param1[2];
         quality = param1[3];
         level = param1[4];
         icon_id = param1[5];
         init_layer = param1[6];
         add_layer = param1[7];
         max_layer = param1[8];
         last_turn = param1[9];
         last_turn_type = param1[10];
         is_debuff = param1[11];
         controllable = param1[12];
         dispellable = param1[13];
         effect_type = param1[14];
         init_effect_value1 = param1[15];
         init_effect_value2 = param1[16];
         init_effect_value3 = param1[17];
         param1 = param1[18];
         param2 = param1[19];
         param3 = param1[20];
         display_effect_id = param1[21];
         buff_show_id = param1[22];
         desc = param1[23];
      }
   }
}
