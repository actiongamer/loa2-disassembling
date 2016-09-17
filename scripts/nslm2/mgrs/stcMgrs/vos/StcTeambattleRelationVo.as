package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcTeambattleRelationVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_teambattle_relation";
       
      
      public var id:int;
      
      public var stageid:int;
      
      public var npcid:int;
      
      public var x:String;
      
      public var y:String;
      
      public function StcTeambattleRelationVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         stageid = param1[1];
         npcid = param1[2];
         x = param1[3];
         y = param1[4];
      }
   }
}
