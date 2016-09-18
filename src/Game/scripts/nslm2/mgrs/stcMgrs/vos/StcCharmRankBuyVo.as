package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcCharmRankBuyVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_charm_rank_buy";
       
      
      public var id:int;
      
      public var shopId:int;
      
      public var giveId:String;
      
      public var save:int;
      
      public function StcCharmRankBuyVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         shopId = param1[1];
         giveId = param1[2];
         save = param1[3];
      }
   }
}
