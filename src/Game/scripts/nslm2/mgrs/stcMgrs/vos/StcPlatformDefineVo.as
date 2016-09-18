package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcPlatformDefineVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "platform";
      
      public static const STC_NAME:String = "static_platform_define";
       
      
      public var platform:String;
      
      public var lv:int;
      
      public var indulgeaddr:String;
      
      public function StcPlatformDefineVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         platform = param1[0];
         lv = param1[1];
         indulgeaddr = param1[2];
      }
   }
}
