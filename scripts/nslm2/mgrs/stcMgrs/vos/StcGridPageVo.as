package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcGridPageVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_grid_page";
       
      
      public var id:int;
      
      public var angle_attr:String;
      
      public var nodes:String;
      
      public var sort:int;
      
      public var mid_attr:String;
      
      public var player_lv:int;
      
      public var mid_attr_desc:String;
      
      public function StcGridPageVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         angle_attr = param1[1];
         nodes = param1[2];
         sort = param1[3];
         mid_attr = param1[4];
         player_lv = param1[5];
         mid_attr_desc = param1[6];
      }
   }
}
