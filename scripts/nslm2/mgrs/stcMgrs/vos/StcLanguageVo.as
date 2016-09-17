package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcLanguageVo extends StcVoBase
   {
      
      public static const TEXT:String = "text";
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_language";
       
      
      public var id:int;
      
      public var text:String;
      
      public function StcLanguageVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         text = param1[1];
      }
   }
}
