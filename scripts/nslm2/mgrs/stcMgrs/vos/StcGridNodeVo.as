package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcGridNodeVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_grid_node";
       
      
      public var id:int;
      
      public var cost_item:String;
      
      public var cost_ziyuan:String;
      
      public var player_lv:int;
      
      public var node_attr:String;
      
      public var position:int;
      
      public var pagenum:int;
      
      public function StcGridNodeVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         cost_item = param1[1];
         cost_ziyuan = param1[2];
         player_lv = param1[3];
         node_attr = param1[4];
         position = param1[5];
         pagenum = param1[6];
      }
   }
}
