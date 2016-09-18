package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcConstellationPageVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_constellation_page";
       
      
      public var id:int;
      
      public var name:String;
      
      public var sort:int;
      
      public var player_lv:int;
      
      public var star_lv:String;
      
      public var reward_drop_id:String;
      
      public function StcConstellationPageVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         name = param1[1];
         sort = param1[2];
         player_lv = param1[3];
         star_lv = param1[4];
         reward_drop_id = param1[5];
      }
   }
}
