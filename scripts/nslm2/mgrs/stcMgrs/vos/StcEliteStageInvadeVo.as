package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcEliteStageInvadeVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_elite_stage_invade";
       
      
      public var id:int;
      
      public var chapter_id:int;
      
      public var stage_id:int;
      
      public var npc_group_id:int;
      
      public var appear_ratio:int;
      
      public var quality:int;
      
      public var cost_stamina:int;
      
      public var reward_exp:int;
      
      public var reward_gold:int;
      
      public var reward_item:int;
      
      public var item_lower:int;
      
      public var item_upper:int;
      
      public function StcEliteStageInvadeVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         chapter_id = param1[1];
         stage_id = param1[2];
         npc_group_id = param1[3];
         appear_ratio = param1[4];
         quality = param1[5];
         cost_stamina = param1[6];
         reward_exp = param1[7];
         reward_gold = param1[8];
         reward_item = param1[9];
         item_lower = param1[10];
         item_upper = param1[11];
      }
   }
}
