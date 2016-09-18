package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcLotteryVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_lottery";
       
      
      public var id:int;
      
      public var drop_ids:int;
      
      public var drop_num:int;
      
      public var cost_res:String;
      
      public var free_cd:int;
      
      public var free_times:int;
      
      public var spare_cost_res:String;
      
      public function StcLotteryVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         drop_ids = param1[1];
         drop_num = param1[2];
         cost_res = param1[3];
         free_cd = param1[4];
         free_times = param1[5];
         spare_cost_res = param1[6];
      }
   }
}
