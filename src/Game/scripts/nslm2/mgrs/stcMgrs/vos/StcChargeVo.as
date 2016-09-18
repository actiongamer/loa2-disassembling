package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcChargeVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_charge";
       
      
      public var id:int;
      
      public var chargeDiamond:int;
      
      public var rewardDiamond:int;
      
      public var desc:String;
      
      public function StcChargeVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         chargeDiamond = param1[1];
         rewardDiamond = param1[2];
         desc = param1[3];
      }
   }
}
