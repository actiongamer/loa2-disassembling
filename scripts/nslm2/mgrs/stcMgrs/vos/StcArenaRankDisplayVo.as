package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcArenaRankDisplayVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_arena_rank_display";
       
      
      public var id:int;
      
      public var player_rank:String;
      
      public var display_type:int;
      
      public var display_rank:String;
      
      public var interval:int;
      
      public function StcArenaRankDisplayVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         player_rank = param1[1];
         display_type = param1[2];
         display_rank = param1[3];
         interval = param1[4];
      }
   }
}
