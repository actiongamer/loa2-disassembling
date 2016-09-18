package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcValentineBuyVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_valentine_buy";
       
      
      public var id:int;
      
      public var day:int;
      
      public var shopid:int;
      
      public var giveid:String;
      
      public function StcValentineBuyVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         day = param1[1];
         shopid = param1[2];
         giveid = param1[3];
      }
   }
}
