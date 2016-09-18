package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcGambleVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_gamble";
       
      
      public var id:int;
      
      public var kind:int;
      
      public var round:int;
      
      public var limit_num:int;
      
      public var gamble_source_1:String;
      
      public var result_ratio_1:String;
      
      public var gamble_source_2:String;
      
      public var result_ratio_2:String;
      
      public var gamble_source_3:String;
      
      public var result_ratio_3:String;
      
      public var describe:String;
      
      public function StcGambleVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         kind = param1[1];
         round = param1[2];
         limit_num = param1[3];
         gamble_source_1 = param1[4];
         result_ratio_1 = param1[5];
         gamble_source_2 = param1[6];
         result_ratio_2 = param1[7];
         gamble_source_3 = param1[8];
         result_ratio_3 = param1[9];
         describe = param1[10];
      }
   }
}
