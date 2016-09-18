package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcUiFadeVo extends StcVoBase
   {
      
      public static const FADE_VIEW_ID:String = "fade_view_id";
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_ui_fade";
       
      
      public var id:int;
      
      public var trigger_kind:int;
      
      public var fade_view_id:int;
      
      public var comp_id:String;
      
      public var comp_name:String;
      
      public var fade_id:int;
      
      public var delay:int;
      
      public var time:int;
      
      public function StcUiFadeVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         trigger_kind = param1[1];
         fade_view_id = param1[2];
         comp_id = param1[3];
         comp_name = param1[4];
         fade_id = param1[5];
         delay = param1[6];
         time = param1[7];
      }
   }
}
