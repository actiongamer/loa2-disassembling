package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcGeneralCreditsPrizeVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_general_credits_prize";
       
      
      public var id:int;
      
      public var types:int;
      
      public var typeA:int;
      
      public var conditionA:String;
      
      public var typeB:int;
      
      public var conditionB:String;
      
      public var dropid:int;
      
      public function StcGeneralCreditsPrizeVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         types = param1[1];
         typeA = param1[2];
         conditionA = param1[3];
         typeB = param1[4];
         conditionB = param1[5];
         dropid = param1[6];
      }
   }
}
