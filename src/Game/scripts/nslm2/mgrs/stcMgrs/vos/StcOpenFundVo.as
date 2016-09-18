package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcOpenFundVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_open_fund";
       
      
      public var id:int;
      
      public var rankid:int;
      
      public var rewardtype:int;
      
      public var level:int;
      
      public var count:int;
      
      public var reward:String;
      
      public function StcOpenFundVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         rankid = param1[1];
         rewardtype = param1[2];
         level = param1[3];
         count = param1[4];
         reward = param1[5];
      }
   }
}
