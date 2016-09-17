package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcMallActivityVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_mall_activity";
       
      
      public var id:int;
      
      public var kind:int;
      
      public var begin:String;
      
      public var end:String;
      
      public var banner:String;
      
      public function StcMallActivityVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         kind = param1[1];
         begin = param1[2];
         end = param1[3];
         banner = param1[4];
      }
   }
}
