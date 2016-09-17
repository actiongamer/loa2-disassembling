package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcAssistantLevelVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_assistant_level";
       
      
      public var id:int;
      
      public var type:int;
      
      public var condition:String;
      
      public function StcAssistantLevelVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         type = param1[1];
         condition = param1[2];
      }
   }
}
