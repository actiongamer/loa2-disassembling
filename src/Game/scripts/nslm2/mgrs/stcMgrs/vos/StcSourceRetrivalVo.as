package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcSourceRetrivalVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_source_retrival";
       
      
      public var id:int;
      
      public var sort:int;
      
      public var gold_price:String;
      
      public var gold_per:Number;
      
      public var diamond_price:String;
      
      public var diamond_per:Number;
      
      public function StcSourceRetrivalVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         sort = param1[1];
         gold_price = param1[2];
         gold_per = param1[3];
         diamond_price = param1[4];
         diamond_per = param1[5];
      }
   }
}
