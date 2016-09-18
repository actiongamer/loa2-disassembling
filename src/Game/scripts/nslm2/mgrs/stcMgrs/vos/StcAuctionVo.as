package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcAuctionVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "itemid";
      
      public static const STC_NAME:String = "static_auction";
       
      
      public var itemid:int;
      
      public var cost:int;
      
      public var duidie_num:int;
      
      public function StcAuctionVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         itemid = param1[0];
         cost = param1[1];
         duidie_num = param1[2];
      }
   }
}
