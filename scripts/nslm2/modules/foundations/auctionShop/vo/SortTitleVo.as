package nslm2.modules.foundations.auctionShop.vo
{
   public class SortTitleVo
   {
       
      
      public var label:String;
      
      public var isDESC:Boolean = true;
      
      public var propName:String;
      
      public function SortTitleVo(param1:String, param2:String, param3:Boolean = true)
      {
         super();
         label = param1;
         propName = param2;
         isDESC = param3;
      }
   }
}
