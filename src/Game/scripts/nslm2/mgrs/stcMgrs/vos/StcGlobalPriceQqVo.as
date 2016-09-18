package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcGlobalPriceQqVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_global_price_qq";
       
      
      public var id:int;
      
      public var price:int;
      
      public function StcGlobalPriceQqVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         price = param1[1];
      }
   }
}
