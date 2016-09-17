package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcGeneralWelfareVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_general_welfare";
       
      
      public var id:int;
      
      public var num:int;
      
      public var cardLimit:int;
      
      public var dropid:int;
      
      public function StcGeneralWelfareVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         num = param1[1];
         cardLimit = param1[2];
         dropid = param1[3];
      }
   }
}
