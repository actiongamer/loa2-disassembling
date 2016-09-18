package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcNpcGroupVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_npc_group";
       
      
      public var id:int;
      
      public var name:String;
      
      public var kind:int;
      
      public var level:int;
      
      public var head_id:int;
      
      public var action_id:int;
      
      public var permanent_dialogue:String;
      
      public var mount_func_id:int;
      
      public var formation_group:String;
      
      public var display_npc:int;
      
      public var battle_power:int;
      
      public function StcNpcGroupVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         name = param1[1];
         kind = param1[2];
         level = param1[3];
         head_id = param1[4];
         action_id = param1[5];
         permanent_dialogue = param1[6];
         mount_func_id = param1[7];
         formation_group = param1[8];
         display_npc = param1[9];
         battle_power = param1[10];
      }
   }
}
