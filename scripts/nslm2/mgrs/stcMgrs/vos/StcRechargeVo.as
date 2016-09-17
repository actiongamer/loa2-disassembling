package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcRechargeVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_recharge";
       
      
      public var id:int;
      
      public var viplevel:int;
      
      public var rate:int;
      
      public var recharge:int;
      
      public var present:int;
      
      public var timelimit:int;
      
      public function StcRechargeVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         viplevel = param1[1];
         rate = param1[2];
         recharge = param1[3];
         present = param1[4];
         timelimit = param1[5];
      }
   }
}
