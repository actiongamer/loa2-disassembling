package nslm2.modules.foundations.shop
{
   import nslm2.mgrs.stcMgrs.vos.StcShopVo;
   
   public class ShopBuyConfirmVo
   {
       
      
      public var shopVo:StcShopVo;
      
      public var num:int;
      
      public function ShopBuyConfirmVo(param1:StcShopVo, param2:int = 1)
      {
         super();
         shopVo = param1;
         num = param2;
      }
   }
}
