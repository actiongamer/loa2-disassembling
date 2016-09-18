package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcCrossArenaCheerVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_cross_arena_cheer";
       
      
      public var id:int;
      
      public var buff_id:int;
      
      public var buff_info:String;
      
      public function StcCrossArenaCheerVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         buff_id = param1[1];
         buff_info = param1[2];
      }
   }
}
