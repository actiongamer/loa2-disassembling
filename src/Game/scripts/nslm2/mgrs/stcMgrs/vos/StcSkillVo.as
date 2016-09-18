package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcSkillVo extends StcVoBase
   {
      
      public static const NODE_ID:String = "node_id";
      
      public static const LEVEL:String = "level";
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_skill";
       
      
      public var id:int;
      
      public var node_id:int;
      
      public var name:String;
      
      public var kind:int;
      
      public var trigger_type:int;
      
      public var interruptable:int;
      
      public var attach_skill_id:int;
      
      public var roll_before_attack:int;
      
      public var skill_attack:int;
      
      public var skill_attack_effect:int;
      
      public var roll_after_attack:int;
      
      public var attack_time_point:String;
      
      public var under_attack_action:String;
      
      public var turn_start:int;
      
      public var cast_interval:int;
      
      public var trigger_ratio:Number;
      
      public var level_up_formula:String;
      
      public var skill_icon:String;
      
      public var skill_description1:String;
      
      public var skill_description2:String;
      
      public var skill_description3:String;
      
      public var level_up_description1:String;
      
      public var quality:int;
      
      public var level:int;
      
      public var show_type:int;
      
      public function StcSkillVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         node_id = param1[1];
         name = param1[2];
         kind = param1[3];
         trigger_type = param1[4];
         interruptable = param1[5];
         attach_skill_id = param1[6];
         roll_before_attack = param1[7];
         skill_attack = param1[8];
         skill_attack_effect = param1[9];
         roll_after_attack = param1[10];
         attack_time_point = param1[11];
         under_attack_action = param1[12];
         turn_start = param1[13];
         cast_interval = param1[14];
         trigger_ratio = param1[15];
         level_up_formula = param1[16];
         skill_icon = param1[17];
         skill_description1 = param1[18];
         skill_description2 = param1[19];
         skill_description3 = param1[20];
         level_up_description1 = param1[21];
         quality = param1[22];
         level = param1[23];
         show_type = param1[24];
      }
   }
}
