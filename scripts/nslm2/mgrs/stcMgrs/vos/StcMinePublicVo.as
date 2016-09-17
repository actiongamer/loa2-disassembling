package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcMinePublicVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_mine_public";
       
      
      public var id:int;
      
      public var area:int;
      
      public var level:int;
      
      public var kind:int;
      
      public var pos:String;
      
      public var icon:String;
      
      public var guild_add:Number;
      
      public var connect:String;
      
      public var earning:Number;
      
      public var rare_item:String;
      
      public var rare_ratio:String;
      
      public var time:int;
      
      public var npc:int;
      
      public var npc_ratios:String;
      
      public var ability:int;
      
      public var extra_item:String;
      
      public function StcMinePublicVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         area = param1[1];
         level = param1[2];
         kind = param1[3];
         pos = param1[4];
         icon = param1[5];
         guild_add = param1[6];
         connect = param1[7];
         earning = param1[8];
         rare_item = param1[9];
         rare_ratio = param1[10];
         time = param1[11];
         npc = param1[12];
         npc_ratios = param1[13];
         ability = param1[14];
         extra_item = param1[15];
      }
   }
}
