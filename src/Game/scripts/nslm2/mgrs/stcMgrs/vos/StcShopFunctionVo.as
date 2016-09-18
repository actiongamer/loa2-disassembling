package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcShopFunctionVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_shop_function";
       
      
      public var id:int;
      
      public var currency:String;
      
      public var fresh_cost:String;
      
      public var time:int;
      
      public var item_type:String;
      
      public var type_weight:String;
      
      public var currency_limit:int;
      
      public function StcShopFunctionVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         currency = param1[1];
         fresh_cost = param1[2];
         time = param1[3];
         item_type = param1[4];
         type_weight = param1[5];
         currency_limit = param1[6];
      }
   }
}
