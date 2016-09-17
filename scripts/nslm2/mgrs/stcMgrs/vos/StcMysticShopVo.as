package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcMysticShopVo extends StcVoBase
   {
      
      public static const SHOP_TYPE:String = "shop_type";
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_mystic_shop";
       
      
      public var id:int;
      
      public var shop_type:int;
      
      public var item_type:int;
      
      public var item_id:int;
      
      public var freshcond:String;
      
      public var weight:int;
      
      public var super_weight:int;
      
      public var condition:String;
      
      public function StcMysticShopVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         shop_type = param1[1];
         item_type = param1[2];
         item_id = param1[3];
         freshcond = param1[4];
         weight = param1[5];
         super_weight = param1[6];
         condition = param1[7];
      }
   }
}
