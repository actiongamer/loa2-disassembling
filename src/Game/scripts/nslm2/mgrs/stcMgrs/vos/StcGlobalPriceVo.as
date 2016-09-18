package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcGlobalPriceVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_global_price";
       
      
      public var id:int;
      
      public var gameid:int;
      
      public var price:int;
      
      public function StcGlobalPriceVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         gameid = param1[1];
         price = param1[2];
      }
   }
}
