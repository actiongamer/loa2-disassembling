package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcBglvIntvlVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_bglv_intvl";
       
      
      public var id:int;
      
      public var need_lv:String;
      
      public var extend_id:int;
      
      public function StcBglvIntvlVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         need_lv = param1[1];
         extend_id = param1[2];
      }
   }
}
