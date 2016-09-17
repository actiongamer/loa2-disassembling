package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcSkillEffectVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_skill_effect";
       
      
      public var id:int;
      
      public var skill_id:int;
      
      public var kind:int;
      
      public var target:int;
      
      public var performance:String;
      
      public var fly_effect:String;
      
      public var fly_speed:int;
      
      public var hit_effect:String;
      
      public var hit_music:String;
      
      public var init_trigger_ratio:Number;
      
      public var init_damage_ratio:Number;
      
      public var init_damage_value:Number;
      
      public var add_effect1:Number;
      
      public var add_effect2:Number;
      
      public var param1:String;
      
      public var param2:String;
      
      public var param3:String;
      
      public var param4:String;
      
      public var special_effect:String;
      
      public var is_hit:int;
      
      public var is_crit:int;
      
      public function StcSkillEffectVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         skill_id = param1[1];
         kind = param1[2];
         target = param1[3];
         performance = param1[4];
         fly_effect = param1[5];
         fly_speed = param1[6];
         hit_effect = param1[7];
         hit_music = param1[8];
         init_trigger_ratio = param1[9];
         init_damage_ratio = param1[10];
         init_damage_value = param1[11];
         add_effect1 = param1[12];
         add_effect2 = param1[13];
         param1 = param1[14];
         param2 = param1[15];
         param3 = param1[16];
         param4 = param1[17];
         special_effect = param1[18];
         is_hit = param1[19];
         is_crit = param1[20];
      }
   }
}
