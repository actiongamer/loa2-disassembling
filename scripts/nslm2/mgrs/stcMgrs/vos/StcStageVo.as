package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcStageVo extends StcVoBase
   {
      
      public static const CHAPTER_ID:String = "chapter_id";
      
      public static const SORT:String = "sort";
      
      public static const KIND:String = "kind";
      
      public static const OFFSET_Y:String = "offset_y";
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_stage";
       
      
      public var id:int;
      
      public var name:String;
      
      public var kind:int;
      
      public var sort:int;
      
      public var chapter_id:int;
      
      public var one_time:int;
      
      public var drain_stamina:int;
      
      public var daily_free_time:int;
      
      public var monster_id1:int;
      
      public var monster_id2:int;
      
      public var monster_id3:int;
      
      public var hero_exp:int;
      
      public var front_end_drop_id:int;
      
      public var box_prize:int;
      
      public var actual_drop_id:int;
      
      public var model_id:int;
      
      public var description:String;
      
      public var reward_coin:int;
      
      public var reward_exp:int;
      
      public var map_id:int;
      
      public var map_config_id:int;
      
      public var drama_script_1:String;
      
      public var drama_script_2:String;
      
      public var drama_script_3:String;
      
      public var drama_script_4:String;
      
      public var unlock_level:int;
      
      public var bgm:String;
      
      public var boss_head_id:int;
      
      public var prev_stage_id:int;
      
      public var prev_drama_id:int;
      
      public var offset_x:int;
      
      public var offset_y:int;
      
      public var address:String;
      
      public var icon_id:int;
      
      public var summary:String;
      
      public function StcStageVo()
      {
         super();
      }
      
      public function get lastGroupId() : int
      {
         if(monster_id3 != 0)
         {
            return monster_id3;
         }
         if(monster_id2 != 0)
         {
            return monster_id2;
         }
         return monster_id1;
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         name = param1[1];
         kind = param1[2];
         sort = param1[3];
         chapter_id = param1[4];
         one_time = param1[5];
         drain_stamina = param1[6];
         daily_free_time = param1[7];
         monster_id1 = param1[8];
         monster_id2 = param1[9];
         monster_id3 = param1[10];
         hero_exp = param1[11];
         front_end_drop_id = param1[12];
         box_prize = param1[13];
         actual_drop_id = param1[14];
         model_id = param1[15];
         description = param1[16];
         reward_coin = param1[17];
         reward_exp = param1[18];
         map_id = param1[19];
         map_config_id = param1[20];
         drama_script_1 = param1[21];
         drama_script_2 = param1[22];
         drama_script_3 = param1[23];
         drama_script_4 = param1[24];
         unlock_level = param1[25];
         bgm = param1[26];
         boss_head_id = param1[27];
         prev_stage_id = param1[28];
         prev_drama_id = param1[29];
         offset_x = param1[30];
         offset_y = param1[31];
         address = param1[32];
         icon_id = param1[33];
         summary = param1[34];
      }
   }
}
