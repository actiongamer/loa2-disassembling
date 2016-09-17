package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcBginfoVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_bginfo";
       
      
      public var id:int;
      
      public var bg_name:String;
      
      public var bg_scene_id:int;
      
      public var bg_open_lv:int;
      
      public var bg_open_date:int;
      
      public var bg_player_num:int;
      
      public var bg_max_time:int;
      
      public var bg_vict_kind:int;
      
      public var bg_vict_num:int;
      
      public var bg_honor:String;
      
      public var bg_score:String;
      
      public var language_id:int;
      
      public var bg_kill_honor:int;
      
      public var bg_assist_honor:int;
      
      public var bg_first_kill_honor:int;
      
      public var bg_first_gather_honor:int;
      
      public function StcBginfoVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         bg_name = param1[1];
         bg_scene_id = param1[2];
         bg_open_lv = param1[3];
         bg_open_date = param1[4];
         bg_player_num = param1[5];
         bg_max_time = param1[6];
         bg_vict_kind = param1[7];
         bg_vict_num = param1[8];
         bg_honor = param1[9];
         bg_score = param1[10];
         language_id = param1[11];
         bg_kill_honor = param1[12];
         bg_assist_honor = param1[13];
         bg_first_kill_honor = param1[14];
         bg_first_gather_honor = param1[15];
      }
   }
}
