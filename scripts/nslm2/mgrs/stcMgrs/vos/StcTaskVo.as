package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcTaskVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_task";
       
      
      public var id:int;
      
      public var name:String;
      
      public var group:int;
      
      public var kind:int;
      
      public var quality:int;
      
      public var prev_task_id:int;
      
      public var next_task_ids:String;
      
      public var show_level:int;
      
      public var sort:int;
      
      public var accept_level:int;
      
      public var auto_complete:int;
      
      public var task_start_id:String;
      
      public var task_end_id:String;
      
      public var task_description:String;
      
      public var check_point_1:String;
      
      public var check_point_2:String;
      
      public var check_point_3:String;
      
      public var relation_func_id:int;
      
      public var reward_drop_ids:String;
      
      public var findpath:String;
      
      public var vip_limit:int;
      
      public var vip_limit_desc:String;
      
      public var function_id:int;
      
      public function StcTaskVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         name = param1[1];
         group = param1[2];
         kind = param1[3];
         quality = param1[4];
         prev_task_id = param1[5];
         next_task_ids = param1[6];
         show_level = param1[7];
         sort = param1[8];
         accept_level = param1[9];
         auto_complete = param1[10];
         task_start_id = param1[11];
         task_end_id = param1[12];
         task_description = param1[13];
         check_point_1 = param1[14];
         check_point_2 = param1[15];
         check_point_3 = param1[16];
         relation_func_id = param1[17];
         reward_drop_ids = param1[18];
         findpath = param1[19];
         vip_limit = param1[20];
         vip_limit_desc = param1[21];
         function_id = param1[22];
      }
   }
}
