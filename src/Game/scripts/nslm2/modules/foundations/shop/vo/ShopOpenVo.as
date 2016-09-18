package nslm2.modules.foundations.shop.vo
{
   public class ShopOpenVo
   {
       
      
      public var funId:int;
      
      public var itemId:int;
      
      public function ShopOpenVo(param1:int, param2:int = 0)
      {
         super();
         funId = param1;
         itemId = param2;
      }
   }
}
