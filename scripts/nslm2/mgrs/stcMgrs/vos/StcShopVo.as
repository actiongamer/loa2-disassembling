package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcShopVo extends StcVoBase
   {
      
      public static const discount_num_kind_1:int = 1;
      
      public static const SHOP_TYPE:String = "shop_type";
      
      public static const SELL_RES:String = "sell_res";
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_shop";
       
      
      public var discount_num:String;
      
      public var extra_res:String;
      
      public var plusData:Object;
      
      public var id:int;
      
      public var shop_type:int;
      
      public var page:String;
      
      public var sell_res:String;
      
      public var ori_res:String;
      
      public var curr_res:String;
      
      public var limit_type:int;
      
      public var limit_num:int;
      
      public var condi:String;
      
      public var position:int;
      
      public var function_id:int;
      
      public function StcShopVo()
      {
         super();
      }
      
      public function get getTabIndex() : int
      {
         return this.page.split("|")[0] - 1;
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         shop_type = param1[1];
         page = param1[2];
         sell_res = param1[3];
         ori_res = param1[4];
         curr_res = param1[5];
         limit_type = param1[6];
         limit_num = param1[7];
         condi = param1[8];
         position = param1[9];
         function_id = param1[10];
      }
   }
}
