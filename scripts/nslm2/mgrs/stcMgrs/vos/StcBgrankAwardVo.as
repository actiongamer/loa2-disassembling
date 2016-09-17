package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcBgrankAwardVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_bgrank_award";
       
      
      public var id:int;
      
      public var kind:int;
      
      public var rank_range:String;
      
      public var award:String;
      
      public var title_id:int;
      
      public var title_name:String;
      
      public function StcBgrankAwardVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         kind = param1[1];
         rank_range = param1[2];
         award = param1[3];
         title_id = param1[4];
         title_name = param1[5];
      }
   }
}
