package nslm2.modules.foundations.shop.model
{
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class ShopTabConfigVo
   {
      
      public static const str_Val:String = "strVal";
       
      
      public var tabIndex:int;
      
      public var strId:int;
      
      public var type:int;
      
      public var stcShopId:Array;
      
      public function ShopTabConfigVo()
      {
         super();
      }
      
      public function get strVal() : String
      {
         return LocaleMgr.ins.getStr(this.strId);
      }
   }
}
