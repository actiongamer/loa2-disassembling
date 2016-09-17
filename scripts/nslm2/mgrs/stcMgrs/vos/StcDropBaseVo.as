package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcDropBaseVo extends StcVoBase
   {
      
      public static const BASE_DROP_ID:String = "base_drop_id";
      
      public static const DROP_ID:String = "drop_id";
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_drop_base";
       
      
      public var id:int;
      
      public var base_drop_id:int;
      
      public var drop_type:int;
      
      public var drop_id:int;
      
      public var number:int;
      
      public var weight:int;
      
      public function StcDropBaseVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         base_drop_id = param1[1];
         drop_type = param1[2];
         drop_id = param1[3];
         number = param1[4];
         weight = param1[5];
      }
   }
}
