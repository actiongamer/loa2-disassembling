package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcFamilyBossZuheVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_family_boss_zuhe";
       
      
      public var id:int;
      
      public var npc_a:int;
      
      public var npc_b:int;
      
      public var npc_c:int;
      
      public var logic:Number;
      
      public var kind:int;
      
      public var buffid:String;
      
      public var descrip:String;
      
      public function StcFamilyBossZuheVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         npc_a = param1[1];
         npc_b = param1[2];
         npc_c = param1[3];
         logic = param1[4];
         kind = param1[5];
         buffid = param1[6];
         descrip = param1[7];
      }
   }
}
