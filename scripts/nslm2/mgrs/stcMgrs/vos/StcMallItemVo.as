package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcMallItemVo extends StcVoBase
   {
      
      public static const KIND_3:int = 3;
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_mall_item";
       
      
      public var id:int;
      
      public var kind:int;
      
      public var position:int;
      
      public var items:String;
      
      public var reset:int;
      
      public var old_price:String;
      
      public var now_price:String;
      
      public var special_price:String;
      
      public var discount:Number;
      
      public var res_con:int;
      
      public var num_con:String;
      
      public var buy_con:String;
      
      public var vip:int;
      
      public var onsell:int;
      
      public var special_day:int;
      
      public var max_buy:int;
      
      public function StcMallItemVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         kind = param1[1];
         position = param1[2];
         items = param1[3];
         reset = param1[4];
         old_price = param1[5];
         now_price = param1[6];
         special_price = param1[7];
         discount = param1[8];
         res_con = param1[9];
         num_con = param1[10];
         buy_con = param1[11];
         vip = param1[12];
         onsell = param1[13];
         special_day = param1[14];
         max_buy = param1[15];
      }
   }
}
