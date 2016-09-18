package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcBgresGatherVo extends StcVoBase
   {
      
      public static const DISPLAY_NPC:String = "display_npc";
      
      public static const STAGE_ID:String = "stage_id";
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_bgres_gather";
       
      
      public var id:int;
      
      public var stage_id:int;
      
      public var display_npc:int;
      
      public var time_consume:int;
      
      public var yield:int;
      
      public var total_yield:int;
      
      public var reset_period:int;
      
      public var honor:int;
      
      public var team_honor:int;
      
      public var npc_info:String;
      
      public function StcBgresGatherVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         stage_id = param1[1];
         display_npc = param1[2];
         time_consume = param1[3];
         yield = param1[4];
         total_yield = param1[5];
         reset_period = param1[6];
         honor = param1[7];
         team_honor = param1[8];
         npc_info = param1[9];
      }
   }
}
