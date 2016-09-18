package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcNichengSuffixVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_nicheng_suffix";
       
      
      public var id:int;
      
      public var suffix:String;
      
      public function StcNichengSuffixVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         suffix = param1[1];
      }
   }
}
