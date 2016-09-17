package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcGuajiVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_guaji";
       
      
      public var id:int;
      
      public var nandu:int;
      
      public var client_drop_desc:String;
      
      public var boss_group_id:int;
      
      public var boss_drop_id:int;
      
      public var npc_group_id:String;
      
      public var npc_drop_id1:int;
      
      public var npc_drop_id2:int;
      
      public var share_reward:String;
      
      public var boss_pos:String;
      
      public var stage_id:int;
      
      public var btl_stage_id:int;
      
      public var cost_jingli:int;
      
      public var pvp_drop:int;
      
      public var boss_lv_limit:int;
      
      public function StcGuajiVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         nandu = param1[1];
         client_drop_desc = param1[2];
         boss_group_id = param1[3];
         boss_drop_id = param1[4];
         npc_group_id = param1[5];
         npc_drop_id1 = param1[6];
         npc_drop_id2 = param1[7];
         share_reward = param1[8];
         boss_pos = param1[9];
         stage_id = param1[10];
         btl_stage_id = param1[11];
         cost_jingli = param1[12];
         pvp_drop = param1[13];
         boss_lv_limit = param1[14];
      }
   }
}
