package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcCwarTimeVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_cwar_time";
       
      
      public var id:int;
      
      public var name:String;
      
      public var start_time:String;
      
      public var end_time:String;
      
      public function StcCwarTimeVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         name = param1[1];
         start_time = param1[2];
         end_time = param1[3];
      }
   }
}
